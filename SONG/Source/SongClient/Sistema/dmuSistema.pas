unit dmuSistema;

interface

uses
  System.SysUtils, System.Classes, dmuBasico, dmuPrincipal, Data.DB,
  Datasnap.DBClient, uClientDataSet;

type
  TdmSistema = class(TdmBasico)
    cdsNotificacao: TRFClientDataSet;
    cdsNotificacaoID: TIntegerField;
    cdsNotificacaoTIPO: TIntegerField;
    cdsNotificacaoTEMPO_ANTECEDENCIA: TIntegerField;
    cdsNotificacao_Pessoa: TRFClientDataSet;
    cdsNotificacao_PessoaID: TIntegerField;
    cdsNotificacao_PessoaID_NOTIFICACAO: TIntegerField;
    cdsNotificacao_PessoaID_PESSOA: TIntegerField;
    cdsNotificacao_PessoaNOME_PESSOA: TStringField;
    cdsNotificacao_PessoaNOTIFICACAO_SISTEMA: TSmallintField;
    cdsNotificacao_PessoaNOTIFICACAO_EMAIL: TSmallintField;
    dsNotificacao: TDataSource;
    cdsNotificacaoVALOR_GATILHO: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSistema: TdmSistema;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
