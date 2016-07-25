unit smuSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, dmuPrincipal,
  uUtils, uClientDataSet, uSQLGenerator, uTypes;

type
  TsmSistema = class(TsmBasico)
    qNotificacao: TRFQuery;
    qNotificacao_Pessoa: TRFQuery;
    qNotificacaoID: TIntegerField;
    qNotificacaoTIPO: TIntegerField;
    qNotificacaoTEMPO_ANTECEDENCIA: TIntegerField;
    qNotificacao_PessoaID: TIntegerField;
    qNotificacao_PessoaID_NOTIFICACAO: TIntegerField;
    qNotificacao_PessoaID_PESSOA: TIntegerField;
    qNotificacao_PessoaNOME_PESSOA: TStringField;
    qNotificacao_PessoaNOTIFICACAO_SISTEMA: TSmallintField;
    qNotificacao_PessoaNOTIFICACAO_EMAIL: TSmallintField;
    qNotificacaoVALOR_GATILHO: TBCDField;
    qAgenda: TRFQuery;
    qAgendaID: TIntegerField;
    qAgendaNOME: TStringField;
    qAgendaTIPO: TSmallintField;
    qAgendaID_PROJETO: TIntegerField;
    qAgendaPROJETO: TStringField;
    qAgenda_Pessoa: TRFQuery;
    qAgenda_PessoaID: TIntegerField;
    qAgenda_PessoaID_AGENDA: TIntegerField;
    qAgenda_PessoaID_PESSOA: TIntegerField;
    qAgenda_PessoaSOMENTE_VISUALIZACAO: TSmallintField;
    qAgenda_PessoaNOME_PESSOA: TStringField;
    qAgenda_Registro: TRFQuery;
    qAgenda_RegistroID: TIntegerField;
    qAgenda_RegistroID_AGENDA: TIntegerField;
    qAgenda_RegistroTITULO: TStringField;
    qAgenda_RegistroDESCRICAO: TStringField;
    qAgenda_RegistroRECURRENCE_INDEX: TIntegerField;
    qAgenda_RegistroRECURRENCE_INFO: TBlobField;
    qAgenda_RegistroPARENT_ID: TIntegerField;
    qAgenda_RegistroEVENT_TYPE: TIntegerField;
    qAgenda_RegistroLABEL_COLOR: TIntegerField;
    qAgendaATIVO: TSmallintField;
    qAgenda_RegistroDATA_INICIO: TSQLTimeStampField;
    qAgenda_RegistroDATA_FIM: TSQLTimeStampField;
    qAgenda_RegistroACTUAL_START: TIntegerField;
    qAgenda_RegistroACTUAL_FINISH: TIntegerField;
    qAgenda_RegistroOPTIONS: TIntegerField;
    qAgenda_RegistroTIPO: TIntegerField;
    qAgenda_RegistroLOCAL: TStringField;
  private
    { Private declarations }
  protected
    function fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string; override;
  public
    { Public declarations }
  end;

var
  smSistema: TsmSistema;

implementation

{$R *.dfm}

{ TsmSistema }

function TsmSistema.fprMontarWhere(ipTabela, ipWhere: string;
  ipParam: TParam): string;
var
  vaValor, vaOperador: string;
  vaDataInicial, vaDataFinal: TDateTime;
begin
  Result := inherited;
  TUtils.ppuExtrairValorOperadorParametro(ipParam.Text, vaValor, vaOperador, TParametros.coDelimitador);

  if ipTabela = 'AGENDA' then
    begin
      if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'TIPO', vaValor.ToInteger, vaOperador);
    end
  else if ipTabela = 'AGENDA_REGISTRO' then
    begin
      if ipParam.Name = TParametros.coData then
        begin
          vaDataInicial := TUtils.fpuExtrairData(vaValor, 0);
          vaDataFinal := TUtils.fpuExtrairData(vaValor, 1);

          Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA_INICIO', vaDataInicial, vaDataFinal, TOperadores.coOR);
          Result := TSQLGenerator.fpuFilterData(Result, ipTabela, 'DATA_FIM', vaDataInicial, vaDataFinal, vaOperador);
        end
      else if ipParam.Name = TParametros.coTipo then
        begin
          Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'EVENT_TYPE', vaValor.ToInteger(), vaOperador);
        end
      else if ipParam.Name = TParametros.coIdPai then
        begin
          Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'ID_AGENDA', vaValor.ToInteger(), vaOperador);
        end
    end
end;

end.
