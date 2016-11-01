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
  cxScrollBox, fmEditor, uMensagem, System.RegularExpressions,
  fBasicoCrudMasterDetail, cxSplitter, cxCalc, cxCurrencyEdit, cxMemo,
  cxRichEdit, System.Generics.Collections, uExceptions, uUtils, fSaida, fVenda,
  cxRichEditUtils,
  dxSkinOffice2007Black, System.Math, ppParameter, ppDesignLayer, ppVar, ppCtrls,
  ppBands, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppStrtch, ppRichTx, Datasnap.DBClient, ppTableGrid, ppSubRpt,
  ppModule, raCodMod, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxExtDBEditorLnks,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, dxPSCore, dxPSContainerLnk, cxDBRichEdit, dxPSRELnk,
  dxPScxExtComCtrlsLnk;

type
  TfrmOrcamento = class(TfrmBasicoCrudMasterDetail)
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
    EditDataOrcamento: TcxDBDateEdit;
    Ac_Adicionar_Cliente: TAction;
    cbModelo: TcxDBLookupComboBox;
    Label3: TLabel;
    pnEditsCadastroTop: TPanel;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_ITEM: TcxGridDBColumn;
    viewRegistrosDetailID_ESPECIE: TcxGridDBColumn;
    viewRegistrosDetailQTDE: TcxGridDBColumn;
    viewRegistrosDetailVALOR_UNITARIO: TcxGridDBColumn;
    viewRegistrosDetailITEM: TcxGridDBColumn;
    viewRegistrosDetailESPECIE: TcxGridDBColumn;
    tabOrcamentoCustomizado: TcxTabSheet;
    dsOrcamento_Customizado: TDataSource;
    pcCadastroDetail: TcxPageControl;
    tabCadastroItem: TcxTabSheet;
    tabPreVisualizacao: TcxTabSheet;
    frameEditor: TframeEditor;
    tabCadastroCampoCustomizavel: TcxTabSheet;
    Label4: TLabel;
    cbItem: TcxDBLookupComboBox;
    EditValorUnitario: TcxDBCurrencyEdit;
    lbl6: TLabel;
    Label7: TLabel;
    EditQtde: TcxDBCalcEdit;
    lbUnidade: TLabel;
    cbEspecie: TcxDBLookupComboBox;
    lb2: TLabel;
    ScrollCampos: TcxScrollBox;
    Panel1: TPanel;
    btnIncluirCampoCustomizado: TButton;
    cxGrid1: TcxGrid;
    viewCamposCustomizados: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    viewCamposCustomizadosID: TcxGridDBColumn;
    viewCamposCustomizadosCAMPO: TcxGridDBColumn;
    viewCamposCustomizadosCONTEUDO: TcxGridDBColumn;
    Ac_Incluir_Campo_Customizado: TAction;
    btnRetornarConfiguracaoCampos: TButton;
    Ac_Retornar_Configuracao_Campos: TAction;
    btnGerar_Saida: TButton;
    Ac_Gerar_Saida: TAction;
    btnGerar_Venda: TButton;
    Ac_Gerar_Venda: TAction;
    EditTamanho: TcxDBCalcEdit;
    Label5: TLabel;
    ColumnImprimir: TcxGridDBColumn;
    Ac_Imprimir: TAction;
    DBPipeOrganizacao: TppDBPipeline;
    ppOrcamento: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppDBImage2: TppDBImage;
    ppDBImage1: TppDBImage;
    ppDetailBand1: TppDetailBand;
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
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    DBPipeOrcamento: TppDBPipeline;
    ppDBRichText1: TppDBRichText;
    btnEditarOrcamento: TButton;
    Ac_Editar_Orcamento: TAction;
    btnEditar_Orcamento2: TButton;
    RichAux: TcxRichEdit;
    cdsLocalOrcamento: TClientDataSet;
    cdsLocalOrcamentoINICIO: TBlobField;
    cdsLocalOrcamentoFIM: TBlobField;
    DBPipeItens: TppDBPipeline;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    dsLocalOrcamento: TDataSource;
    ppDBRichText2: TppDBRichText;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppTableGrid1: TppTableGrid;
    ppTableRow1: TppTableRow;
    ppTableColumn1: TppTableColumn;
    ppTableCell1: TppTableCell;
    ppTableColumn2: TppTableColumn;
    ppTableCell3: TppTableCell;
    ppTableColumn3: TppTableColumn;
    ppTableCell5: TppTableCell;
    ppTableColumn4: TppTableColumn;
    ppTableCell7: TppTableCell;
    ppTableColumn5: TppTableColumn;
    ppTableCell9: TppTableCell;
    ppTableColumn6: TppTableColumn;
    ppTableCell11: TppTableCell;
    ppTableColumn7: TppTableColumn;
    ppTableCell13: TppTableCell;
    ppTableGrid2: TppTableGrid;
    ppTableRow2: TppTableRow;
    ppTableCell2: TppTableCell;
    ppTableCell4: TppTableCell;
    ppTableCell6: TppTableCell;
    ppTableCell8: TppTableCell;
    ppTableCell10: TppTableCell;
    ppTableCell12: TppTableCell;
    ppTableCell14: TppTableCell;
    ppTableColumn8: TppTableColumn;
    ppTableColumn9: TppTableColumn;
    ppTableColumn10: TppTableColumn;
    ppTableColumn11: TppTableColumn;
    ppTableColumn12: TppTableColumn;
    ppTableColumn13: TppTableColumn;
    ppTableColumn14: TppTableColumn;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText12: TppDBText;
    ppLabel8: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppVariable1: TppVariable;
    raCodeModule1: TraCodeModule;
    raCodeModule2: TraCodeModule;
    viewRegistrosDetailTAMANHO: TcxGridDBColumn;
    viewRegistrosDetailNOME_CIENTIFICO: TcxGridDBColumn;
    viewRegistrosDetailFAMILIA_BOTANICA: TcxGridDBColumn;
    viewRegistrosDetailCALC_VALOR_TOTAL: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cbClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Adicionar_ClienteExecute(Sender: TObject);
    procedure tabCadastroShow(Sender: TObject);
    procedure cbModeloPropertiesEditValueChanged(Sender: TObject);
    procedure cbEspeciePropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Incluir_Campo_CustomizadoExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Ac_Salvar_Incluir_DetailUpdate(Sender: TObject);
    procedure tabPreVisualizacaoShow(Sender: TObject);
    procedure Ac_Salvar_DetailUpdate(Sender: TObject);
    procedure Ac_Salvar_DetailExecute(Sender: TObject);
    procedure Ac_Retornar_Configuracao_CamposExecute(Sender: TObject);
    procedure pcCadastroDetailChange(Sender: TObject);
    procedure Ac_Gerar_SaidaUpdate(Sender: TObject);
    procedure Ac_Gerar_VendaExecute(Sender: TObject);
    procedure Ac_Gerar_SaidaExecute(Sender: TObject);
    procedure Ac_ImprimirExecute(Sender: TObject);
    procedure Ac_Editar_OrcamentoExecute(Sender: TObject);
    procedure Ac_Editar_OrcamentoUpdate(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
    FMarcadoresCustomizados: TDictionary<String, TcxTextEdit>;
    procedure ppvCarregarClientes;
    procedure ppvAdicionarCliente;
    procedure ppvLimparEditsCamposCustomizados;
    procedure ppvCarregarMarcadoresCustomizados;
    procedure ppvAdicionarCampoCustomizado(ipCampo: String; ipConteudo: String = '');
    function fpvLocalizarModeloOrcamento(ipIdModelo: Integer): Boolean;
    procedure ppvSubstituirMarcadoresOrcamento;
    procedure ppvMontarOrcamento;
    function fpvInserirTabelaEspecies: String;
  protected
    function fprGetPermissao: String; override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;

    procedure pprAfterSalvarDetail(ipAcaoExecutada: TDataSetState); override;

    function fprHabilitarSalvarDetail(): Boolean; override;
    procedure pprValidarDadosDetail; override;
    procedure pprEfetuarPesquisa; override;
  public
    procedure ppuIncluir; override;
    procedure ppuAlterar(ipId: Integer); override;
    procedure ppuAlterarDetail(ipId: Integer); override;
    procedure ppuRetornar; override;
    procedure ppuIncluirDetail; override;
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

procedure TfrmOrcamento.ppvSubstituirMarcadoresOrcamento;
var
  vaMarcador, vaConteudo: String;
  vaPos: Integer;
  ATableParams: TcxRichEditTableParams;
  AIndex: Integer;
  vaValorTotal: Currency;

  procedure plSubstituir(ipMarcador, ipConteudo: String);
  begin
    vaPos := 0;
    while vaPos <> -1 do
      begin
        vaPos := frameEditor.Rich.FindTexT(coInicioMarcador + ipMarcador + coFimMarcador, 0, Length(frameEditor.Rich.Text), []);
        if vaPos <> -1 then
          begin
            frameEditor.Rich.SelStart := vaPos;
            frameEditor.Rich.SelLength := Length(coInicioMarcador + ipMarcador + coFimMarcador);
            frameEditor.Rich.SelText := ipConteudo;
          end;
      end;
  end;

begin
  dmEstoque.cdsOrcamento_Orcamento.Edit;

  for vaMarcador in FMarcadoresCustomizados.Keys do
    begin
      vaConteudo := FMarcadoresCustomizados.Items[vaMarcador].Text;
      plSubstituir(vaMarcador, vaConteudo);
    end;

  // vaConteudo := fpvInserirTabelaEspecies;
  // plSubstituir(MarcadorOrcamento[moTabelaEspecie], vaConteudo);

  plSubstituir(MarcadorOrcamento[moDataOrcamento], DateToStr(dmEstoque.cdsOrcamentoDATA.AsDateTime));
  plSubstituir(MarcadorOrcamento[moDataOrcamentoExtenso], FormatDateTime('dd "de" mmmm "de" yyyy', dmEstoque.cdsOrcamentoDATA.AsDateTime));
  plSubstituir(MarcadorOrcamento[moCliente], dmEstoque.cdsOrcamentoCLIENTE.AsString);
  plSubstituir(MarcadorOrcamento[moResponsavel], dmEstoque.cdsOrcamentoRESPONSAVEL.AsString);

  TUtils.ppuPercorrerCds(dmEstoque.cdsOrcamento_Item,
    procedure
    begin
      vaValorTotal := vaValorTotal + dmEstoque.cdsOrcamento_ItemCALC_VALOR_TOTAL.AsCurrency;
    end);
  plSubstituir(MarcadorOrcamento[moValorTotal], FormatFloat('R$ ,0.00', vaValorTotal));
  plSubstituir(MarcadorOrcamento[moValorTotalExtenso], TUtils.fpuGetValorPorExtenso(vaValorTotal));
end;

function TfrmOrcamento.fpvInserirTabelaEspecies: String;
const
  coQuebraLinha: String = Char(13) + Char(10);
  coCellWidth: Integer = 1680;
  coCellIndent: Integer = 100;
  coQtdeColuna = 7;
var
  i, vaLinha, vaColuna: Integer;

  function flAddBold(ipTexto: String): String;
  begin
    Exit('\b ' + ipTexto + '\b0');
  end;

begin
  // vamos fazer um refresh para garantir que vai conter todas as informacoes necessarias
  dmEstoque.cdsOrcamento_Item.Refresh;

  Result := '{\rtf1\ansi\ansicpg1251 ' + coQuebraLinha;
  for vaLinha := 0 to dmEstoque.cdsOrcamento_Item.RecordCount do
    begin
      if vaLinha > 0 then
        dmEstoque.cdsOrcamento_Item.RecNo := vaLinha;

      Result := Result + '\trowd\trgaph' + IntToStr(coCellIndent) + coQuebraLinha;
      i := 0;
      for vaColuna := 0 to coQtdeColuna - 1 do
        begin
          Inc(i);
          Result := Result + '\clbrdrt\brdrs\clbrdrl\brdrs\clbrdrb\brdrs\clbrdrr\brdrs\cellx' +
            IntToStr(i * coCellWidth) + coQuebraLinha;
        end;

      Result := Result + '\pard\intbl' + coQuebraLinha;

      for vaColuna := 0 to coQtdeColuna - 1 do
        begin
          if vaLinha = 0 then
            begin
              case vaColuna of
                0:
                  Result := Result + flAddBold('ESPÉCIE');
                1:
                  Result := Result + flAddBold('NOME CIENTÍFICO');
                2:
                  Result := Result + flAddBold('FAMÍLIA BOTÂNICA');
                3:
                  Result := Result + flAddBold('TAMANHO');
                4:
                  Result := Result + flAddBold('QUANT');
                5:
                  Result := Result + flAddBold('PREÇO UNITÁRIO');
              else // valor total
                Result := Result + flAddBold('PREÇO TOTAL');
              end;
            end
          else
            begin
              case vaColuna of
                0:
                  Result := Result + dmEstoque.cdsOrcamento_ItemESPECIE.AsString;
                1:
                  Result := Result + dmEstoque.cdsOrcamento_ItemNOME_CIENTIFICO.AsString;
                2:
                  Result := Result + dmEstoque.cdsOrcamento_ItemFAMILIA_BOTANICA.AsString;
                3:
                  Result := Result + FormatFloat(',0.00', dmEstoque.cdsOrcamento_ItemTAMANHO.AsFloat);
                4:
                  Result := Result + FormatFloat(',0', dmEstoque.cdsOrcamento_ItemTAMANHO.AsFloat);
                5:
                  Result := Result + FormatFloat('R$ ,0.00', dmEstoque.cdsOrcamento_ItemVALOR_UNITARIO.AsFloat);
              else // valor total
                Result := Result + FormatFloat('R$ ,0.00',
                  RoundTo(dmEstoque.cdsOrcamento_ItemVALOR_UNITARIO.AsFloat * dmEstoque.cdsOrcamento_ItemQTDE.AsFloat, -2));
              end;
            end;

          Result := Result + '\cell' + coQuebraLinha;
        end;

      Result := Result + '\row' + coQuebraLinha;
    end;
  Result := Result + '}';
end;

procedure TfrmOrcamento.Ac_Editar_OrcamentoExecute(Sender: TObject);
begin
  inherited;
  dmEstoque.cdsOrcamento_Orcamento.Close;
  dmEstoque.cdsOrcamento_Orcamento.ParamByName('ID').AsInteger := dmEstoque.cdsOrcamentoID.AsInteger;
  dmEstoque.cdsOrcamento_Orcamento.Open;

  pcPrincipal.ActivePage := tabCadastroDetail;
  pcCadastroDetail.ActivePage := tabPreVisualizacao;
end;

procedure TfrmOrcamento.Ac_Editar_OrcamentoUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterar;
end;

procedure TfrmOrcamento.Ac_Gerar_SaidaExecute(Sender: TObject);
var
  vaFrmSaida: TfrmSaida;
  vaSaida: TSaida;
  vaItem: TItem;
  vaIdSaida: Integer;
begin
  inherited;
  if (dmEstoque.cdsOrcamentoID_VENDA.IsNull and dmEstoque.cdsOrcamentoID_SAIDA.IsNull) then
    begin
      if TMensagem.fpuPerguntar('Tem certeza que deseja gerar uma saída para este orçamento?', ppSimNao) = rpSim then
        begin
          vaIdSaida := 0;
          vaFrmSaida := TfrmSaida.Create(nil);
          try
            try
              vaFrmSaida.ModoSilencioso := True;
              vaSaida := TSaida.Create;
              vaSaida.Data := Now;
              vaSaida.Tipo := tsConsumo;

              vaFrmSaida.ppuConfigurarModoExecucao(meSomenteCadastro, vaSaida);
              vaFrmSaida.ppuIncluir;
              vaFrmSaida.ppuSalvar;

              vaIdSaida := vaFrmSaida.IdEscolhido;
            except
              on e: Exception do
                begin
                  TMensagem.ppuShowException('Não foi possível gerar a saída deste orçamento.', e);
                  Exit;
                end;
            end;

            try
              dmEstoque.cdsOrcamento_Item.First;
              while not dmEstoque.cdsOrcamento_Item.eof do
                begin
                  vaItem := TItem.Create;
                  vaItem.Id := dmEstoque.cdsOrcamento_ItemID_ITEM.AsInteger;
                  vaItem.IdEspecie := dmEstoque.cdsOrcamento_ItemID_ESPECIE.AsInteger;
                  vaItem.Qtde := dmEstoque.cdsOrcamento_ItemQTDE.AsFloat;

                  vaFrmSaida.Modelo := vaItem;
                  vaFrmSaida.ppuIncluirDetail;
                  vaFrmSaida.ppuSalvarDetail;

                  dmEstoque.cdsOrcamento_Item.Next;
                end;
            except
              on e: Exception do
                begin
                  TMensagem.ppuShowException('Houve um erro ao incluir os itens da saída. Será necessário inclui-los manualmente.', e);
                  Exit;
                end;
            end;

            TMensagem.ppuShowMessage('Saída gerada com sucesso.');

          finally
            vaFrmSaida.Free;
            // mesmo que tenha dado erro nos itens, a saida ja foi gerada, entao vou vincular
            if vaIdSaida <> 0 then
              begin
                dmEstoque.cdsOrcamento.Edit;
                dmEstoque.cdsOrcamentoID_SAIDA.AsInteger := vaIdSaida;
                dmEstoque.cdsOrcamento.Post;
              end;
          end;
        end;
    end
  else
    raise Exception.Create('Já existe uma venda ou saída vinculada a este orçamento.');

end;

procedure TfrmOrcamento.Ac_Gerar_SaidaUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := dmEstoque.cdsOrcamento.Active and dmEstoque.cdsOrcamentoID_SAIDA.IsNull and dmEstoque.cdsOrcamentoID_VENDA.IsNull;
end;

procedure TfrmOrcamento.Ac_Gerar_VendaExecute(Sender: TObject);
var
  vaFrmVenda: TfrmVenda;
  vaVenda: TVenda;
  vaItem: TItem;
begin
  inherited;
  if (dmEstoque.cdsOrcamentoID_VENDA.IsNull and dmEstoque.cdsOrcamentoID_SAIDA.IsNull) then
    begin
      vaFrmVenda := TfrmVenda.Create(nil);
      try
        try
          vaFrmVenda.ModoSilencioso := True;
          vaVenda := TVenda.Create;
          vaVenda.Data := dmEstoque.cdsOrcamentoDATA.AsDateTime;
          vaVenda.IdCliente := dmEstoque.cdsOrcamentoID_CLIENTE.AsInteger;
          vaVenda.IdVendedor := dmEstoque.cdsOrcamentoID_RESPONSAVEL.AsInteger;

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
          dmEstoque.cdsOrcamento_Item.First;
          while not dmEstoque.cdsOrcamento_Item.eof do
            begin
              vaItem := TItem.Create;
              vaItem.Id := dmEstoque.cdsOrcamento_ItemID_ITEM.AsInteger;
              vaItem.IdEspecie := dmEstoque.cdsOrcamento_ItemID_ESPECIE.AsInteger;
              vaItem.Qtde := dmEstoque.cdsOrcamento_ItemQTDE.AsFloat;

              if dmLookup.cdslkEspecie.Locate(TBancoDados.coId, vaItem.IdEspecie, []) then
                vaItem.ValorUnitario := dmLookup.cdslkEspecieVALOR_MUDA.AsFloat;

              vaFrmVenda.Modelo := vaItem;
              vaFrmVenda.ppuIncluirDetail;
              // se nao tiver valor configurado irei abrir a tela para o usuario informar
              if vaItem.ValorUnitario = 0 then
                vaFrmVenda.ShowModal
              else
                vaFrmVenda.ppuSalvarDetail;

              dmEstoque.cdsOrcamento_Item.Next;
            end;
        except
          on e: Exception do
            begin
              TMensagem.ppuShowException('Houve um erro ao incluir os itens da saída. Será necessário inclui-los manualmente.', e);
              Exit;
            end;
        end;

        dmEstoque.cdsOrcamento.Edit;
        dmEstoque.cdsOrcamentoID_VENDA.AsInteger := vaFrmVenda.IdEscolhido;
        dmEstoque.cdsOrcamento.Post;

        TMensagem.ppuShowMessage('Venda gerada com sucesso.');

      finally
        vaFrmVenda.Free;
      end;
    end
  else
    raise Exception.Create('Já existe uma venda ou saída vinculada a este orçamento.');

end;

procedure TfrmOrcamento.Ac_ImprimirExecute(Sender: TObject);
var
  vaPos: Integer;
begin
  inherited;
  if not dmLookup.cdslkOrganizacao.Active then
    dmLookup.cdslkOrganizacao.Open;

  dmEstoque.cdsOrcamento_Orcamento.Close;
  dmEstoque.cdsOrcamento_Orcamento.ParamByName('ID').AsInteger := dmEstoque.cdsOrcamentoID.AsInteger;
  dmEstoque.cdsOrcamento_Orcamento.Open;

  if cdsLocalOrcamento.Active then
    cdsLocalOrcamento.EmptyDataSet
  else
    cdsLocalOrcamento.CreateDataSet;

  cdsLocalOrcamento.Append;
  // vamos pegar o texto ate o marcador das espécies
  vaPos := frameEditor.Rich.FindTexT(MarcadorOrcamento[moTabelaEspecie],1,Length(frameEditor.Rich.Text),[]);
  if vaPos > 0 then
    begin
      frameEditor.Rich.SelStart := 1;
      frameEditor.Rich.SelLength := vaPos;
      cdsLocalOrcamentoINICIO.AsString := frameEditor.Rich.SelText;

      //Copy(dmEstoque.cdsOrcamento_OrcamentoORCAMENTO.AsString, 1, vaPos);
      frameEditor.Rich.SelStart := vaPos+length(MarcadorOrcamento[moTabelaEspecie]);
      frameEditor.Rich.SelLength := Length(frameEditor.Rich.Text)-frameEditor.Rich.SelStart;
      cdsLocalOrcamentoFIM.AsString := frameEditor.Rich.SelText;
    end;

  cdsLocalOrcamento.Post;

  dmEstoque.cdsOrcamento_Item.DisableControls;
  try
    ppOrcamento.PrintReport;
  finally
    dmEstoque.cdsOrcamento_Item.EnableControls;
  end;

end;

procedure TfrmOrcamento.Ac_Incluir_Campo_CustomizadoExecute(Sender: TObject);
begin
  inherited;
  ppvCarregarMarcadoresCustomizados;

  pcPrincipal.ActivePage := tabCadastroDetail;
  pcCadastroDetail.ActivePage := tabCadastroCampoCustomizavel;
end;

procedure TfrmOrcamento.Ac_Retornar_Configuracao_CamposExecute(Sender: TObject);
begin
  inherited;
  if ScrollCampos.ControlCount = 0 then
    ppvCarregarMarcadoresCustomizados;

  pcCadastroDetail.ActivePage := tabCadastroCampoCustomizavel;
end;

procedure TfrmOrcamento.Ac_Salvar_DetailExecute(Sender: TObject);
begin
  if pcCadastroDetail.ActivePage = tabCadastroItem then
    begin
      ppuSalvarDetail;
      ppvCarregarMarcadoresCustomizados;
      pcCadastroDetail.ActivePage := tabCadastroCampoCustomizavel;
    end
  else if pcCadastroDetail.ActivePage = tabCadastroCampoCustomizavel then
    begin
      ppuSalvarDetail;
      ppvMontarOrcamento;
      pcCadastroDetail.ActivePage := tabPreVisualizacao;
    end
  else
    inherited;
end;

procedure TfrmOrcamento.ppvMontarOrcamento;
begin
  if fpvLocalizarModeloOrcamento(dmEstoque.cdsOrcamentoID_MODELO_ORCAMENTO.AsInteger) then
    begin
      dmEstoque.cdsOrcamento_Orcamento.Close;
      dmEstoque.cdsOrcamento_Orcamento.ParamByName('ID').AsInteger := dmEstoque.cdsOrcamentoID.AsInteger;
      dmEstoque.cdsOrcamento_Orcamento.Open;

      if dmEstoque.cdsOrcamento_Orcamento.eof then
        begin
          dmEstoque.cdsOrcamento_Orcamento.Append;
          dmEstoque.cdsOrcamento_OrcamentoID.AsInteger := 1; // apenas para conseguir fazer o post
        end
      else
        dmEstoque.cdsOrcamento_Orcamento.Edit;

      dmEstoque.cdsOrcamento_OrcamentoORCAMENTO.Assign(dmLookup.cdslkModelo_Orcamento_OrcamentoMODELO);
      dmEstoque.cdsOrcamento_Orcamento.Post;

      ppvSubstituirMarcadoresOrcamento;
    end;
end;

procedure TfrmOrcamento.Ac_Salvar_DetailUpdate(Sender: TObject);
begin
  inherited;
  if pcCadastroDetail.ActivePage = tabCadastroItem then
    Ac_Salvar_Detail.Caption := 'Salvar/Configurar Campos Customizados'
  else if pcCadastroDetail.ActivePage = tabCadastroCampoCustomizavel then
    Ac_Salvar_Detail.Caption := 'Salvar/Montar Orçamento'
  else
    Ac_Salvar_Detail.Caption := 'Salvar';

end;

procedure TfrmOrcamento.Ac_Salvar_Incluir_DetailUpdate(Sender: TObject);
begin
  if pcCadastroDetail.ActivePage = tabCadastroItem then
    TAction(Sender).Enabled := fprHabilitarSalvarDetail
  else
    TAction(Sender).Enabled := false;
end;

procedure TfrmOrcamento.cbClienteKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarCliente;
end;

procedure TfrmOrcamento.cbEspeciePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if (pcPrincipal.ActivePage = tabCadastroDetail) and (dmEstoque.cdsOrcamento_Item.State in [dsEdit, dsInsert]) then
    begin
      if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiSemente) then
        dmEstoque.cdsOrcamento_ItemVALOR_UNITARIO.AsFloat := dmLookup.cdslkEspecieVALOR_KG_SEMENTE.AsFloat
      else if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda) then
        dmEstoque.cdsOrcamento_ItemVALOR_UNITARIO.AsFloat := dmLookup.cdslkEspecieVALOR_MUDA.AsFloat;
    end;

end;

function TfrmOrcamento.fpvLocalizarModeloOrcamento(ipIdModelo: Integer): Boolean;
begin
  Result := false;
  if dmLookup.cdslkModelo_Orcamento.Locate(TBancoDados.coId, ipIdModelo, []) then
    begin
      dmLookup.cdslkModelo_Orcamento_Orcamento.ppuLimparParametros;
      dmLookup.cdslkModelo_Orcamento_Orcamento.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
      dmLookup.ppuAbrirCache(dmLookup.cdslkModelo_Orcamento_Orcamento);
      // se o recordcount for zero significa que o cache q tinha nao era referente a este modelo
      if dmLookup.cdslkModelo_Orcamento_Orcamento.RecordCount = 0 then
        begin
          dmLookup.cdslkModelo_Orcamento_Orcamento.ppuDataRequest();
          if dmLookup.cdslkModelo_Orcamento_Orcamento.RecordCount > 0 then
            dmLookup.ppuSalvarCache(dmLookup.cdslkModelo_Orcamento_Orcamento);
        end;

      if dmLookup.cdslkModelo_Orcamento_Orcamento.RecordCount > 0 then
        Result := True;
    end
  else
    raise Exception.Create('Não foi possível encontrar o modelo para montar o orçamento.');

end;

procedure TfrmOrcamento.ppvCarregarMarcadoresCustomizados;
var
  vaModelo: TStringStream;
  vaMatchesCampo: TMatchCollection;
  vaMatchCampo: TMatch;
  vaConteudo: String;
  i: TMarcadorOrcamento;
  vaMarcadorCustomizado: Boolean;
begin
  ppvLimparEditsCamposCustomizados;

  if fpvLocalizarModeloOrcamento(dmEstoque.cdsOrcamentoID_MODELO_ORCAMENTO.AsInteger) then
    begin
      dmEstoque.cdsOrcamento_Customizado.DisableControls;
      vaModelo := TStringStream.Create;
      try
        RichAux.Properties.PlainText := false;
        RichAux.Lines.Clear;
        dmLookup.cdslkModelo_Orcamento_OrcamentoMODELO.SaveToStream(vaModelo);
        vaModelo.Position := 0;
        RichAux.Lines.LoadFromStream(vaModelo);
        // vamos remover o RTF para conseguir encontrar os marcadores
        RichAux.Properties.PlainText := True;
        vaModelo.Clear;
        RichAux.Lines.SaveToStream(vaModelo);

        FMarcadoresCustomizados.Clear;

        vaMatchesCampo := TRegEx.Matches(vaModelo.DataString, '(?<=' + TRegEx.Escape(coInicioMarcador) + ').+?(?=' + TRegEx.Escape(coFimMarcador) + ')',
          [roIgnoreCase, roSingleLine]);

        for vaMatchCampo in vaMatchesCampo do
          begin
            vaMarcadorCustomizado := true;
            for i := Low(TMarcadorOrcamento) to High(TMarcadorOrcamento) do
              begin
                if i <> moCustomizado then
                  begin
                    vaMarcadorCustomizado := vaMarcadorCustomizado and (MarcadorOrcamento[i] <> vaMatchCampo.Value);
                    if not vaMarcadorCustomizado then
                      break;
                  end;
              end;

            if vaMarcadorCustomizado then
              begin
                if not FMarcadoresCustomizados.ContainsKey(vaMatchCampo.Value) then
                  begin
                    vaConteudo := '';
                    if dmEstoque.cdsOrcamento_Customizado.Locate(dmEstoque.cdsOrcamento_CustomizadoCAMPO.FieldName, vaMatchCampo.Value, [loCaseInsensitive])
                    then
                      vaConteudo := dmEstoque.cdsOrcamento_CustomizadoCONTEUDO.AsString
                    else
                      begin
                        dmEstoque.cdsOrcamento_Customizado.Append;
                        dmEstoque.cdsOrcamento_CustomizadoID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('ORCAMENTO_CUSTOMIZADO');
                        dmEstoque.cdsOrcamento_CustomizadoID_ORCAMENTO.AsInteger := dmEstoque.cdsOrcamentoID.AsInteger;
                        dmEstoque.cdsOrcamento_CustomizadoCAMPO.AsString := vaMatchCampo.Value;
                        dmEstoque.cdsOrcamento_Customizado.Post;
                      end;

                    ppvAdicionarCampoCustomizado(vaMatchCampo.Value, vaConteudo);
                  end;
              end;
          end;

        dmEstoque.cdsOrcamento_Customizado.First;
        while not dmEstoque.cdsOrcamento_Customizado.eof do
          begin
            if not FMarcadoresCustomizados.ContainsKey(dmEstoque.cdsOrcamento_CustomizadoCAMPO.AsString) then
              dmEstoque.cdsOrcamento_Customizado.Delete
            else
              dmEstoque.cdsOrcamento_Customizado.Next;
          end;

      finally
        vaModelo.Free;
        dmEstoque.cdsOrcamento_Customizado.EnableControls;
      end;
    end
  else
    raise Exception.Create('Modelo de Orçamento não encontrado.');

end;

procedure TfrmOrcamento.ppvAdicionarCampoCustomizado(ipCampo: String; ipConteudo: String);
var
  i: Integer;
  vaPanel, vaPanelCampo: TPanel;
  vaLabel: TLabel;
  vaEdit: TcxTextEdit;
begin

  vaPanel := TPanel.Create(Self);
  vaPanel.Parent := ScrollCampos;
  vaPanel.Width := 0;
  vaPanel.Height := 22;
  vaPanel.Caption := '';
  vaPanel.Align := alTop;
  vaPanel.Top := 100000;


  // vaPanelCampo := TPanel.Create(Self);
  // vaPanelCampo.Parent := vaPanel;
  // vaPanelCampo.Height := 21;
  /// /  vaPanelCampo.Width := 350;
  // vaPanelCampo.Caption := '';
  // vaPanelCampo.Align := alClient;
  // vaPanelCampo.AlignWithMargins := true;
  // vaPanelCampo.Margins.Top := 0;
  // vaPanelCampo.Margins.Left := 0;
  // vaPanelCampo.Margins.Bottom := 0;
  // vaPanelCampo.BevelOuter := bvNone;
  //
  // vaPanel.Width := vaPanel.Width + vaPanelCampo.Width;

  vaLabel := TLabel.Create(Self);
  vaLabel.AutoSize := false;
  vaLabel.Caption := ipCampo;
  vaLabel.Height := 21;
  vaLabel.Width := 200;
  vaLabel.Align := AlLeft;
  vaLabel.Parent := vaPanel;

  vaEdit := TcxTextEdit.Create(Self);
  vaEdit.Height := 21;
  vaEdit.Align := alClient;
  vaEdit.Parent := vaPanel;
  if ipConteudo <> '' then
    vaEdit.Text := ipConteudo;

  FMarcadoresCustomizados.AddOrSetValue(ipCampo, vaEdit);
end;

procedure TfrmOrcamento.ppvLimparEditsCamposCustomizados;
var
  i: Integer;
begin
  ScrollCampos.LockScrollBars;
  try
    for i := ScrollCampos.ControlCount - 1 downto 0 do
      begin
        if ScrollCampos.Controls[i] is TPanel then
          begin
            ScrollCampos.Controls[i].Visible := false;
            ScrollCampos.Controls[i].Parent := Self;
          end;
      end;
  finally
    ScrollCampos.UnlockScrollBars;
  end;

end;

procedure TfrmOrcamento.cbModeloPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if (pcPrincipal.ActivePage = tabCadastro) and dmEstoque.cdsOrcamento_Customizado.Active then
    begin
      if (dmEstoque.cdsOrcamento_Customizado.RecordCount > 0) then
        begin
          if TMensagem.fpuPerguntar('Já existem campos customizados configurados para este orçamento.' + slinebreak +
            'Se o modelo for alterado estes campos serão perdidos.' +
            slinebreak + 'Tem certeza que deseja alterar o modelo?', ppSimNao) = rpNao then
            begin
              cbModelo.LockChangeEvents(True);
              try
                cbModelo.EditValue := dmEstoque.cdsOrcamentoID_MODELO_ORCAMENTO.AsInteger;
                cbModelo.PostEditValue;
              finally
                cbModelo.LockChangeEvents(false, false);
              end;
            end;
        end;
    end;
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

  pcCadastroDetail.ActivePage := tabCadastroItem;
  pcCadastroDetail.Properties.HideTabs := True;

  FMarcadoresCustomizados := TDictionary<String, TcxTextEdit>.Create;
  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);

  dmLookup.cdslkItem.ppuDataRequest([TParametros.coTipo], [Ord(tiMuda).ToString + coDelimitadorPadrao + Ord(tiSemente).ToString()]);

  dmLookup.cdslkModelo_Orcamento.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
  dmLookup.ppuAbrirCache(dmLookup.cdslkModelo_Orcamento);

  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
  ppvCarregarClientes;
end;

procedure TfrmOrcamento.FormDestroy(Sender: TObject);
begin
  inherited;
  FMarcadoresCustomizados.Free;
end;

procedure TfrmOrcamento.pcCadastroDetailChange(Sender: TObject);
begin
  inherited;
  btnRetornarConfiguracaoCampos.Visible := pcCadastroDetail.ActivePage = tabPreVisualizacao;
end;

procedure TfrmOrcamento.pprAfterSalvarDetail(ipAcaoExecutada: TDataSetState);
var
  vaOrcamento: TBytesStream;
  vaMarcador: String;
begin
  inherited;
  // fazendo um refresh para recalcular o saldo
  if pcCadastroDetail.ActivePage = tabCadastroItem then
    begin
      if dmEstoque.cdsOrcamento_Item.ChangeCount > 0 then
        dmEstoque.cdsOrcamento_Item.ApplyUpdates(0);

      dmLookup.cdslkEspecie.ppuDataRequest();
    end
  else if pcCadastroDetail.ActivePage = tabCadastroCampoCustomizavel then
    begin
      for vaMarcador in FMarcadoresCustomizados.Keys do
        begin
          if dmEstoque.cdsOrcamento_Customizado.Locate(dmEstoque.cdsOrcamento_CustomizadoCAMPO.FieldName, vaMarcador, [loCaseInsensitive]) then
            begin
              dmEstoque.cdsOrcamento_Customizado.Edit;
              dmEstoque.cdsOrcamento_CustomizadoCONTEUDO.AsString := FMarcadoresCustomizados.Items[vaMarcador].Text;
              dmEstoque.cdsOrcamento_Customizado.Post;
            end;
        end;

      if dmEstoque.cdsOrcamento_Customizado.ChangeCount > 0 then
        dmEstoque.cdsOrcamento_Customizado.ApplyUpdates(0);
    end
  else if pcCadastroDetail.ActivePage = tabPreVisualizacao then
    begin
      // se estava incluindo nao posso dar apply pq o codigo estara o mesmo do cds principal o que causaria um key violation
      if dmEstoque.cdsOrcamento_OrcamentoID.AsInteger = 1 then
        begin
          vaOrcamento := TBytesStream.Create;
          try
            dmEstoque.cdsOrcamento_Orcamento.Edit;
            dmEstoque.cdsOrcamento_OrcamentoID.AsInteger := dmEstoque.cdsOrcamentoID.AsInteger;
            dmEstoque.cdsOrcamento_OrcamentoORCAMENTO.SaveToStream(vaOrcamento);
            dmEstoque.cdsOrcamento_OrcamentoORCAMENTO.Clear;
            dmEstoque.cdsOrcamento_Orcamento.Post;
            dmEstoque.cdsOrcamento_Orcamento.MergeChangeLog;

            dmEstoque.cdsOrcamento_Orcamento.Edit;
            vaOrcamento.Position := 0;
            dmEstoque.cdsOrcamento_OrcamentoORCAMENTO.LoadFromStream(vaOrcamento);
            dmEstoque.cdsOrcamento_Orcamento.Post;
          finally
            vaOrcamento.Free;
          end;
        end;

      if dmEstoque.cdsOrcamento_Orcamento.State in [dsEdit, dsInsert] then
        dmEstoque.cdsOrcamento_Orcamento.Post;

      if dmEstoque.cdsOrcamento_Orcamento.ChangeCount > 0 then
        dmEstoque.cdsOrcamento_Orcamento.ApplyUpdates(0);
    end;
end;

procedure TfrmOrcamento.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaCliente then
    ipCds.ppuAddParametro(TParametros.coCliente, cbPesquisaCliente.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaVendedor then
    ipCds.ppuAddParametro(TParametros.coVendedor, cbPesquisaVendedor.EditValue)
end;

procedure TfrmOrcamento.pprEfetuarPesquisa;
begin
  dmEstoque.cdsOrcamento_Customizado.Close;
  inherited;
  dmEstoque.cdsOrcamento_Customizado.Open;
end;

procedure TfrmOrcamento.pprValidarDadosDetail;
begin
  if pcCadastroDetail.ActivePage = tabCadastroItem then
    begin
      inherited;
      if dmLookup.cdslkEspecie.Locate(TBancoDados.coId, dmEstoque.cdsOrcamento_ItemID_ESPECIE.AsInteger, []) then
        begin
          if dmLookup.cdslkItemTIPO.AsInteger = Ord(tiMuda) then
            begin
              if dmLookup.cdslkEspecieQTDE_MUDA_PRONTA.AsInteger < dmEstoque.cdsOrcamento_ItemQTDE.AsFloat then
                begin
                  if TMensagem.fpuPerguntar('O saldo atual de mudas prontas desta espécie é inferior a quantidade informada.' + slinebreak +
                    'Não será possível fazer realizar a venda posteriormente.' + slinebreak + 'Tem certeza que deseja gravar esta quantidade?', ppSimNao) = rpNao
                  then
                    raise TPararExecucaoException.Create('');
                end;
            end
          else
            if dmLookup.cdslkEspecieQTDE_SEMENTE_ESTOQUE.AsInteger < dmEstoque.cdsOrcamento_ItemQTDE.AsFloat then
            begin
              if TMensagem.fpuPerguntar('O saldo atual de sementes desta espécie é inferior a quantidade informada.' + slinebreak +
                'Não será possível fazer realizar a venda posteriormente.' + slinebreak + 'Tem certeza que deseja gravar esta quantidade?', ppSimNao) = rpNao
              then
                raise TPararExecucaoException.Create('');
            end;
        end;
    end;
end;

procedure TfrmOrcamento.ppuAlterar(ipId: Integer);
begin
  inherited;
end;

procedure TfrmOrcamento.ppuAlterarDetail(ipId: Integer);
begin
  inherited;
  pcCadastroDetail.ActivePage := tabCadastroItem;
end;

procedure TfrmOrcamento.ppuIncluir;
begin
  inherited;
  dmEstoque.cdsOrcamentoDATA.AsDateTime := Now;
end;

procedure TfrmOrcamento.ppuIncluirDetail;
begin
  inherited;
  pcCadastroDetail.ActivePage := tabCadastroItem;
end;

procedure TfrmOrcamento.ppuRetornar;
begin
  dmEstoque.cdsOrcamento_Item.CancelUpdates;
  dmEstoque.cdsOrcamento_Customizado.CancelUpdates;
  if dmEstoque.cdsOrcamento_Orcamento.Active then
    dmEstoque.cdsOrcamento_Orcamento.CancelUpdates;

  inherited;
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

procedure TfrmOrcamento.tabPreVisualizacaoShow(Sender: TObject);
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

function TfrmOrcamento.fprHabilitarSalvarDetail: Boolean;
begin
  if pcCadastroDetail.ActivePage = tabCadastroItem then
    Result := inherited
  else
    Result := True;
end;

end.
