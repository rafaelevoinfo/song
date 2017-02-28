unit fMatriz;

interface

uses
  FMX.MediaLibrary, FMX.Platform, System.Messaging,
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, System.ImageList, FMX.ImgList,
  FMX.Ani, FMX.EditBox, FMX.NumberBox, FMX.Edit, FMX.ScrollBox, FMX.Memo,
  System.Sensors, System.Sensors.Components, FMX.Layouts, dmuPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, System.Actions, FMX.ActnList, FMX.ListBox, FMX.StdActns,
  FMX.MediaLibrary.Actions, fBasicoCadastro, fBasico, uConstantes;

type

  TfrmMatriz = class(TfrmBasicoCadastro)
    pnPrincipal: TPanel;
    FloatAnimation1: TFloatAnimation;
    pnNome: TPanel;
    EditNome: TEdit;
    Label1: TLabel;
    LocationSensor: TLocationSensor;
    ScrollBox1: TScrollBox;
    BindSourceMatriz: TBindSourceDB;
    pnEspecie: TPanel;
    Label5: TLabel;
    cbEspecie: TComboBox;
    qEspecie: TRFQuery;
    qEspecieNOME: TStringField;
    BindSourceEspecie: TBindSourceDB;
    mmoDescricaoLocalizacao: TMemo;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnLatLong: TPanel;
    GridPanelLayout1: TGridPanelLayout;
    EditLatitude: TEdit;
    EditLongitude: TEdit;
    imgFoto: TImage;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    qMatriz: TRFQuery;
    qMatrizID: TFDAutoIncField;
    qMatrizNOME: TStringField;
    qMatrizLATITUDE: TFMTBCDField;
    qMatrizLONGITUDE: TFMTBCDField;
    qMatrizENDERECO: TStringField;
    qMatrizFOTO: TBlobField;
    qMatrizSYNC: TIntegerField;
    qMatrizID_ESPECIE: TIntegerField;
    LinkControlToField4: TLinkControlToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    btnGaleria: TButton;
    btnCamera: TButton;
    btnLocalizacao: TButton;
    qEspecieID: TFDAutoIncField;
    procedure FormCreate(Sender: TObject);
    procedure LocationSensorLocationChanged(Sender: TObject; const OldLocation, NewLocation: TLocationCoord2D);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure Ac_Tirar_FotoDidFinishTaking(Image: TBitmap);
    procedure Ac_Pegar_LocalizacaoExecute(Sender: TObject);
  private
    procedure ppvAjustarTamanhoFoto;
    { Private declarations }
  protected
    procedure pprBeforeSalvar; override;
  public
    procedure ppuIncluir; override;

  end;

var
  frmMatriz: TfrmMatriz;

implementation

uses
  fPrincipal;

{$R *.fmx}

procedure TfrmMatriz.Ac_Pegar_LocalizacaoExecute(Sender: TObject);
begin
  recFade.Visible := true;
  recModal.Visible := true;

  recFade.BringToFront;
  recModal.BringToFront;

  if not LocationSensor.Active then
    LocationSensor.Active := true;
end;

procedure TfrmMatriz.Ac_Tirar_FotoDidFinishTaking(Image: TBitmap);
var
  vaStream: TStream;
  vaFoto: TBitmap;
begin
  if Assigned(Image) then
    begin
      vaFoto := Image.CreateThumbnail(800, 600);
      vaStream := TBytesStream.Create();
      try
        vaFoto.SaveToStream(vaStream);
        vaStream.Position := 0;

        qMatrizFOTO.LoadFromStream(vaStream);
      finally
        vaFoto.free;
        vaStream.free;
      end;
    end;
end;

procedure TfrmMatriz.FormCreate(Sender: TObject);
begin
  qEspecie.Open();
  // TMessageManager.DefaultManager.SubscribeToMessage(TMessageDidFinishTakingImageFromLibrary, ppvImagemEscolhida);
end;

procedure TfrmMatriz.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkHardwareBack then
    begin
      if recModal.Visible then
        begin
          recFade.Visible := false;
          recModal.Visible := false;

          LocationSensor.Active := false;

          Key := 0;
        end;

    end;
end;

procedure TfrmMatriz.FormResize(Sender: TObject);
begin
  ppvAjustarTamanhoFoto;
end;

procedure TfrmMatriz.pprBeforeSalvar;
begin
  inherited;
  qMatrizSYNC.AsInteger := coDesincronizado;
end;

procedure TfrmMatriz.ppuIncluir;
begin
  inherited;
  qMatrizSYNC.AsInteger := coDesincronizado;
end;

procedure TfrmMatriz.ppvAjustarTamanhoFoto;
begin
  imgFoto.Width := Self.Width;
  imgFoto.Height := Trunc(Self.Width * 0.75);
  imgFoto.Position.Y := mmoDescricaoLocalizacao.Position.Y + mmoDescricaoLocalizacao.Height;
end;

procedure TfrmMatriz.FormShow(Sender: TObject);
begin
  // FloatAnimation1.StartValue := Self.Width;
  // FloatAnimation1.Start;
  ppvAjustarTamanhoFoto;
  if EditNome.CanFocus then
    EditNome.SetFocus;
end;

procedure TfrmMatriz.LocationSensorLocationChanged(Sender: TObject; const OldLocation, NewLocation: TLocationCoord2D);
begin
  recFade.Visible := false;
  recModal.Visible := false;

  qMatrizLATITUDE.AsFloat := NewLocation.Latitude;
  qMatrizLONGITUDE.AsFloat := NewLocation.Longitude;
  LocationSensor.Active := false;

end;

end.
