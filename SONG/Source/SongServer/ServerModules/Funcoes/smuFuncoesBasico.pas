unit smuFuncoesBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, uEnviarEmail;

type
  TsmFuncoesBasico = class(TsmBasico)
    qId: TRFQuery;
    qIdID: TIntegerField;
  private
  protected
    procedure pprEnviarEmail(ipAssunto, ipMsg, ipDestinatario: String);
  public
    function fpuGetId(ipTabela: string): Integer; virtual;
    function fpuDataHoraAtual: string; virtual;
    function fpuTestarConexao:Boolean;
  end;

var
  smFuncoesBasico: TsmFuncoesBasico;

implementation

uses
  dmuPrincipal;

{$R *.dfm}

{ TsmFuncoesBasico }

function TsmFuncoesBasico.fpuDataHoraAtual: string;
begin
  Result := DateTimeToStr(now);
end;

function TsmFuncoesBasico.fpuGetId(ipTabela: string): Integer;
begin
  qId.Connection := dmPrincipal.Connection;

  qId.Close;
  qId.MacroByName('GENERATOR').AsRaw := 'GEN_' + ipTabela.ToUpper;
  qId.Open();

  Result := qIdID.AsInteger;
end;

function TsmFuncoesBasico.fpuTestarConexao: Boolean;
begin
  Result := true;
end;

procedure TsmFuncoesBasico.pprEnviarEmail(ipAssunto, ipMsg,
  ipDestinatario: String);
var
  vaEnviarEmail: TEnviarEmail;
begin
  vaEnviarEmail := TEnviarEmail.Create(true);
  vaEnviarEmail.ExibirMensagens := false;
  vaEnviarEmail.EMail.Remetente.Nome := 'SONG';
  vaEnviarEmail.EMail.Remetente.EMail := 'song@oreades.org.br';

  vaEnviarEmail.EMail.Destinatario.Para.Add.EnderecoEMail.EMail := ipDestinatario;

  vaEnviarEmail.EMail.Configuracao.Usuario := 'song@oreades.org.br';
  vaEnviarEmail.EMail.Configuracao.Senha := 'ipeAmarelo';
  vaEnviarEmail.EMail.Configuracao.Host := 'smtp.oreades.org.br';
  vaEnviarEmail.EMail.Configuracao.Porta := 587;

  vaEnviarEmail.EMail.Assunto := ipAssunto;
  vaEnviarEmail.EMail.Mensagem := ipMsg;
  vaEnviarEmail.Start;
end;

end.
