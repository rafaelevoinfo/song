program Project_Geral;

uses
  Forms,
  pPrincipal in 'pPrincipal.pas' {Form1},
  pECF in 'pECF.pas',
  pAtualizacaoNet in 'pAtualizacaoNet.pas',
  Unit_Util in 'Unit_Util.pas',
  pAtualizacao in 'pAtualizacao.pas' {frmAtualizacao},
  Unit_ECF in 'Unit_ECF.pas',
  Unit_Method in 'Unit_Method.pas',
  Unit_Method_ant_sage30 in 'Unit_Method_ant_sage30.pas',
  Unit_Method_D2 in 'Unit_Method_D2.pas',
  Unit_SimNao in 'Unit_SimNao.pas' {Form_SimNao},
  Unit_Sweda in 'Unit_Sweda.pas',
  pBoletos_Remessa in 'pBoletos_Remessa.pas' {frmBoletos_Remessa},
  pNFePrincipal in 'pNFePrincipal.pas' {frmNFePrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmAtualizacao, frmAtualizacao);
  Application.CreateForm(TForm_SimNao, Form_SimNao);
  Application.CreateForm(TfrmBoletos_Remessa, frmBoletos_Remessa);
  Application.CreateForm(TfrmNFePrincipal, frmNFePrincipal);
  Application.Run;
end.
