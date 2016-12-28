unit fMatriz;

interface

uses
  FMX.MediaLibrary, FMX.Platform, System.Messaging,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
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
  FMX.MediaLibrary.Actions;

type
  TLocalizacao = class
  private
    FLatitude: Double;
    FDescricao: String;
    FLongitude: Double;
    procedure SetDescricao(const Value: String);
    procedure SetLatitude(const Value: Double);
    procedure SetLongitude(const Value: Double);
  public
    property Latitude: Double read FLatitude write SetLatitude;
    property Longitude: Double read FLongitude write SetLongitude;
    property Descricao: String read FDescricao write SetDescricao;
  end;

  TEspecie = class
  private
    FNome: String;
    procedure SetNome(const Value: String);
  public
    property Nome: String read FNome write SetNome;
  end;

  TMatriz = class
  private
    FFoto: TStream;
    FLocalizacao: TLocalizacao;
    FNome: String;
    procedure SetFoto(const Value: TStream);
    procedure SetLocalizacao(const Value: TLocalizacao);
    procedure SetNome(const Value: String);
  public
    property Nome: String read FNome write SetNome;
    property Localizacao: TLocalizacao read FLocalizacao write SetLocalizacao;
    property Foto: TStream read FFoto write SetFoto;
  end;

  TfrmMatriz = class(TForm)
    pnPrincipal: TPanel;
    tbAcao: TToolBar;
    btnRetornar: TButton;
    FloatAnimation1: TFloatAnimation;
    pnNome: TPanel;
    EditNome: TEdit;
    Label1: TLabel;
    LocationSensor: TLocationSensor;
    ScrollBox1: TScrollBox;
    BindSourceMatriz: TBindSourceDB;
    ActionList1: TActionList;
    Ac_Salvar: TAction;
    pnEspecie: TPanel;
    Label5: TLabel;
    cbEspecie: TComboBox;
    qEspecie: TRFQuery;
    qEspecieNOME: TStringField;
    BindSourceEspecie: TBindSourceDB;
    qEspecieID: TLargeintField;
    mmoDescricaoLocalizacao: TMemo;
    Label4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pnLatLong: TPanel;
    Ac_Retornar: TAction;
    GridPanelLayout1: TGridPanelLayout;
    recFade: TRectangle;
    recModal: TRectangle;
    LoadLocalizacao: TAniIndicator;
    Label6: TLabel;
    btnLocalizacao: TSpeedButton;
    imgLocalizacao: TImage;
    imgSalvar: TImage;
    btnSalvar: TSpeedButton;
    imgCamera: TImage;
    imgGaleria: TImage;
    EditLatitude: TEdit;
    EditLongitude: TEdit;
    btnCamera: TSpeedButton;
    btnGaleria: TSpeedButton;
    imgFoto: TImage;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    LinkControlToField1: TLinkControlToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
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
    Ac_Tirar_Foto: TTakePhotoFromCameraAction;
    Ac_Carregar_Foto: TTakePhotoFromLibraryAction;
    procedure FormCreate(Sender: TObject);
    procedure LocationSensorLocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure Ac_SalvarUpdate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Ac_RetornarExecute(Sender: TObject);
    procedure btnLocalizacaoClick(Sender: TObject);
    procedure Ac_SalvarExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure Ac_Tirar_FotoDidFinishTaking(Image: TBitmap);
  private
    FOnSalvar: TProc;
    procedure SetOnSalvar(const Value: TProc);
    function fpvValidarDados(var opMsgErro: String): Boolean;
    procedure ppvIniciarEdicao;
    procedure ppvAjustarTamanhoFoto;
    { Private declarations }
  public
    property OnSalvar: TProc read FOnSalvar write SetOnSalvar;
    procedure ppuAlterar(ipId: Integer);
    procedure ppuIncluir;

  end;

var
  frmMatriz: TfrmMatriz;

implementation

uses
  fPrincipal;

{$R *.fmx}

procedure TfrmMatriz.Ac_RetornarExecute(Sender: TObject);
begin
  Close;

end;

function TfrmMatriz.fpvValidarDados(var opMsgErro: String): Boolean;
var
  vaErros: TStringList;
begin
  Result := true;
  vaErros := TStringList.Create;
  try
    if EditNome.Text = '' then
      vaErros.Add('Nome');

    if cbEspecie.ItemIndex = -1 then
      vaErros.Add('Espécie');

    if vaErros.Count > 0 then
      begin
        Result := false;
        opMsgErro := 'Os seguintes campos são obrigatórios e não foram preenchidos:' + slinebreak + vaErros.DelimitedText;
      end;
  finally
    vaErros.free;
  end;

end;

procedure TfrmMatriz.Ac_SalvarExecute(Sender: TObject);
var
  vaMsgErro: String;
begin
  try
    if fpvValidarDados(vaMsgErro) then
      begin
        if qMatriz.State in [dsEdit, dsInsert] then
          begin
            qMatriz.Post;
          end;

        if Assigned(FOnSalvar) then
          FOnSalvar();

        Close;
      end
    else
      showMessage('Não foi possível salvar. Detalhes:' + vaMsgErro);
  except
    on e: Exception do
      showMessage('Não foi possível salvar. Detalhes:' + slinebreak + e.Message);
  end;
end;

procedure TfrmMatriz.Ac_SalvarUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := qMatriz.Active and (qMatriz.State in [dsEdit, dsInsert]);
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

        ppvIniciarEdicao;
        qMatrizFOTO.LoadFromStream(vaStream);
      finally
        vaFoto.free;
        vaStream.free;
      end;
    end;
end;

procedure TfrmMatriz.ppuAlterar(ipId: Integer);
begin
  qMatriz.Close;
  qMatriz.ParamByName('ID').AsInteger := ipId;
  qMatriz.Open();
end;

procedure TfrmMatriz.ppuIncluir;
begin
  qMatriz.Open();
  qMatriz.Append;
  qMatrizSYNC.AsInteger := 0;
end;

procedure TfrmMatriz.SetOnSalvar(const Value: TProc);
begin
  FOnSalvar := Value;
end;

procedure TfrmMatriz.btnLocalizacaoClick(Sender: TObject);
begin
  if not LocationSensor.Active then
    LocationSensor.Active := true;

  recFade.Visible := true;
  recModal.Visible := true;
end;

procedure TfrmMatriz.FormCreate(Sender: TObject);
begin
  qEspecie.Open();

  recFade.Visible := false;
  recModal.Visible := false;

  recFade.BringToFront;
  recModal.BringToFront;
  // TMessageManager.DefaultManager.SubscribeToMessage(TMessageDidFinishTakingImageFromLibrary, ppvImagemEscolhida);
end;

procedure TfrmMatriz.FormKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
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
end;

procedure TfrmMatriz.LocationSensorLocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
  recFade.Visible := false;
  recModal.Visible := false;

  ppvIniciarEdicao;

  qMatrizLATITUDE.AsFloat := NewLocation.Latitude;
  qMatrizLONGITUDE.AsFloat := NewLocation.Longitude;
  LocationSensor.Active := false;

end;

procedure TfrmMatriz.ppvIniciarEdicao;
begin
  if not(qMatriz.State in [dsEdit, dsInsert]) then
    qMatriz.Edit;
end;

{ TMatriz }

procedure TMatriz.SetFoto(const Value: TStream);
begin
  FFoto := Value;
end;

procedure TMatriz.SetLocalizacao(const Value: TLocalizacao);
begin
  FLocalizacao := Value;
end;

procedure TMatriz.SetNome(const Value: String);
begin
  FNome := Value;
end;

{ TLocalizacao }

procedure TLocalizacao.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TLocalizacao.SetLatitude(const Value: Double);
begin
  FLatitude := Value;
end;

procedure TLocalizacao.SetLongitude(const Value: Double);
begin
  FLongitude := Value;
end;

{ TEspecie }

procedure TEspecie.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
