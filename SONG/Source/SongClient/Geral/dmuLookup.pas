unit dmuLookup;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, cxEdit, cxEditRepositoryItems,
  cxClasses, Data.DB, Datasnap.DBClient, dmuPrincipal, cxDBEditRepository,
  uClientDataSet;

type
  TdmLookup = class(TdmBasico)
    Repositorio: TcxEditRepository;
    RepIcbNaoSim: TcxEditRepositoryImageComboBoxItem;
    cdslkPerfil: TClientDataSet;
    cdslkPerfilID: TIntegerField;
    cdslkPerfilNOME: TStringField;
    repLcbPerfil: TcxEditRepositoryLookupComboBoxItem;
    dslkPerfil: TDataSource;
    cdslkPessoa: TRFClientDataSet;
    cdslkPessoaID: TIntegerField;
    cdslkPessoaNOME: TStringField;
    repLcbPessoa: TcxEditRepositoryLookupComboBoxItem;
    dslkPessoa: TDataSource;
    repIcbTipoPerfil: TcxEditRepositoryImageComboBoxItem;
    repIcbSituacaoProjeto: TcxEditRepositoryImageComboBoxItem;
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
    procedure cdslkConta_CorrenteCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmLookup: TdmLookup;

implementation


{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}


procedure TdmLookup.cdslkConta_CorrenteCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdslkConta_CorrenteCALC_BANCO_CONTA.AsString := cdslkConta_CorrenteNOME.AsString + ' - ' + cdslkConta_CorrenteAGENCIA.AsString + '/' +
    cdslkConta_CorrenteCONTA.AsString;
end;

end.
