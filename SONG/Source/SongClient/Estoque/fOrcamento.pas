unit fOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, Vcl.Menus, Vcl.ExtDlgs,
  System.Actions, Vcl.ActnList, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxGroupBox, cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox,
  cxTextEdit, cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuEstoque, uTypes,
  System.TypInfo, uControleAcesso, dmuLookup, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, uClientDataSet, dmuPrincipal, cxDBEdit, fCliente,
  cxScrollBox, fmEditor;

type
  TfrmOrcamento = class(TfrmBasicoCrud)
    dsOrcamento_Orcamento: TDataSource;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_MODELO_ORCAMENTO: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosID_RESPONSAVEL: TcxGridDBColumn;
    viewRegistrosRESPONSAVEL: TcxGridDBColumn;
    viewRegistrosID_CLIENTE: TcxGridDBColumn;
    viewRegistrosCLIENTE: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    cbPesquisaCliente: TcxLookupComboBox;
    cbPesquisaVendedor: TcxLookupComboBox;
    lbl5: TLabel;
    cbCliente: TcxDBLookupComboBox;
    btnAdicionarCliente: TButton;
    cbVendedor: TcxDBLookupComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    EditDataVenda: TcxDBDateEdit;
    Ac_Adicionar_Cliente: TAction;
    cbModelo: TcxDBLookupComboBox;
    Label3: TLabel;
    pnEditsCadastroTop: TPanel;
    frameEditor: TframeEditor;
    ScrollCampos: TcxScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure cbClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Adicionar_ClienteExecute(Sender: TObject);
    procedure tabCadastroShow(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
    procedure ppvCarregarClientes;
    procedure ppvAdicionarCliente;
  protected
    function fprGetPermissao: String; override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
  public
    { Public declarations }
  end;

var
  frmOrcamento: TfrmOrcamento;

const
  coPesquisaCliente = 5;
  coPesquisaVendedor = 6;

implementation

{$R *.dfm}


procedure TfrmOrcamento.Ac_Adicionar_ClienteExecute(Sender: TObject);
begin
  inherited;
  ppvAdicionarCliente;
end;

procedure TfrmOrcamento.cbClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarCliente;
end;

procedure TfrmOrcamento.ppvAdicionarCliente;
var
  vaFrmCliente: TfrmCliente;
begin
  vaFrmCliente := TfrmCliente.Create(nil);
  try
    vaFrmCliente.ppuConfigurarModoExecucao(meSomenteCadastro);
    vaFrmCliente.ShowModal;
    if vaFrmCliente.IdEscolhido <> 0 then
      begin
        ppvCarregarClientes;
        if dmLookup.cdslkFin_For_Cli.Locate(TBancoDados.coId, vaFrmCliente.IdEscolhido, []) then
          begin
            cbCliente.EditValue := vaFrmCliente.IdEscolhido;
            cbCliente.PostEditValue;
          end;
      end;
  finally
    vaFrmCliente.Free;
  end;
end;

procedure TfrmOrcamento.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := Ord(tppData);

  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);
  ppvCarregarClientes;
end;

procedure TfrmOrcamento.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaCliente then
    ipCds.ppuAddParametro(TParametros.coCliente, cbPesquisaCliente.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaVendedor then
    ipCds.ppuAddParametro(TParametros.coVendedor, cbPesquisaVendedor.EditValue)
end;

procedure TfrmOrcamento.ppvCarregarClientes;
begin
  dmLookup.cdslkFin_For_Cli.ppuDataRequest([TParametros.coTipo], [Ord(tfCliente)], TOperadores.coAnd, True);
end;

procedure TfrmOrcamento.tabCadastroShow(Sender: TObject);
begin
  inherited;
  frameEditor.ppuIniciar;
end;

function TfrmOrcamento.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaVendedor.Visible := (cbPesquisarPor.EditValue = coPesquisaVendedor);
  cbPesquisaCliente.Visible := cbPesquisarPor.EditValue = coPesquisaCliente;

  EditPesquisa.Visible := EditPesquisa.Visible and (not(cbPesquisaVendedor.Visible or cbPesquisaCliente.Visible));

  if cbPesquisaVendedor.Visible then
    Result := cbPesquisaVendedor
  else if cbPesquisaCliente.Visible then
    Result := cbPesquisaCliente;
end;

function TfrmOrcamento.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estOrcamento));
end;

end.
