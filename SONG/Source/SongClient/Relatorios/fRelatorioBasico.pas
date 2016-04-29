unit fRelatorioBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, dmuPrincipal;

type
  TfrmRelatorioBasico = class(TfrmBasico)
    pnBotoes: TPanel;
    pnConfiguracoes: TPanel;
    btnGerarRelatorio: TButton;
    ActionList: TActionList;
    Ac_GerarRelatorio: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioBasico: TfrmRelatorioBasico;

implementation

{$R *.dfm}

end.
