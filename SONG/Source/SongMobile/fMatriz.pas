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
  Data.Bind.DBScope, System.Actions, FMX.ActnList, FMX.ListBox;

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
    btnSalvar: TButton;
    FloatAnimation1: TFloatAnimation;
    gbLocalizacao: TGroupBox;
    pnNome: TPanel;
    EditNome: TEdit;
    Label1: TLabel;
    Label4: TLabel;
    mmoDescricaoLocalizacao: TMemo;
    pnLatLong: TPanel;
    EditLatitude: TNumberBox;
    Label2: TLabel;
    Label3: TLabel;
    EditLongitude: TNumberBox;
    btnLatLong: TButton;
    LocationSensor: TLocationSensor;
    btnFoto: TButton;
    ScrollBox1: TScrollBox;
    pnFoto: TPanel;
    imgFoto: TImage;
    btnGaleria: TButton;
    StyleBook1: TStyleBook;
    qMatriz: TRFQuery;
    qMatrizID: TFDAutoIncField;
    qMatrizNOME: TStringField;
    qMatrizLATITUDE: TFMTBCDField;
    qMatrizLONGITUDE: TFMTBCDField;
    qMatrizENDERECO: TStringField;
    qMatrizFOTO: TBlobField;
    qMatrizSYNC: TIntegerField;
    BindSourceMatriz: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    ActionList1: TActionList;
    Ac_Salvar: TAction;
    pnEspecie: TPanel;
    Label5: TLabel;
    cbEspecie: TComboBox;
    qEspecie: TRFQuery;
    qEspecieNOME: TStringField;
    BindSourceDB1: TBindSourceDB;
    LinkListControlToField1: TLinkListControlToField;
    qEspecieID: TLargeintField;
    procedure btnRetornarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LocationSensorLocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure btnLatLongClick(Sender: TObject);
    procedure btnFotoClick(Sender: TObject);
    procedure btnGaleriaClick(Sender: TObject);
    procedure Ac_SalvarUpdate(Sender: TObject);
    procedure Ac_SalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure ppvFotoCapturada(ipFoto: TBitmap);
    procedure ppvImagemEscolhida(const Sender: TObject; const M: TMessage);
    { Private declarations }
  public
    procedure ppuAlterar(ipId: Integer);
    procedure ppuIncluir;
  end;

var
  frmMatriz: TfrmMatriz;

implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.SmXhdpiPh.fmx ANDROID}


procedure TfrmMatriz.Ac_SalvarExecute(Sender: TObject);
begin
  if qMatriz.State in [dsEdit, dsInsert] then
    qMatriz.Post;

  if qMatriz.ChangeCount > 0 then
    begin
      qMatriz.ApplyUpdates(0);
      qMatriz.CommitUpdates;
    end;

  Close;
end;

procedure TfrmMatriz.Ac_SalvarUpdate(Sender: TObject);
begin
  TAction(Sender).Enabled := qMatriz.Active and (qMatriz.RecordCount > 0) and (qMatriz.State in [dsEdit, dsInsert]);
end;

procedure TfrmMatriz.btnFotoClick(Sender: TObject);
var
  vaService: IFMXCameraService;
  vaParams: TParamsPhotoQuery;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXCameraService,
    vaService) then
    begin
      vaParams.Editable := False;
      vaParams.OnDidFinishTaking := ppvFotoCapturada;
      vaService.TakePhoto(btnFoto, vaParams);
    end
  else
    ShowMessage('N�o existe suporte para camera neste dispositivo.');
end;

procedure TfrmMatriz.ppuAlterar(ipId: Integer);
begin
  qMatriz.Close;
  qMatriz.ParamByName('ID').AsInteger := ipId;
  qMatriz.Open();
end;

procedure TfrmMatriz.ppuIncluir;
begin
  qMatriz.Append;
  qMatrizSYNC.AsInteger := 0;
end;

procedure TfrmMatriz.ppvFotoCapturada(ipFoto: TBitmap);
begin
  imgFoto.Bitmap.Assign(ipFoto);
end;

procedure TfrmMatriz.ppvImagemEscolhida(const Sender: TObject; const M: TMessage);
begin
  if M is TMessageDidFinishTakingImageFromLibrary then
    imgFoto.Bitmap.Assign(TMessageDidFinishTakingImageFromLibrary(M).Value);
end;

procedure TfrmMatriz.btnGaleriaClick(Sender: TObject);
var
  vaService: IFMXTakenImageService;
  vaParams: TParamsPhotoQuery;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXCameraService, vaService) then
    begin
      vaParams.OnDidFinishTaking := ppvFotoCapturada;
      vaService.TakeImageFromLibrary(btnGaleria, vaParams);
    end
  else
    ShowMessage('N�o existe suporte para camera neste dispositivo.');

end;

procedure TfrmMatriz.btnLatLongClick(Sender: TObject);
begin
  if not LocationSensor.Active then
    LocationSensor.Active := True;

  btnLatLong.Enabled := False;
end;

procedure TfrmMatriz.btnRetornarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMatriz.FormCreate(Sender: TObject);
begin
  qEspecie.Open();

  //TMessageManager.DefaultManager.SubscribeToMessage(TMessageDidFinishTakingImageFromLibrary, ppvImagemEscolhida);
end;

procedure TfrmMatriz.FormShow(Sender: TObject);
begin
  FloatAnimation1.StartValue := Self.Width;
  FloatAnimation1.Start;
end;

procedure TfrmMatriz.LocationSensorLocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
  EditLatitude.Text := Format('%2.6f', [NewLocation.Latitude]);
  EditLongitude.Text := Format('%2.6f', [NewLocation.Longitude]);
  LocationSensor.Active := False;
  btnLatLong.Enabled := True;
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
