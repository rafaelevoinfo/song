unit fAtividade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrudMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuAdministrativo, dmuLookup,
  cxCheckBox, cxCheckComboBox, uTypes, System.TypInfo, uControleAcesso, cxDBEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dmuPrincipal, cxMemo,
  uClientDataSet, System.IOUtils, Vcl.ExtDlgs, uUtils,
  System.RegularExpressions, System.DateUtils;

type
  TfrmAtividade = class(TfrmBasicoCrudMasterDetail)
    tabDetailProjeto: TcxTabSheet;
    tabDetailVinculo: TcxTabSheet;
    tabDetailArquivo: TcxTabSheet;
    tabDetailComentario: TcxTabSheet;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosID_SOLICITANTE: TcxGridDBColumn;
    viewRegistrosID_RESPONSAVEL: TcxGridDBColumn;
    viewRegistrosSTATUS: TcxGridDBColumn;
    viewRegistrosDATA_INICIAL: TcxGridDBColumn;
    viewRegistrosDATA_FINAL: TcxGridDBColumn;
    viewRegistrosNOTIFICAR_ENVOLVIDOS: TcxGridDBColumn;
    Label3: TLabel;
    cbProjetosPesquisa: TcxCheckComboBox;
    Label4: TLabel;
    EditNome: TcxDBTextEdit;
    Label5: TLabel;
    EditDataInicioAtividade: TcxDBDateEdit;
    Label6: TLabel;
    EditDataTerminoAtividade: TcxDBDateEdit;
    Label7: TLabel;
    cbSolicitante: TcxDBLookupComboBox;
    Label8: TLabel;
    cbResponsavel: TcxDBLookupComboBox;
    cbStatus: TcxDBImageComboBox;
    Label9: TLabel;
    chkNotificarEnvolvidos: TcxDBCheckBox;
    Label10: TLabel;
    EditDescricao: TcxDBMemo;
    Label11: TLabel;
    EditFuncaoPessoa: TcxDBTextEdit;
    Label12: TLabel;
    cbPessoaEnvolvida: TcxDBLookupComboBox;
    tabCadastroDetailProjeto: TcxTabSheet;
    tabCadastroDetailVinculo: TcxTabSheet;
    tabCadastroDetailArquivo: TcxTabSheet;
    tabCadastroDetailComentario: TcxTabSheet;
    pnCadastroDetailVinculo: TPanel;
    btnSalvarAtividadeVinculo: TButton;
    btnSalvarIncluirAtividadeVinculo: TButton;
    btnactCnPrefixWizard2: TButton;
    pnCadastroDetailArquivo: TPanel;
    btnSalvarArquivo: TButton;
    btnCancelarArquivo: TButton;
    btnSalvarIncluirArquivo: TButton;
    pnCadastroDetailComentario: TPanel;
    btnSalvarComentario: TButton;
    btnCancelarComentario: TButton;
    btnSalvarIncluirComentario: TButton;
    pnCadastroDetailProjeto: TPanel;
    btnSalvarProjeto: TButton;
    btnCancelarProjeto: TButton;
    btnSalvarIncluirProjeto: TButton;
    dsAtividade_Projeto: TDataSource;
    dsAtividade_Vinculo: TDataSource;
    dsAtividade_Arquivo: TDataSource;
    dsAtividade_Comentario: TDataSource;
    Label17: TLabel;
    cbProjetoPrincipal: TcxDBLookupComboBox;
    btnPesquisarProjeto: TButton;
    Ac_Pesquisar_Projeto: TAction;
    Ac_CarregarArquivo: TAction;
    SaveDialogDocumento: TSaveDialog;
    FileDialog: TOpenTextFileDialog;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_PESSOA: TcxGridDBColumn;
    viewRegistrosDetailFUNCAO: TcxGridDBColumn;
    pnBotoesDetailVinculo: TPanel;
    btnIncluirVinculo: TButton;
    cxGrid1: TcxGrid;
    viewDetailVinculo: TcxGridDBTableView;
    viewDetailVinculoID: TcxGridDBColumn;
    viewDetailVinculoTIPO_VINCULO: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel1: TPanel;
    Button2: TButton;
    cxGrid2: TcxGrid;
    viewProjetos: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    viewProjetosID: TcxGridDBColumn;
    viewProjetosID_PROJETO: TcxGridDBColumn;
    Panel2: TPanel;
    Button3: TButton;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    Panel3: TPanel;
    Button4: TButton;
    cxGrid4: TcxGrid;
    viewDetailComentario: TcxGridDBTableView;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxGridDBTableView1ID: TcxGridDBColumn;
    cxGridDBTableView1NOME: TcxGridDBColumn;
    cxGridDBTableView1DATA_UPLOAD: TcxGridDBColumn;
    viewDetailComentarioID: TcxGridDBColumn;
    viewDetailComentarioID_PESSOA: TcxGridDBColumn;
    viewDetailComentarioCOMENTARIO: TcxGridDBColumn;
    viewDetailComentarioDATA_HORA: TcxGridDBColumn;
    pnCadastroVinculo: TPanel;
    Label15: TLabel;
    cbTipoVinculo: TcxDBImageComboBox;
    Label18: TLabel;
    cbAtividadeVinculo: TcxDBLookupComboBox;
    btnPesquisarAtividade: TButton;
    Label16: TLabel;
    EditObservacaoVinculo: TcxDBMemo;
    pnCadastroProjeto: TPanel;
    Label13: TLabel;
    cbProjeto: TcxDBLookupComboBox;
    Label14: TLabel;
    EditObsAtividadeProjeto: TcxDBMemo;
    Button1: TButton;
    pnCadastroArquivo: TPanel;
    Label19: TLabel;
    EditNomeArquivo: TcxDBTextEdit;
    Label20: TLabel;
    EditCaminhoArquivo: TcxButtonEdit;
    Label21: TLabel;
    EditDescricaoArquivo: TcxDBMemo;
    pnCadastroComentario: TPanel;
    EditComentario: TcxDBMemo;
    Label22: TLabel;
    viewProjetosNOME_PROJETO: TcxGridDBColumn;
    viewDetailVinculoID_ATIVIDADE_VINCULO: TcxGridDBColumn;
    viewDetailVinculoNOME_ATIVIDADE_VINCULO: TcxGridDBColumn;
    viewRegistrosID_PROJETO: TcxGridDBColumn;
    viewRegistrosNOME_PROJETO: TcxGridDBColumn;
    viewDetailVinculoID_ATIVIDADE_ORIGEM: TcxGridDBColumn;
    viewDetailVinculoNOME_ATIVIDADE_ORIGEM: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure viewRegistrosSTATUSPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_CarregarArquivoExecute(Sender: TObject);
    procedure pcDetailsChange(Sender: TObject);
    procedure viewRegistrosFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    procedure ppvCarregarAtividadesVinculadas;

    { Private declarations }
  protected
    function fprGetPermissao: string; override;
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprDefinirTabDetailCadastro; override;
    procedure pprEfetuarPesquisa; override;

    procedure pprCarregarProjetos;
  public
    procedure ppuIncluir; override;
    procedure ppuIncluirDetail; override;
    procedure ppuRetornar; override;

  end;

var
  frmAtividade: TfrmAtividade;

implementation

{$R *.dfm}

{ TfrmAtividade }

procedure TfrmAtividade.Ac_CarregarArquivoExecute(Sender: TObject);
begin
  inherited;
  if FileDialog.Execute then
    begin
      if not TFile.Exists(FileDialog.FileName) then
        raise Exception.Create('Arquivo não encontrado.');

      if not(dmAdministrativo.cdsAtividade_Arquivo.State in [dsEdit, dsInsert]) then
        dmAdministrativo.cdsAtividade_Arquivo.Edit;

      EditCaminhoArquivo.Text := FileDialog.FileName;
      dmAdministrativo.cdsAtividade_ArquivoARQUIVO.LoadFromFile(FileDialog.FileName);
      dmAdministrativo.cdsAtividade_ArquivoNOME_ORIGINAL.AsString := TPath.GetFileName(FileDialog.FileName);
      dmAdministrativo.cdsAtividade_ArquivoDATA_UPLOAD.AsDateTime := StrToDateTime(dmPrincipal.FuncoesGeral.fpuDataHoraAtual);
    end
  else
    EditCaminhoArquivo.Text := '';
end;

procedure TfrmAtividade.FormCreate(Sender: TObject);
begin
  dmAdministrativo := TdmAdministrativo.Create(Self);
  dmAdministrativo.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  PesquisaPadrao := tppData;
  EditDataInicialPesquisa.Date := IncDay(Now, -7);;
  EditDataFinalPesquisa.Date := IncDay(Now, 7);

  dmLookup.cdslkPessoa.Open;

  pprCarregarProjetos;
end;

procedure TfrmAtividade.pprCarregarProjetos;
begin
  dmLookup.cdslkProjeto.ppuDataRequest([TParametros.coStatusDiferente],
    [Ord(spRecusado).ToString + ';' + Ord(spExecutado).ToString + ';' + Ord(spCancelado).ToString]); // recusado, cancelado, executado

  cbProjetosPesquisa.Properties.Items.Clear;
  TUtils.ppuPercorrerCds(dmLookup.cdslkProjeto,
    procedure
    var
      vaProjeto: TcxCheckComboBoxItem;
    begin
      vaProjeto := cbProjetosPesquisa.Properties.Items.Add;
      vaProjeto.Tag := dmLookup.cdslkProjetoID.AsInteger;
      vaProjeto.Description := dmLookup.cdslkProjetoNOME.AsString;
    end);
end;

function TfrmAtividade.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoAdministrativo), Ord(admAtividade));
end;

procedure TfrmAtividade.pcDetailsChange(Sender: TObject);
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    dsDetail.DataSet := dmAdministrativo.cdsAtividade_Pessoa
  else if pcDetails.ActivePage = tabDetailProjeto then
    dsDetail.DataSet := dmAdministrativo.cdsAtividade_Projeto
  else if pcDetails.ActivePage = tabDetailVinculo then
    begin
      dsDetail.DataSet := dmAdministrativo.cdsAtividade_Vinculo;
      if (not dmLookup.cdslkAtividade.Active) or (dmLookup.cdslkAtividade.ValoresParametros[0] <> dmAdministrativo.cdsAtividadeID_PROJETO.AsInteger)
      then
        begin
          dmLookup.cdslkAtividade.ppuLimparParametros;
          dmLookup.cdslkAtividade.ppuDataRequest([TParametros.coProjeto, TParametros.coStatusDiferente],
            [dmAdministrativo.cdsAtividadeID_PROJETO.AsInteger, Ord(saCancelada).ToString + ';' + Ord(saFinalizada).ToString]);
        end;

      ppvCarregarAtividadesVinculadas;
    end
  else if pcDetails.ActivePage = tabDetailArquivo then
    dsDetail.DataSet := dmAdministrativo.cdsAtividade_Arquivo
  else if pcDetails.ActivePage = tabDetailComentario then
    dsDetail.DataSet := dmAdministrativo.cdsAtividade_Comentario;

  if not dsDetail.DataSet.Active then
    dsDetail.DataSet.Open;
end;

procedure TfrmAtividade.ppuIncluirDetail;
begin
  inherited;
  if dsDetail.DataSet = dmAdministrativo.cdsAtividade_Arquivo then
    EditCaminhoArquivo.Text := ''
  else if dsDetail.DataSet = dmAdministrativo.cdsAtividade_Vinculo then
    begin
      dmAdministrativo.cdsAtividade_VinculoTIPO_VINCULO.AsInteger := Ord(tvRelacionado);
      dmLookup.cdslkAtividade.Filter := TBancoDados.coId + ' <> ' + dmAdministrativo.cdsAtividadeID.AsString;
      dmLookup.cdslkAtividade.Filtered := True;
    end
  else if dsDetail.DataSet = dmAdministrativo.cdsAtividade_Comentario then
    dmAdministrativo.cdsAtividade_ComentarioID_PESSOA.AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
end;

procedure TfrmAtividade.ppuRetornar;
begin
  inherited;
  dmLookup.cdslkAtividade.Filtered := False;
end;

procedure TfrmAtividade.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
var
  vaIndices: TArray<String>;
  I: Integer;
  vaCodigosProjetos: TStringList;
begin
  inherited;
  if (not VarIsNull(cbProjetosPesquisa.EditValue)) and (cbProjetosPesquisa.EditValue <> '') then
    begin
      vaCodigosProjetos := TStringList.Create;
      try
        vaCodigosProjetos.Delimiter := coDelimitadorPadrao;
        vaCodigosProjetos.StrictDelimiter := True;

        vaIndices := TRegex.Split(Copy(cbProjetosPesquisa.EditValue, Pos(';', cbProjetosPesquisa.EditValue) + 1, Length(cbProjetosPesquisa.EditValue)
          ), ',', [roIgnoreCase]);
        for I := 0 to High(vaIndices) do
          begin
            vaCodigosProjetos.Add(cbProjetosPesquisa.Properties.Items[vaIndices[I].ToInteger].Tag.ToString());
          end;

        if vaCodigosProjetos.Count > 0 then
          ipCds.ppuAddParametro(TParametros.coProjeto, vaCodigosProjetos.DelimitedText);
      finally
        vaCodigosProjetos.Clear;
        vaCodigosProjetos.Free;
      end;
    end;
end;

procedure TfrmAtividade.pprDefinirTabDetailCadastro;
begin
  inherited;
  if pcDetails.ActivePage = tabDetail then
    pcPrincipal.ActivePage := tabCadastroDetail
  else if pcDetails.ActivePage = tabDetailProjeto then
    pcPrincipal.ActivePage := tabCadastroDetailProjeto
  else if pcDetails.ActivePage = tabDetailVinculo then
    pcPrincipal.ActivePage := tabCadastroDetailVinculo
  else if pcDetails.ActivePage = tabDetailArquivo then
    pcPrincipal.ActivePage := tabCadastroDetailArquivo
  else if pcDetails.ActivePage = tabDetailComentario then
    pcPrincipal.ActivePage := tabCadastroDetailComentario;
end;

procedure TfrmAtividade.pprEfetuarPesquisa;
begin
  inherited;
  ppvCarregarAtividadesVinculadas;
end;

procedure TfrmAtividade.pprPreencherCamposPadroes(ipDataSet: TDataSet);
begin
  inherited;
  if ipDataSet = dmAdministrativo.cdsAtividade_Comentario then
    dmAdministrativo.cdsAtividade_ComentarioDATA_HORA.AsDateTime := StrToDateTime(dmPrincipal.FuncoesGeral.fpuDataHoraAtual)
  else if ipDataSet = dmAdministrativo.cdsAtividade_Vinculo then
    dmAdministrativo.cdsAtividade_VinculoID_ATIVIDADE_ORIGEM.AsInteger := dmAdministrativo.cdsAtividadeID.AsInteger;

end;

procedure TfrmAtividade.ppuIncluir;
begin
  inherited;
  dmAdministrativo.cdsAtividadeSTATUS.AsInteger := 0; // programada
  dmAdministrativo.cdsAtividadeID_SOLICITANTE.AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
end;

procedure TfrmAtividade.viewRegistrosFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  ppvCarregarAtividadesVinculadas;
end;

procedure TfrmAtividade.ppvCarregarAtividadesVinculadas;
begin
  if pcDetails.ActivePage = tabDetailVinculo then
    begin
      if (not dmAdministrativo.cdsAtividade.Active) or (dmAdministrativo.cdsAtividade.RecordCount = 0) then
        dmAdministrativo.cdsAtividade_Vinculo.Close
      else if (not dmAdministrativo.cdsAtividade.Active) or
        (dmAdministrativo.cdsAtividade_Vinculo.Params.ParamByName('ID_ATIVIDADE_ORIGEM').AsInteger <> dmAdministrativo.cdsAtividadeID.AsInteger) then
        begin
          dmAdministrativo.cdsAtividade_Vinculo.Close;
          dmAdministrativo.cdsAtividade_Vinculo.Params.ParamByName('ID_ATIVIDADE_ORIGEM').AsInteger := dmAdministrativo.cdsAtividadeID.AsInteger;
          dmAdministrativo.cdsAtividade_Vinculo.Open;
        end;
    end;

end;

procedure TfrmAtividade.viewRegistrosSTATUSPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if dmAdministrativo.cdsAtividade.State in [dsEdit, dsInsert] then
    dmAdministrativo.cdsAtividade.Post;
end;

end.
