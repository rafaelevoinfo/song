unit smuSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, dmuPrincipal;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  smSistema: TsmSistema;

implementation

{$R *.dfm}

end.
