unit dmuLookup;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, cxEdit, cxEditRepositoryItems,
  cxClasses, Data.DB, Datasnap.DBClient, cxDBEditRepository,
  uClientDataSet, dmuPrincipal, uTypes, cxImageComboBox, uUtils,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TdmLookup = class(TdmBasico)
    Repositorio: TcxEditRepository;
    RepIcbNaoSim: TcxEditRepositoryImageComboBoxItem;
    repLcbPerfil: TcxEditRepositoryLookupComboBoxItem;
    dslkPerfil: TDataSource;
    cdslkPessoa: TRFClientDataSet;
    cdslkPessoaID: TIntegerField;
    cdslkPessoaNOME: TStringField;
    repLcbPessoa: TcxEditRepositoryLookupComboBoxItem;
    dslkPessoa: TDataSource;
    repIcbTipoPerfil: TcxEditRepositoryImageComboBoxItem;
    repIcbStatusProjeto: TcxEditRepositoryImageComboBoxItem;
    cdslkOrganizacao: TRFClientDataSet;
    cdslkFinanciador: TRFClientDataSet;
    repLcbOrganizacao: TcxEditRepositoryLookupComboBoxItem;
    dslkOrganizacao: TDataSource;
    dslkFinanciador: TDataSource;
    repLcbFinanciador: TcxEditRepositoryLookupComboBoxItem;
    cdslkOrganizacaoID: TIntegerField;
    cdslkOrganizacaoNOME: TStringField;
    cdslkFinanciadorID: TIntegerField;
    cdslkBanco: TRFClientDataSet;
    cdslkBanco_Conta_Corrente: TRFClientDataSet;
    cdslkBancoID: TIntegerField;
    cdslkBancoNOME: TStringField;
    cdslkBanco_Conta_CorrenteID: TIntegerField;
    cdslkBanco_Conta_CorrenteID_BANCO: TIntegerField;
    cdslkBanco_Conta_CorrenteAGENCIA: TStringField;
    cdslkBanco_Conta_CorrenteCONTA: TStringField;
    dslkBanco: TDataSource;
    repLcbContaCorrente: TcxEditRepositoryLookupComboBoxItem;
    dslkConta_Corrente: TDataSource;
    cdslkConta_Corrente: TRFClientDataSet;
    cdslkConta_CorrenteID: TIntegerField;
    cdslkConta_CorrenteID_BANCO: TIntegerField;
    cdslkConta_CorrenteNOME: TStringField;
    cdslkConta_CorrenteAGENCIA: TStringField;
    cdslkConta_CorrenteCONTA: TStringField;
    cdslkConta_CorrenteCALC_BANCO_CONTA: TStringField;
    repCurPadrao: TcxEditRepositoryCurrencyItem;
    repIcbTipoPessoa: TcxEditRepositoryImageComboBoxItem;
    repIcbStatusAtividade: TcxEditRepositoryImageComboBoxItem;
    repIcbTipoVinculo: TcxEditRepositoryImageComboBoxItem;
    cdslkProjeto: TRFClientDataSet;
    cdslkProjetoID: TIntegerField;
    cdslkProjetoNOME: TStringField;
    repLcbProjeto: TcxEditRepositoryLookupComboBoxItem;
    cdslkAtividade: TRFClientDataSet;
    cdslkAtividadeID: TIntegerField;
    cdslkAtividadeNOME: TStringField;
    cdslkAtividadeSTATUS: TSmallintField;
    repLcbAtividade: TcxEditRepositoryLookupComboBoxItem;
    dslkAtividade: TDataSource;
    dslkProjeto: TDataSource;
    repLcbEspecie: TcxEditRepositoryLookupComboBoxItem;
    cdslkEspecie: TRFClientDataSet;
    cdslkEspecieID: TIntegerField;
    cdslkEspecieNOME: TStringField;
    dslkEspecie: TDataSource;
    cdslkMatriz: TRFClientDataSet;
    cdslkMatrizID: TIntegerField;
    cdslkMatrizNOME: TStringField;
    cdslkMatrizID_ESPECIE: TIntegerField;
    repLcbMatriz: TcxEditRepositoryLookupComboBoxItem;
    dslkMatriz: TDataSource;
    repCalcPadrao: TcxEditRepositoryCalcItem;
    cdslkCanteiro: TRFClientDataSet;
    cdslkCanteiroID: TIntegerField;
    cdslkCanteiroNOME: TStringField;
    repLcbCanteiro: TcxEditRepositoryLookupComboBoxItem;
    dslkCanteiro: TDataSource;
    cdslkEspecieVALOR_MUDA: TBCDField;
    cdslkEspecieVALOR_KG_SEMENTE: TBCDField;
    cdslkEspecieTEMPO_GERMINACAO: TIntegerField;
    cdslkPerfil: TRFClientDataSet;
    cdslkPerfilID: TIntegerField;
    cdslkPerfilNOME: TStringField;
    cdslkPlano_Contas: TRFClientDataSet;
    cdslkPlano_ContasID: TIntegerField;
    cdslkPlano_ContasID_CONTA_PAI: TIntegerField;
    cdslkPlano_ContasTIPO: TSmallintField;
    cdslkPlano_ContasNOME: TStringField;
    repLcbPlano_Contas: TcxEditRepositoryLookupComboBoxItem;
    dslkPlano_Contas: TDataSource;
    repIcbTipoPlanoConta: TcxEditRepositoryImageComboBoxItem;
    cdslkRubrica: TRFClientDataSet;
    cdslkRubricaID: TIntegerField;
    cdslkRubricaID_RUBRICA_PAI: TIntegerField;
    cdslkRubricaNOME: TStringField;
    repLcbRubrica: TcxEditRepositoryLookupComboBoxItem;
    dslkRubrica: TDataSource;
    repIcbFormaPagamento: TcxEditRepositoryImageComboBoxItem;
    repLcbFornecedor: TcxEditRepositoryLookupComboBoxItem;
    cdslkFornecedor: TRFClientDataSet;
    dslkFornecedor: TDataSource;
    cdslkFornecedorID: TIntegerField;
    repIcbStatusContaPagar: TcxEditRepositoryImageComboBoxItem;
    repIcbStatusContaReceber: TcxEditRepositoryImageComboBoxItem;
    repDateDataPadrao: TcxEditRepositoryDateItem;
    cdslkFin_For_Cli: TRFClientDataSet;
    cdslkFin_For_CliID: TIntegerField;
    repLcbFinForCli: TcxEditRepositoryLookupComboBoxItem;
    dslkFin_For_Cli: TDataSource;
    repIcbTipoItem: TcxEditRepositoryImageComboBoxItem;
    cdslkItem: TRFClientDataSet;
    cdslkItemID: TIntegerField;
    cdslkItemNOME: TStringField;
    cdslkItemTIPO: TSmallintField;
    repLcbItem: TcxEditRepositoryLookupComboBoxItem;
    dslkItem: TDataSource;
    cdslkItemUNIDADE: TStringField;
    cdslkRubrica_Atividade: TRFClientDataSet;
    cdslkRubrica_AtividadeID: TIntegerField;
    cdslkRubrica_AtividadeID_RUBRICA_PAI: TIntegerField;
    cdslkRubrica_AtividadeNOME: TStringField;
    cdslkProjeto_Area: TRFClientDataSet;
    cdslkProjeto_AreaID: TIntegerField;
    cdslkProjeto_AreaID_PROJETO: TIntegerField;
    cdslkProjeto_AreaNOME: TStringField;
    cdslkProjeto_Area_Atividade: TRFClientDataSet;
    cdslkProjeto_Area_AtividadeID: TIntegerField;
    cdslkProjeto_Area_AtividadeID_PROJETO: TIntegerField;
    cdslkProjeto_Area_AtividadeNOME: TStringField;
    repLcbRubricaAtividade: TcxEditRepositoryLookupComboBoxItem;
    dslkRubrica_Atividade: TDataSource;
    repLcbProjetoArea: TcxEditRepositoryLookupComboBoxItem;
    dslkProjeto_Area: TDataSource;
    dslkProjeto_Area_Atividade: TDataSource;
    repLcbProjeto_Area_Atividade: TcxEditRepositoryLookupComboBoxItem;
    repIcbStatusSolicitacaoCompra: TcxEditRepositoryImageComboBoxItem;
    repIcbStatusEntrega: TcxEditRepositoryImageComboBoxItem;
    cdslkCompra: TRFClientDataSet;
    cdslkCompraID: TIntegerField;
    cdslkCompraID_FORNECEDOR: TIntegerField;
    cdslkCompraDATA: TSQLTimeStampField;
    cdslkCompraNOME_FANTASIA: TStringField;
    repLcbCompra: TcxEditRepositoryLookupComboBoxItem;
    dslkCompra: TDataSource;
    cdslkFundo: TRFClientDataSet;
    cdslkFundoID: TIntegerField;
    cdslkFundoNOME: TStringField;
    cdslkFundoSALDO: TBCDField;
    repLcbFundo: TcxEditRepositoryLookupComboBoxItem;
    dslkFundo: TDataSource;
    cdslkAtividade_Alocada: TRFClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    SmallintField1: TSmallintField;
    cdslkRubrica_Atividade_Alocada: TRFClientDataSet;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    cdslkProjeto_Area_Atividade_Alocada: TRFClientDataSet;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    StringField3: TStringField;
    cdslkOrganizacaoCNPJ: TStringField;
    cdslkOrganizacaoLOGO: TBlobField;
    cdslkFundoORGANIZACAO: TStringField;
    cdslkProjeto_Organizacao: TRFClientDataSet;
    cdslkProjeto_OrganizacaoID: TIntegerField;
    cdslkProjeto_OrganizacaoNOME: TStringField;
    dslkProjeto_Organizcao: TDataSource;
    repLcbProjetoOrganizacao: TcxEditRepositoryLookupComboBoxItem;
    cdslkFundoID_ORGANIZACAO: TIntegerField;
    cdslkProjeto_OrganizacaoID_ORGANIZACAO: TIntegerField;
    repIcbTipoSaida: TcxEditRepositoryImageComboBoxItem;
    cdslkLote_Semente: TRFClientDataSet;
    cdslkLote_Muda: TRFClientDataSet;
    cdslkLote_SementeID: TIntegerField;
    cdslkLote_SementeNOME: TStringField;
    cdslkLote_SementeQTDE_ARMAZENADA: TBCDField;
    cdslkLote_MudaID: TIntegerField;
    cdslkLote_MudaNOME: TStringField;
    repLcbLoteSemente: TcxEditRepositoryLookupComboBoxItem;
    dslkLote_Semente: TDataSource;
    dslkLote_Muda: TDataSource;
    repLcbLoteMuda: TcxEditRepositoryLookupComboBoxItem;
    cdslkLote_MudaSALDO: TIntegerField;
    cdslkItemSALDO: TBCDField;
    cdslkProjeto_Rubrica: TRFClientDataSet;
    cdslkProjeto_RubricaID: TIntegerField;
    cdslkProjeto_RubricaORCAMENTO: TBCDField;
    cdslkProjeto_RubricaSALDO_REAL: TFMTBCDField;
    cdslkProjeto_RubricaNOME_RUBRICA: TStringField;
    cdslkLote_SementeID_ESPECIE: TIntegerField;
    cdslkLote_MudaID_ESPECIE: TIntegerField;
    cdslkFornecedorNOME_FANTASIA: TStringField;
    cdslkFornecedorRAZAO_SOCIAL: TStringField;
    cdslkFin_For_CliNOME_FANTASIA: TStringField;
    cdslkFin_For_CliRAZAO_SOCIAL: TStringField;
    cdslkFinanciadorNOME_FANTASIA: TStringField;
    cdslkFinanciadorRAZAO_SOCIAL: TStringField;
    cdslkLocal_Uso: TRFClientDataSet;
    cdslkLocal_UsoID: TIntegerField;
    cdslkLocal_UsoNOME: TStringField;
    dslkLocal_Uso: TDataSource;
    repLcbLocalUso: TcxEditRepositoryLookupComboBoxItem;
    repIcbStatusMudas: TcxEditRepositoryImageComboBoxItem;
    cdslkLote_MudaSTATUS: TSmallintField;
    cdslkEspecieQTDE_SEMENTE_ESTOQUE: TBCDField;
    cdslkEspecieQTDE_MUDA_PRONTA: TIntegerField;
    cdslkEspecieQTDE_MUDA_DESENVOLVIMENTO: TIntegerField;
    repCalcInteiro: TcxEditRepositoryCalcItem;
    procedure cdslkConta_CorrenteCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private

    { Private declarations }
  public
    procedure ppuCarregarPessoasAvulsas(ipCds: TClientDataSet; ipFieldIdPessoa, ipFieldNomePessoa: String);
    procedure ppuCarregarPessoas(ipIdEspecifico: Integer; ipTipos: TRelacionamentosPessoa);
    procedure ppuPesquisarPessoa(ipEditResultado: TcxDBLookupComboBox; ipTipos: TRelacionamentosPessoa);
  end;

  // var
  // dmLookup: TdmLookup;

implementation

uses
  fPessoa;

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}


procedure TdmLookup.ppuCarregarPessoas(ipIdEspecifico: Integer; ipTipos: TRelacionamentosPessoa);
var
  vaTipos: TStringList;
  vaTipo: TTipoRelacionamentoPessoa;
begin
  vaTipos := TStringList.Create;
  try
    vaTipos.Delimiter := ',';
    vaTipos.StrictDelimiter := True;

    cdslkPessoa.ppuLimparParametros;
    if ipIdEspecifico <> 0 then
      cdslkPessoa.ppuAddParametro(TParametros.coID, ipIdEspecifico, TOperadores.coOR);

    for vaTipo in ipTipos do
      vaTipos.Add(Ord(vaTipo).ToString());;

    // recusado, cancelado, executado
    cdslkPessoa.ppuDataRequest([TParametros.coTipo], [vaTipos.DelimitedText]);
  finally
    vaTipos.Free;
  end;
end;

procedure TdmLookup.ppuPesquisarPessoa(ipEditResultado: TcxDBLookupComboBox; ipTipos: TRelacionamentosPessoa);
var
  vaFrmPessoa: TfrmPessoa;
begin
  inherited;
  vaFrmPessoa := TfrmPessoa.Create(nil);
  try
    vaFrmPessoa.ppuConfigurarModoExecucao(mePesquisa);

    vaFrmPessoa.ShowModal;
    if vaFrmPessoa.IdEscolhido <> 0 then
      begin
        if cdslkPessoa.Locate(TBancoDados.coID, vaFrmPessoa.IdEscolhido, []) then
          begin
            ipEditResultado.EditValue := vaFrmPessoa.IdEscolhido;
            ipEditResultado.PostEditValue;
          end
        else
          begin
            ppuCarregarPessoas(vaFrmPessoa.IdEscolhido, ipTipos);
            if cdslkPessoa.Locate(TBancoDados.coID, vaFrmPessoa.IdEscolhido, []) then
              begin
                ipEditResultado.EditValue := vaFrmPessoa.IdEscolhido;
                ipEditResultado.PostEditValue;
              end;
          end;

      end;
  finally
    vaFrmPessoa.Free;
  end;
end;

procedure TdmLookup.ppuCarregarPessoasAvulsas(ipCds: TClientDataSet; ipFieldIdPessoa, ipFieldNomePessoa: String);
begin
  cdslkPessoa.DisableControls;
  try
    TUtils.ppuPercorrerCds(ipCds,
      procedure
      begin
        if (not ipCds.FieldByName(ipFieldIdPessoa).IsNull) and (not cdslkPessoa.Locate(cdslkPessoaID.FieldName, ipCds.FieldByName(ipFieldIdPessoa).AsInteger, [])) then
          begin
            cdslkPessoa.Append;
            cdslkPessoaID.AsInteger := ipCds.FieldByName(ipFieldIdPessoa).AsInteger;
            cdslkPessoaNOME.AsString := ipCds.FieldByName(ipFieldNomePessoa).AsString;
            cdslkPessoa.Post;
          end;
      end);
  finally
    cdslkPessoa.EnableControls;
  end;

end;

procedure TdmLookup.cdslkConta_CorrenteCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdslkConta_CorrenteCALC_BANCO_CONTA.AsString := cdslkConta_CorrenteNOME.AsString + ' - ' + cdslkConta_CorrenteAGENCIA.AsString + '/' +
    cdslkConta_CorrenteCONTA.AsString;
end;

procedure TdmLookup.DataModuleCreate(Sender: TObject);
var
  vaTipo: TTipoRelacionamentoPessoa;
  vaItem: TcxImageComboBoxItem;
begin
  inherited;
  repIcbTipoPessoa.Properties.Items.Clear;
  for vaTipo := Low(TTipoRelacionamentoPessoa) to High(TTipoRelacionamentoPessoa) do
    begin
      vaItem := repIcbTipoPessoa.Properties.Items.Add;
      vaItem.Value := Ord(vaTipo);
      vaItem.Description := TipoRelacionamentoPessoa[vaTipo];
    end;

end;

end.
