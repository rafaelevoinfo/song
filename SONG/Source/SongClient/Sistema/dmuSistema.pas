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
    cdsAgenda: TRFClientDataSet;
    cdsAgendaID: TIntegerField;
    cdsAgendaNOME: TStringField;
    cdsAgendaTIPO: TSmallintField;
    cdsAgendaID_PROJETO: TIntegerField;
    cdsAgendaPROJETO: TStringField;
    cdsAgenda_Pessoa: TRFClientDataSet;
    cdsAgenda_PessoaID: TIntegerField;
    cdsAgenda_PessoaID_AGENDA: TIntegerField;
    cdsAgenda_PessoaID_PESSOA: TIntegerField;
    cdsAgenda_PessoaSOMENTE_VISUALIZACAO: TSmallintField;
    cdsAgenda_PessoaNOME_PESSOA: TStringField;
    dsAgenda: TDataSource;
    cdsAgendaATIVO: TSmallintField;
    cdsAgenda_Registro: TRFClientDataSet;
    cdsAgenda_RegistroID: TIntegerField;
    cdsAgenda_RegistroID_AGENDA: TIntegerField;
    cdsAgenda_RegistroTITULO: TStringField;
    cdsAgenda_RegistroDESCRICAO: TStringField;
    cdsAgenda_RegistroRECURRENCE_INDEX: TIntegerField;
    cdsAgenda_RegistroRECURRENCE_INFO: TBlobField;
    cdsAgenda_RegistroPARENT_ID: TIntegerField;
    cdsAgenda_RegistroEVENT_TYPE: TIntegerField;
    cdsAgenda_RegistroLABEL_COLOR: TIntegerField;
    cdsAgenda_RegistroDATA_INICIO: TSQLTimeStampField;
    cdsAgenda_RegistroDATA_FIM: TSQLTimeStampField;
    cdsAgenda_RegistroACTUAL_START: TIntegerField;
    cdsAgenda_RegistroACTUAL_FINISH: TIntegerField;
    cdsAgenda_RegistroOPTIONS: TIntegerField;
    cdsAgenda_RegistroTIPO: TIntegerField;
    cdsAgenda_RegistroLOCAL: TStringField;
    cdsAparelho_Externo: TRFClientDataSet;
    cdsAparelho_ExternoID: TIntegerField;
    cdsAparelho_ExternoNOME: TStringField;
    cdsAparelho_ExternoSERIAL: TStringField;
    procedure cdsAgenda_RegistroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSistema: TdmSistema;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}


procedure TdmSistema.cdsAgenda_RegistroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if cdsAgenda_RegistroID.IsNull then
    cdsAgenda_RegistroID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('AGENDA_REGISTRO');
end;

end.
