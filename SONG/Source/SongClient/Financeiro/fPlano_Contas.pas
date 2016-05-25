unit fPlano_Contas;

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
  Vcl.ExtCtrls, cxPC, dmuFinanceiro, uControleAcesso, System.TypInfo, cxDBEdit,
  uTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dmuLookup,
  uClientDataSet, dmuPrincipal, uMensagem;

type
  TfrmPlanoContas = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    lblNome: TLabel;
    EditNome: TcxDBTextEdit;
    cbTipo: TcxDBImageComboBox;
    Label3: TLabel;
    cbContaPai: TcxDBLookupComboBox;
    Label4: TLabel;
    viewRegistrosIDENTIFICADOR: TcxGridDBColumn;
    viewRegistrosTIPO: TcxGridDBColumn;
    btnIncluirSubItem: TButton;
    Ac_Incluir_Item: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Ac_Incluir_ItemUpdate(Sender: TObject);
    procedure Ac_Incluir_ItemExecute(Sender: TObject);
  private
    dmFinanceiro: TdmFinanceiro;
    dmLookup: TdmLookup;
    procedure ppvAtualizarLookupPlanoContas;
  protected
    function fprGetPermissao: String; override;
    procedure pprValidarDados; override;
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); override;
    procedure pprAfterSalvar; override;

    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
  public
    function fpuExcluir(ipIds: TArray<Integer>): Boolean; override;
  public const
    coIdentificador = 5;
    { Public declarations }
  end;

var
  frmPlanoContas: TfrmPlanoContas;

implementation

{$R *.dfm}


procedure TfrmPlanoContas.Ac_Incluir_ItemExecute(Sender: TObject);
var
  vaTipo, vaIdContaPai: Integer;

begin
  inherited;
  vaIdContaPai := dmFinanceiro.cdsPlano_ContasID.AsInteger;
  vaTipo := dmFinanceiro.cdsPlano_ContasTIPO.AsInteger;
  ppuIncluir;

  dmFinanceiro.cdsPlano_ContasTIPO.AsInteger := vaTipo;
  dmFinanceiro.cdsPlano_ContasID_CONTA_PAI.AsInteger := vaIdContaPai;
end;

procedure TfrmPlanoContas.Ac_Incluir_ItemUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterar;
end;

procedure TfrmPlanoContas.FormCreate(Sender: TObject);
begin
  dmFinanceiro := TdmFinanceiro.Create(Self);
  dmFinanceiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;
  PesquisaPadrao := Ord(tppTodos);

  ppvAtualizarLookupPlanoContas;
end;

function TfrmPlanoContas.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finPlanoConta));
end;

function TfrmPlanoContas.fpuExcluir(ipIds: TArray<Integer>): Boolean;
var
  vaId: Integer;
  vaDependencias: Boolean;
begin
  vaDependencias := dmPrincipal.FuncoesFinanceiro.fpuVerificarDependenciasPlanoConta(dmFinanceiro.cdsPlano_ContasIDENTIFICADOR.AsString);
  if vaDependencias then
    begin
      if TMensagem.fpuPerguntar('Excluindo esse plano irá causar a exclusão de todos os planos filhos. Deseja continuar?', ppSimNao) = rpNao then
        Exit(False);
    end;

  Result := inherited;
  if Result then
    begin
      if vaDependencias then
        begin
          ppvAtualizarLookupPlanoContas;
          pprEfetuarPesquisa;
        end
      else
        begin
          for vaId in ipIds do
            begin
              if dmLookup.cdslkPlano_Contas.Locate(TBancoDados.coId, vaId, []) then
                dmLookup.cdslkPlano_Contas.Delete;
            end;
        end;

    end;
end;

procedure TfrmPlanoContas.ppvAtualizarLookupPlanoContas;
begin
  dmLookup.cdslkPlano_Contas.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
end;

procedure TfrmPlanoContas.pprAfterSalvar;
begin
  inherited;
  // incluindo apenas localmente
  if not dmLookup.cdslkPlano_Contas.Locate(TBancoDados.coId, dmFinanceiro.cdsPlano_ContasID.AsInteger, []) then
    begin
      dmLookup.cdslkPlano_Contas.Append;
      dmLookup.cdslkPlano_ContasID.AsInteger := dmFinanceiro.cdsPlano_ContasID.AsInteger;
    end
  else
    dmLookup.cdslkPlano_Contas.Edit;

  dmLookup.cdslkPlano_ContasID_CONTA_PAI.AsInteger := dmFinanceiro.cdsPlano_ContasID_CONTA_PAI.AsInteger;
  dmLookup.cdslkPlano_ContasTIPO.AsInteger := dmFinanceiro.cdsPlano_ContasTIPO.AsInteger;
  dmLookup.cdslkPlano_ContasNOME.AsString := dmFinanceiro.cdsPlano_ContasIDENTIFICADOR.AsString + ' - ' +
    dmFinanceiro.cdsPlano_ContasNOME.AsString;
  dmLookup.cdslkPlano_Contas.Post;
end;

procedure TfrmPlanoContas.pprCarregarParametrosPesquisa(
  ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coIdentificador then
    ipCds.ppuAddParametro(TParametros.coIdentificadorPlanoContasRubrica, EditPesquisa.Text);
end;

procedure TfrmPlanoContas.pprPreencherCamposPadroes(ipDataSet: TDataSet);
begin
  inherited;
  if dmFinanceiro.cdsRubricaIDENTIFICADOR.IsNull or
    (dmFinanceiro.cdsPlano_ContasID_CONTA_PAI.NewValue <> dmFinanceiro.cdsPlano_ContasID_CONTA_PAI.OldValue) then
    begin
      dmFinanceiro.cdsPlano_ContasIDENTIFICADOR.AsString := dmPrincipal.FuncoesFinanceiro.fpuGerarIdentificadorPlanoContas
        (dmFinanceiro.cdsPlano_ContasID_CONTA_PAI.AsInteger);
    end;
end;

procedure TfrmPlanoContas.pprValidarDados;
begin
  inherited;
  cbContaPai.PostEditValue;
  if not VarIsNull(cbContaPai.EditValue) then
    begin
      if dmLookup.cdslkPlano_Contas.Locate(TBancoDados.coId, cbContaPai.EditValue, []) then
        begin
          if dmLookup.cdslkPlano_ContasTIPO.AsInteger <> dmFinanceiro.cdsPlano_ContasTIPO.AsInteger then
            raise Exception.Create('O tipo da conta pai está diferente da conta atual. Ambas devem ser do tipo Receita ou Despesa');
        end;
    end;
end;

end.
