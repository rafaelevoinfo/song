unit fCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrudMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuEstoque, dmuLookup, uTypes,
  System.DateUtils, uClientDataSet, uControleAcesso, System.TypInfo, cxMemo,
  cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit,
  uMensagem, cxCalc, uExceptions, fEntrada, fLote_Muda, fConta_Pagar,
  dmuPrincipal, System.RegularExpressions, fLote_Semente;

type
  TCompra = class(TModelo)
  private
    FIdPessoaComprou: Integer;
    FData: TDateTime;
    FIdSolicitacao: Integer;
    procedure SetData(const Value: TDateTime);
    procedure SetIdPessoaComprou(const Value: Integer);
    procedure SetIdSolicitacao(const Value: Integer);
  public
    property Data: TDateTime read FData write SetData;
    property IdPessoaComprou: Integer read FIdPessoaComprou write SetIdPessoaComprou;
    property IdSolicitacao: Integer read FIdSolicitacao write SetIdSolicitacao;
  end;

  TfrmCompra = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_FORNECEDOR: TcxGridDBColumn;
    viewRegistrosID_CONTA_PAGAR: TcxGridDBColumn;
    viewRegistrosID_PESSOA_COMPROU: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosSTATUS_ENTREGA: TcxGridDBColumn;
    viewRegistrosVALOR_FRETE: TcxGridDBColumn;
    viewRegistrosCODIGO_RASTREIO: TcxGridDBColumn;
    viewRegistrosDESCRICAO: TcxGridDBColumn;
    viewRegistrosFORNECEDOR: TcxGridDBColumn;
    viewRegistrosPESSOA_COMPROU: TcxGridDBColumn;
    viewRegistrosVALOR_TOTAL: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_ITEM: TcxGridDBColumn;
    viewRegistrosDetailID_ESPECIE: TcxGridDBColumn;
    viewRegistrosDetailQTDE: TcxGridDBColumn;
    viewRegistrosDetailVALOR_UNITARIO: TcxGridDBColumn;
    viewRegistrosDetailITEM: TcxGridDBColumn;
    viewRegistrosDetailESPECIE: TcxGridDBColumn;
    lbl1: TLabel;
    cbComprador: TcxDBLookupComboBox;
    lbl2: TLabel;
    EditDataCompra: TcxDBDateEdit;
    lbl3: TLabel;
    cbStatusEntrega: TcxDBImageComboBox;
    lbl4: TLabel;
    EditDescricao: TcxDBMemo;
    lbl5: TLabel;
    cbFornecedor: TcxDBLookupComboBox;
    Label3: TLabel;
    EditValorFrete: TcxDBCurrencyEdit;
    btnProdutoEntregue: TButton;
    Ac_Produto_Entregue: TAction;
    Label4: TLabel;
    cbItem: TcxDBLookupComboBox;
    Label5: TLabel;
    cbEspecie: TcxDBLookupComboBox;
    Label7: TLabel;
    EditQtde: TcxDBCalcEdit;
    lbUnidade: TLabel;
    lbl6: TLabel;
    EditValorUnitario: TcxDBCurrencyEdit;
    cbPesquisaPessoa: TcxLookupComboBox;
    cbItemPesquisa: TcxLookupComboBox;
    cbPesquisaFornecedor: TcxLookupComboBox;
    EditCodigoRastreio: TcxDBTextEdit;
    Label6: TLabel;
    btnGerarContaPagar: TButton;
    Ac_Gerar_Conta_Pagar: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Ac_Produto_EntregueUpdate(Sender: TObject);
    procedure Ac_Produto_EntregueExecute(Sender: TObject);
    procedure viewRegistrosSTATUS_ENTREGACustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cbItemPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Gerar_Conta_PagarExecute(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
    procedure ppvRealizarEntradas;
    procedure ppvGerarEntrada();
    procedure ppvGerarEntradaSemente;
    procedure ppvGerarEntradaMuda;
    procedure ppvGerarContaPagar;
    procedure ppvExcluirLotesMuda(ipIds: TArray<Integer>);
    procedure ppvExcluirLotesSemente(ipIds: TArray<Integer>);
    procedure ppvExcluirItensEntrada(ipIds: TArray<Integer>);

  protected
    function fprGetPermissao: string; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprValidarPesquisa; override;
    procedure pprExecutarSalvar; override;

    procedure pprBeforeSalvarDetail; override;
    procedure pprBeforeExcluirDetail(ipId: Integer); override;

    procedure pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela); override;

    procedure pprCarregarDadosModelo; override;
    procedure pprCarregarDadosModeloDetail; override;
  public
    procedure ppuIncluir; override;
  public const
    coPesquisaItem = 6;
    coPesquisaComprador = 5;
    coPesquisaCodigoRastreio = 7;
    coPesquisaFornecedor = 8;
    { Public declarations }
  end;

var
  frmCompra: TfrmCompra;

implementation

{$R *.dfm}


procedure TfrmCompra.Ac_Gerar_Conta_PagarExecute(Sender: TObject);
begin
  inherited;
  ppvGerarContaPagar;
end;

procedure TfrmCompra.ppvGerarContaPagar;
var
  vaContaGerada: Boolean;
  vaPergunta: string;
  vaFrmContaPagar: TfrmContaPagar;
  vaContaPagar: TContaPagar;
begin
  vaContaGerada := dmPrincipal.FuncoesEstoque.fpuVerificarContaPagarJaGerada(dmEstoque.cdsCompraID.AsInteger);
  if vaContaGerada then
    vaPergunta := 'Já existe uma conta a pagar para esta compra. Tem certeza que deseja gerar outra?'
  else
    vaPergunta := 'Deseja gerar uma conta a pagar para esta compra?';

  if TMensagem.fpuPerguntar(vaPergunta, ppSimNao) = rpSim then
    begin
      vaFrmContaPagar := TfrmContaPagar.Create(nil);
      try
        vaContaPagar := TContaPagar.Create;
        vaContaPagar.IdFornecedor := dmEstoque.cdsCompraID_FORNECEDOR.AsInteger;
        vaContaPagar.IdCompra := dmEstoque.cdsCompraID.AsInteger;
        vaContaPagar.ValorTotal := dmEstoque.cdsCompraVALOR_TOTAL.AsFloat;
        vaContaPagar.IdResponsavel := dmEstoque.cdsCompraID_PESSOA_COMPROU.AsInteger;

        vaFrmContaPagar.ppuConfigurarModoExecucao(meSomenteCadastro, vaContaPagar);
        vaFrmContaPagar.ShowModal;

        if vaFrmContaPagar.IdEscolhido <> 0 then
          TMensagem.ppuShowMessage('Conta a Pagar gerada com sucesso.');
      finally
        vaFrmContaPagar.Free;
      end;
    end;
end;

procedure TfrmCompra.Ac_Produto_EntregueExecute(Sender: TObject);
begin
  inherited;
  ppvRealizarEntradas;

  dmEstoque.cdsCompra.Edit;
  dmEstoque.cdsCompraSTATUS_ENTREGA.AsInteger := Ord(sepEntregue);
  dmEstoque.cdsCompra.Post;
end;

procedure TfrmCompra.ppvRealizarEntradas();
begin
  if dmEstoque.cdsCompra_Item.RecordCount > 0 then
    begin
      if TMensagem.fpuPerguntar('Deseja realizar a entrada do produtos comprados?', ppSimNao) = rpSim then
        begin
          // Tipo Outros
          if dmEstoque.cdsCompra_Item.Locate(dmEstoque.cdsCompra_ItemTIPO_ITEM.FieldName, Ord(tiOutro), []) then
            ppvGerarEntrada();
          // Semente
          if dmEstoque.cdsCompra_Item.Locate(dmEstoque.cdsCompra_ItemTIPO_ITEM.FieldName, Ord(tiSemente), []) then
            ppvGerarEntradaSemente();
          // Muda
          if dmEstoque.cdsCompra_Item.Locate(dmEstoque.cdsCompra_ItemTIPO_ITEM.FieldName, Ord(tiMuda), []) then
            ppvGerarEntradaMuda();

          TMensagem.ppuShowMessage('Entradas realizadas com sucesso.');
        end;
    end;
end;

procedure TfrmCompra.Ac_Produto_EntregueUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterar and (dmEstoque.cdsCompraSTATUS_ENTREGA.AsInteger <> Ord(sepEntregue));
end;

procedure TfrmCompra.cbItemPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cbItem.PostEditValue;
  lbUnidade.Caption := dmLookup.cdslkItemUNIDADE.AsString;
  cbEspecie.Enabled := dmLookup.cdslkItemTIPO.AsInteger in ([Ord(tiSemente), Ord(tiMuda)]);
end;

procedure TfrmCompra.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  inherited;

  PesquisaPadrao := tppData;
  EditDataInicialPesquisa.Date := IncDay(Now, -7);;
  EditDataFinalPesquisa.Date := IncDay(Now, 7);

  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);
  dmLookup.cdslkItem.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
  dmLookup.cdslkFornecedor.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);

end;

function TfrmCompra.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaPessoa.Visible := (cbPesquisarPor.EditValue = coPesquisaComprador);
  cbItemPesquisa.Visible := cbPesquisarPor.EditValue = coPesquisaItem;
  cbPesquisaFornecedor.Visible := cbPesquisarPor.EditValue = coPesquisaFornecedor;

  EditPesquisa.Visible := EditPesquisa.Visible and (not(cbItemPesquisa.Visible or cbPesquisaPessoa.Visible or cbPesquisaFornecedor.Visible));

  if cbPesquisaPessoa.Visible then
    Result := cbPesquisaPessoa
  else if cbItemPesquisa.Visible then
    Result := cbItemPesquisa
  else if cbPesquisaFornecedor.Visible then
    Result := cbPesquisaFornecedor;
end;

function TfrmCompra.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estCompra));
end;

procedure TfrmCompra.pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela);
var
  vaIdsExcluir: String;
  vaIdsString: TArray<String>;
  vaIds: TArray<Integer>;
  I: Integer;
begin
  inherited;
  vaIdsExcluir := dmPrincipal.FuncoesViveiro.fpuBuscarLotesMudas(ipId);
  if vaIdsExcluir <> '' then
    begin
      if TMensagem.fpuPerguntar('Existem lotes de mudas vinculados a esta compra. Deseja excluí-los também?', ppSimNao) = rpSim then
        begin
          vaIdsString := TRegex.Split(vaIdsExcluir, coDelimitadorPadrao);
          SetLength(vaIds, length(vaIdsString));
          for I := 0 to High(vaIdsString) do
            vaIds[I] := vaIdsString[I].ToInteger;

          ppvExcluirLotesMuda(vaIds);
        end;
    end;

  vaIdsExcluir := dmPrincipal.FuncoesViveiro.fpuBuscarLotesSementes(ipId);
  if vaIdsExcluir <> '' then
    begin
      if TMensagem.fpuPerguntar('Existem lotes de sementes vinculados a esta compra. Deseja excluí-los também?', ppSimNao) = rpSim then
        begin
          vaIdsString := TRegex.Split(vaIdsExcluir, coDelimitadorPadrao);
          SetLength(vaIds, length(vaIdsString));
          for I := 0 to High(vaIdsString) do
            vaIds[I] := vaIdsString[I].ToInteger;

          ppvExcluirLotesSemente(vaIds);
        end;
    end;

  vaIdsExcluir := dmPrincipal.FuncoesEstoque.fpuBuscarItensEntrada(ipId);
  if vaIdsExcluir <> '' then
    begin
      if TMensagem.fpuPerguntar('Existem itens de entradas vinculados a esta compra. Deseja excluí-los também?', ppSimNao) = rpSim then
        begin
          vaIdsString := TRegex.Split(vaIdsExcluir, coDelimitadorPadrao);
          SetLength(vaIds, length(vaIdsString));
          for I := 0 to High(vaIdsString) do
            vaIds[I] := vaIdsString[I].ToInteger;

          ppvExcluirItensEntrada(vaIds);
        end;
    end;
end;

procedure TfrmCompra.ppvExcluirItensEntrada(ipIds: TArray<Integer>);
var
  vaFrmEntrada: TfrmEntrada;
  vaIds: TStringList;
  I: Integer;
begin
  vaFrmEntrada := TfrmEntrada.Create(nil);
  try
    vaFrmEntrada.ModoSilencioso := True;
    vaFrmEntrada.ppuConfigurarPesquisa(TfrmEntrada.coPesquisaCompra, dmEstoque.cdsCompraID.AsString);
    vaFrmEntrada.ppuPesquisar;

    vaFrmEntrada.fpuExcluirDetail(ipIds);
  finally
    vaFrmEntrada.Free;
  end;
end;

procedure TfrmCompra.ppvExcluirLotesSemente(ipIds: TArray<Integer>);
var
  vaFrmLoteSemente: TfrmLoteSemente;
  vaIds: TStringList;
  I: Integer;
begin
  vaFrmLoteSemente := TfrmLoteSemente.Create(nil);
  try
    vaFrmLoteSemente.ModoSilencioso := True;
    if length(ipIds) > 1 then
      begin
        vaIds := TStringList.Create;
        try
          vaIds.StrictDelimiter := True;
          vaIds.Delimiter := coDelimitadorPadrao;

          for I := 0 to High(ipIds) do
            vaIds.Add(ipIds[I].ToString());

          vaFrmLoteSemente.ppuConfigurarPesquisa(Ord(tppId), vaIds.DelimitedText);
        finally
          vaIds.Free;
        end;
      end
    else
      vaFrmLoteSemente.ppuConfigurarPesquisa(Ord(tppId), ipIds[0].ToString);
    vaFrmLoteSemente.ppuPesquisar;

    vaFrmLoteSemente.fpuExcluir(ipIds);
  finally
    vaFrmLoteSemente.Free;
  end;
end;

procedure TfrmCompra.ppvExcluirLotesMuda(ipIds: TArray<Integer>);
var
  vaFrmLoteMuda: TfrmLoteMuda;
  vaIds: TStringList;
  I: Integer;
begin
  vaFrmLoteMuda := TfrmLoteMuda.Create(nil);
  try
    vaFrmLoteMuda.ModoSilencioso := True;
    if length(ipIds) > 1 then
      begin
        vaIds := TStringList.Create;
        try
          vaIds.StrictDelimiter := True;
          vaIds.Delimiter := coDelimitadorPadrao;

          for I := 0 to High(ipIds) do
            vaIds.Add(ipIds[I].ToString());

          vaFrmLoteMuda.ppuConfigurarPesquisa(Ord(tppId), vaIds.DelimitedText);
        finally
          vaIds.Free;
        end;
      end
    else
      vaFrmLoteMuda.ppuConfigurarPesquisa(Ord(tppId), ipIds[0].ToString);
    vaFrmLoteMuda.ppuPesquisar;

    vaFrmLoteMuda.fpuExcluir(ipIds);
  finally
    vaFrmLoteMuda.Free;
  end;
end;

procedure TfrmCompra.pprBeforeExcluirDetail(ipId: Integer);
var
  vaIdExcluir: Integer;
begin
  inherited;
  if dmEstoque.cdsCompra_ItemTIPO_ITEM.AsInteger = Ord(tiMuda) then
    begin
      vaIdExcluir := dmPrincipal.FuncoesViveiro.fpuBuscarLoteMuda(ipId);
      if vaIdExcluir <> 0 then
        begin
          if not ModoSilencioso then
            begin
              if TMensagem.fpuPerguntar('Existe um lote de mudas vinculado a esta compra. Deseja excluí-lo também?', ppSimNao) = rpSim then
                ppvExcluirLotesMuda([vaIdExcluir]);
            end;

        end;
    end
  else if dmEstoque.cdsCompra_ItemTIPO_ITEM.AsInteger = Ord(tiSemente) then
    begin
      vaIdExcluir := dmPrincipal.FuncoesViveiro.fpuBuscarLoteSemente(ipId);
      if vaIdExcluir <> 0 then
        begin
          if not ModoSilencioso then
            begin
              if TMensagem.fpuPerguntar('Existe um lote de semente vinculado a esta compra. Deseja excluí-lo também?', ppSimNao) = rpSim then
                ppvExcluirLotesSemente([vaIdExcluir]);
            end;

        end;
    end
  else
    begin
      vaIdExcluir := dmPrincipal.FuncoesEstoque.fpuBuscarItemEntrada(ipId);
      if vaIdExcluir <> 0 then
        begin
          if not ModoSilencioso then
            begin
              if TMensagem.fpuPerguntar('Existe um item de uma entrada vinculado a esta compra. Deseja excluí-lo também?', ppSimNao) = rpSim then
                ppvExcluirItensEntrada([vaIdExcluir]);
            end;

        end;
    end;
end;

procedure TfrmCompra.pprBeforeSalvarDetail;
begin
  inherited;
  // vamos garantir que somente itens do tipo smente e muda vao estar vinculados a uma especie
  if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiOutro) then
    dmEstoque.cdsCompra_ItemID_ESPECIE.Clear;
end;

procedure TfrmCompra.pprCarregarDadosModelo;
var
  vaCompra: TCompra;
begin
  inherited;
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) and (Modelo is TCompra) then
    begin
      vaCompra := TCompra(Modelo);

      EditDataCompra.EditValue := vaCompra.Data;
      EditDataCompra.PostEditValue;

      cbComprador.EditValue := vaCompra.IdPessoaComprou;
      cbComprador.PostEditValue;

      if vaCompra.IdSolicitacao <> 0 then
        dmEstoque.cdsCompraID_SOLICITACAO_COMPRA.AsInteger := vaCompra.IdSolicitacao;
    end;
end;

procedure TfrmCompra.pprCarregarDadosModeloDetail;
var
  vaItem: TItem;
begin
  inherited;
  if (ModoExecucao in [meSomenteCadastro, meSomenteEdicao]) and Assigned(Modelo) and (Modelo is TItem) then
    begin
      vaItem := TItem(Modelo);
      cbItem.EditValue := vaItem.IdItem;
      cbItem.PostEditValue;

      if vaItem.IdEspecie <> 0 then
        begin
          cbEspecie.EditValue := vaItem.IdEspecie;
          cbEspecie.PostEditValue;
        end;

      EditQtde.EditValue := vaItem.Qtde;
      EditQtde.PostEditValue;
    end;
end;

procedure TfrmCompra.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaItem then
    ipCds.ppuAddParametro(TParametros.coItem, cbItemPesquisa.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaComprador then
    ipCds.ppuAddParametro(TParametros.coComprador, cbPesquisaPessoa.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaFornecedor then
    ipCds.ppuAddParametro(TParametros.coFornecedor, cbPesquisaFornecedor.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaCodigoRastreio then
    ipCds.ppuAddParametro(TParametros.coCodigoRastreio, EditPesquisa.Text)
end;

procedure TfrmCompra.pprExecutarSalvar;
var
  vaRealizarEntradas: Boolean;
begin
  vaRealizarEntradas := false;
  if not VarIsNull(dmEstoque.cdsCompraSTATUS_ENTREGA.NewValue) then
    begin
      if dmEstoque.cdsCompraSTATUS_ENTREGA.NewValue = Ord(sepEntregue) then
        begin
          if (not VarIsNull(dmEstoque.cdsCompraSTATUS_ENTREGA.OldValue)) and
            (dmEstoque.cdsCompraSTATUS_ENTREGA.NewValue <> dmEstoque.cdsCompraSTATUS_ENTREGA.OldValue) then
            vaRealizarEntradas := True
        end;
    end;
  inherited;

  if vaRealizarEntradas then
    ppvRealizarEntradas;
end;

procedure TfrmCompra.pprValidarPesquisa;
begin
  inherited;
  if cbPesquisaPessoa.Visible and (VarIsNull(cbPesquisaPessoa.EditValue)) then
    begin
      if cbPesquisarPor.EditValue = coPesquisaComprador then
        raise TControlException.Create('Informe o comprador.', cbPesquisaPessoa);
    end;

  if cbItemPesquisa.Visible and (VarIsNull(cbItemPesquisa.EditValue)) then
    raise Exception.Create('Informe o item a ser pesquisado.');

  if cbPesquisaFornecedor.Visible and (VarIsNull(cbPesquisaFornecedor.EditValue)) then
    raise Exception.Create('Informe o fornecedor a ser pesquisado.');
end;

procedure TfrmCompra.ppuIncluir;
begin
  inherited;
  if dmEstoque.cdsCompraSTATUS_ENTREGA.isNull then
    dmEstoque.cdsCompraSTATUS_ENTREGA.AsInteger := Ord(sepACaminho);

  if dmEstoque.cdsCompraDATA.isNull then
    dmEstoque.cdsCompraDATA.AsDateTime := Now;
end;

procedure TfrmCompra.ppvGerarEntrada();
var
  vaFrmEntrada: TfrmEntrada;
  vaEntrada: TEntrada;
  vaItem: TItem;
begin
  // realizando a entrada
  vaFrmEntrada := TfrmEntrada.Create(nil);
  try
    vaEntrada := TEntrada.Create; // vai ser destruido pelo frmEntrada
    vaEntrada.Data := dmEstoque.cdsCompraDATA.AsDateTime;

    vaFrmEntrada.ppuConfigurarModoExecucao(meSomenteCadastro, vaEntrada);
    vaFrmEntrada.ppuIncluir;
    vaFrmEntrada.ppuSalvar;
    dmEstoque.cdsCompra_Item.First;
    while not dmEstoque.cdsCompra_Item.Eof do
      begin
        if dmEstoque.cdsCompra_ItemTIPO_ITEM.AsInteger = Ord(tiOutro) then
          begin
            vaItem := TItem.Create; // vai ser destruido pelo vafrmEntrada
            vaItem.IdItem := dmEstoque.cdsCompra_ItemID_ITEM.AsInteger;
            vaItem.Qtde := dmEstoque.cdsCompra_ItemQTDE.AsFloat;
            vaItem.IdItemCompra := dmEstoque.cdsCompra_ItemID.AsInteger;

            vaFrmEntrada.Modelo := vaItem;
            vaFrmEntrada.ppuIncluirDetail;
            vaFrmEntrada.ppuSalvarDetail;

          end;
        dmEstoque.cdsCompra_Item.Next;
      end;
  finally
    vaFrmEntrada.Free;
  end;
end;

procedure TfrmCompra.ppvGerarEntradaSemente();
var
  vaFrmLoteSemente: TfrmLoteSemente;
  vaLoteSemente: TLoteSemente;
begin
  // realizando a entrada de sementes
  vaFrmLoteSemente := TfrmLoteSemente.Create(nil);
  try
    dmEstoque.cdsCompra_Item.First;
    while not dmEstoque.cdsCompra_Item.Eof do
      begin
        if dmEstoque.cdsCompra_ItemTIPO_ITEM.AsInteger = Ord(tiSemente) then
          begin
            vaLoteSemente := TLoteSemente.Create; // vai ser destruido pelo vaFrmLoteSemente
            vaLoteSemente.Data := dmEstoque.cdsCompraDATA.AsDateTime;
            vaLoteSemente.IdItemCompra := dmEstoque.cdsCompra_ItemID.AsInteger;
            vaLoteSemente.IdEspecie := dmEstoque.cdsCompra_ItemID_ESPECIE.AsInteger;
            vaLoteSemente.Nome := 'Compra de Semente';
            vaLoteSemente.Qtde := dmEstoque.cdsCompra_ItemQTDE.AsFloat;
            vaLoteSemente.IdPessoaColetouComprou := dmEstoque.cdsCompraID_PESSOA_COMPROU.AsInteger;

            vaFrmLoteSemente.ppuConfigurarModoExecucao(meSomenteCadastro, vaLoteSemente);
            vaFrmLoteSemente.ppuIncluir;
            vaFrmLoteSemente.ppuSalvar;

          end;
        dmEstoque.cdsCompra_Item.Next;
      end;
  finally
    vaFrmLoteSemente.Free;
  end;
end;

procedure TfrmCompra.ppvGerarEntradaMuda();
var
  vaFrmLoteMuda: TfrmLoteMuda;
  vaLoteMuda: TLoteMuda;
begin
  // realizando a entrada de muda
  vaFrmLoteMuda := TfrmLoteMuda.Create(nil);
  try
    dmEstoque.cdsCompra_Item.First;
    while not dmEstoque.cdsCompra_Item.Eof do
      begin
        if dmEstoque.cdsCompra_ItemTIPO_ITEM.AsInteger = Ord(tiMuda) then
          begin
            vaLoteMuda := TLoteMuda.Create;
            vaLoteMuda.Data := dmEstoque.cdsCompraDATA.AsDateTime;
            vaLoteMuda.IdItemCompra := dmEstoque.cdsCompra_ItemID.AsInteger;
            vaLoteMuda.IdEspecie := dmEstoque.cdsCompra_ItemID_ESPECIE.AsInteger;
            vaLoteMuda.Nome := 'Compra de Muda';
            vaLoteMuda.Qtde := dmEstoque.cdsCompra_ItemQTDE.AsFloat;
            vaLoteMuda.QtdeClassificada := dmEstoque.cdsCompra_ItemQTDE.AsInteger;

            vaFrmLoteMuda.ppuConfigurarModoExecucao(meSomenteCadastro, vaLoteMuda);
            vaFrmLoteMuda.ppuIncluir;
            vaFrmLoteMuda.ppuSalvar;

          end;
        dmEstoque.cdsCompra_Item.Next;
      end;
  finally
    vaFrmLoteMuda.Free;
  end;
end;

procedure TfrmCompra.viewRegistrosSTATUS_ENTREGACustomDrawCell(
  Sender: TcxCustomGridTableView;
  ACanvas:
  TcxCanvas;
  AViewInfo:
  TcxGridTableDataCellViewInfo;
  var
  ADone:
  Boolean);
begin
  inherited;
  // if AViewInfo.GridRecord.Values[viewRegistrosDetailSTATUS.Index] = 1 then
  // begin
  // ACanvas.Font.Color := clWhite;
  // if AViewInfo.GridRecord.Selected then
  // ACanvas.Brush.Color := $00274F00
  // else
  // ACanvas.Brush.Color := clGreen;
  // end
  // else if AViewInfo.GridRecord.Values[viewRegistrosDetailVENCIMENTO.Index] < Today then
  // begin
  // ACanvas.Font.Color := clWhite;
  // if AViewInfo.GridRecord.Selected then
  // ACanvas.Brush.Color := clMaroon
  // else
  // ACanvas.Brush.Color := clRed;
  // end;
end;

{ TCompra }

procedure TCompra.SetData(
  const
  Value:
  TDateTime);
begin
  FData := Value;
end;

procedure TCompra.SetIdPessoaComprou(
  const
  Value:
  Integer);
begin
  FIdPessoaComprou := Value;
end;

procedure TCompra.SetIdSolicitacao(
  const
  Value:
  Integer);
begin
  FIdSolicitacao := Value;
end;

end.
