unit fVenda;

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
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuEstoque, dmuLookup, cxMemo,
  cxDBEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalc,
  cxCurrencyEdit, uTypes, System.DateUtils, uClientDataSet, uControleAcesso,
  System.TypInfo, uExceptions, dmuPrincipal, uMensagem, fSaida,
  System.RegularExpressions, fConta_Receber, Vcl.ExtDlgs, fPessoa, ppPrnabl,
  ppClass, ppCtrls, ppBands, ppCache, ppDB, ppDesignLayer, ppParameter, ppProd,
  ppReport, ppComm, ppRelatv, ppDBPipe, ppVar, ppModule, raCodMod, ppUtils;

type
  TfrmVenda = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_CLIENTE: TcxGridDBColumn;
    viewRegistrosID_PESSOA_VENDEU: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosDESCRICAO: TcxGridDBColumn;
    viewRegistrosCLIENTE: TcxGridDBColumn;
    viewRegistrosVENDEDOR: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_VENDA: TcxGridDBColumn;
    viewRegistrosDetailID_ITEM: TcxGridDBColumn;
    viewRegistrosDetailID_ESPECIE: TcxGridDBColumn;
    viewRegistrosDetailVALOR_UNITARIO: TcxGridDBColumn;
    viewRegistrosDetailITEM: TcxGridDBColumn;
    viewRegistrosDetailESPECIE: TcxGridDBColumn;
    viewRegistrosVALOR_TOTAL: TcxGridDBColumn;
    lbl5: TLabel;
    cbCliente: TcxDBLookupComboBox;
    lbl1: TLabel;
    cbVendedor: TcxDBLookupComboBox;
    lbl2: TLabel;
    EditDataVenda: TcxDBDateEdit;
    lbl4: TLabel;
    EditDescricao: TcxDBMemo;
    Label4: TLabel;
    cbItem: TcxDBLookupComboBox;
    lbl6: TLabel;
    EditValorUnitario: TcxDBCurrencyEdit;
    EditQtde: TcxDBCalcEdit;
    Label7: TLabel;
    lbUnidade: TLabel;
    cbPesquisaCliente: TcxLookupComboBox;
    cbItemPesquisa: TcxLookupComboBox;
    cbPesquisaPessoa: TcxLookupComboBox;
    pnEspecieLotes: TPanel;
    pnLoteSemente: TPanel;
    lb1: TLabel;
    cbLoteSemente: TcxDBLookupComboBox;
    pnLoteMuda: TPanel;
    Label3: TLabel;
    cbLoteMuda: TcxDBLookupComboBox;
    pnEspecie: TPanel;
    lb2: TLabel;
    cbEspecie: TcxDBLookupComboBox;
    btnGerarContaReceber: TButton;
    btnGerarSaida: TButton;
    Ac_Gerar_Conta_Receber: TAction;
    Ac_Gerar_Saida: TAction;
    viewRegistrosDetailID_LOTE_SEMENTE: TcxGridDBColumn;
    viewRegistrosDetailLOTE_SEMENTE: TcxGridDBColumn;
    viewRegistrosDetailID_LOTE_MUDA: TcxGridDBColumn;
    viewRegistrosDetailLOTE_MUDA: TcxGridDBColumn;
    viewRegistrosDetailUNIDADE: TcxGridDBColumn;
    viewRegistrosDetailCALC_QTDE: TcxGridDBColumn;
    btnAdicionarCliente: TButton;
    Ac_Adicionar_Cliente: TAction;
    viewRegistrosDetailCALC_VALOR_TOTAL: TcxGridDBColumn;
    ColumnImprimirRecibo: TcxGridDBColumn;
    Ac_Imprimir_Recibo: TAction;
    DBPipeVenda: TppDBPipeline;
    DBPipeVenda_Item: TppDBPipeline;
    ppRecibo: TppReport;
    ppParameterList1: TppParameterList;
    DBPipeOrganizacao: TppDBPipeline;
    viewRegistrosSAIU_ESTOQUE: TcxGridDBColumn;
    viewRegistrosGEROU_CONTA_RECEBER: TcxGridDBColumn;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppEditValorDescricao: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine16: TppLine;
    ppDBImage2: TppDBImage;
    ppDBImage1: TppDBImage;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine15: TppLine;
    ppLine17: TppLine;
    ppLine5: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppFooterBand1: TppFooterBand;
    ppShape1: TppShape;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel6: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppDBText14: TppDBText;
    ppLine6: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel7: TppLabel;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine28: TppLine;
    ppLine33: TppLine;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppEditValorTotal: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    procedure cbItemPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ac_Gerar_SaidaExecute(Sender: TObject);
    procedure Ac_Gerar_Conta_ReceberExecute(Sender: TObject);
    procedure cbEspeciePropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Adicionar_ClienteExecute(Sender: TObject);
    procedure cbClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Imprimir_ReciboExecute(Sender: TObject);
    procedure viewRegistrosGEROU_CONTA_RECEBERCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure Ac_Gerar_Conta_ReceberUpdate(Sender: TObject);
    procedure Ac_Gerar_SaidaUpdate(Sender: TObject);
    procedure ppReciboAfterPrint(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
    procedure ppvConfigurarEdits;
    procedure ppvCarregarLotes;
    procedure ppvExcluirItensSaida(ipIds: TArray<Integer>);
    procedure ppvGerarContaReceber;
    procedure ppvGerarSaida;
    procedure ppvCarregarPrecoPadrao;
    procedure ppvAdicionarCliente;
    procedure ppvCarregarClientes;

  protected
    function fprConfigurarControlesPesquisa: TWinControl; override;
    function fprGetPermissao: string; override;
    procedure pprBeforeSalvarDetail; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprValidarPesquisa; override;

    procedure pprBeforeExcluirDetail(ipId: Integer); override;
    procedure pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela); override;

    procedure pprValidarDadosDetail; override;

  public
    procedure ppuIncluir; override;
    procedure ppuIncluirDetail; override;
    procedure ppuAlterarDetail(ipId: Integer); override;
  public const
    coPesquisaItem = 7;
    coPesquisaVendedor = 5;
    coPesquisaCliente = 6;
  end;

var
  frmVenda: TfrmVenda;

implementation

uses
  fCliente;

{$R *.dfm}


function TfrmVenda.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estVenda));
end;

procedure TfrmVenda.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaItem then
    ipCds.ppuAddParametro(TParametros.coItem, cbItemPesquisa.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaVendedor then
    ipCds.ppuAddParametro(TParametros.coVendedor, cbPesquisaPessoa.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaCliente then
    ipCds.ppuAddParametro(TParametros.coFornecedor, cbPesquisaCliente.EditValue);
end;

procedure TfrmVenda.ppReciboAfterPrint(Sender: TObject);
begin
  inherited;
  ppEditValorDescricao.Left := ppEditValorTotal.Left + ppEditValorTotal.Width + 5;
end;

procedure TfrmVenda.pprValidarDadosDetail;
begin
  inherited;
  if dmLookup.cdslkItem.Locate(TBancoDados.coId, cbItem.EditValue, []) then
    begin
      if (dmLookup.cdslkItemTIPO.AsInteger in [Ord(tiSemente), Ord(tiMuda)]) and VarIsNull(cbEspecie.EditValue) then
        raise TControlException.Create('Informe a espécie.', cbEspecie);

      if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente) then
        begin
          if VarIsNull(cbLoteSemente.EditValue) then
            raise TControlException.Create('Informe o lote de semente.', cbLoteSemente);

          if dmLookup.cdslkLote_Semente.Locate(TBancoDados.coId, cbLoteSemente.EditValue, []) then
            begin
              if dmLookup.cdslkLote_SementeQTDE_ARMAZENADA.AsFloat < dmEstoque.cdsVenda_ItemQTDE.AsFloat then
                raise Exception.Create('O lote informado não possui saldo suficiente.');

            end;
        end;

      if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda) then
        begin
          if VarIsNull(cbLoteMuda.EditValue) then
            raise TControlException.Create('Informe o lote de muda.', cbLoteMuda);

          if dmLookup.cdslkLote_Muda.Locate(TBancoDados.coId, cbLoteMuda.EditValue, []) then
            begin
              if dmLookup.cdslkLote_MudaSALDO.AsInteger < dmEstoque.cdsVenda_ItemQTDE.AsInteger then
                raise Exception.Create('O lote informado não possui saldo suficiente.');

            end;
        end;
    end;
end;

procedure TfrmVenda.pprValidarPesquisa;
begin
  inherited;
  if cbPesquisaPessoa.Visible and (VarIsNull(cbPesquisaPessoa.EditValue)) then
    begin
      if cbPesquisarPor.EditValue = coPesquisaVendedor then
        raise TControlException.Create('Informe o vendedor.', cbPesquisaPessoa);
    end;

  if cbItemPesquisa.Visible and (VarIsNull(cbItemPesquisa.EditValue)) then
    raise Exception.Create('Informe o item a ser pesquisado.');

  if cbPesquisaCliente.Visible and (VarIsNull(cbPesquisaCliente.EditValue)) then
    raise Exception.Create('Informe o cliente a ser pesquisado.');
end;

procedure TfrmVenda.pprBeforeExcluir(ipId: Integer; ipAcao: TAcaoTela);
var
  vaIdsExcluir: String;
  vaIdsString: TArray<String>;
  vaIds: TArray<Integer>;
  i: Integer;
begin
  inherited;
  vaIdsExcluir := dmPrincipal.FuncoesEstoque.fpuBuscarItensSaida(ipId);
  if vaIdsExcluir <> '' then
    begin
      if TMensagem.fpuPerguntar('Existem itens de uma saida vinculados a esta venda. Deseja excluí-los também?', ppSimNao) = rpSim then
        begin
          vaIdsString := TRegex.Split(vaIdsExcluir, coDelimitadorPadrao);
          SetLength(vaIds, length(vaIdsString));
          for i := 0 to High(vaIdsString) do
            vaIds[i] := vaIdsString[i].ToInteger;

          ppvExcluirItensSaida(vaIds);
        end;
    end;
end;

procedure TfrmVenda.pprBeforeExcluirDetail(ipId: Integer);
var
  vaIdExcluir: Integer;
begin
  inherited;
  vaIdExcluir := dmPrincipal.FuncoesEstoque.fpuBuscarItemSaida(ipId);
  if vaIdExcluir <> 0 then
    begin
      if TMensagem.fpuPerguntar('Existe um item de uma saída vinculado a esta venda. Deseja excluí-lo também?', ppSimNao) = rpSim then
        ppvExcluirItensSaida([vaIdExcluir]);
    end;
end;

procedure TfrmVenda.ppvExcluirItensSaida(ipIds: TArray<Integer>);
var
  vaFrmSaida: TfrmSaida;
begin
  vaFrmSaida := TfrmSaida.Create(nil);
  try
    vaFrmSaida.ModoSilencioso := True;
    vaFrmSaida.ppuConfigurarPesquisa(TfrmSaida.coPesquisaVenda, dmEstoque.cdsVendaID.AsString);
    vaFrmSaida.ppuPesquisar;

    // ja exclui a saida tbm caso nao exista mais itens
    vaFrmSaida.fpuExcluirDetail(ipIds);
  finally
    vaFrmSaida.Free;
  end;
end;

procedure TfrmVenda.pprBeforeSalvarDetail;
begin
  inherited;
  // vamos garantir que somente itens do tipo smente e muda vao estar vinculados a uma especie
  if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiOutro) then
    dmEstoque.cdsVenda_ItemID_ESPECIE.Clear;
end;

function TfrmVenda.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaPessoa.Visible := (cbPesquisarPor.EditValue = coPesquisaVendedor);
  cbItemPesquisa.Visible := cbPesquisarPor.EditValue = coPesquisaItem;
  cbPesquisaCliente.Visible := cbPesquisarPor.EditValue = coPesquisaCliente;

  EditPesquisa.Visible := EditPesquisa.Visible and (not(cbItemPesquisa.Visible or cbPesquisaPessoa.Visible or cbPesquisaCliente.Visible));

  if cbPesquisaPessoa.Visible then
    Result := cbPesquisaPessoa
  else if cbItemPesquisa.Visible then
    Result := cbItemPesquisa
  else if cbPesquisaCliente.Visible then
    Result := cbPesquisaCliente;
end;

procedure TfrmVenda.Ac_Adicionar_ClienteExecute(Sender: TObject);
begin
  inherited;
  ppvAdicionarCliente;
end;

procedure TfrmVenda.ppvAdicionarCliente;
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

procedure TfrmVenda.Ac_Gerar_Conta_ReceberExecute(Sender: TObject);
begin
  inherited;
  ppvGerarContaReceber;
end;

procedure TfrmVenda.Ac_Gerar_Conta_ReceberUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterar and (dmEstoque.cdsVendaGEROU_CONTA_RECEBER.AsInteger = 0);
end;

procedure TfrmVenda.ppvGerarContaReceber();
var
  vaContaGerada: Boolean;
  vaPergunta: string;
  vaFrmContaReceber: TfrmContaReceber;
  vaContaReceber: TContaReceber;
  vaAutoApply: Boolean;
begin
  vaContaGerada := dmPrincipal.FuncoesEstoque.fpuVerificarContaReceberJaGerada(dmEstoque.cdsVendaID.AsInteger);
  if vaContaGerada then
    vaPergunta := 'Já existe uma conta a receber para esta venda. Tem certeza que deseja gerar outra?'
  else
    vaPergunta := 'Deseja gerar uma conta a receber para esta venda?';

  if TMensagem.fpuPerguntar(vaPergunta, ppSimNao) = rpSim then
    begin
      vaFrmContaReceber := TfrmContaReceber.Create(nil);
      try
        vaContaReceber := TContaReceber.Create;
        vaContaReceber.IdCliente := dmEstoque.cdsVendaID_CLIENTE.AsInteger;
        vaContaReceber.IdVenda := dmEstoque.cdsVendaID.AsInteger;
        vaContaReceber.ValorTotal := dmEstoque.cdsVendaVALOR_TOTAL.AsFloat;

        vaFrmContaReceber.ppuConfigurarModoExecucao(meSomenteCadastro, vaContaReceber);
        vaFrmContaReceber.ShowModal;

        if vaFrmContaReceber.IdEscolhido <> 0 then
          begin
            TMensagem.ppuShowMessage('Conta a Receber gerada com sucesso.');
            vaAutoApply := dmEstoque.cdsVenda.RFApplyAutomatico;
            dmEstoque.cdsVenda.RFApplyAutomatico := false;
            try
              dmEstoque.cdsVenda.Edit;
              dmEstoque.cdsVendaGEROU_CONTA_RECEBER.AsInteger := 1;
              dmEstoque.cdsVenda.Post;
              dmEstoque.cdsVenda.MergeChangeLog;
            finally
              dmEstoque.cdsVenda.RFApplyAutomatico := vaAutoApply;
            end;
          end;
      finally
        vaFrmContaReceber.Free;
      end;
    end;
end;

procedure TfrmVenda.Ac_Gerar_SaidaExecute(Sender: TObject);
begin
  if TMensagem.fpuPerguntar('Tem certeza que deseja gerar uma saída para esta venda?', ppSimNao) = rpSim then
    ppvGerarSaida;
end;

procedure TfrmVenda.Ac_Gerar_SaidaUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterar and (dmEstoque.cdsVendaSAIU_ESTOQUE.AsInteger = 0);
end;

procedure TfrmVenda.Ac_Imprimir_ReciboExecute(Sender: TObject);
begin
  inherited;
  if not dmLookup.cdslkOrganizacao.Active then
    dmLookup.cdslkOrganizacao.Open;

  // Precisa desabilitar os controles pq senao da um erro de parameter incorrect ao desenhar o cxGrid
  dmEstoque.cdsVenda.DisableControls;
  dmEstoque.cdsVenda_Item.DisableControls;
  try
    //tive que fazer essa gabi do caralho so pra conseguir colocar um apos o outro
    ppEditValorDescricao.Left := ppEditValorTotal.Left + ppUtils.ppGetSpTextWidth(ppEditValorTotal.Font,FormatFloat('$ ,0.00',dmEstoque.cdsVendaVALOR_TOTAL.AsFloat))+12; //FormatFloat('$ ,0.00',dmEstoque.cdsVendaVALOR_TOTAL.AsFloat).Length * 8;
    ppRecibo.PrintReport;
  finally
    dmEstoque.cdsVenda.EnableControls;
    dmEstoque.cdsVenda_Item.EnableControls;
  end;
end;

procedure TfrmVenda.ppvGerarSaida;
var
  vaFrmSaida: TfrmSaida;
  vaSaida: TSaida;
  vaItem: TItem;
  vaAutoApply: Boolean;
begin
  inherited;
  if dmPrincipal.FuncoesEstoque.fpuBuscarItensSaida(dmEstoque.cdsVendaID.AsInteger) = '' then
    begin
      vaFrmSaida := TfrmSaida.Create(nil);
      try
        try
          vaFrmSaida.ModoSilencioso := True;
          vaSaida := TSaida.Create;
          vaSaida.Data := dmEstoque.cdsVendaDATA.AsDateTime;
          vaSaida.Tipo := tsVenda;

          vaFrmSaida.ppuConfigurarModoExecucao(meSomenteCadastro, vaSaida);
          vaFrmSaida.ppuIncluir;
          vaFrmSaida.ppuSalvar;
        except
          on e: Exception do
            begin
              TMensagem.ppuShowException('Não foi possível gerar a saída desta venda.', e);
              Exit;
            end;
        end;

        try
          dmEstoque.cdsVenda_Item.First;
          while not dmEstoque.cdsVenda_Item.eof do
            begin
              vaItem := TItem.Create;
              vaItem.Id := dmEstoque.cdsVenda_ItemID_ITEM.AsInteger;
              vaItem.IdEspecie := dmEstoque.cdsVenda_ItemID_ESPECIE.AsInteger;
              vaItem.IdLoteMuda := dmEstoque.cdsVenda_ItemID_LOTE_MUDA.AsInteger;
              vaItem.IdLoteSemente := dmEstoque.cdsVenda_ItemID_LOTE_SEMENTE.AsInteger;
              vaItem.IdItemCompraVenda := dmEstoque.cdsVenda_ItemID.AsInteger;
              vaItem.Qtde := dmEstoque.cdsVenda_ItemQTDE.AsFloat;

              vaFrmSaida.Modelo := vaItem;
              vaFrmSaida.ppuIncluirDetail;
              vaFrmSaida.ppuSalvarDetail;

              dmEstoque.cdsVenda_Item.Next;
            end;
        except
          on e: Exception do
            begin
              TMensagem.ppuShowException('Houve um erro ao incluir os itens da saída. Será necessário inclui-los manualmente.', e);
              Exit;
            end;
        end;

        TMensagem.ppuShowMessage('Saída gerada com sucesso.');

        vaAutoApply := dmEstoque.cdsVenda.RFApplyAutomatico;
        dmEstoque.cdsVenda.RFApplyAutomatico := false;
        try
          dmEstoque.cdsVenda.Edit;
          dmEstoque.cdsVendaSAIU_ESTOQUE.AsInteger := 1;
          dmEstoque.cdsVenda.Post;
          dmEstoque.cdsVenda.MergeChangeLog;
        finally
          dmEstoque.cdsVenda.RFApplyAutomatico := vaAutoApply;
        end;

      finally
        vaFrmSaida.Free;
      end;
    end
  else
    raise Exception.Create('Já existe itens de saídas vinculados a esta venda.');

end;

procedure TfrmVenda.viewRegistrosGEROU_CONTA_RECEBERCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.Value = 0 then
    begin
      ACanvas.Font.Color := clWhite;
      if AViewInfo.GridRecord.Selected then
        ACanvas.Brush.Color := clMaroon
      else
        ACanvas.Brush.Color := clRed;
    end
  else
    begin
      ACanvas.Font.Color := clWhite;
      ACanvas.Brush.Color := clGreen;
    end;
end;

procedure TfrmVenda.cbClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarCliente;
end;

procedure TfrmVenda.cbEspeciePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    begin
      ppvCarregarLotes;
      ppvCarregarPrecoPadrao;
    end;
end;

procedure TfrmVenda.ppvCarregarPrecoPadrao;
begin
  if dmEstoque.cdsVenda_Item.State in [dsEdit, dsInsert] then
    begin
      if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente) then
        dmEstoque.cdsVenda_ItemVALOR_UNITARIO.AsFloat := dmLookup.cdslkEspecieVALOR_KG_SEMENTE.AsFloat
      else if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda) then
        dmEstoque.cdsVenda_ItemVALOR_UNITARIO.AsFloat := dmLookup.cdslkEspecieVALOR_MUDA.AsFloat;
    end;
end;

procedure TfrmVenda.cbItemPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastroDetail then
    begin
      ppvConfigurarEdits;
      ppvCarregarPrecoPadrao;
    end;
end;

procedure TfrmVenda.ppvCarregarLotes;
const
  coAberto = 0;
begin
  if (not VarIsNull(cbEspecie.EditValue)) and dmLookup.cdslkEspecie.Locate(TBancoDados.coId, cbEspecie.EditValue, []) then
    begin
      if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente) then
        begin
          if (not dmLookup.cdslkLote_Semente.Active) or (dmLookup.cdslkLote_SementeID_ESPECIE.AsInteger <> cbEspecie.EditValue) then
            begin
              dmLookup.cdslkLote_Semente.ppuDataRequest([TParametros.coEspecie, TParametros.coStatus, TParametros.coPossuiEstoque],
                [cbEspecie.EditValue, coAberto, True], TOperadores.coAnd, True);
            end;
        end
      else if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda) then
        begin
          if (not dmLookup.cdslkLote_Muda.Active) or (dmLookup.cdslkLote_MudaID_ESPECIE.AsInteger <> cbEspecie.EditValue) then
            begin
              dmLookup.cdslkLote_Muda.ppuDataRequest([TParametros.coEspecie, TParametros.coPossuiEstoque],
                [cbEspecie.EditValue, True], TOperadores.coAnd, True);
            end;
        end;
    end
  else
    begin
      dmLookup.cdslkLote_Semente.Close;
      dmLookup.cdslkLote_Muda.Close;
    end;
end;

procedure TfrmVenda.ppuAlterarDetail(ipId: Integer);
begin
  inherited;
  ppvConfigurarEdits;
  ppvCarregarLotes;
end;

procedure TfrmVenda.ppuIncluir;
begin
  inherited;
  dmEstoque.cdsVendaDATA.AsDateTime := StrToDateTime(dmPrincipal.FuncoesGeral.fpuDataHoraAtual);
  dmEstoque.cdsVendaID_PESSOA_VENDEU.AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
end;

procedure TfrmVenda.ppuIncluirDetail;
begin
  inherited;
  ppvConfigurarEdits;
  ppvCarregarLotes;
end;

procedure TfrmVenda.ppvConfigurarEdits;
var
  vaVisivel: Boolean;
begin
  vaVisivel := (not VarIsNull(cbItem.EditValue));
  if vaVisivel then
    begin
      vaVisivel := dmLookup.cdslkItem.Locate(TBancoDados.coId, cbItem.EditValue, []) and
        (dmLookup.cdslkItemTIPO.AsInteger in [Ord(tiSemente), Ord(tiMuda)]);

      pnLoteSemente.Visible := dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente);
      pnLoteMuda.Visible := dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda);
      pnEspecieLotes.Visible := vaVisivel;

      lbUnidade.Caption := dmLookup.cdslkItemUNIDADE.AsString;
    end;
end;

procedure TfrmVenda.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';
  inherited;

  PesquisaPadrao := Ord(tppData);
  EditDataInicialPesquisa.Date := IncDay(Now, -7);;
  EditDataFinalPesquisa.Date := IncDay(Now, 7);

  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);
  dmLookup.cdslkItem.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);

  ppvCarregarClientes;
end;

procedure TfrmVenda.ppvCarregarClientes;
begin
  dmLookup.cdslkFin_For_Cli.ppuDataRequest([TParametros.coTipo], [Ord(tfCliente)], TOperadores.coAnd, True);
end;

end.
