unit fPatrimonio;

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
  Vcl.ExtCtrls, cxPC, dmuEstoque, uTypes, uControleAcesso, System.TypInfo,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, fItemPatrimonio,
  uClientDataSet, dmuLookup, cxCurrencyEdit, cxDBEdit, cxSpinEdit, uMensagem,
  uExceptions, cxMemo, uUtils;

type
  TfrmPatrimonio = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_ITEM_PATRIMONIO: TcxGridDBColumn;
    viewRegistrosNOME_ITEM: TcxGridDBColumn;
    viewRegistrosDATA_AQUISICAO: TcxGridDBColumn;
    viewRegistrosIDENTIFICACAO: TcxGridDBColumn;
    viewRegistrosMARCA: TcxGridDBColumn;
    viewRegistrosVALOR_INICIAL: TcxGridDBColumn;
    viewRegistrosTAXA_DEPRECIACAO_ANUAL: TcxGridDBColumn;
    viewRegistrosLOCALIZACAO: TcxGridDBColumn;
    viewRegistrosNOTA_FISCAL: TcxGridDBColumn;
    viewRegistrosSTATUS: TcxGridDBColumn;
    viewRegistrosCALC_VALOR_ATUAL: TcxGridDBColumn;
    cbItem: TcxDBLookupComboBox;
    Label3: TLabel;
    btnAdicionar_Financiador: TButton;
    Ac_Adicionar_Item: TAction;
    EditDataAquisicao: TcxDBDateEdit;
    Label4: TLabel;
    EditMarca: TcxDBTextEdit;
    Label5: TLabel;
    Label6: TLabel;
    EditValorInicial: TcxDBCurrencyEdit;
    Label7: TLabel;
    EditTaxaDepreciacao: TcxDBSpinEdit;
    lb1: TLabel;
    EditLocalizacao: TcxDBTextEdit;
    lb2: TLabel;
    EditNotaFiscal: TcxDBTextEdit;
    lb3: TLabel;
    EditIdentifiacao: TcxDBTextEdit;
    btnBaixarReativar: TButton;
    Ac_Baixar: TAction;
    Ac_Reativar: TAction;
    cbPesquisaItem: TcxLookupComboBox;
    lb4: TLabel;
    EditModelo: TcxDBTextEdit;
    EditObservacao: TcxDBMemo;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbItemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Ac_Adicionar_ItemExecute(Sender: TObject);
    procedure cbItemPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_BaixarExecute(Sender: TObject);
    procedure Ac_ReativarExecute(Sender: TObject);
    procedure viewRegistrosCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
    procedure ppvAdicionarItemPatrimonio;
    procedure ppvCarregarItens(ipIdItemEspecifico: integer = 0);
  protected
    procedure pprBeforeAlterar; override;
    function fprGetPermissao: string; override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprValidarPesquisa; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
  public
    procedure ppuIncluir; override;
    procedure ppuPesquisar; override;
  public const
    coEmUso = 0;
    coBaixado = 1;

    coPesqItem = 5;
    coPesqLocalizacao = 6;
    coPesqNotaFiscal = 7;
    coPesqIdentificacao = 8;

    { Public declarations }
  end;

var
  frmPatrimonio: TfrmPatrimonio;

implementation

{$R *.dfm}


procedure TfrmPatrimonio.Ac_Adicionar_ItemExecute(Sender: TObject);
begin
  inherited;
  ppvAdicionarItemPatrimonio;
end;

procedure TfrmPatrimonio.Ac_BaixarExecute(Sender: TObject);
begin
  inherited;
  if TMensagem.fpuPerguntar('Tem certeza que deseja realizar a baixa deste patrimônio?', ppSimNao) = rpSim then
    begin
      dmEstoque.cdsPatrimonio.Edit;
      dmEstoque.cdsPatrimonioSTATUS.AsInteger := coBaixado;
      dmEstoque.cdsPatrimonio.Post;

      pprEfetuarPesquisa;
    end;
end;

procedure TfrmPatrimonio.Ac_ReativarExecute(Sender: TObject);
begin
  inherited;

  if TMensagem.fpuPerguntar('Tem certeza que deseja reativar este patrimônio?', ppSimNao) = rpSim then
    begin
      dmEstoque.cdsPatrimonio.Edit;
      dmEstoque.cdsPatrimonioSTATUS.AsInteger := coEmUso;
      dmEstoque.cdsPatrimonio.Post;

      pprEfetuarPesquisa;
    end;
end;

procedure TfrmPatrimonio.cbItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarItemPatrimonio;
end;

procedure TfrmPatrimonio.cbItemPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if (pcPrincipal.ActivePage = tabCadastro) and dmEstoque.cdsPatrimonio.Active and (dmEstoque.cdsPatrimonio.State in [dsInsert, dsEdit]) then
    begin
      if dmLookup.cdslkItem_Patrimonio.Locate(TBancoDados.coID, cbItem.Editvalue, []) then
        dmEstoque.cdsPatrimonioTAXA_DEPRECIACAO_ANUAL.AsInteger := dmLookup.cdslkItem_PatrimonioTAXA_DEPRECIACAO_ANUAL.AsInteger;
    end;
end;

procedure TfrmPatrimonio.ppvCarregarItens(ipIdItemEspecifico: integer);
begin
  if (not dmLookup.cdslkItem_Patrimonio.Active) or
    ((ipIdItemEspecifico <> 0) and (not dmLookup.cdslkItem_Patrimonio.Locate(TBancoDados.coID, ipIdItemEspecifico, []))) then
    begin
      dmLookup.cdslkItem_Patrimonio.ppuLimparParametros;
      if ipIdItemEspecifico <> 0 then
        dmLookup.cdslkItem_Patrimonio.ppuAddParametro(TParametros.coID, ipIdItemEspecifico, TOperadores.coOR);

      dmLookup.cdslkItem_Patrimonio.ppuAddParametro(TParametros.coAtivo, coRegistroAtivo);
      dmLookup.cdslkItem_Patrimonio.ppuDataRequest();
    end;
end;

procedure TfrmPatrimonio.viewRegistrosCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if not VarIsNull(AViewInfo.GridRecord.Values[viewRegistrosCALC_VALOR_ATUAL.Index]) and
    (not VarIsNull(AViewInfo.GridRecord.Values[viewRegistrosSTATUS.Index])) then
    begin
      // patrimonio totalmente depreciado
      if (VarToStrDef(AViewInfo.GridRecord.Values[viewRegistrosSTATUS.Index], '0').ToInteger = coEmUso) and
        (StrToFloat(VarToStrDef(AViewInfo.GridRecord.Values[viewRegistrosCALC_VALOR_ATUAL.Index], '0')) <= 0) then
        begin
          ACanvas.Font.Color := clWhite;
          if AViewInfo.GridRecord.Selected then
            ACanvas.Brush.Color := clMaroon
          else
            ACanvas.Brush.Color := clRed;
        end;
    end;
end;

procedure TfrmPatrimonio.pprBeforeAlterar;
begin
  inherited;
  ppvCarregarItens(dmEstoque.cdsPatrimonioID_ITEM_PATRIMONIO.AsInteger);
end;

procedure TfrmPatrimonio.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  dmEstoque.cdsPatrimonio.ppuAddParametro(TParametros.coStatus, rgStatus.ItemIndex);

  if (cbPesquisarPor.Editvalue = coPesqItem) then
    dmEstoque.cdsPatrimonio.ppuAddParametro(TParametros.coItem, cbPesquisaItem.Editvalue)
  else if cbPesquisarPor.Editvalue = coPesqLocalizacao then
    dmEstoque.cdsPatrimonio.ppuAddParametro(TParametros.coLocalizacao, EditPesquisa.Text)
  else if cbPesquisarPor.Editvalue = coPesqNotaFiscal then
    dmEstoque.cdsPatrimonio.ppuAddParametro(TParametros.coNotaFiscal, EditPesquisa.Text)
  else if cbPesquisarPor.Editvalue = coPesqIdentificacao then
    dmEstoque.cdsPatrimonio.ppuAddParametro(TParametros.coIdentificacao, EditPesquisa.Text);
end;

procedure TfrmPatrimonio.pprValidarPesquisa;
begin
  inherited;
  if cbPesquisaItem.Visible and VarIsNull(cbPesquisaItem.Editvalue) then
    raise TControlException.Create('Informe o item a ser pesquisado', cbPesquisaItem);
end;

procedure TfrmPatrimonio.ppuIncluir;
begin
  inherited;
  dmEstoque.cdsPatrimonioSTATUS.AsInteger := 0; // em uso (ativo)
end;

procedure TfrmPatrimonio.ppuPesquisar;
begin
  inherited;
  if rgStatus.ItemIndex = coEmUso then
    btnBaixarReativar.Action := Ac_Baixar
  else
    btnBaixarReativar.Action := Ac_Reativar;
end;

procedure TfrmPatrimonio.ppvAdicionarItemPatrimonio;
var
  vaFrmItemPatrimonio: TfrmItemPatrimonio;
begin
  vaFrmItemPatrimonio := TfrmItemPatrimonio.Create(nil);
  try
    vaFrmItemPatrimonio.ppuConfigurarModoExecucao(meSomenteCadastro);
    vaFrmItemPatrimonio.ShowModal;
    if vaFrmItemPatrimonio.IdEscolhido <> 0 then
      begin
        dmLookup.cdslkItem_Patrimonio.Close;
        ppvCarregarItens();
        if dmLookup.cdslkItem_Patrimonio.Locate(TBancoDados.coID, vaFrmItemPatrimonio.IdEscolhido, []) then
          begin
            cbItem.Editvalue := vaFrmItemPatrimonio.IdEscolhido;
            cbItem.PostEditValue;

            TUtils.fpuFocar(cbItem);
          end;
      end;
  finally
    vaFrmItemPatrimonio.Free;
  end;

end;

procedure TfrmPatrimonio.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := 5; // Item

  ppvCarregarItens;
end;

function TfrmPatrimonio.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaItem.Visible := cbPesquisarPor.Editvalue = coPesqItem;
  EditPesquisa.Visible := EditPesquisa.Visible and (not cbPesquisaItem.Visible);
  if cbPesquisaItem.Visible then
    Result := cbPesquisaItem;
end;

function TfrmPatrimonio.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoPatrimonio), Ord(patPatrimonio));
end;

end.
