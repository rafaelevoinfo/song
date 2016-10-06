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
  System.RegularExpressions, System.DateUtils, cxLocalization, System.Types,
  fAreaAtuacao, uExceptions, Datasnap.DBClient, ppDB, ppDBPipe, ppParameter,
  ppDesignLayer, ppVar, ppCtrls, ppBands, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, ppStrtch, ppRegion, ppMemo, Vcl.Menus;

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
    Ac_Download: TAction;
    ColumnDownload: TcxGridDBColumn;
    btnPesquisarPessoa: TButton;
    Ac_Pesquisar_Pessoa_Envolvida: TAction;
    viewRegistrosDetailNOME_PESSOA: TcxGridDBColumn;
    viewRegistrosDATA_CADASTRO: TcxGridDBColumn;
    cbAreaAtuacao: TcxDBLookupComboBox;
    lb1: TLabel;
    btnAdicionarAreaAtuacao: TButton;
    btnAdicionarAreaExecucao: TButton;
    cbAreaExecucao: TcxDBLookupComboBox;
    lb2: TLabel;
    Ac_Adicionar_Area_Atuacao: TAction;
    Ac_Adicionar_Area_Execucao: TAction;
    cdsLocal_Area_Atuacao: TClientDataSet;
    cdsLocal_Area_AtuacaoID: TIntegerField;
    cdsLocal_Area_AtuacaoNOME: TStringField;
    cdsLocal_Area_Execucao: TClientDataSet;
    cdsLocal_Area_ExecucaoID: TIntegerField;
    cdsLocal_Area_ExecucaoNOME: TStringField;
    dsLocal_Area_Atuacao: TDataSource;
    dsLocal_Area_Execucao: TDataSource;
    cdsLocal_Area_ExecucaoID_AREA_ATUACAO: TIntegerField;
    viewRegistrosDATA_FINALIZACAO: TcxGridDBColumn;
    viewRegistrosID_AREA_ATUACAO: TcxGridDBColumn;
    viewRegistrosID_AREA_EXECUCAO: TcxGridDBColumn;
    viewRegistrosAREA_ATUACAO: TcxGridDBColumn;
    viewRegistrosAREA_EXECUCAO: TcxGridDBColumn;
    ppOrdemServico: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel8: TppLabel;
    ppDBImage2: TppDBImage;
    ppDBImage1: TppDBImage;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppShape1: TppShape;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel6: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppSystemVariable1: TppSystemVariable;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    DBPipeAtividade: TppDBPipeline;
    DBPipeOrganizacao: TppDBPipeline;
    ColumnImprimirOS: TcxGridDBColumn;
    Ac_Imprimir_OS: TAction;
    ppDBText4: TppDBText;
    ppLabel1: TppLabel;
    ppDBText18: TppDBText;
    ppLabel5: TppLabel;
    ppLabel9: TppLabel;
    ppDBText19: TppDBText;
    ppLabel10: TppLabel;
    ppDBText20: TppDBText;
    ppLabel11: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppRegion1: TppRegion;
    ppDBText12: TppDBText;
    ppLine2: TppLine;
    ppDBText13: TppDBText;
    ppLine3: TppLine;
    ppLabel12: TppLabel;
    btnPesquisar_Pessoa_Responsavel: TButton;
    Ac_Pesquisar_Responsavel: TAction;
    viewRegistrosNOME_SOLICITANTE: TcxGridDBColumn;
    viewRegistrosNOME_RESPONSAVEL: TcxGridDBColumn;
    ppDBText14: TppDBText;
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
    procedure cbAtividadeVinculoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Pesquisar_AtividadeExecute(Sender: TObject);
    procedure Ac_DownloadExecute(Sender: TObject);
    procedure cbPessoaEnvolvidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Pesquisar_Pessoa_EnvolvidaExecute(Sender: TObject);
    procedure viewRegistrosCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cbProjetoPrincipalPropertiesEditValueChanged(Sender: TObject);
    procedure cbAreaAtuacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Adicionar_Area_ExecucaoExecute(Sender: TObject);
    procedure cbAreaExecucaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Adicionar_Area_AtuacaoExecute(Sender: TObject);
    procedure cbAreaAtuacaoPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Imprimir_OSExecute(Sender: TObject);
    procedure Ac_Pesquisar_ResponsavelExecute(Sender: TObject);
    procedure cbResponsavelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    dmLookup: TdmLookup;
    dmAdministrativo: TdmAdministrativo;
    procedure ppvCarregarAtividadesVinculadas;
    procedure ppvFiltrarAtividade;
    procedure ppvPesquisarProjeto(ipCombo: TcxDBLookupComboBox);
    procedure ppvPesquisarAtividade;
    procedure ppvCarregarAtividades(ipIdEspecifico: Integer = 0);
    procedure ppvAdicionarAreaAtuacao;
    procedure ppvCarregarAreasAtuacao;
    procedure ppvAdicionarAreaExecucao;
    procedure ppvCarregarAreaExecucao;

    { Private declarations }
  protected
    function fprGetPermissao: string; override;
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprDefinirTabDetailCadastro; override;
    procedure pprEfetuarPesquisa; override;
    procedure pprExecutarSalvarDetail; override;
    procedure pprBeforeSalvar; override;
    procedure pprBeforeAlterar; override;
    procedure pprBeforeAlterarDetail; override;
    procedure pprBeforeIncluir; override;

    procedure pprCarregarProjetos(ipIdEspecifico: Integer = 0);

    function fprMontarTextoPanelFiltro(ipParametro: String; ipValor: Variant): String; override;
  public
    procedure ppuIncluir; override;
    procedure ppuAlterarDetail(ipId: Integer); override;
    procedure ppuIncluirDetail; override;
    procedure ppuRetornar; override;
    procedure ppuBaixarArquivo(ipId: Integer);


  end;

var
  frmAtividade: TfrmAtividade;

implementation

uses
  fProjeto, fReconexao;

{$R *.dfm}

{ TfrmAtividade }

procedure TfrmAtividade.Ac_Adicionar_Area_AtuacaoExecute(Sender: TObject);
begin
  inherited;
  ppvAdicionarAreaAtuacao;
end;

procedure TfrmAtividade.Ac_Adicionar_Area_ExecucaoExecute(Sender: TObject);
begin
  inherited;
  ppvAdicionarAreaExecucao;
end;

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

procedure TfrmAtividade.Ac_DownloadExecute(Sender: TObject);
begin
  inherited;
  ppuBaixarArquivo(dmAdministrativo.cdsAtividade_ArquivoID.AsInteger);
end;

procedure TfrmAtividade.Ac_Imprimir_OSExecute(Sender: TObject);
begin
  inherited;
  if not dmLookup.cdslkOrganizacao.Active then
    dmLookup.cdslkOrganizacao.Open;

  // Precisa desabilitar os controles pq senao da um erro de parameter incorrect ao desenhar o cxGrid
  dmAdministrativo.cdsAtividade.DisableControls;
  try
    ppOrdemServico.PrintReport;
  finally
    dmAdministrativo.cdsAtividade.EnableControls;
  end;
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

procedure TfrmAtividade.Ac_Pesquisar_Pessoa_EnvolvidaExecute(Sender: TObject);
begin
  inherited;
  dmLookup.ppuPesquisarPessoa(cbPessoaEnvolvida, coTiposPessoaPadrao);
end;

procedure TfrmAtividade.Ac_Pesquisar_ProjetoExecute(Sender: TObject);
begin
  ppvPesquisarProjeto(cbProjetoPrincipal);
end;

procedure TfrmAtividade.Ac_Pesquisar_ResponsavelExecute(Sender: TObject);
begin
  inherited;
  dmLookup.ppuPesquisarPessoa(cbResponsavel, coTiposPessoaPadrao);
end;

procedure TfrmAtividade.cbAreaAtuacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarAreaAtuacao;
end;

procedure TfrmAtividade.cbAreaAtuacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastro then
    ppvCarregarAreaExecucao;
end;

procedure TfrmAtividade.cbAreaExecucaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarAreaExecucao;
end;

procedure TfrmAtividade.cbAtividadeVinculoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvPesquisarAtividade;
end;

procedure TfrmAtividade.cbPessoaEnvolvidaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    dmLookup.ppuPesquisarPessoa(cbPessoaEnvolvida, coTiposPessoaPadrao);
end;

procedure TfrmAtividade.cbProjetoPrincipalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvPesquisarProjeto(cbProjetoPrincipal);
end;

procedure TfrmAtividade.cbProjetoPrincipalPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastro then
    begin
      ppvCarregarAreasAtuacao;
    end;
end;

procedure TfrmAtividade.cbResponsavelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    dmLookup.ppuPesquisarPessoa(cbResponsavel, coTiposPessoaPadrao);
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
        if dmLookup.cdslkProjeto.Locate(TBancoDados.coId, vaFrmProjeto.IdEscolhido, []) then
          begin
            ipCombo.EditValue := vaFrmProjeto.IdEscolhido;
            ipCombo.PostEditValue;
          end
        else
          begin
            pprCarregarProjetos(vaFrmProjeto.IdEscolhido);
            if dmLookup.cdslkProjeto.Locate(TBancoDados.coId, vaFrmProjeto.IdEscolhido, []) then
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

    vaFrmAtividade.ShowModal;
    if vaFrmAtividade.IdEscolhido <> 0 then
      begin
        if dmLookup.cdslkAtividade.Locate(TBancoDados.coId, vaFrmAtividade.IdEscolhido, []) then
          begin
            cbAtividadeVinculo.EditValue := vaFrmAtividade.IdEscolhido;
            cbAtividadeVinculo.PostEditValue;
          end
        else
          begin
            ppvCarregarAtividades(vaFrmAtividade.IdEscolhido);
            if dmLookup.cdslkAtividade.Locate(TBancoDados.coId, vaFrmAtividade.IdEscolhido, []) then
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

  PesquisaPadrao := Ord(tppData);
  EditDataInicialPesquisa.Date := IncDay(Now, -7);;
  EditDataFinalPesquisa.Date := IncDay(Now, 7);

  dmLookup.ppuCarregarPessoas(0, coTiposPessoaPadrao);
  pprCarregarProjetos;

  pcDetails.ActivePage := tabDetailComentario;
end;

procedure TfrmAtividade.ppvCarregarAreasAtuacao;
begin
  if not dmLookup.cdslkArea_Atuacao_Projeto.Active then
    begin
      dmLookup.cdslkArea_Atuacao_Projeto.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
      dmLookup.cdslkArea_Execucao.Open;
    end;

  cdsLocal_Area_Atuacao.DisableControls;
  cdsLocal_Area_Execucao.DisableControls;
  try
    if cdsLocal_Area_Atuacao.Active then
      cdsLocal_Area_Atuacao.EmptyDataSet
    else
      cdsLocal_Area_Atuacao.CreateDataSet;

    dmLookup.cdslkArea_Atuacao_Projeto.First;
    while not dmLookup.cdslkArea_Atuacao_Projeto.eof do
      begin
        if not cdsLocal_Area_Atuacao.Locate(cdsLocal_Area_AtuacaoID.FieldName, dmLookup.cdslkArea_Atuacao_ProjetoID.AsInteger, []) then
          begin
            if VarIsNull(cbProjetoPrincipal.EditValue) or (cbProjetoPrincipal.EditValue = dmLookup.cdslkArea_Atuacao_ProjetoID_PROJETO.AsInteger) then
              begin
                cdsLocal_Area_Atuacao.Append;
                cdsLocal_Area_AtuacaoID.AsInteger := dmLookup.cdslkArea_Atuacao_ProjetoID.AsInteger;
                cdsLocal_Area_AtuacaoNOME.AsString := dmLookup.cdslkArea_Atuacao_ProjetoNOME.AsString;
                cdsLocal_Area_Atuacao.Post;
              end;
          end;

        dmLookup.cdslkArea_Atuacao_Projeto.Next;
      end;

    ppvCarregarAreaExecucao;

  finally
    cdsLocal_Area_Execucao.EnableControls;
    cdsLocal_Area_Atuacao.EnableControls;
  end;

  if (not VarIsNull(cbAreaAtuacao.EditValue)) and (not(dmLookup.cdslkArea_Atuacao_Projeto.Locate(TBancoDados.coId, cbAreaAtuacao.EditValue, []))) then
    begin
      if dmAdministrativo.cdsAtividade.State in [dsEdit, dsInsert] then
        begin
          dmAdministrativo.cdsAtividadeID_AREA_ATUACAO.Clear;
          dmAdministrativo.cdsAtividadeID_AREA_EXECUCAO.Clear;
        end;
    end;
end;

procedure TfrmAtividade.ppvCarregarAreaExecucao;
begin
  cdsLocal_Area_Execucao.DisableControls;
  try

    if cdsLocal_Area_Execucao.Active then
      cdsLocal_Area_Execucao.EmptyDataSet
    else
      cdsLocal_Area_Execucao.CreateDataSet;

    if (not VarIsNull(cbAreaAtuacao.EditValue)) and
      (dmLookup.cdslkArea_Atuacao_Projeto.Locate(dmLookup.cdslkArea_Atuacao_ProjetoID.FieldName, cbAreaAtuacao.EditValue, [])) then
      begin
        while not dmLookup.cdslkArea_Execucao.eof do
          begin
            if not cdsLocal_Area_Execucao.Locate(cdsLocal_Area_AtuacaoID.FieldName, dmLookup.cdslkArea_Atuacao_ProjetoID.AsInteger, []) then
              begin
                cdsLocal_Area_Execucao.Append;
                cdsLocal_Area_ExecucaoID.AsInteger := dmLookup.cdslkArea_ExecucaoID.AsInteger;
                cdsLocal_Area_ExecucaoID_AREA_ATUACAO.AsInteger := dmLookup.cdslkArea_ExecucaoID_AREA_ATUACAO.AsInteger;
                cdsLocal_Area_ExecucaoNOME.AsString := dmLookup.cdslkArea_ExecucaoNOME.AsString;
                cdsLocal_Area_Execucao.Post;
              end;

            dmLookup.cdslkArea_Execucao.Next;
          end;
      end;
  finally
    cdsLocal_Area_Execucao.EnableControls;
  end;
end;

procedure TfrmAtividade.ppvAdicionarAreaExecucao;
var
  vaFrmAreaAtuacao: TfrmAreaAtuacao;
begin
  if VarIsNull(cbAreaAtuacao.EditValue) then
    raise TControlException.Create('Selecione a Área de Atuação', cbAreaAtuacao);

  vaFrmAreaAtuacao := TfrmAreaAtuacao.Create(nil);
  try

    vaFrmAreaAtuacao.ppuConfigurarPesquisa(Ord(tppId), cbAreaAtuacao.EditValue);
    vaFrmAreaAtuacao.ppuPesquisar;
    if vaFrmAreaAtuacao.dsMaster.DataSet.RecordCount > 0 then
      begin
        vaFrmAreaAtuacao.ppuConfigurarModoExecucao(meSomenteCadastro);
        vaFrmAreaAtuacao.ppuIncluirDetail;
        vaFrmAreaAtuacao.ShowModal;
        if vaFrmAreaAtuacao.IdDetailEscolhido <> 0 then
          begin
            ppvCarregarAreasAtuacao;
            if dmLookup.cdslkArea_Execucao.Locate(TBancoDados.coId, vaFrmAreaAtuacao.IdDetailEscolhido, []) then
              begin
                cbAreaExecucao.EditValue := vaFrmAreaAtuacao.IdDetailEscolhido;
                cbAreaExecucao.PostEditValue;
              end;
          end;
      end
    else
      raise Exception.Create('Não foi possível encontrar a área de atuação selecionada.');
  finally
    vaFrmAreaAtuacao.Free;
  end;

end;

procedure TfrmAtividade.ppvAdicionarAreaAtuacao;
var
  vaFrmAreaAtuacao: TfrmAreaAtuacao;
  vaFrmProjeto: TfrmProjeto;
  vaIdEscolhido: Integer;
  vaField: TField;
begin
  vaIdEscolhido := 0;
  if not VarIsNull(cbProjetoPrincipal.EditValue) then
    begin
      vaFrmProjeto := TfrmProjeto.Create(nil);
      try
        vaFrmProjeto.ppuConfigurarPesquisa(Ord(tppId), cbProjetoPrincipal.EditValue);
        vaFrmProjeto.ppuPesquisar;
        if vaFrmProjeto.dsMaster.DataSet.RecordCount > 0 then
          begin
            vaFrmProjeto.pcDetails.ActivePage := vaFrmProjeto.tabDetailArea;
            vaFrmProjeto.ppuIncluirDetail;

            vaFrmProjeto.ppuConfigurarModoExecucao(meSomenteCadastro);
            vaFrmProjeto.ShowModal;
            if vaFrmProjeto.IdDetailEscolhido <> 0 then
              begin
                vaField := vaFrmProjeto.dsDetail.DataSet.FindField('ID_AREA_ATUACAO');
                if Assigned(vaField) then
                  vaIdEscolhido := vaField.AsInteger;
              end;
          end;
      finally
        vaFrmProjeto.Free;
      end;
    end
  else
    begin
      vaFrmAreaAtuacao := TfrmAreaAtuacao.Create(nil);
      try
        vaFrmAreaAtuacao.ppuConfigurarModoExecucao(meSomenteCadastro);
        vaFrmAreaAtuacao.ShowModal;

        if vaFrmAreaAtuacao.IdEscolhido <> 0 then
          vaIdEscolhido := vaFrmAreaAtuacao.IdEscolhido;
      finally
        vaFrmAreaAtuacao.Free;
      end;
    end;

  if vaIdEscolhido <> 0 then
    begin
      ppvCarregarAreasAtuacao;
      if dmLookup.cdslkArea_Atuacao_Projeto.Locate(TBancoDados.coId, vaIdEscolhido, []) then
        begin
          if not(dmAdministrativo.cdsAtividade.State in [dsInsert, dsEdit]) then
            dmAdministrativo.cdsAtividade.Edit;

          cbAreaAtuacao.EditValue := vaIdEscolhido;
          cbAreaAtuacao.PostEditValue;
        end;
    end;
end;

procedure TfrmAtividade.pprCarregarProjetos(ipIdEspecifico: Integer);
begin
  dmLookup.cdslkProjeto.ppuLimparParametros;
  if ipIdEspecifico <> 0 then
    dmLookup.cdslkProjeto.ppuAddParametro(TParametros.coId, ipIdEspecifico, TOperadores.coOR);

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

function TfrmAtividade.fprMontarTextoPanelFiltro(ipParametro: String;
  ipValor: Variant): String;
begin
  if ipParametro = TParametros.coProjeto then
    Result := 'Projetos = ' + cbProjetosPesquisa.Text
  else
    Result := inherited;
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
    begin
      dsDetail.DataSet.Open;
      if dsDetail.DataSet = dmAdministrativo.cdsAtividade_Pessoa then
        dmLookup.ppuCarregarPessoasAvulsas(dmAdministrativo.cdsAtividade_Pessoa, dmAdministrativo.cdsAtividade_PessoaID_PESSOA.FieldName,
          dmAdministrativo.cdsAtividade_PessoaNOME_PESSOA.FieldName);

    end;
end;

procedure TfrmAtividade.ppvFiltrarAtividade;
begin
  dmLookup.cdslkAtividade.Filter := TBancoDados.coId + ' <> ' + dmAdministrativo.cdsAtividadeID.AsString;
  dmLookup.cdslkAtividade.Filtered := true;
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
  dmLookup.cdslkAtividade.Filtered := false;
end;

procedure TfrmAtividade.pprBeforeAlterar;
begin
  inherited;
  ppvCarregarAreasAtuacao;
  if not dmLookup.cdslkPessoa.Locate(TBancoDados.coId, dmAdministrativo.cdsAtividadeID_RESPONSAVEL.AsInteger, []) then
    dmLookup.ppuCarregarPessoas(dmAdministrativo.cdsAtividadeID_RESPONSAVEL.AsInteger, coTiposPessoaPadrao);
end;

procedure TfrmAtividade.pprBeforeAlterarDetail;
begin
  inherited;
  if dsDetail.DataSet = dmAdministrativo.cdsAtividade_Pessoa then
    begin
      if not dmLookup.cdslkPessoa.Locate(TBancoDados.coId, dmAdministrativo.cdsAtividade_PessoaID_PESSOA.AsInteger, []) then
        dmLookup.ppuCarregarPessoas(dmAdministrativo.cdsAtividade_PessoaID_PESSOA.AsInteger, coTiposPessoaPadrao);
    end;
end;

procedure TfrmAtividade.pprBeforeIncluir;
begin
  inherited;
  ppvCarregarAreasAtuacao;
end;

procedure TfrmAtividade.pprBeforeSalvar;
begin
  inherited;
  if dmAdministrativo.cdsAtividadeSTATUS.AsInteger = Ord(saFinalizada) then
    dmPrincipal.FuncoesAdm.ppuValidarFinalizarAtividade(dmAdministrativo.cdsAtividadeID.AsInteger);
end;

procedure TfrmAtividade.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
var
  vaCodigos: string;
begin
  inherited;
  vaCodigos := TUtils.fpuExtrairValoresCheckComboBox(cbProjetosPesquisa);
  if vaCodigos <> '' then
    ipCds.ppuAddParametro(TParametros.coProjeto, vaCodigos);;
end;

procedure TfrmAtividade.ppuBaixarArquivo(ipId: Integer);
begin
  if dmAdministrativo.cdsAtividade_Arquivo.Locate(TBancoDados.coId, ipId, []) then
    begin
      if not dmAdministrativo.cdsAtividade_ArquivoARQUIVO.IsNull then
        begin
          SaveDialogDocumento.FileName := dmAdministrativo.cdsAtividade_ArquivoNOME_ORIGINAL.AsString;
          if SaveDialogDocumento.Execute then
            begin
              dmAdministrativo.cdsAtividade_ArquivoARQUIVO.SaveToFile(SaveDialogDocumento.FileName);
            end;
        end
      else
        raise Exception.Create('Nenhum arquivo foi carregado para poder ser baixado.');
    end
  else
    raise Exception.Create('Registro não encontrado.');
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
  dmLookup.ppuCarregarPessoasAvulsas(dmAdministrativo.cdsAtividade_Pessoa, dmAdministrativo.cdsAtividade_PessoaID_PESSOA.FieldName,
    dmAdministrativo.cdsAtividade_PessoaNOME_PESSOA.FieldName);
end;

procedure TfrmAtividade.pprExecutarSalvarDetail;
begin
  try
    if not(dmAdministrativo.cdsAtividade.State in [dsEdit, dsInsert]) then
      dmAdministrativo.cdsAtividade.Edit;

    pprPreencherCamposPadroes(dmAdministrativo.cdsAtividade); // apenas para trocar o campo data_alteracao
    inherited;

    if dmAdministrativo.cdsAtividade.State in [dsEdit, dsInsert] then
      begin
        dmAdministrativo.cdsAtividade.Post;
        if dmAdministrativo.cdsAtividade.ChangeCount > 0 then
          dmAdministrativo.cdsAtividade.ApplyUpdates(0);
      end;

  except
    on E: Exception do
      begin
        if TRegex.IsMatch(E.Message, coRegexUniqueKey, [roIgnoreCase]) then
          E.RaiseOuterException(Exception.Create('A atividade selecionada já foi vinculada a atividade atual. Por favor, escolha outra atividade.'));
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

procedure TfrmAtividade.viewRegistrosCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  vaDataFinal, vaDataAtual: TDateTime;
begin
  inherited;

  if not VarIsNull(AViewInfo.GridRecord.Values[viewRegistrosSTATUS.Index]) then
    begin
      if not(VarToStr(AViewInfo.GridRecord.Values[viewRegistrosSTATUS.Index]).ToInteger in [Ord(saFinalizada), Ord(saCancelada)]) then
        begin
          if not VarIsNull(AViewInfo.GridRecord.Values[viewRegistrosDATA_FINAL.Index]) then
            begin
              vaDataAtual := Now;
              vaDataAtual := EncodeDate(YearOf(vaDataAtual), MonthOf(vaDataAtual), DayOf(vaDataAtual));
              vaDataFinal := AViewInfo.GridRecord.Values[viewRegistrosDATA_FINAL.Index];
              // atividade vencida
              if CompareDateTime(vaDataAtual, vaDataFinal) = GreaterThanValue then
                begin
                  ACanvas.Font.Color := clWhite;
                  if AViewInfo.GridRecord.Selected then
                    ACanvas.Brush.Color := clMaroon
                  else
                    ACanvas.Brush.Color := clRed;
                end
              else if DaysBetween(vaDataFinal, vaDataAtual) < 3 then // atividade quase vencendo
                begin
                  ACanvas.Font.Color := clBlack;
                  if AViewInfo.GridRecord.Selected then
                    ACanvas.Brush.Color := $0039D5C9
                  else
                    ACanvas.Brush.Color := clYellow;
                end;
            end;
        end;
    end;
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
      dmLookup.cdslkAtividade.ppuAddParametro(TParametros.coProjeto, dmAdministrativo.cdsAtividadeID_PROJETO.AsInteger);

      if ipIdEspecifico <> 0 then
        begin
          dmLookup.cdslkAtividade.ppuAddParametro(TParametros.coStatusDiferente, Ord(saCancelada).ToString + ';' + Ord(saFinalizada).ToString,
            TOperadores.coOR);
          dmLookup.cdslkAtividade.ppuDataRequest([TParametros.coId], [ipIdEspecifico], TOperadores.coAnd);
        end
      else
        dmLookup.cdslkAtividade.ppuDataRequest([TParametros.coStatusDiferente], [Ord(saCancelada).ToString + ';' + Ord(saFinalizada).ToString]);
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
