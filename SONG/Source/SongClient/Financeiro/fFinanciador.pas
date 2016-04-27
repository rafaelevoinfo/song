unit fFinanciador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxGroupBox, cxRadioGroup, Vcl.StdCtrls,
  cxDropDownEdit, cxImageComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  Vcl.ExtCtrls, cxPC, dmuFinanceiro, dmuLookup, uTypes, uControleAcesso,
  System.TypInfo, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxDBEdit,
  dmuPrincipal, uExceptions, System.RegularExpressions, uClientDataSet, cxMemo,
  uUtils;

type
  TfrmFinanciador = class(TfrmBasicoCrud)
    lbNome: TLabel;
    EditNomeFantasia: TcxDBTextEdit;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_CONTATO: TcxGridDBColumn;
    viewRegistrosNOME_FANTASIA: TcxGridDBColumn;
    viewRegistrosRAZAO_SOCIAL: TcxGridDBColumn;
    viewRegistrosTELEFONE: TcxGridDBColumn;
    viewRegistrosCELULAR: TcxGridDBColumn;
    viewRegistrosEMAIL: TcxGridDBColumn;
    viewRegistrosSITE: TcxGridDBColumn;
    viewRegistrosCPF_CNPJ: TcxGridDBColumn;
    viewRegistrosINSCRICAO_ESTADUAL: TcxGridDBColumn;
    viewRegistrosINSCRICAO_MUNICIPAL: TcxGridDBColumn;
    viewRegistrosRAMO_ATIVIDADE: TcxGridDBColumn;
    viewRegistrosID_CIDADE: TcxGridDBColumn;
    Label5: TLabel;
    EditRazaoSocial: TcxDBTextEdit;
    rgInfoContato: TcxGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditEmail: TcxDBTextEdit;
    EditEndereco: TcxDBTextEdit;
    EditComplemento: TcxDBTextEdit;
    EditCelular: TcxDBMaskEdit;
    EditTelefone: TcxDBMaskEdit;
    EditBairro: TcxDBTextEdit;
    cbCidade: TcxDBLookupComboBox;
    Label13: TLabel;
    EditSite: TcxDBTextEdit;
    cbContato: TcxDBLookupComboBox;
    Label4: TLabel;
    lbCpfCnpj: TLabel;
    Label15: TLabel;
    EditInscricaoEstadual: TcxDBTextEdit;
    Label16: TLabel;
    EditInscricaoMunicipal: TcxDBTextEdit;
    Label17: TLabel;
    EditRamo: TcxDBTextEdit;
    Label19: TLabel;
    EditObs: TcxDBMemo;
    btnPesquisarPessoa: TButton;
    Ac_Pesquisar_Pessoa: TAction;
    lbl1: TLabel;
    EditCargoContato: TcxDBTextEdit;
    EditCpfCnpj: TcxDBMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure Ac_Pesquisar_PessoaExecute(Sender: TObject);
    procedure cbContatoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

  protected
    dmFinanceiro: TdmFinanceiro;
    dmLookup: TdmLookup;

    function fprGetPermissao: String; override;
    procedure pprValidarDados; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); override;
    procedure pprPesquisarPessoa(); virtual;
    procedure pprCarregarPessoas(ipIdEspecifico: Integer = 0); virtual;
    function fprGetTipoPessoa: TTipoRelacionamentoPessoa; virtual;
    procedure pprValidarCPFCNPJ;virtual;

    function fprGetTipo: TTipoFinForCli; virtual;
  public
    const
    coNomeFantasia = 5;
    coRazaoSocial = 6;
    coCpfCnpj = 7;
  end;

var
  frmFinanciador: TfrmFinanciador;

implementation

uses
  fPessoa;

{$R *.dfm}


procedure TfrmFinanciador.Ac_Pesquisar_PessoaExecute(Sender: TObject);
begin
  inherited;
  pprPesquisarPessoa();
end;

procedure TfrmFinanciador.pprPesquisarPessoa();
var
  vaFrmPessoa: TfrmPessoa;
begin
  inherited;
  vaFrmPessoa := TfrmPessoa.Create(nil);
  try
    vaFrmPessoa.ppuConfigurarModoExecucao(mePesquisa);
    vaFrmPessoa.ShowModal;
    if vaFrmPessoa.IdEscolhido <> 0 then
      begin
        if dmLookup.cdslkPessoa.Locate(TBancoDados.coID, vaFrmPessoa.IdEscolhido, []) then
          begin
            cbContato.EditValue := vaFrmPessoa.IdEscolhido;
            cbContato.PostEditValue;
          end
        else
          begin
            pprCarregarPessoas(vaFrmPessoa.IdEscolhido);
            if dmLookup.cdslkPessoa.Locate(TBancoDados.coID, vaFrmPessoa.IdEscolhido, []) then
              begin
                cbContato.EditValue := vaFrmPessoa.IdEscolhido;
                cbContato.PostEditValue;
              end;
          end;
      end;
  finally
    vaFrmPessoa.Free;
  end;
end;

procedure TfrmFinanciador.cbContatoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    pprPesquisarPessoa;
end;

procedure TfrmFinanciador.FormCreate(Sender: TObject);
begin
  dmFinanceiro := TdmFinanceiro.Create(Self);
  dmFinanceiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;
  PesquisaPadrao := tppTodos;

  pprCarregarPessoas();
end;

procedure TfrmFinanciador.pprCarregarPessoas(ipIdEspecifico: Integer);
begin
  dmLookup.cdslkPessoa.close;
  dmLookup.cdslkPessoa.ppuLimparParametros;

  dmLookup.cdslkPessoa.ppuAddParametro(TParametros.coAtivo, 0, TOperadores.coAnd);
  if ipIdEspecifico <> 0 then
    begin
      dmLookup.cdslkPessoa.ppuAddParametro(TParametros.coTipo, Ord(fprGetTipoPessoa), TOperadores.coOr);
      dmLookup.cdslkPessoa.ppuAddParametro(TParametros.coID, ipIdEspecifico, TOperadores.coAnd);
    end
  else
    dmLookup.cdslkPessoa.ppuAddParametro(TParametros.coTipo, Ord(fprGetTipoPessoa), TOperadores.coAnd);

  dmLookup.cdslkPessoa.ppuDataRequest();
end;

function TfrmFinanciador.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finFinanciador));
end;

function TfrmFinanciador.fprGetTipo: TTipoFinForCli;
begin
  Result := tfFinanciador;
end;

function TfrmFinanciador.fprGetTipoPessoa: TTipoRelacionamentoPessoa;
begin
  Result := trpFinanciador;
end;

procedure TfrmFinanciador.pprCarregarParametrosPesquisa(
  ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = Ord(coNomeFantasia) then
    ipCds.ppuAddParametro(TParametros.coNomeFantasia, EditPesquisa.Text)
  else if cbPesquisarPor.EditValue = Ord(coRazaoSocial) then
    ipCds.ppuAddParametro(TParametros.coRazaoSocial, EditPesquisa.Text)
  else if cbPesquisarPor.EditValue = Ord(coCpfCnpj) then
    ipCds.ppuAddParametro(TParametros.coCpfCnpj, EditPesquisa.Text);

  ipCds.ppuAddParametro(TParametros.coTipo, Ord(fprGetTipo));
end;

procedure TfrmFinanciador.pprPreencherCamposPadroes(ipDataSet: TDataSet);
begin
  inherited;
  dmFinanceiro.cdsFin_For_CliTIPO.AsInteger := Ord(fprGetTipo);
end;

procedure TfrmFinanciador.pprValidarCPFCNPJ;
begin
   if not TUtils.fpuValidarCnpj(dmFinanceiro.cdsFin_For_CliCPF_CNPJ.AsString) then
    raise TControlException.Create('CNPJ inválido.', EditCpfCnpj);
end;

procedure TfrmFinanciador.pprValidarDados;
var
  vaErros, vaResult: string;
  vaDuplicados: TArray<String>;
  I: Integer;
  vaEdit: TWinControl;
begin
  inherited;
  vaEdit := nil;
  pprValidarCPFCNPJ;

  vaResult := dmPrincipal.FuncoesAdm.fpuValidarFinanciadorFornecedorCliente(dmFinanceiro.cdsFin_For_CliID.AsInteger,
    Ord(fprGetTipo),
    dmFinanceiro.cdsFin_For_CliRAZAO_SOCIAL.AsString, dmFinanceiro.cdsFin_For_CliNOME_FANTASIA.AsString,
    dmFinanceiro.cdsFin_For_CliCPF_CNPJ.AsString);

  if vaResult <> '' then
    begin
      vaDuplicados := TRegex.Split(vaResult, TParametros.coDelimitador);
      vaErros := 'O(s) seguinte(s) campo(s) deve(m) ser único(s):';
      for I := 0 to High(vaDuplicados) do
        begin
          if vaDuplicados[I] = 'NOME_FANTASIA' then
            begin
              vaEdit := EditNomeFantasia;
              vaErros := vaErros + slineBreak + 'Nome Fantasia';
            end
          else if vaDuplicados[I] = 'RAZAO_SOCIAL' then
            begin
              vaEdit := EditRazaoSocial;
              vaErros := vaErros + slineBreak + 'Razão Social';
            end
          else if vaDuplicados[I] = 'CPF_CNPJ' then
            begin
              vaEdit := EditCpfCnpj;
              vaErros := vaErros + slineBreak + 'CPF/CNPJ';
            end
        end;

      raise TControlException.Create(vaErros, vaEdit);

    end;

end;

end.
