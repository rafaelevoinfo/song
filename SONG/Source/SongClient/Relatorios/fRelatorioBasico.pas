unit fRelatorioBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, dmuPrincipal, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dmuLookup, Data.DB, uClientDataSet,
  uTypes, cxCheckBox, dmuRelatorio, cxGroupBox, dxCheckGroupBox,
  uControleAcesso;

type
  TfrmRelatorioBasico = class(TfrmBasico)
    pnBotoes: TPanel;
    pnConfiguracoes: TPanel;
    btnGerarRelatorio: TButton;
    ActionList: TActionList;
    Ac_GerarRelatorio: TAction;
    dsOrganizacao: TDataSource;
    pnOrganizacao: TPanel;
    lb2: TLabel;
    cbOrganizacao: TcxLookupComboBox;
    chkTodasOrganizacoes: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Ac_GerarRelatorioExecute(Sender: TObject);
    procedure chkTodasOrganizacoesPropertiesEditValueChanged(Sender: TObject);
  private

  protected
    dmLookup: TdmLookup;
    dmRelatorio: TdmRelatorio;
    procedure pprValidarPermissao(ipAcao: TAcaoTela; ipPermissao: string);
    function fprExtrairValor(ipChkTodos: TcxCheckBox; ipLookup: TcxLookupComboBox; ipMsgErro: string): Integer;

    function fprGetPermissao: String; virtual; abstract;
  public
    constructor Create(AOwner: TComponent);override;
  end;

var
  frmRelatorioBasico: TfrmRelatorioBasico;

implementation

{$R *.dfm}


procedure TfrmRelatorioBasico.pprValidarPermissao(ipAcao: TAcaoTela; ipPermissao: string);
begin
  if not TInfoLogin.fpuGetInstance.Usuario.fpuValidarPermissao(ipAcao, ipPermissao) then
    raise Exception.Create('Operação não permitida.' + slineBreak + 'O usuário logado não possui a ação de ' +
      AcaoTelaDescricao[ipAcao].ToUpper + ' para a permissão ' + TModulos.fpuGetInstance.fpuGetDescricao(ipPermissao).ToUpper);
end;

function TfrmRelatorioBasico.fprExtrairValor(ipChkTodos: TcxCheckBox; ipLookup: TcxLookupComboBox; ipMsgErro: string): Integer;
begin
  Result := 0;
  if Assigned(ipLookup.Parent) and (ipLookup.Parent is TdxCheckGroupBox) and (not TdxCheckGroupBox(ipLookup.Parent).CheckBox.Checked) then
    Result := -1
  else if not ipChkTodos.Checked then
    begin
      if VarIsNull(ipLookup.EditValue) then
        raise Exception.Create(ipMsgErro);

      Result := ipLookup.EditValue;
    end;
end;

procedure TfrmRelatorioBasico.Ac_GerarRelatorioExecute(Sender: TObject);
begin
  inherited;
  if VarIsNull(cbOrganizacao.EditValue) then
    raise Exception.Create('Informe para qual organização o relatório está sendo gerado.');

  dmLookup.cdslkOrganizacao.Locate(TBancoDados.coId, cbOrganizacao.EditValue, []);
end;

procedure TfrmRelatorioBasico.chkTodasOrganizacoesPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbOrganizacao.Enabled := not chkTodasOrganizacoes.Checked;
end;

constructor TfrmRelatorioBasico.Create(AOwner: TComponent);
begin
  inherited;
  pprValidarPermissao(atVisualizar,fprGetPermissao);
end;

procedure TfrmRelatorioBasico.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  dmRelatorio := TdmRelatorio.Create(Self);
  dmRelatorio.Name := '';

  inherited;

  dmLookup.cdslkOrganizacao.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);;
  if not dmLookup.cdslkOrganizacao.Eof then
    begin
      cbOrganizacao.EditValue := dmLookup.cdslkOrganizacaoID.AsInteger;
      cbOrganizacao.PostEditValue;
    end;
end;

end.
