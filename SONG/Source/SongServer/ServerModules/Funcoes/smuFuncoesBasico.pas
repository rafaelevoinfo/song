unit smuFuncoesBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, uEnviarEmail,
  uUtils;

type
  TsmFuncoesBasico = class(TsmBasico)
    qId: TRFQuery;
    qIdID: TIntegerField;
  private
  protected

  public
    function fpuGetId(ipTabela: string): Integer; virtual;
    function fpuDataHoraAtual: string; virtual;
    function fpuTestarConexao: Boolean;
    function fpuVerificarAlteracao(ipTabela,ipUltimaSincronizacao: String): Boolean;

    procedure ppuEnviarEmail(ipAssunto, ipMsg, ipDestinatario: String; ipNomeAnexo:String; ipAnexo:TStream);
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
  if (ipTabela.ToUpper = 'LOTE_SEMENTE') or (ipTabela.ToUpper = 'LOTE_MUDA') then
    qId.MacroByName('GENERATOR').AsRaw := 'GEN_LOTE_SEMENTE_MUDA'
  else
    qId.MacroByName('GENERATOR').AsRaw := 'GEN_' + ipTabela.ToUpper;

  qId.Open();

  Result := qIdID.AsInteger;
end;

function TsmFuncoesBasico.fpuTestarConexao: Boolean;
begin
  Result := true;
end;

function TsmFuncoesBasico.fpuVerificarAlteracao(ipTabela: String; ipUltimaSincronizacao:String): Boolean;
var
  vaUltimaSincronizacao:TDateTime;
  vaResult:Boolean;
begin
  vaUltimaSincronizacao := StrToDateTime(ipUltimaSincronizacao);

  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      ipDataSet.SQL.Text := 'Select count(*) as qtde from log where log.tabela = :TABELA and log.data_hora > :ULTIMA_SYNC';
      ipDataSet.ParamByName('TABELA').AsString := ipTabela;
      ipDataSet.ParamByName('ULTIMA_SYNC').AsDateTime := vaUltimaSincronizacao;
      ipDataSet.Open();

      vaResult := ipDataSet.FieldByName('QTDE').AsInteger > 0;
    end);

  Result := vaResult;
end;

procedure TsmFuncoesBasico.ppuEnviarEmail(ipAssunto, ipMsg,
  ipDestinatario: String; ipNomeAnexo:String; ipAnexo:TStream);
var
  vaEnviarEmail: TEnviarEmail;
  vaAnexo:TAnexoItem;
  vaArquivoAnexo:TBytesStream;
begin
  vaEnviarEmail := TEnviarEmail.Create(true);
  vaEnviarEmail.FreeOnTerminate := true;
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

  if Assigned(ipAnexo) then
    begin
      vaAnexo := vaEnviarEmail.EMail.Anexo.Add;
      vaAnexo.NomeArquivo := ipNomeAnexo;
      vaArquivoAnexo := TBytesStream.Create;
      TUtils.ppuCopyStreamToByteStream(ipAnexo, vaArquivoAnexo);
      vaArquivoAnexo.Position := 0;

      vaAnexo.Arquivo := vaArquivoAnexo;
    end;
  vaEnviarEmail.Start;
end;

end.
