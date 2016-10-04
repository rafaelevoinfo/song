unit fMix_Muda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrudMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, Vcl.ExtDlgs, System.Actions,
  Vcl.ActnList, cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuViveiro, dmuLookup,
  dmuPrincipal, cxCalc, cxDBEdit, cxMemo, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Datasnap.DBClient, fmGrids, uUtils, System.TypInfo,
  uControleAcesso, uClientDataSet, uTypes, uExceptions, fSaida, uMensagem,
  fVenda, ppParameter, ppDesignLayer, ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppVar, ppCtrls, ppPrnabl, ppBands, ppCache,
  Vcl.Menus, ppStrtch, ppSubRpt;

type
  TfrmMixMuda = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_CLIENTE: TcxGridDBColumn;
    viewRegistrosCLIENTE: TcxGridDBColumn;
    viewRegistrosID_PESSOA_RESPONSAVEL: TcxGridDBColumn;
    viewRegistrosRESPONSAVEL: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosQTDE_MUDA: TcxGridDBColumn;
    viewRegistrosQTDE_MUDA_ROCAMBOLE: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_ESPECIE: TcxGridDBColumn;
    viewRegistrosDetailESPECIE: TcxGridDBColumn;
    viewRegistrosDetailNOME_CIENTIFICO: TcxGridDBColumn;
    lbl5: TLabel;
    cbCliente: TcxDBLookupComboBox;
    btnAdicionarCliente: TButton;
    lbl1: TLabel;
    cbResponsavel: TcxDBLookupComboBox;
    EditData: TcxDBDateEdit;
    lbl2: TLabel;
    lbl4: TLabel;
    EditDescricao: TcxDBMemo;
    Ac_Adicionar_Cliente: TAction;
    Label3: TLabel;
    EditQtde: TcxDBCalcEdit;
    Label4: TLabel;
    EditQtdeRocambole: TcxDBCalcEdit;
    pnEditsCadastroSuperior: TPanel;
    frameGrids: TframeGrids;
    cdsLocalEspecie: TClientDataSet;
    cdsLocalEspecieID: TIntegerField;
    cdsLocalEspecieNOME: TStringField;
    btnGerarVenda: TButton;
    Ac_Gerar_Venda: TAction;
    btnGerarSaida: TButton;
    Ac_Gerar_Saida: TAction;
    cdsLocalEspecieQTDE_MUDA_PRONTA: TIntegerField;
    dsMix_Muda_Especie_Lote: TDataSource;
    cxGrid1: TcxGrid;
    viewLotes: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    viewLotesID: TcxGridDBColumn;
    viewLotesID_LOTE_MUDA: TcxGridDBColumn;
    viewLotesLOTE: TcxGridDBColumn;
    viewLotesCANTEIROS: TcxGridDBColumn;
    Label5: TLabel;
    viewRegistrosID_VENDA: TcxGridDBColumn;
    viewRegistrosID_SAIDA: TcxGridDBColumn;
    ColumnSaidaVenda: TcxGridDBColumn;
    viewLotesQTDE: TcxGridDBColumn;
    btnImprimir: TButton;
    Ac_Imprimir: TAction;
    DBPipeOrganizacao: TppDBPipeline;
    ppMudas: TppReport;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage7: TppDBImage;
    ppLbTituloLoteMudaVendida: TppLabel;
    ppDBImage1: TppDBImage;
    DBPipeLotesCanteiro: TppDBPipeline;
    dsMix_Muda_Especie_Lote_Canteiro: TDataSource;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppShape1: TppShape;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppLabel13: TppLabel;
    ppDBText15: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    DBPipeRocamboles: TppDBPipeline;
    dsQtdeMudaRocambole: TDataSource;
    cdsQtdeMudaRocambole: TClientDataSet;
    cdsQtdeMudaRocamboleID: TIntegerField;
    cdsQtdeMudaRocamboleNOME: TStringField;
    cdsQtdeMudaRocamboleID_ESPECIE: TIntegerField;
    cdsQtdeMudaRocamboleESPECIE: TStringField;
    cdsQtdeMudaRocamboleQTDE: TIntegerField;
    ppSummaryBand1: TppSummaryBand;
    ppSubReportRocambole: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel4: TppLabel;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppColumnFooterBand1: TppColumnFooterBand;
    procedure FormCreate(Sender: TObject);
    procedure Ac_Gerar_SaidaUpdate(Sender: TObject);
    procedure EditQtdePropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Gerar_SaidaExecute(Sender: TObject);
    procedure ColumnSaidaVendaGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: string);
    procedure ColumnSaidaVendaCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure Ac_Gerar_VendaExecute(Sender: TObject);
    procedure Ac_ImprimirExecute(Sender: TObject);
    procedure Ac_ImprimirUpdate(Sender: TObject);
  private
    FIdItemMuda: integer;
    FCalcularQuantidades: Boolean;
    dmLookup: TdmLookup;
    dmViveiro: TdmViveiro;
    procedure ppvConfigurarGrids;
    procedure ppvCarregarClientes;
    procedure ppvConfigurarEdits;
    procedure ppvIncluirEspecieCdsLocal;
    procedure ppvCarregarEspeciesAndSaldos;
    { Private declarations }
  protected
    procedure pprEfetuarPesquisa; override;
    function fprHabilitarAlterarDetail: Boolean; override;

    procedure pprValidarDados; override;
    procedure pprAfterSalvar(ipAcaoExecutada: TDataSetState); override;

    function fprGetPermissao: String; override;

    procedure pprExecutarCancelar; override;
  public
    procedure ppuIncluir; override;
    procedure ppuAlterar(ipId: integer); override;
  end;

var
  frmMixMuda: TfrmMixMuda;

implementation

{$R *.dfm}

{ TfrmMixMuda }

procedure TfrmMixMuda.Ac_Gerar_SaidaExecute(Sender: TObject);
var
  vaFrmSaida: TfrmSaida;
  vaSaida: TSaida;
  vaItem: TItem;
begin
  inherited;
  if (dmViveiro.cdsMix_MudaID_VENDA.IsNull and dmViveiro.cdsMix_MudaID_SAIDA.IsNull) then
    begin
      vaFrmSaida := TfrmSaida.Create(nil);
      try
        try
          vaFrmSaida.ModoSilencioso := True;
          vaSaida := TSaida.Create;
          vaSaida.Data := dmViveiro.cdsMix_MudaDATA.AsDateTime;
          vaSaida.Tipo := tsPlantio;

          vaFrmSaida.ppuConfigurarModoExecucao(meSomenteCadastro, vaSaida);
          vaFrmSaida.ppuIncluir;
          vaFrmSaida.ppuSalvar;
        except
          on e: Exception do
            begin
              TMensagem.ppuShowException('Não foi possível gerar a saída deste mix.', e);
              Exit;
            end;
        end;

        try
          dmViveiro.cdsMix_Muda_Especie.First;
          while not dmViveiro.cdsMix_Muda_Especie.eof do
            begin
              dmViveiro.cdsMix_Muda_Especie_Lote.First;
              while not dmViveiro.cdsMix_Muda_Especie_Lote.eof do
                begin
                  vaItem := TItem.Create;
                  vaItem.Id := FIdItemMuda;
                  vaItem.IdEspecie := dmViveiro.cdsMix_Muda_EspecieID_ESPECIE.AsInteger;
                  vaItem.IdLoteMuda := dmViveiro.cdsMix_Muda_Especie_LoteID_LOTE_MUDA.AsInteger;
                  vaItem.Qtde := dmViveiro.cdsMix_Muda_Especie_LoteQTDE.AsInteger;

                  vaFrmSaida.Modelo := vaItem;
                  vaFrmSaida.ppuIncluirDetail;
                  vaFrmSaida.ppuSalvarDetail;

                  dmViveiro.cdsMix_Muda_Especie_Lote.Next;
                end;

              dmViveiro.cdsMix_Muda_Especie.Next;
            end;
        except
          on e: Exception do
            begin
              TMensagem.ppuShowException('Houve um erro ao incluir os itens da saída. Será necessário inclui-los manualmente.', e);
              Exit;
            end;
        end;

        dmViveiro.cdsMix_Muda.Edit;
        dmViveiro.cdsMix_MudaID_SAIDA.AsInteger := vaFrmSaida.IdEscolhido;
        dmViveiro.cdsMix_Muda.Post;

        TMensagem.ppuShowMessage('Saída gerada com sucesso.');

      finally
        vaFrmSaida.Free;
      end;
    end
  else
    raise Exception.Create('Já existe uma venda ou saída vinculada a este mix.');

end;

procedure TfrmMixMuda.Ac_Gerar_SaidaUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterar and (dmViveiro.cdsMix_MudaID_VENDA.IsNull) and (dmViveiro.cdsMix_MudaID_SAIDA.IsNull);
end;

procedure TfrmMixMuda.Ac_Gerar_VendaExecute(Sender: TObject);
var
  vaFrmVenda: TfrmVenda;
  vaVenda: TVenda;
  vaItem: TItem;
begin
  inherited;
  if (dmViveiro.cdsMix_MudaID_VENDA.IsNull and dmViveiro.cdsMix_MudaID_SAIDA.IsNull) then
    begin
      vaFrmVenda := TfrmVenda.Create(nil);
      try
        try
          vaFrmVenda.ModoSilencioso := True;
          vaVenda := TVenda.Create;
          vaVenda.Data := dmViveiro.cdsMix_MudaDATA.AsDateTime;
          vaVenda.IdCliente := dmViveiro.cdsMix_MudaID_CLIENTE.AsInteger;
          vaVenda.IdVendedor := dmViveiro.cdsMix_MudaID_PESSOA_RESPONSAVEL.AsInteger;

          vaFrmVenda.ppuConfigurarModoExecucao(meSomenteCadastro, vaVenda);
          vaFrmVenda.ppuIncluir;
          vaFrmVenda.ppuSalvar;
        except
          on e: Exception do
            begin
              TMensagem.ppuShowException('Não foi possível gerar a venda deste mix.', e);
              Exit;
            end;
        end;

        try
          dmViveiro.cdsMix_Muda_Especie.First;
          while not dmViveiro.cdsMix_Muda_Especie.eof do
            begin
              dmViveiro.cdsMix_Muda_Especie_Lote.First;
              while not dmViveiro.cdsMix_Muda_Especie_Lote.eof do
                begin
                  vaItem := TItem.Create;
                  vaItem.Id := FIdItemMuda;
                  vaItem.IdEspecie := dmViveiro.cdsMix_Muda_EspecieID_ESPECIE.AsInteger;
                  vaItem.IdLoteMuda := dmViveiro.cdsMix_Muda_Especie_LoteID_LOTE_MUDA.AsInteger;
                  vaItem.Qtde := dmViveiro.cdsMix_Muda_Especie_LoteQTDE.AsInteger;
                  if dmLookup.cdslkEspecie.Locate(TBancoDados.coId, vaItem.IdEspecie, []) then
                    vaItem.ValorUnitario := dmLookup.cdslkEspecieVALOR_MUDA.AsFloat;

                  vaFrmVenda.Modelo := vaItem;
                  vaFrmVenda.ppuIncluirDetail;
                  // se nao tiver valor configurado irei abrir a tela para o usuario informar
                  if vaItem.ValorUnitario = 0 then
                    vaFrmVenda.ShowModal
                  else
                    vaFrmVenda.ppuSalvarDetail;

                  dmViveiro.cdsMix_Muda_Especie_Lote.Next;
                end;

              dmViveiro.cdsMix_Muda_Especie.Next;
            end;
        except
          on e: Exception do
            begin
              TMensagem.ppuShowException('Houve um erro ao incluir os itens da saída. Será necessário inclui-los manualmente.', e);
              Exit;
            end;
        end;

        dmViveiro.cdsMix_Muda.Edit;
        dmViveiro.cdsMix_MudaID_VENDA.AsInteger := vaFrmVenda.IdEscolhido;
        dmViveiro.cdsMix_Muda.Post;

        TMensagem.ppuShowMessage('Venda gerada com sucesso.');

      finally
        vaFrmVenda.Free;
      end;
    end
  else
    raise Exception.Create('Já existe uma venda ou saída vinculada a este mix.');

end;

procedure TfrmMixMuda.Ac_ImprimirExecute(Sender: TObject);
begin
  inherited;
  dmViveiro.cdsMix_Muda_Especie_Lote_Canteiro.Close;
  dmViveiro.cdsMix_Muda_Especie_Lote_Canteiro.ParamByName('ID_MIX_MUDA').AsInteger := dmViveiro.cdsMix_MudaID.AsInteger;
  dmViveiro.cdsMix_Muda_Especie_Lote_Canteiro.Open;

  ppSubReportRocambole.Visible := true;
  try
    cdsQtdeMudaRocambole.Data := dmPrincipal.FuncoesViveiro.fpuCalcularQtdeMudasRocambole(dmViveiro.cdsMix_MudaID.AsInteger);
  except
    on e: Exception do
      begin
        ppSubReportRocambole.Visible := false;
        //mesmo se der erro ao calcular a quantidade de mudas por rocambole, ainda irei imprimir
        TMensagem.ppuShowException(e);
        if not cdsQtdeMudaRocambole.Active then
          cdsQtdeMudaRocambole.CreateDataSet
        else
          cdsQtdeMudaRocambole.EmptyDataSet;

      end;
  end;

  ppMudas.PrintReport;

end;

procedure TfrmMixMuda.Ac_ImprimirUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterar;
end;

procedure TfrmMixMuda.ColumnSaidaVendaCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.Text = 'Não' then
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

procedure TfrmMixMuda.ColumnSaidaVendaGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  inherited;
  if (not VarIsNull(ARecord.Values[viewRegistrosID_VENDA.Index])) or (not VarIsNull(ARecord.Values[viewRegistrosID_SAIDA.Index])) then
    AText := 'Sim'
  else
    AText := 'Não';

end;

procedure TfrmMixMuda.EditQtdePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastro then
    FCalcularQuantidades := True;
end;

procedure TfrmMixMuda.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.name := '';

  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.name := '';
  inherited;

  PesquisaPadrao := Ord(tppData);

  dmLookup.cdslkOrganizacao.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
  dmLookup.ppuAbrirCache(dmLookup.cdslkOrganizacao);

  ppvCarregarEspeciesAndSaldos;

  dmLookup.ppuCarregarPessoas(0, coTiposPessoaPadrao);

  ppvCarregarClientes;

  ppvConfigurarGrids;

  FIdItemMuda := dmPrincipal.FuncoesViveiro.fpuBuscarIdItemMuda;
end;

procedure TfrmMixMuda.ppvCarregarEspeciesAndSaldos;
begin
  dmLookup.cdslkEspecie.Close;
  dmLookup.cdslkEspecie.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
  dmLookup.ppuAbrirCache(dmLookup.cdslkEspecie);
end;

procedure TfrmMixMuda.ppvCarregarClientes;
begin
  dmLookup.cdslkFin_For_Cli.ppuDataRequest([TParametros.coTipo], [Ord(tfCliente)], TOperadores.coAnd, True);
end;

function TfrmMixMuda.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivMixMuda));
end;

function TfrmMixMuda.fprHabilitarAlterarDetail: Boolean;
begin
  Result := false;
end;

procedure TfrmMixMuda.pprAfterSalvar(ipAcaoExecutada: TDataSetState);
begin
  inherited;
  if dmViveiro.cdsMix_Muda_Especie.ChangeCount > 0 then
    dmViveiro.cdsMix_Muda_Especie.ApplyUpdates(0);

  // calcula as quantidades e insere os lotes para cada especie
  if FCalcularQuantidades then
    dmPrincipal.FuncoesViveiro.ppuCalcularQuantidadeMudasMix(dmViveiro.cdsMix_MudaID.AsInteger);

end;

procedure TfrmMixMuda.ppvConfigurarEdits;
begin
  EditQtde.Enabled := (dmViveiro.cdsMix_MudaID_VENDA.IsNull) and (dmViveiro.cdsMix_MudaID_VENDA.IsNull);
  EditQtdeRocambole.Enabled := EditQtde.Enabled;
  frameGrids.ppuLockUnlockAcoes(not EditQtde.Enabled);
end;

procedure TfrmMixMuda.pprEfetuarPesquisa;
begin
  dmViveiro.cdsMix_Muda_Especie_Lote.Close;
  inherited;
  dmViveiro.cdsMix_Muda_Especie_Lote.Open;
end;

procedure TfrmMixMuda.pprExecutarCancelar;
begin
  inherited;
  if dmViveiro.cdsMix_Muda_Especie.ChangeCount > 0 then
    dmViveiro.cdsMix_Muda_Especie.CancelUpdates;
end;

procedure TfrmMixMuda.pprValidarDados;
var
  vaTotalMudasDisponiveis: integer;
begin
  inherited;
  if dmViveiro.cdsMix_Muda_Especie.RecordCount = 0 then
    raise Exception.Create('É necessário selecionar pelo menos uma espécie.');

  vaTotalMudasDisponiveis := 0;
  TUtils.ppuPercorrerCds(dmViveiro.cdsMix_Muda_Especie,
    procedure
    begin
      inc(vaTotalMudasDisponiveis, dmViveiro.cdsMix_Muda_EspecieQTDE_MUDA_PRONTA.AsInteger);
    end);

  if vaTotalMudasDisponiveis < dmViveiro.cdsMix_MudaQTDE_MUDA.AsInteger then
    raise TControlException.Create('As espécies selecionadas não possuem mudas suficientes para a quantidade informada.', EditQtde);

end;

procedure TfrmMixMuda.ppuAlterar(ipId: integer);
begin
  inherited;
  FCalcularQuantidades := false;
  if cdsLocalEspecie.Active then
    cdsLocalEspecie.EmptyDataSet
  else
    cdsLocalEspecie.CreateDataSet;

  ppvCarregarEspeciesAndSaldos; // atualiza os saldoss
  TUtils.ppuPercorrerCds(dmLookup.cdslkEspecie,
    procedure
    begin
      if (not dmViveiro.cdsMix_Muda_Especie.Locate(dmViveiro.cdsMix_Muda_EspecieID_ESPECIE.FieldName, dmLookup.cdslkEspecieID.AsInteger, [])) and
        (dmLookup.cdslkEspecieQTDE_MUDA_PRONTA.AsInteger > 0) then
        begin
          ppvIncluirEspecieCdsLocal;
        end;
    end);

  ppvConfigurarEdits;
end;

procedure TfrmMixMuda.ppuIncluir;
begin
  inherited;

  FCalcularQuantidades := True;
  if cdsLocalEspecie.Active then
    cdsLocalEspecie.EmptyDataSet
  else
    cdsLocalEspecie.CreateDataSet;

  dmViveiro.cdsMix_MudaQTDE_MUDA_ROCAMBOLE.AsInteger := 30;
  dmViveiro.cdsMix_MudaDATA.AsDateTime := now;

  ppvCarregarEspeciesAndSaldos; // atualiza os saldos
  TUtils.ppuPercorrerCds(dmLookup.cdslkEspecie,
    procedure
    begin
      if dmLookup.cdslkEspecieQTDE_MUDA_PRONTA.AsInteger > 0 then
        begin
          ppvIncluirEspecieCdsLocal;
        end;
    end);

  ppvConfigurarEdits;

  pprPreencherCamposPadroes(dmViveiro.cdsMix_Muda);

  frameGrids.Ac_AddTodos.Execute;
end;

procedure TfrmMixMuda.ppvIncluirEspecieCdsLocal;
begin
  cdsLocalEspecie.Append;
  cdsLocalEspecieID.AsInteger := dmLookup.cdslkEspecieID.AsInteger;
  cdsLocalEspecieNOME.AsString := dmLookup.cdslkEspecieNOME.AsString;
  cdsLocalEspecieQTDE_MUDA_PRONTA.AsInteger := dmLookup.cdslkEspecieQTDE_MUDA_PRONTA.AsInteger;
  cdsLocalEspecie.Post;
end;

procedure TfrmMixMuda.ppvConfigurarGrids;
begin
  // Esquerda
  frameGrids.fpuAdicionarField(frameGrids.viewEsquerda, 'ID', false);
  frameGrids.fpuAdicionarField(frameGrids.viewEsquerda, 'NOME');
  frameGrids.fpuAdicionarField(frameGrids.viewEsquerda, 'QTDE_MUDA_PRONTA');
  // Direita
  frameGrids.fpuAdicionarField(frameGrids.viewDireita, 'ID_ESPECIE', false);
  frameGrids.fpuAdicionarField(frameGrids.viewDireita, 'ESPECIE');
  frameGrids.fpuAdicionarField(frameGrids.viewDireita, 'QTDE_MUDA_PRONTA');
  // mapeando
  frameGrids.ppuMapearFields('ID', 'ID_ESPECIE');
  frameGrids.ppuMapearFields('NOME', 'ESPECIE');
  frameGrids.ppuMapearFields('QTDE_MUDA_PRONTA', 'QTDE_MUDA_PRONTA');

  frameGrids.OnAddRemoveRegistro := procedure(ipDataSetOrigem, ipDataSetDestino: TDataSet; ipTipo: TTipoAcao)
    begin
      FCalcularQuantidades := True;
      if not(dmViveiro.cdsMix_Muda.State in [dsInsert, dsEdit]) then
        dmViveiro.cdsMix_Muda.Edit;
    end;
end;

end.
