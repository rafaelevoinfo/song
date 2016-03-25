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
    cdslkFinanciadorNOME: TStringField;
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
  I: Integer;
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
        if not cdslkPessoa.Locate(cdslkPessoaID.FieldName, ipCds.FieldByName(ipFieldIdPessoa).AsInteger, []) then
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
