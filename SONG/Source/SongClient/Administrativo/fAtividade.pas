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
    Ac_Pesquisar_Detail_Projeto: TAction;
    Ac_Pesquisar_Atividade: TAction;
    procedure FormCreate(Sender: TObject);
    procedure viewRegistrosSTATUSPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_CarregarArquivoExecute(Sender: TObject);
    procedure pcDetailsChange(Sender: TObject);
    procedure viewRegistrosFocusedRecordChanged(Sender: TcxCustomGridTableView;
      APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Ac_Pesquisar_ProjetoExecute(Sender: TObject);
    procedure cbProjetoPrincipalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Pesquisar_Detail_ProjetoExecute(Sender: TObject);
    procedure cbProjetoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbAtividadeVinculoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Pesquisar_AtividadeExecute(Sender: TObject);
  private
    dmLookup: TdmLookup;
    dmAdministrativo: TdmAdministrativo;
    procedure ppvCarregarAtividadesVinculadas;
    procedure ppvFiltrarAtividade;
    procedure ppvPesquisarProjeto(ipCombo: TcxDBLookupComboBox);
    procedure ppvPesquisarAtividade;
    procedure ppvCarregarAtividades(ipIdEspecifico: Integer = 0);

    { Private declarations }
  protected
    function fprGetPermissao: string; override;
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprDefinirTabDetailCadastro; override;
    procedure pprEfetuarPesquisa; override;
    procedure pprExecutarSalvarDetail; override;
    procedure pprBeforeSalvar; override;

    procedure pprCarregarProjetos(ipIdEspecifico: Integer = 0);
  public
    procedure ppuIncluir; override;
    procedure ppuAlterarDetail(ipId: Integer); override;
    procedure ppuIncluirDetail; override;
    procedure ppuRetornar; override;

  end;

var
  frmAtividade: TfrmAtividade;

implementation

uses
  fProjeto;

{$R *.dfm}

{ TfrmAtividade }

procedure TfrmAtividade.Ac_CarregarArquivoExecute(Sender: TObject);
begin
  inherited;
  if FileDialog.Execute then
    begin
      if not TFile.Exists(FileDialog.FileName) then
        raise Exception.Create('Arquivo n�o encontrado.');

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

procedure TfrmAtividade.Ac_Pesquisar_AtividadeExecute(Sender: TObject);
begin
  inherited;
  ppvPesquisarAtividade;
end;

procedure TfrmAtividade.Ac_Pesquisar_Detail_ProjetoExecute(Sender: TObject);
begin
  inherited;
  ppvPesquisarProjeto(cbProjeto);
end;

procedure TfrmAtividade.Ac_Pesquisar_ProjetoExecute(Sender: TObject);
begin
  ppvPesquisarProjeto(cbProjetoPrincipal);
end;

procedure TfrmAtividade.cbAtividadeVinculoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvPesquisarAtividade;
end;

procedure TfrmAtividade.cbProjetoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvPesquisarProjeto(cbProjeto);
end;

procedure TfrmAtividade.cbProjetoPrincipalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvPesquisarProjeto(cbProjetoPrincipal);
end;

procedure TfrmAtividade.ppvPesquisarProjeto(ipCombo: TcxDBLookupComboBox);
var
  vaFrmProjeto: TfrmProjeto;
begin
  inherited;
  vaFrmProjeto := TfrmProjeto.Create(nil);
  try
    vaFrmProjeto.ppuConfigurarModoExecucao(mePesquisa);
    vaFrmProjeto.ShowModal;
    if vaFrmProjeto.IdEscolhido <> 0 then
      begin
        if dmLookup.cdslkProjeto.Locate(TBancoDados.coID, vaFrmProjeto.IdEscolhido, []) then
          begin
            ipCombo.EditValue := vaFrmProjeto.IdEscolhido;
            ipCombo.PostEditValue;
          end
        else
          begin
            pprCarregarProjetos(vaFrmProjeto.IdEscolhido);
            if dmLookup.cdslkProjeto.Locate(TBancoDados.coID, vaFrmProjeto.IdEscolhido, []) then
              begin
                ipCombo.EditValue := vaFrmProjeto.IdEscolhido;
                ipCombo.PostEditValue;
              end;
          end;

      end;
  finally
    vaFrmProjeto.Free;
  end;

end;

procedure TfrmAtividade.ppvPesquisarAtividade();
var
  vaFrmAtividade: TfrmAtividade;
begin
  inherited;
  vaFrmAtividade := TfrmAtividade.Create(nil);
  try
    vaFrmAtividade.ppuConfigurarModoExecucao(mePesquisa);
    vaFrmAtividade.Name := '';
    vaFrmAtividade.ShowModal;
    if vaFrmAtividade.IdEscolhido <> 0 then
      begin
        if dmLookup.cdslkAtividade.Locate(TBancoDados.coID, vaFrmAtividade.IdEscolhido, []) then
          begin
            cbAtividadeVinculo.EditValue := vaFrmAtividade.IdEscolhido;
            cbAtividadeVinculo.PostEditValue;
          end
        else
          begin
            ppvCarregarAtividades(vaFrmAtividade.IdEscolhido);
            if dmLookup.cdslkAtividade.Locate(TBancoDados.coID, vaFrmAtividade.IdEscolhido, []) then
              begin
                cbAtividadeVinculo.EditValue := vaFrmAtividade.IdEscolhido;
                cbAtividadeVinculo.PostEditValue;
              end;
          end;

      end;
  finally
    vaFrmAtividade.Free;
  end;

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

  pcDetails.ActivePage := tabDetailComentario;
end;

procedure TfrmAtividade.pprCarregarProjetos(ipIdEspecifico: Integer);
begin
  dmLookup.cdslkProjeto.ppuLimparParametros;
  if ipIdEspecifico <> 0 then
    dmLookup.cdslkProjeto.ppuAddParametro(TParametros.coID, ipIdEspecifico, TOperadores.coOR);

  // recusado, cancelado, executado
  dmLookup.cdslkProjeto.ppuAddParametro(TParametros.coStatusDiferente,
    Ord(spRecusado).ToString + ';' + Ord(spExecutado).ToString + ';' + Ord(spCancelado).ToString);

  dmLookup.cdslkProjeto.ppuDataRequest();

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
      ppvCarregarAtividadesVinculadas;
    end
  else if pcDetails.ActivePage = tabDetailArquivo then
    dsDetail.DataSet := dmAdministrativo.cdsAtividade_Arquivo
  else if pcDetails.ActivePage = tabDetailComentario then
    dsDetail.DataSet := dmAdministrativo.cdsAtividade_Comentario;

  if not dsDetail.DataSet.Active then
    dsDetail.DataSet.Open;
end;

procedure TfrmAtividade.ppvFiltrarAtividade;
begin
  dmLookup.cdslkAtividade.Filter := TBancoDados.coID + ' <> ' + dmAdministrativo.cdsAtividadeID.AsString;
  dmLookup.cdslkAtividade.Filtered := True;
end;

procedure TfrmAtividade.ppuIncluirDetail;
begin
  inherited;
  if dsDetail.DataSet = dmAdministrativo.cdsAtividade_Arquivo then
    EditCaminhoArquivo.Text := ''
  else if dsDetail.DataSet = dmAdministrativo.cdsAtividade_Vinculo then
    begin
      dmAdministrativo.cdsAtividade_VinculoTIPO_VINCULO.AsInteger := Ord(tvRelacionado);
      ppvFiltrarAtividade;
    end
  else if dsDetail.DataSet = dmAdministrativo.cdsAtividade_Comentario then
    dmAdministrativo.cdsAtividade_ComentarioID_PESSOA.AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
end;

procedure TfrmAtividade.ppuRetornar;
begin
  inherited;
  dmLookup.cdslkAtividade.Filtered := False;
end;

procedure TfrmAtividade.pprBeforeSalvar;
begin
  inherited;
  if dmAdministrativo.cdsAtividadeSTATUS.AsInteger = Ord(saFinalizada) then
    dmPrincipal.FuncoesAdm.ppuValidarFinalizarAtividade(dmAdministrativo.cdsAtividadeID.AsInteger);
end;

procedure TfrmAtividade.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
var
  vaCodigos:string;
begin
  inherited;
  vaCodigos := TUtils.fpuExtrairValoresCheckComboBox(cbProjetosPesquisa);
  if vaCodigos <> '' then
    ipCds.ppuAddParametro(TParametros.coProjeto, vaCodigos);;
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

procedure TfrmAtividade.pprExecutarSalvarDetail;
begin
  try
    inherited;
  except
    on E: Exception do
      begin
        if TRegex.IsMatch(E.Message, coRegexUniqueKey, [roIgnoreCase]) then
          E.RaiseOuterException(Exception.Create('A atividade selecionada j� foi vinculada a atividade atual. Por favor, escolha outra atividade.'));
      end;
  end;

end;

procedure TfrmAtividade.pprPreencherCamposPadroes(ipDataSet: TDataSet);
begin
  inherited;
  if ipDataSet = dmAdministrativo.cdsAtividade_Comentario then
    dmAdministrativo.cdsAtividade_ComentarioDATA_HORA.AsDateTime := StrToDateTime(dmPrincipal.FuncoesGeral.fpuDataHoraAtual)
  else if ipDataSet = dmAdministrativo.cdsAtividade_Vinculo then
    dmAdministrativo.cdsAtividade_VinculoID_ATIVIDADE_ORIGEM.AsInteger := dmAdministrativo.cdsAtividadeID.AsInteger;

end;

procedure TfrmAtividade.ppuAlterarDetail(ipId: Integer);
begin
  inherited;
  if dsDetail.DataSet = dmAdministrativo.cdsAtividade_Vinculo then
    ppvFiltrarAtividade;
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

procedure TfrmAtividade.ppvCarregarAtividades(ipIdEspecifico: Integer);
var
  vaValor: String;
begin
  vaValor := '';
  if Assigned(dmLookup.cdslkAtividade.ValoresParametros) and (dmLookup.cdslkAtividade.ValoresParametros.Count > 0) then
    TUtils.ppuExtrairValorParametro(dmLookup.cdslkAtividade.ValoresParametros[0], vaValor, TParametros.coDelimitador);

  if (ipIdEspecifico <> 0) or (not dmLookup.cdslkAtividade.Active) or (vaValor <> dmAdministrativo.cdsAtividadeID_PROJETO.AsString) then
    begin
      dmLookup.cdslkAtividade.ppuLimparParametros;
      if ipIdEspecifico <> 0 then
        dmLookup.cdslkAtividade.ppuAddParametro(TParametros.coID, ipIdEspecifico, TOperadores.coOR);

      dmLookup.cdslkAtividade.ppuDataRequest([TParametros.coProjeto, TParametros.coStatusDiferente],
        [dmAdministrativo.cdsAtividadeID_PROJETO.AsInteger, Ord(saCancelada).ToString + ';' + Ord(saFinalizada).ToString]);
    end;
end;

procedure TfrmAtividade.ppvCarregarAtividadesVinculadas;
begin
  if pcDetails.ActivePage = tabDetailVinculo then
    begin
      ppvCarregarAtividades();

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
    begin
      try
        ppuSalvar;
      except
        dmAdministrativo.cdsAtividade.CancelUpdates;
        raise;
      end;
    end;
end;

end.
