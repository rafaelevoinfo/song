unit pExame_Laudo_Pesquisa_Avancada;

interface

uses pmClientDataSet,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, pZero, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxTextEdit, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, RVScroll, SclRView, DBSRVE, dxSkinsCore,
  pmPromedicoSkin, dxSkinscxPCPainter, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, System.Generics.Collections,
  System.Generics.Defaults, Vcl.ImgList, AdvSmartMessageBox, pTypes, cxCheckBox,
  System.ImageList, Datasnap.DBClient;

type

  TOnGravarAudio = reference to procedure(ipCodigoHost: Integer; ipInfoExame: TInfoExame);

  TfrmExame_Laudo_Pesquisa_Avancada = class(TfrmZero)
    pnlPesquisa: TPanel;
    Label1: TLabel;
    cxEditPesquisa: TcxTextEdit;
    bttPesquisa: TButton;
    pnlBotoes: TPanel;
    pnlGeral: TPanel;
    dsPrincipal: TDataSource;
    cxGridPai: TcxGrid;
    GridPesquisaAvancada: TcxGridDBTableView;
    GridPesquisaAvancadaCODIGO: TcxGridDBColumn;
    GridPesquisaAvancadaCODIGO_EXAME: TcxGridDBColumn;
    GridPesquisaAvancadaDATA_EXAME: TcxGridDBColumn;
    GridPesquisaAvancadaNROFICHA_FICHAS: TcxGridDBColumn;
    GridPesquisaAvancadaNOMEPACIENTE: TcxGridDBColumn;
    GridPesquisaAvancadaCODIGO_CTEXAMES: TcxGridDBColumn;
    GridPesquisaAvancadaNOMEPROC: TcxGridDBColumn;
    GridPesquisaAvancadaQTDE_IMAGENS: TcxGridDBColumn;
    GridPesquisaAvancadaCODIGO_SOLICITANTES: TcxGridDBColumn;
    GridPesquisaAvancadaCODIGO_MEDICO_EXAMINADOR: TcxGridDBColumn;
    GridPesquisaAvancadaNREGISTRO_INTERNA: TcxGridDBColumn;
    GridPesquisaAvancadaCODIGO_BCEXAMES: TcxGridDBColumn;
    GridPesquisaAvancadaCODIGO_CONVENIO: TcxGridDBColumn;
    GridPesquisaAvancadaCODIGO_MEDICO_CONFERIDOR: TcxGridDBColumn;
    cxGridPaiLevel1: TcxGridLevel;
    ActionList1: TActionList;
    Ac_VisualizarImagensDICOM: TAction;
    Ac_ImpLaudoLab: TAction;
    Ac_ImpLaudoImagens: TAction;
    Ac_ImpLaudoExameImg: TAction;
    Ac_VisualizarLaudo: TAction;
    Ac_Retornar: TAction;
    bttVisualizarLaudo: TButton;
    bttVisualizarImagensDICOM: TButton;
    bttImpLaudoLab: TButton;
    bttImpLaudoImagens: TButton;
    bttImpLaudoExameImgDICOM: TButton;
    bttFechar: TButton;
    Ac_Pesquisar: TAction;
    pnlVisualizarLaudo: TPanel;
    DBSRichViewEdit1: TDBSRichViewEdit;
    pnlBotoesVisualizarLaudo: TPanel;
    bttRetornarVisualizarLaudo: TButton;
    Ac_RetornarVisualizarLaudo: TAction;
    GridPesquisaAvancadaCTEXAME_DESCRICAO: TcxGridDBColumn;
    GridPesquisaAvancadaMEDICO_EXAMINADOR: TcxGridDBColumn;
    GridPesquisaAvancadaMEDICO_CONFERIDOR: TcxGridDBColumn;
    GridPesquisaAvancadaMEDICO_SOLICITANTE: TcxGridDBColumn;
    pnHost: TPanel;
    Label2: TLabel;
    dsHost: TDataSource;
    EditHost: TcxLookupComboBox;
    GridPesquisaAvancadaCALC_LAUDO: TcxGridDBColumn;
    GridPesquisaAvancadaCALC_LIBERADO: TcxGridDBColumn;
    GridPesquisaAvancadaCALC_IMPRESSO: TcxGridDBColumn;
    GridPesquisaAvancadaCALC_ENTREGUE: TcxGridDBColumn;
    GridPesquisaAvancadaCALC_AUDIO: TcxGridDBColumn;
    bttGravarAudio: TButton;
    bttOuvirAudio: TButton;
    bttAssinarLaudo: TButton;
    Ac_AssinarLaudo: TAction;
    Ac_GravarAudio: TAction;
    Ac_OuvirAudio: TAction;
    ImageListLocal: TImageList;
    advMessage: TAdvSmartMessageBox;
    chkTodosExames: TcxCheckBox;
    procedure Ac_PesquisarExecute(Sender: TObject);
    procedure Ac_RetornarVisualizarLaudoExecute(Sender: TObject);
    procedure Ac_RetornarExecute(Sender: TObject);
    procedure GridPesquisaAvancadaDblClick(Sender: TObject);
    procedure GridPesquisaAvancadaSTATUS_LAUDOGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure FormCreate(Sender: TObject);
    procedure pmfrmZeroFormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Ac_VisualizarLaudoExecute(Sender: TObject);
    procedure Ac_VisualizarImagensDICOMExecute(Sender: TObject);
    procedure Ac_ImpLaudoLabExecute(Sender: TObject);
    procedure Ac_ImpLaudoImagensExecute(Sender: TObject);
    procedure Ac_ImpLaudoExameImgExecute(Sender: TObject);
    procedure DBSRichViewEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bttRetornarVisualizarLaudoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxEditPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure EditHostPropertiesEditValueChanged(Sender: TObject);
    procedure GridPesquisaAvancadaCALC_LAUDOCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure GridPesquisaAvancadaCALC_LAUDOGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure Ac_AssinarLaudoExecute(Sender: TObject);
    procedure Ac_GravarAudioExecute(Sender: TObject);
    procedure Ac_OuvirAudioExecute(Sender: TObject);
    procedure Ac_AssinarLaudoUpdate(Sender: TObject);
    procedure Ac_VisualizarImagensDICOMUpdate(Sender: TObject);
    procedure Ac_OuvirAudioUpdate(Sender: TObject);
    procedure Ac_ImpLaudoImagensUpdate(Sender: TObject);
    procedure Ac_GravarAudioUpdate(Sender: TObject);
    procedure cxEditPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FOnHostChanged: TFunc<Integer, Boolean>;
    FcdsLaudoPesquisaAvancada: TpmClientDataSet;
    FpoImpLaudoImagens: Boolean;
    FpoCodigoExame: Integer;
    FpoCodigoCtExame: Integer;
    FpoImpLaudoExameImgDICOM: Boolean;
    FpoImpLaudoLab: Boolean;
    FpoCodigoExameProcedimento: Integer;
    FpoVisualizarImagensDICOM: Boolean;
    FpoNroFicha: Integer;
    FWorkStation: Boolean;
    FOnGravarAudioClick: TOnGravarAudio;
    FOnOuvirAudioClick: TProc<Integer, Integer>;
    FOnAssinarLaudoClick: TProc<Integer, Integer>;
    FOnVisualizarImprimirLaudo: TProc<Integer, Integer, Boolean>;
    FNomePaciente: String;
    FPermitirImpressao: Boolean;
    FDataExame: TDateTime;
    procedure ppvFecharPnlVisualizarLaudo;
    procedure SetpoCodigoCtExame(const Value: Integer);
    procedure SetpoCodigoExame(const Value: Integer);
    procedure SetpoCodigoExameProcedimento(const Value: Integer);
    procedure SetpoImpLaudoExameImgDICOM(const Value: Boolean);
    procedure SetpoImpLaudoImagens(const Value: Boolean);
    procedure SetpoImpLaudoLab(const Value: Boolean);
    procedure SetpoNroFicha(const Value: Integer);
    procedure SetpoVisualizarImagensDICOM(const Value: Boolean);
    procedure SetcdsLaudoPesquisaAvancada(const Value: TpmClientDataSet);
    procedure SetWorkStation(const Value: Boolean);
    procedure SetOnAssinarLaudoClick(const Value: TProc<Integer, Integer>);
    procedure SetOnGravarAudioClick(const Value: TOnGravarAudio);
    procedure SetOnOuvirAudioClick(const Value: TProc<Integer, Integer>);
    procedure SetOnVisualizarImprimirLaudo(const Value: TProc<Integer, Integer, Boolean>);
    procedure SetNomePaciente(const Value: String);
    procedure SetPermitirImpressao(const Value: Boolean);
    procedure SetOnHostChanged(const Value: TFunc<Integer, Boolean>);
    procedure SetDataExame(const Value: TDateTime);
    { Private declarations }

  public
    { Public declarations }
    property poCodigoExame: Integer read FpoCodigoExame write SetpoCodigoExame;
    property poCodigoExameProcedimento: Integer read FpoCodigoExameProcedimento write SetpoCodigoExameProcedimento;
    property poVisualizarImagensDICOM: Boolean read FpoVisualizarImagensDICOM write SetpoVisualizarImagensDICOM;
    property poImpLaudoLab: Boolean read FpoImpLaudoLab write SetpoImpLaudoLab;
    property poImpLaudoImagens: Boolean read FpoImpLaudoImagens write SetpoImpLaudoImagens;
    property poImpLaudoExameImgDICOM: Boolean read FpoImpLaudoExameImgDICOM write SetpoImpLaudoExameImgDICOM;
    property cdsLaudoPesquisaAvancada: TpmClientDataSet read FcdsLaudoPesquisaAvancada write SetcdsLaudoPesquisaAvancada;
    property WorkStation: Boolean read FWorkStation write SetWorkStation;
    property PermitirImpressao: Boolean read FPermitirImpressao write SetPermitirImpressao;
    property OnGravarAudioClick: TOnGravarAudio read FOnGravarAudioClick write SetOnGravarAudioClick;
    property OnOuvirAudioClick: TProc<Integer, Integer> read FOnOuvirAudioClick write SetOnOuvirAudioClick;
    property OnAssinarLaudoClick: TProc<Integer, Integer> read FOnAssinarLaudoClick write SetOnAssinarLaudoClick;
    property OnVisualizarImprimirLaudo: TProc<Integer, Integer, Boolean> read FOnVisualizarImprimirLaudo write SetOnVisualizarImprimirLaudo;
    property OnChangeHost: TFunc<Integer, Boolean> read FOnHostChanged write SetOnHostChanged;

    // propertys utilizadas para realizar a pesquisa
    property poNroFicha: Integer read FpoNroFicha write SetpoNroFicha;
    property NomePaciente: String read FNomePaciente write SetNomePaciente;
    property poCodigoCtExame: Integer read FpoCodigoCtExame write SetpoCodigoCtExame;
    property DataExame: TDateTime read FDataExame write SetDataExame;

    procedure ppuAtivarUsoHost(ipCdsHost: TDataSet; ipKeyField, ipListField: String);
    procedure ppuRefresh;

  end;

var
  frmExame_Laudo_Pesquisa_Avancada: TfrmExame_Laudo_Pesquisa_Avancada;

implementation

uses
  pMethod2009, pCarregarDados, ppmClasse, pdmPrincipal;

{$R *.dfm}


procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_AssinarLaudoExecute(
  Sender: TObject);
begin
  inherited;
  EditHost.PostEditValue;
  if Assigned(FOnAssinarLaudoClick) then
    begin
      FOnAssinarLaudoClick(EditHost.EditValue, cdsLaudoPesquisaAvancada.FieldByName('CODIGO').AsInteger);
      ppuRefresh;
    end;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_AssinarLaudoUpdate(
  Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Assigned(cdsLaudoPesquisaAvancada) and
    cdsLaudoPesquisaAvancada.Active and (cdsLaudoPesquisaAvancada.RecordCount > 0) and (cdsLaudoPesquisaAvancada.FieldByName('CALC_LAUDO').AsInteger = 1);
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_GravarAudioExecute(
  Sender: TObject);
var
  vaInfoExame: TInfoExame;
begin
  inherited;
  EditHost.PostEditValue;
  if Assigned(FOnGravarAudioClick) then
    begin
      vaInfoExame := TInfoExame.Create(cdsLaudoPesquisaAvancada.FieldByName('CODIGO').AsInteger);
      vaInfoExame.NomePaciente := cdsLaudoPesquisaAvancada.FieldByName('NOMEPACIENTE').AsString;
      vaInfoExame.NomeProcedimento := cdsLaudoPesquisaAvancada.FieldByName('NOMEPROC').AsString;
      vaInfoExame.ExameUid := ''; // Nao tenho essa informacao aqui, mas tbm nao preciso, pois nessa tela nao vai existir audio sem vinculo com exame
      vaInfoExame.DataExame := cdsLaudoPesquisaAvancada.FieldByName('DATA_EXAME').AsDatetime;

      FOnGravarAudioClick(EditHost.EditValue, vaInfoExame);
    end;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_GravarAudioUpdate(
  Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Assigned(cdsLaudoPesquisaAvancada) and
    cdsLaudoPesquisaAvancada.Active and (cdsLaudoPesquisaAvancada.RecordCount > 0);
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_ImpLaudoExameImgExecute(
  Sender: TObject);
begin
  inherited;
  poVisualizarImagensDICOM := False;
  poImpLaudoLab := False;
  poImpLaudoImagens := False;
  poImpLaudoExameImgDICOM := True;
  GridPesquisaAvancadaDblClick(Self);
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_ImpLaudoImagensExecute(
  Sender: TObject);
begin
  inherited;
  poVisualizarImagensDICOM := False;
  poImpLaudoLab := False;
  poImpLaudoImagens := True;
  poImpLaudoExameImgDICOM := False;
  GridPesquisaAvancadaDblClick(Self);
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_ImpLaudoImagensUpdate(
  Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Assigned(cdsLaudoPesquisaAvancada) and cdsLaudoPesquisaAvancada.Active and (cdsLaudoPesquisaAvancada.RecordCount > 0);
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_ImpLaudoLabExecute(
  Sender: TObject);
begin
  inherited;
  if WorkStation then
    begin
      if Assigned(FOnVisualizarImprimirLaudo) then
        FOnVisualizarImprimirLaudo(EditHost.EditValue, cdsLaudoPesquisaAvancada.FieldByName('CODIGO').AsInteger, True);
    end
  else
    begin
      poVisualizarImagensDICOM := False;
      poImpLaudoLab := True;
      poImpLaudoImagens := False;
      poImpLaudoExameImgDICOM := False;
      GridPesquisaAvancadaDblClick(Self);
    end;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_OuvirAudioExecute(
  Sender: TObject);
begin
  inherited;
  EditHost.PostEditValue;
  if Assigned(FOnOuvirAudioClick) then
    FOnOuvirAudioClick(EditHost.EditValue, cdsLaudoPesquisaAvancada.FieldByName('CODIGO').AsInteger);
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_OuvirAudioUpdate(
  Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Assigned(cdsLaudoPesquisaAvancada) and cdsLaudoPesquisaAvancada.Active and (cdsLaudoPesquisaAvancada.RecordCount > 0) and (cdsLaudoPesquisaAvancada.FieldByName('CALC_AUDIO').AsInteger = 1);
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_PesquisarExecute(
  Sender: TObject);
var
  vaCd: TCarregaDados;
begin
  inherited;
  if not bttPesquisa.Enabled then
    Exit;

  if Trim(cxEditPesquisa.Text) = '' then
    raise Exception.Create('Informe o número da fihca ou o nome do paciente a ser pesquisado')
  else if (SoNumeros(cxEditPesquisa.Text) <> cxEditPesquisa.Text) and (Length(Trim(cxEditPesquisa.Text)) < 3) then // pesq por nome
    raise Exception.Create('Informe pelo menos 3 caracteres para realizar a pesquisa');

  vaCd := TCarregaDados.Create;
  try
    if WorkStation then
      vaCd.addParam('IGNORAR_CATEGORIA', 2); // exames de lab nao vao aparecer

    if (not chkTodosExames.Checked) and chkTodosExames.Visible and (poCodigoCtExame <> 0) and (DataExame <> 0) then
      begin
        vaCd.addParam('EditCTExames', poCodigoCtExame);
        vaCd.addParam('Data_Exame', DatetoStr(DataExame) + DatetoStr(DataExame));
      end;

    if SoNumeros(cxEditPesquisa.Text) = cxEditPesquisa.Text then // pesquisar pela ficha
      vaCd.addParams(['RGPESQUISA', 'EDITPESQUISA'], ['No. Ficha', cxEditPesquisa.Text])
    else
      vaCd.addParams(['RGPESQUISA', 'EDITPESQUISA'], ['Nome do Paciente', cxEditPesquisa.Text + '%']);

    vaCd.carregarDados(cdsLaudoPesquisaAvancada);

  finally
    vaCd.free;
  end;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetcdsLaudoPesquisaAvancada(
  const Value: TpmClientDataSet);
begin
  FcdsLaudoPesquisaAvancada := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetDataExame(
  const Value: TDateTime);
begin
  FDataExame := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetNomePaciente(
  const Value: String);
begin
  FNomePaciente := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetOnAssinarLaudoClick(
  const Value: TProc<Integer, Integer>);
begin
  FOnAssinarLaudoClick := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetOnHostChanged(
  const Value: TFunc<Integer, Boolean>);
begin
  FOnHostChanged := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetOnGravarAudioClick(
  const Value: TOnGravarAudio);
begin
  FOnGravarAudioClick := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetOnOuvirAudioClick(
  const Value: TProc<Integer, Integer>);
begin
  FOnOuvirAudioClick := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetOnVisualizarImprimirLaudo(
  const Value: TProc<Integer, Integer, Boolean>);
begin
  FOnVisualizarImprimirLaudo := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetPermitirImpressao(
  const Value: Boolean);
begin
  FPermitirImpressao := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetpoCodigoCtExame(
  const Value: Integer);
begin
  FpoCodigoCtExame := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetpoCodigoExame(
  const Value: Integer);
begin
  FpoCodigoExame := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetpoCodigoExameProcedimento(
  const Value: Integer);
begin
  FpoCodigoExameProcedimento := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetpoImpLaudoExameImgDICOM(
  const Value: Boolean);
begin
  FpoImpLaudoExameImgDICOM := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetpoImpLaudoImagens(
  const Value: Boolean);
begin
  FpoImpLaudoImagens := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetpoImpLaudoLab(
  const Value: Boolean);
begin
  FpoImpLaudoLab := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetpoNroFicha(
  const Value: Integer);
begin
  FpoNroFicha := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetpoVisualizarImagensDICOM(
  const Value: Boolean);
begin
  FpoVisualizarImagensDICOM := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.SetWorkStation(
  const Value: Boolean);
begin
  FWorkStation := Value;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_RetornarExecute(
  Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_RetornarVisualizarLaudoExecute(
  Sender: TObject);
begin
  inherited;
  ppvFecharPnlVisualizarLaudo;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_VisualizarImagensDICOMExecute(
  Sender: TObject);
begin
  inherited;
  poVisualizarImagensDICOM := True;
  poImpLaudoLab := False;
  poImpLaudoImagens := False;
  poImpLaudoExameImgDICOM := False;
  GridPesquisaAvancadaDblClick(Self);
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_VisualizarImagensDICOMUpdate(
  Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := Assigned(cdsLaudoPesquisaAvancada) and cdsLaudoPesquisaAvancada.Active and (cdsLaudoPesquisaAvancada.RecordCount > 0) and (cdsLaudoPesquisaAvancada.FieldByName('QTDE_IMAGENS').AsInteger > 0);
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.Ac_VisualizarLaudoExecute(
  Sender: TObject);
var
  vaForm: TfrmZero;
begin
  inherited;
  if WorkStation then
    begin
      if Assigned(FOnVisualizarImprimirLaudo) then
        FOnVisualizarImprimirLaudo(EditHost.EditValue, cdsLaudoPesquisaAvancada.FieldByName('CODIGO').AsInteger, False);
    end
  else if cdsLaudoPesquisaAvancada.FieldByName('STATUS_LAUDO').AsInteger = 0 then
    MessageTela('Esse Exame não possui laudo para ser visualizado.')
  else
    begin
      vaForm := TfrmZero.Create(Self);
      try
        vaForm.Caption := 'Visualização do Laudo';
        pnlVisualizarLaudo.Parent := vaForm;
        pnlVisualizarLaudo.Align := alClient;
        pnlVisualizarLaudo.Visible := True;
        vaForm.BorderIcons := [];
        vaForm.BorderStyle := bsSingle;
        vaForm.ShowModal;
      finally
        pnlVisualizarLaudo.Visible := False;
        pnlVisualizarLaudo.Parent := Self;
        vaForm.Close;
        FreeAndNil(vaForm);
      end;
    end;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.bttRetornarVisualizarLaudoKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then // Esc
    ppvFecharPnlVisualizarLaudo;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.cxEditPesquisaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_UP then
    GridPesquisaAvancada.Navigator.Buttons.Prior.Click
  else if Key = VK_DOWN then
    GridPesquisaAvancada.Navigator.Buttons.Next.Click;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.cxEditPesquisaKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    Ac_PesquisarExecute(bttPesquisa);
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.GridPesquisaAvancadaCALC_LAUDOCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if not VarIsNull(AViewInfo.Value) then
    begin
      case AViewInfo.Value of
        0: // NAO
          begin
            if AViewInfo.GridRecord.Selected Then
              ACanvas.Brush.Color := clMaroon
            else
              ACanvas.Brush.Color := clRed;
          end;
        1: // SIM
          begin
            if AViewInfo.GridRecord.Selected Then
              ACanvas.Brush.Color := clTeal
            else
              ACanvas.Brush.Color := clGreen;
          end;
      end;
      ACanvas.Font.Color := clYellow;
    end;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.GridPesquisaAvancadaCALC_LAUDOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  inherited;
  if AText = '1' then
    AText := 'Sim'
  else
    AText := 'Não';
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.GridPesquisaAvancadaDblClick(
  Sender: TObject);
begin
  inherited;
  if cdsLaudoPesquisaAvancada.RecordCount = 0 then
    begin
      MessageTela('Nenhum Exame foi Selecionado.');
      poVisualizarImagensDICOM := False;
      poImpLaudoLab := False;
      poImpLaudoImagens := False;
      poImpLaudoExameImgDICOM := False;
      Exit;
    end
  else
    begin
      poCodigoExame := cdsLaudoPesquisaAvancada.FieldByName('CODIGO_EXAME').AsInteger;
      poCodigoCtExame := cdsLaudoPesquisaAvancada.FieldByName('CODIGO_CTEXAMES').AsInteger;
      poNroFicha := cdsLaudoPesquisaAvancada.FieldByName('NROFICHA_FICHAS').AsInteger;
      poCodigoExameProcedimento := cdsLaudoPesquisaAvancada.FieldByName('CODIGO').AsInteger;
      if WorkStation then
        begin
          poVisualizarImagensDICOM := True;
          if cdsLaudoPesquisaAvancada.FieldByName('QTDE_IMAGENS').AsInteger < 1 then
            begin
              with advMessage.Messages.Add do
                Begin
                  MinDuration := 2000;
                  MaxDuration := 2000;
                  Text := 'Não existem imagens para este exame';
                  show;
                End;
              Exit;
            end;

        end;

      Close;
    end;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.GridPesquisaAvancadaSTATUS_LAUDOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  inherited;
  if (Trim(AText) = '') or (Trim(AText) = '0') then
    AText := 'Sem laudo'
  else if (Trim(AText) = '-1') then
    AText := 'Com laudo'
  else if (Trim(AText) = '1') then
    AText := 'Aguardando confirmacao'
  else if (Trim(AText) = '2') then
    AText := 'Confirmado'
  else if (Trim(AText) = '3') then
    AText := 'Liberado';
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.DBSRichViewEdit1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then // Esc
    ppvFecharPnlVisualizarLaudo;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.EditHostPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if WorkStation then
    begin
      if Assigned(FOnHostChanged) then
        begin
          if FOnHostChanged(EditHost.EditValue) then
            begin
              bttPesquisa.Enabled := True;
              if Trim(cxEditPesquisa.Text) <> '' then
                bttPesquisa.Click
              else
                cdsLaudoPesquisaAvancada.Close;
            end
          else
            begin
              cdsLaudoPesquisaAvancada.Close;
              bttPesquisa.Enabled := False;
            end;
        end;

    end;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.FormCreate(Sender: TObject);
var
  Grid: TListaComponentes;
begin
  inherited;
  poCodigoExame := 0;
  poCodigoCtExame := 0;
  poCodigoExameProcedimento := 0;
  FPermitirImpressao := True;
  Grid := TListaComponentes.Create(Self);
  Grid.ResturarGrids;
  Grid.free;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(dsPrincipal.DataSet) then
    dsPrincipal.DataSet.Close;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.pmfrmZeroFormShow(Sender: TObject);
begin
  inherited;
  dsPrincipal.DataSet := cdsLaudoPesquisaAvancada;
  if poNroFicha <> 0 then
    begin
      // TCarregaDados.ppuCarregarDados(cdsLaudoPesquisaAvancada, ['RGPESQUISA', 'EDITPESQUISA'], ['No. Ficha', IntToStr(poNroFicha)]);
      cxEditPesquisa.Text := IntToStr(poNroFicha);
    end
  else if NomePaciente.Trim <> '' then
    begin
      // TCarregaDados.ppuCarregarDados(cdsLaudoPesquisaAvancada, ['RGPESQUISA', 'EDITPESQUISA'], ['Nome do Paciente', NomePaciente + '%']);
      cxEditPesquisa.Text := NomePaciente;
    end;

  cxEditPesquisa.SetFocus;
  cxEditPesquisa.SelectAll;
  poVisualizarImagensDICOM := False;
  poImpLaudoLab := False;
  poImpLaudoImagens := False;
  poImpLaudoExameImgDICOM := False;

  if FWorkStation then
    Ac_ImpLaudoLab.Caption := 'Imprimir';

  bttImpLaudoLab.Visible := FPermitirImpressao;
  bttImpLaudoImagens.Visible := (not FWorkStation) and FPermitirImpressao;
  bttImpLaudoExameImgDICOM.Visible := (not FWorkStation) and FPermitirImpressao;
  bttAssinarLaudo.Visible := FWorkStation;
  bttGravarAudio.Visible := FWorkStation;
  bttOuvirAudio.Visible := FWorkStation;

  chkTodosExames.Visible := (poCodigoCtExame <> 0) and (DataExame <> 0);
  chkTodosExames.Checked := not chkTodosExames.Visible;

  if cxEditPesquisa.Text <> '' then
    bttPesquisa.Click;
end;


procedure TfrmExame_Laudo_Pesquisa_Avancada.ppuAtivarUsoHost(ipCdsHost: TDataSet; ipKeyField, ipListField: String);
begin
  dsHost.DataSet := ipCdsHost;
  EditHost.Properties.KeyFieldNames := ipKeyField;
  EditHost.Properties.ListFieldNames := ipListField;

  pnHost.Visible := True;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.ppuRefresh;
var
  vaRow: Integer;
begin
  if GridPesquisaAvancada.ViewData.RecordCount > 0 then
    begin
      vaRow := GridPesquisaAvancada.Controller.FocusedRowIndex;

      bttPesquisa.Click;

// tenta focar o registro informado
      GridPesquisaAvancada.Controller.FocusRecord(vaRow, True);
      if GridPesquisaAvancada.Controller.SelectedRowCount = 0 then // se for zero significa que nao conseguiu focar
        GridPesquisaAvancada.Controller.FocusRecord(GridPesquisaAvancada.ViewData.RecordCount - 1, True);
    end
  else
    bttPesquisa.Click;
end;

procedure TfrmExame_Laudo_Pesquisa_Avancada.ppvFecharPnlVisualizarLaudo;
begin
  if pnlVisualizarLaudo.Parent is Tform then
    Tform(pnlVisualizarLaudo.Parent).Close;
end;

end.
