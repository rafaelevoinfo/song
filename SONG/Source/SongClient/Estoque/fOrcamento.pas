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
  cxRichEdit, System.Generics.Collections, uExceptions, uUtils;

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
    RichAux: TcxRichEdit;
    pnBotoesCustomizado: TPanel;
    btnAplicarCampos: TButton;
    Ac_Aplicar_Campos_Customizado: TAction;
    btnConfigurarCamposCustomizados: TButton;
    Ac_Configurar_Campos_Customizado: TAction;
    procedure FormCreate(Sender: TObject);
    procedure cbClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Adicionar_ClienteExecute(Sender: TObject);
    procedure tabCadastroShow(Sender: TObject);
    procedure cbModeloPropertiesEditValueChanged(Sender: TObject);
    procedure cbEspeciePropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Incluir_Campo_CustomizadoExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Ac_Aplicar_Campos_CustomizadoExecute(Sender: TObject);
    procedure Ac_Configurar_Campos_CustomizadoExecute(Sender: TObject);
    procedure Ac_Salvar_Incluir_DetailUpdate(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
    FCamposCustomizados: TDictionary<String, TcxTextEdit>;
    procedure ppvCarregarClientes;
    procedure ppvAdicionarCliente;
    procedure ppvLimparEditsCamposCustomizados;
    procedure ppvCarregarCamposCustomizados;
    procedure ppvAdicionarCampoCustomizado(ipCampo: String; ipConteudo: String = '');
    function fpvLocalizarModeloOrcamento(ipIdModelo: Integer): Boolean;
    procedure ppvSubstituirCamposOrcamento;
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

procedure TfrmOrcamento.Ac_Aplicar_Campos_CustomizadoExecute(Sender: TObject);
begin
  inherited;
  if fpvLocalizarModeloOrcamento(dmEstoque.cdsOrcamentoID_MODELO_ORCAMENTO.AsInteger) then
    begin
      dmEstoque.cdsOrcamento_Orcamento.Close;
      dmEstoque.cdsOrcamento_Orcamento.ParamByName('ID').AsInteger := dmEstoque.cdsOrcamentoID.AsInteger;
      dmEstoque.cdsOrcamento_Orcamento.Open;

      if dmEstoque.cdsOrcamento_Orcamento.Eof then
        begin
          dmEstoque.cdsOrcamento_Orcamento.Append;
          dmEstoque.cdsOrcamento_OrcamentoID.AsInteger := 1; // apenas para conseguir fazer o post
        end
      else
        dmEstoque.cdsOrcamento_Orcamento.Edit;

      dmEstoque.cdsOrcamento_OrcamentoORCAMENTO.Assign(dmLookup.cdslkModelo_Orcamento_OrcamentoMODELO);
      dmEstoque.cdsOrcamento_Orcamento.Post;

      ppvSubstituirCamposOrcamento;
    end;
end;

procedure TfrmOrcamento.Ac_Configurar_Campos_CustomizadoExecute(
  Sender: TObject);
begin
  inherited;
  ppvCarregarCamposCustomizados;

  pcCadastroDetail.ActivePage := tabCadastroCampoCustomizavel;
end;

procedure TfrmOrcamento.ppvSubstituirCamposOrcamento;
var
  vaCampo, vaConteudo, vaOrcamento: String;
begin
  vaOrcamento := frameEditor.Rich.Lines.Text;
  for vaCampo in FCamposCustomizados.Keys do
    begin
      vaConteudo := FCamposCustomizados.Items[vaCampo].Text;

      vaOrcamento := StringReplace(vaOrcamento, coInicioMarcador + vaCampo + coFimMarcador, vaConteudo, [rfReplaceAll]);

    end;
  frameEditor.Rich.Lines.Text := vaOrcamento;
end;

procedure TfrmOrcamento.Ac_Incluir_Campo_CustomizadoExecute(Sender: TObject);
begin
  inherited;
  ppvCarregarCamposCustomizados;

  pcPrincipal.ActivePage := tabDetail;
  pcCadastroDetail.ActivePage := tabCadastroCampoCustomizavel;
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
        Result := true;
    end;

end;

procedure TfrmOrcamento.ppvCarregarCamposCustomizados;
var
  vaModelo: TStream;
  vaMatchesCampo: TMatchCollection;
  vaMatchCampo: TMatch;
  vaCampo, vaConteudo: String;
  i: Integer;
begin
  ppvLimparEditsCamposCustomizados;

  if fpvLocalizarModeloOrcamento(dmEstoque.cdsOrcamentoID_MODELO_ORCAMENTO.AsInteger) then
    begin
      dmEstoque.cdsOrcamento_Customizado.DisableControls;
      vaModelo := TBytesStream.Create;
      try
        RichAux.Lines.Clear;
        dmLookup.cdslkModelo_Orcamento_OrcamentoMODELO.SaveToStream(vaModelo);
        vaModelo.Position := 0;
        RichAux.Lines.LoadFromStream(vaModelo);

        FCamposCustomizados.Clear;

        for i := 0 to RichAux.Lines.Count - 1 do
          begin
            vaMatchesCampo := TRegEx.Matches(RichAux.Lines[i], '(?<=' + TRegEx.Escape(coInicioMarcador) + ').+?(?=' + TRegEx.Escape(coFimMarcador)
              + ')', []);

            for vaMatchCampo in vaMatchesCampo do
              begin
                if not FCamposCustomizados.ContainsKey(vaMatchCampo.Value) then
                  begin
                    vaConteudo := '';
                    if dmEstoque.cdsOrcamento_Customizado.Locate(dmEstoque.cdsOrcamento_CustomizadoCAMPO.FieldName, vaCampo, [loCaseInsensitive]) then
                      vaConteudo := dmEstoque.cdsOrcamento_CustomizadoCONTEUDO.AsString
                    else
                      begin
                        dmEstoque.cdsOrcamento_Customizado.Append;
                        dmEstoque.cdsOrcamento_CustomizadoID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('ORCAMENTO_CUSTOMIZADO');
                        dmEstoque.cdsOrcamento_CustomizadoCAMPO.AsString := vaCampo;
                        dmEstoque.cdsOrcamento_Customizado.Post;
                      end;

                    ppvAdicionarCampoCustomizado(vaCampo, vaConteudo);
                  end;
              end;
          end;

        dmEstoque.cdsOrcamento_Customizado.First;
        while dmEstoque.cdsOrcamento_Customizado.Eof do
          begin
            if not FCamposCustomizados.ContainsKey(dmEstoque.cdsOrcamento_CustomizadoCAMPO.AsString) then
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
  vaPanel.Width := 0;
  vaPanel.Height := 22;
  vaPanel.Caption := '';
  vaPanel.Align := alTop;
  vaPanel.Parent := ScrollCampos;

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
  vaLabel.Caption := ipCampo;
  vaLabel.Height := 21;
  vaLabel.Align := AlLeft;
  vaLabel.Parent := vaPanel;

  vaEdit := TcxTextEdit.Create(Self);
  vaEdit.Height := 21;
  vaEdit.Align := alClient;
  vaEdit.Parent := vaPanel;
  if ipConteudo <> '' then
    vaEdit.Text := ipConteudo;

  FCamposCustomizados.AddOrSetValue(ipCampo, vaEdit);
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
              cbModelo.LockChangeEvents(true);
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

  pcCadastroDetail.Properties.HideTabs := true;

  FCamposCustomizados := TDictionary<String, TcxTextEdit>.Create;
  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);

  dmLookup.cdslkItem.ppuAddParametro(TParametros.coTipo, Ord(tiMuda).ToString + ', ' + Ord(tiSemente).ToString());
  dmLookup.cdslkItem.ppuDataRequest();
  
  dmLookup.cdslkModelo_Orcamento.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
  dmLookup.ppuAbrirCache(dmLookup.cdslkModelo_Orcamento);
  
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
  ppvCarregarClientes;
end;

procedure TfrmOrcamento.FormDestroy(Sender: TObject);
begin
  inherited;
  FCamposCustomizados.Free;
end;

procedure TfrmOrcamento.pprAfterSalvarDetail(ipAcaoExecutada: TDataSetState);
var
  vaOrcamento: TBytesStream;
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
      if ipAcaoExecutada = dsInsert then
        begin
          // se estava incluindo nao posso dar apply pq o codigo estara o mesmo do cds principal o que causaria um key violation
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

      if dmEstoque.cdsOrcamento_Customizado.ChangeCount > 0 then
        dmEstoque.cdsOrcamento_Customizado.ApplyUpdates(0);
    end
  else if pcCadastroDetail.ActivePage = tabPreVisualizacao then
    begin
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

procedure TfrmOrcamento.ppuIncluir;
begin
  inherited;
  dmEstoque.cdsOrcamentoDATA.AsDateTime := now;
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
  dmLookup.cdslkFin_For_Cli.ppuDataRequest([TParametros.coTipo], [Ord(tfCliente)], TOperadores.coAnd, true);
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

function TfrmOrcamento.fprHabilitarSalvarDetail: Boolean;
begin
  if pcCadastroDetail.ActivePage = tabCadastroItem then
    Result := inherited
  else
    Result := true;
end;

end.
