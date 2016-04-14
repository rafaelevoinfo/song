unit fConta_Receber;

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
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuFinanceiro, uControleAcesso,
  System.TypInfo, uTypes, dmuLookup, cxMemo, cxDBEdit, dmuPrincipal,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalc, cxCurrencyEdit,
  cxSpinEdit, dxCheckGroupBox, Datasnap.DBClient, uClientDataSet, uUtils,
  System.Math, System.DateUtils, uMensagem;

type
  TfrmContaReceber = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailVENCIMENTO: TcxGridDBColumn;
    viewRegistrosDetailVALOR: TcxGridDBColumn;
    viewRegistrosDetailPARCELA: TcxGridDBColumn;
    Label3: TLabel;
    EditDescricao: TcxDBTextEdit;
    Label7: TLabel;
    EditObservacao: TcxDBMemo;
    Label17: TLabel;
    cbContaCorrente: TcxDBLookupComboBox;
    Label4: TLabel;
    cbClienteFinanciador: TcxDBLookupComboBox;
    cbPlanoContas: TcxDBLookupComboBox;
    Label5: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    cbFormaPagamento: TcxDBImageComboBox;
    EditValorTotal: TcxDBCurrencyEdit;
    rgParcelas: TcxGroupBox;
    Label9: TLabel;
    EditQtdeParcelas: TcxSpinEdit;
    cxGrid1: TcxGrid;
    viewParcelas: TcxGridDBTableView;
    viewParcelasID: TcxGridDBColumn;
    viewParcelasID_CONTA_PAGAR: TcxGridDBColumn;
    viewParcelasVENCIMENTO: TcxGridDBColumn;
    viewParcelasVALOR: TcxGridDBColumn;
    viewParcelasPARCELA: TcxGridDBColumn;
    levelGrid1Level1: TcxGridLevel;
    Label11: TLabel;
    btnIncluirParcelas: TButton;
    Ac_Gerar_Parcelas: TAction;
    rgVinculos: TcxGroupBox;
    Label10: TLabel;
    Label12: TLabel;
    cxGrid2: TcxGrid;
    viewVinculos: TcxGridDBTableView;
    level1: TcxGridLevel;
    btnAddProjeto: TButton;
    btnAddAtividade: TButton;
    Ac_Incluir_Vinculo_Projeto: TAction;
    Ac_Incluir_Vinculo_Atividade: TAction;
    dsVinculos: TDataSource;
    viewVinculosID: TcxGridDBColumn;
    viewVinculosTIPO: TcxGridDBColumn;
    viewVinculosNOME: TcxGridDBColumn;
    ColumnDeletarVinculo: TcxGridDBColumn;
    Ac_Excluir_Vinculo: TAction;
    EditVencimentoParcela: TcxDateEdit;
    cbProjeto: TcxLookupComboBox;
    cbAtividade: TcxLookupComboBox;
    cbPesquisaClienteFinanciador: TcxLookupComboBox;
    cbPesquisaPlanoConta: TcxLookupComboBox;
    btnBaixarReabrir: TButton;
    Ac_Baixar_Reabrir: TAction;
    viewRegistrosDetailSTATUS: TcxGridDBColumn;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_CLIENTE_FINANCIADOR: TcxGridDBColumn;
    viewRegistrosID_PLANO_CONTAS: TcxGridDBColumn;
    viewRegistrosID_CONTA_CORRENTE: TcxGridDBColumn;
    viewRegistrosDESCRICAO: TcxGridDBColumn;
    viewRegistrosVALOR_TOTAL: TcxGridDBColumn;
    viewRegistrosFORMA_PAGTO: TcxGridDBColumn;
    viewRegistrosNOME_FANTASIA: TcxGridDBColumn;
    viewRegistrosPLANO_CONTAS: TcxGridDBColumn;
    viewRegistrosCONTA_CORRENTE: TcxGridDBColumn;
    viewRegistrosDetailDATA_RECEBIMENTO: TcxGridDBColumn;
    viewRegistrosNUMERO_DOCUMENTO: TcxGridDBColumn;
    Label13: TLabel;
    EditNroDocumento: TcxDBTextEdit;
    cdsLocalVinculo: TClientDataSet;
    cdsLocalVinculoID: TIntegerField;
    cdsLocalVinculoTIPO: TIntegerField;
    cdsLocalVinculoNOME: TStringField;
    cdsLocalVinculoID_PROJETO_AREA: TIntegerField;
    cdsLocalVinculoAREA: TStringField;
    lbl2: TLabel;
    cbAreaProjeto: TcxLookupComboBox;
    lbl3: TLabel;
    cbAreaAtividade: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cbProjetoPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Incluir_Vinculo_ProjetoExecute(Sender: TObject);
    procedure Ac_Incluir_Vinculo_AtividadeExecute(Sender: TObject);
    procedure Ac_Gerar_ParcelasExecute(Sender: TObject);
    procedure Ac_Excluir_VinculoExecute(Sender: TObject);
    procedure Ac_Baixar_ReabrirUpdate(Sender: TObject);
    procedure Ac_Baixar_ReabrirExecute(Sender: TObject);
    procedure viewRegistrosDetailCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure cbAtividadePropertiesEditValueChanged(Sender: TObject);
  private
    dmFinanceiro: TdmFinanceiro;
    dmLookup: TdmLookup;
    procedure ppvAddVinculo(ipId, ipTipo: Integer; ipNome: string; ipIdArea: Integer; ipArea: String);
    procedure ppvAdicionarParcela(ipParcela: Integer; ipVencimento: TDate;
      ipValor: Double);
    procedure ppvBaixarParcela;
    procedure ppvReabrirParcela;
  protected
    function fprGetPermissao: string; override;
    procedure pprBeforeSalvar; override;
    procedure pprExecutarSalvar; override;
    procedure pprBeforeAlterar; override;
    procedure pprBeforeIncluir; override;
    procedure pprValidarDados; override;
    procedure pprEfetuarPesquisa; override;
    function fprHabilitarSalvar(): Boolean; override;
    function fprHabilitarAlterarDetail: Boolean; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
  public
    procedure ppuIncluir; override;
  public const
    coProjeto = 1;
    coAtividade = 2;

    coPesquisaDescricao = 5;
    coPesquisaClienteFinanciador = 6;
    coPesquisaPlanoConta = 7;

  end;

var
  frmContaReceber: TfrmContaReceber;

implementation

{$R *.dfm}

{ TfrmContaPagar }

procedure TfrmContaReceber.pprBeforeAlterar;
begin
  inherited;
  EditQtdeParcelas.Value := 1;
  EditVencimentoParcela.Clear;

  if cdsLocalVinculo.Active then
    cdsLocalVinculo.EmptyDataSet;

  TUtils.ppuPercorrerCds(dmFinanceiro.cdsConta_Receber_Projeto,
    procedure
    begin
      ppvAddVinculo(dmFinanceiro.cdsConta_Receber_ProjetoID_PROJETO.AsInteger, coProjeto,
        dmFinanceiro.cdsConta_Receber_ProjetoPROJETO.AsString, dmFinanceiro.cdsConta_Receber_ProjetoID_PROJETO_AREA.AsInteger,
        dmFinanceiro.cdsConta_Receber_ProjetoAREA.AsString);
    end);

  TUtils.ppuPercorrerCds(dmFinanceiro.cdsConta_Receber_Atividade,
    procedure
    begin
      ppvAddVinculo(dmFinanceiro.cdsConta_Receber_AtividadeID_ATIVIDADE.AsInteger, coAtividade,
        dmFinanceiro.cdsConta_Receber_AtividadeATIVIDADE.AsString, dmFinanceiro.cdsConta_Receber_AtividadeID_PROJETO_AREA.AsInteger,
        dmFinanceiro.cdsConta_Receber_AtividadeAREA.AsString);
    end);
end;

procedure TfrmContaReceber.pprBeforeIncluir;
begin
  inherited;
  if cdsLocalVinculo.Active then
    cdsLocalVinculo.EmptyDataSet;

  EditQtdeParcelas.Value := 1;
end;

procedure TfrmContaReceber.pprBeforeSalvar;
begin
  inherited;
  dmFinanceiro.cdsConta_Receber_Projeto.DisableControls;
  dmFinanceiro.cdsConta_Receber_Atividade.DisableControls;
  try
    // vamos remover os registros nao existem mais
    dmFinanceiro.cdsConta_Receber_Projeto.First;
    while not dmFinanceiro.cdsConta_Receber_Projeto.Eof do
      begin
        if cdsLocalVinculo.Active and cdsLocalVinculo.Locate('ID;TIPO;ID_PROJETO_AREA',
          VarArrayOf([dmFinanceiro.cdsConta_Receber_ProjetoID_PROJETO.AsInteger, coProjeto,
          dmFinanceiro.cdsConta_Receber_ProjetoID_PROJETO_AREA.AsInteger]), []) then
          dmFinanceiro.cdsConta_Receber_Projeto.Next
        else
          dmFinanceiro.cdsConta_Receber_Projeto.Delete;
      end;

    // vamos remover os registros nao existem mais
    dmFinanceiro.cdsConta_Receber_Atividade.First;
    while not dmFinanceiro.cdsConta_Receber_Atividade.Eof do
      begin
        if cdsLocalVinculo.Active and cdsLocalVinculo.Locate('ID;TIPO;ID_PROJETO_AREA',
          VarArrayOf([dmFinanceiro.cdsConta_Receber_AtividadeID_ATIVIDADE.AsInteger,
          coAtividade, dmFinanceiro.cdsConta_Receber_AtividadeID_PROJETO_AREA.AsInteger]), [])
        then
          dmFinanceiro.cdsConta_Receber_Atividade.Next
        else
          dmFinanceiro.cdsConta_Receber_Atividade.Delete;
      end;

    TUtils.ppuPercorrerCds(cdsLocalVinculo,
      procedure
      begin
        if cdsLocalVinculoTIPO.AsInteger = coProjeto then
          begin
            if not dmFinanceiro.cdsConta_Receber_Projeto.Locate(dmFinanceiro.cdsConta_Receber_ProjetoID_PROJETO.FieldName,
              cdsLocalVinculoID.AsInteger, [])
            then
              begin
                dmFinanceiro.cdsConta_Receber_Projeto.Append;
                dmFinanceiro.cdsConta_Receber_ProjetoID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_RECEBER_PROJETO');
                dmFinanceiro.cdsConta_Receber_ProjetoID_CONTA_RECEBER.AsInteger := dmFinanceiro.cdsConta_ReceberID.AsInteger;
                dmFinanceiro.cdsConta_Receber_ProjetoID_PROJETO.AsInteger := cdsLocalVinculoID.AsInteger;
                dmFinanceiro.cdsConta_Receber_ProjetoID_PROJETO_AREA.AsInteger := cdsLocalVinculoID_PROJETO_AREA.AsInteger;
                dmFinanceiro.cdsConta_Receber_Projeto.Post;
              end;
          end
        else
          begin
            if not dmFinanceiro.cdsConta_Receber_Atividade.Locate(dmFinanceiro.cdsConta_Receber_AtividadeID_ATIVIDADE.FieldName,
              cdsLocalVinculoID.AsInteger, [])
            then
              begin
                dmFinanceiro.cdsConta_Receber_Atividade.Append;
                dmFinanceiro.cdsConta_Receber_AtividadeID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_RECEBER_ATIVIDADE');
                dmFinanceiro.cdsConta_Receber_AtividadeID_CONTA_RECEBER.AsInteger := dmFinanceiro.cdsConta_ReceberID.AsInteger;
                dmFinanceiro.cdsConta_Receber_AtividadeID_ATIVIDADE.AsInteger := cdsLocalVinculoID.AsInteger;
                dmFinanceiro.cdsConta_Receber_AtividadeID_PROJETO_AREA.AsInteger := cdsLocalVinculoID_PROJETO_AREA.AsInteger;
                dmFinanceiro.cdsConta_Receber_Atividade.Post;
              end;
          end;
      end);
  finally
    dmFinanceiro.cdsConta_Receber_Projeto.EnableControls;
    dmFinanceiro.cdsConta_Receber_Atividade.EnableControls;
  end;
end;

procedure TfrmContaReceber.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaDescricao then
    ipCds.ppuAddParametro(TParametros.coDescricao, EditPesquisa.Text)
  else if cbPesquisarPor.EditValue = coPesquisaClienteFinanciador then
    ipCds.ppuAddParametro(TParametros.coClienteFinanciador, cbPesquisaClienteFinanciador.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaPlanoConta then
    ipCds.ppuAddParametro(TParametros.coPlanoConta, cbPesquisaPlanoConta.EditValue)

end;

procedure TfrmContaReceber.pprEfetuarPesquisa;
begin
  dmFinanceiro.cdsConta_Receber_Projeto.Close;
  dmFinanceiro.cdsConta_Receber_Atividade.Close;
  inherited;
  dmFinanceiro.cdsConta_Receber_Projeto.Open;
  dmFinanceiro.cdsConta_Receber_Atividade.Open;
end;

procedure TfrmContaReceber.pprExecutarSalvar;
begin
  inherited;
  if dmFinanceiro.cdsConta_Receber.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Receber.ApplyUpdates(0);

  if dmFinanceiro.cdsConta_Receber_Parcela.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Receber_Parcela.ApplyUpdates(0);

  if dmFinanceiro.cdsConta_Receber_Projeto.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Receber_Projeto.ApplyUpdates(0);

  if dmFinanceiro.cdsConta_Receber_Atividade.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Receber_Atividade.ApplyUpdates(0);
end;

procedure TfrmContaReceber.pprValidarDados;
var
  vaValorParcelado: Double;
begin
  inherited;
  vaValorParcelado := 0;
  TUtils.ppuPercorrerCds(dmFinanceiro.cdsConta_Receber_Parcela,
    procedure
    begin
      vaValorParcelado := vaValorParcelado + dmFinanceiro.cdsConta_Receber_ParcelaVALOR.AsFloat;
    end);

  if dmFinanceiro.cdsConta_Receber_Parcela.RecordCount <> 0 then
    begin
      if not SameValue(vaValorParcelado, dmFinanceiro.cdsConta_ReceberVALOR_TOTAL.AsFloat) then
        raise Exception.Create('O valor total está diferente do valor parcelado.');
    end
  else
    raise Exception.Create('É necessário gerar pelo menos uma parcela.');
end;

procedure TfrmContaReceber.ppuIncluir;
begin
  inherited;
  dmFinanceiro.cdsConta_ReceberID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_RECEBER');
end;

procedure TfrmContaReceber.ppvAddVinculo(ipId, ipTipo: Integer; ipNome: string; ipIdArea: Integer; ipArea: String);
begin
  if not cdsLocalVinculo.Active then
    cdsLocalVinculo.CreateDataSet;

  cdsLocalVinculo.Append;
  cdsLocalVinculoID.AsInteger := ipId;
  cdsLocalVinculoTIPO.AsInteger := ipTipo;
  cdsLocalVinculoNOME.AsString := ipNome;
  cdsLocalVinculoID_PROJETO_AREA.AsInteger := ipIdArea;
  cdsLocalVinculoAREA.AsString := ipArea;
  cdsLocalVinculo.Post;
end;

procedure TfrmContaReceber.Ac_Excluir_VinculoExecute(Sender: TObject);
begin
  inherited;
  cdsLocalVinculo.Delete;
end;

procedure TfrmContaReceber.Ac_Gerar_ParcelasExecute(Sender: TObject);
var
  vaValorParcela: Double;
  vaValorParcelado: Double;
  I: Integer;
begin
  inherited;
  if dmFinanceiro.cdsConta_ReceberVALOR_TOTAL.IsNull then
    raise Exception.Create('Informe o valor total para que seja possível gerar as parcelas.');

  if VarIsNull(EditQtdeParcelas.Value) then
    raise Exception.Create('Informe o valor total para que seja possível gerar as parcelas.');

  if VarIsNull(EditVencimentoParcela.EditValue) then
    raise Exception.Create('Informe o vencimento da primeira parcela.');

  dmFinanceiro.cdsConta_Receber_Parcela.DisableControls;
  try
    dmFinanceiro.cdsConta_Receber_Parcela.First;
    while not dmFinanceiro.cdsConta_Receber_Parcela.Eof do
      dmFinanceiro.cdsConta_Receber_Parcela.Delete;

    vaValorParcela := dmFinanceiro.cdsConta_ReceberVALOR_TOTAL.AsFloat / EditQtdeParcelas.Value;
    vaValorParcelado := 0;
    for I := 1 to EditQtdeParcelas.Value do
      begin
        vaValorParcela := RoundTo(vaValorParcela, -2); // arredonda para 2 casas

        if I = EditQtdeParcelas.Value then
          vaValorParcela := dmFinanceiro.cdsConta_ReceberVALOR_TOTAL.AsFloat - vaValorParcelado
        else
          vaValorParcelado := vaValorParcelado + vaValorParcela;

        ppvAdicionarParcela(I, IncMonth(EditVencimentoParcela.Date, I - 1), vaValorParcela);
      end;
  finally
    dmFinanceiro.cdsConta_Receber_Parcela.EnableControls;
  end;

end;

procedure TfrmContaReceber.ppvAdicionarParcela(ipParcela: Integer; ipVencimento: TDate; ipValor: Double);
begin
  dmFinanceiro.cdsConta_Receber_Parcela.Append;
  dmFinanceiro.cdsConta_Receber_ParcelaID.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId('CONTA_RECEBER_PARCELA');
  dmFinanceiro.cdsConta_Receber_ParcelaVENCIMENTO.AsDateTime := ipVencimento;
  dmFinanceiro.cdsConta_Receber_ParcelaPARCELA.AsInteger := ipParcela;
  dmFinanceiro.cdsConta_Receber_ParcelaVALOR.AsFloat := ipValor;
  dmFinanceiro.cdsConta_Receber_Parcela.Post;
end;

procedure TfrmContaReceber.Ac_Incluir_Vinculo_AtividadeExecute(Sender: TObject);
begin
  inherited;
  if not VarIsNull(cbAtividade.EditValue) then
    begin
      if not VarIsNull(cbAreaAtividade.EditValue) then
        begin
          if dmLookup.cdslkAtividade.Locate(TBancoDados.coId, cbAtividade.EditValue, []) then
            begin
              ppvAddVinculo(cbAtividade.EditValue, coAtividade, cbAtividade.Text, cbAreaAtividade.EditValue, cbAreaAtividade.Text);
            end;
        end
      else
        TMensagem.ppuShowMessage('Informe a área da atividade.');
    end
  else
    TMensagem.ppuShowMessage('Informe com qual atividade deseja realizar o vinculo.');
end;

procedure TfrmContaReceber.Ac_Incluir_Vinculo_ProjetoExecute(Sender: TObject);
begin
  inherited;
  if not VarIsNull(cbProjeto.EditValue) then
    begin
      if not VarIsNull(cbAreaProjeto.EditValue) then
        begin
          if dmLookup.cdslkProjeto.Locate(TBancoDados.coId, cbProjeto.EditValue, []) then
            begin
              ppvAddVinculo(cbProjeto.EditValue, coProjeto, cbProjeto.Text, cbAreaProjeto.EditValue, cbAreaProjeto.Text);
            end;
        end
      else
        TMensagem.ppuShowMessage('Informe a área do projeto.');
    end
  else
    TMensagem.ppuShowMessage('Informe com qual projeto deseja realizar o vinculo.');
end;

procedure TfrmContaReceber.Ac_Baixar_ReabrirExecute(Sender: TObject);
begin
  inherited;
  if dmFinanceiro.cdsConta_Receber_ParcelaSTATUS.AsInteger = 0 then
    ppvBaixarParcela
  else
    ppvReabrirParcela;
end;

procedure TfrmContaReceber.ppvBaixarParcela;
begin
  dmFinanceiro.cdsConta_Receber_Parcela.Edit;
  dmFinanceiro.cdsConta_Receber_ParcelaDATA_RECEBIMENTO.AsDateTime := Now;
  dmFinanceiro.cdsConta_Receber_ParcelaSTATUS.AsInteger := 1;
  dmFinanceiro.cdsConta_Receber_Parcela.Post;

  if dmFinanceiro.cdsConta_Receber_Parcela.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Receber_Parcela.ApplyUpdates(0);
end;

procedure TfrmContaReceber.ppvReabrirParcela;
begin
  dmFinanceiro.cdsConta_Receber_Parcela.Edit;
  dmFinanceiro.cdsConta_Receber_ParcelaDATA_RECEBIMENTO.Clear;
  dmFinanceiro.cdsConta_Receber_ParcelaSTATUS.AsInteger := 0;
  dmFinanceiro.cdsConta_Receber_Parcela.Post;

  if dmFinanceiro.cdsConta_Receber_Parcela.ChangeCount > 0 then
    dmFinanceiro.cdsConta_Receber_Parcela.ApplyUpdates(0);
end;

procedure TfrmContaReceber.viewRegistrosDetailCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.GridRecord.Values[viewRegistrosDetailSTATUS.Index] = 1 then
    begin
      ACanvas.Font.Color := clWhite;
      if AViewInfo.GridRecord.Selected then
        ACanvas.Brush.Color := $00274F00
      else
        ACanvas.Brush.Color := clGreen;
    end
  else if AViewInfo.GridRecord.Values[viewRegistrosDetailVENCIMENTO.Index] < Today then
    begin
      ACanvas.Font.Color := clWhite;
      if AViewInfo.GridRecord.Selected then
        ACanvas.Brush.Color := clMaroon
      else
        ACanvas.Brush.Color := clRed;
    end;

end;

procedure TfrmContaReceber.Ac_Baixar_ReabrirUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := dmFinanceiro.cdsConta_Receber_Parcela.Active and (dmFinanceiro.cdsConta_Receber_Parcela.RecordCount > 0);

  if dmFinanceiro.cdsConta_Receber_Parcela.Active and (dmFinanceiro.cdsConta_Receber_ParcelaSTATUS.AsInteger = 0) then
    begin
      Ac_Baixar_Reabrir.ImageIndex := 8;
      Ac_Baixar_Reabrir.Caption := 'Baixar Parcela';
    end
  else
    begin
      Ac_Baixar_Reabrir.ImageIndex := 3;
      Ac_Baixar_Reabrir.Caption := 'Reabrir Parcela';
    end;
end;

procedure TfrmContaReceber.cbAtividadePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if not VarIsNull(cbAtividade.EditValue) then
    begin
      dmLookup.cdslkProjeto_Area_Atividade.ppuDataRequest([TParametros.coAtividade], [cbAtividade.EditValue], TOperadores.coAnd, true);
    end
  else
    begin
      dmLookup.cdslkProjeto_Area_Atividade.Close;
    end;
end;

procedure TfrmContaReceber.cbProjetoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if not VarIsNull(cbProjeto.EditValue) then
    begin
      dmLookup.cdslkAtividade.ppuLimparParametros;
      dmLookup.cdslkAtividade.ppuAddParametro(TParametros.coProjeto, cbProjeto.EditValue);
      dmLookup.cdslkAtividade.ppuAddParametro(TParametros.coStatusDiferente, Ord(saCancelada).ToString + ';' + Ord(saFinalizada).ToString,
        TOperadores.coOR);
      dmLookup.cdslkAtividade.ppuDataRequest();
      dmLookup.cdslkProjeto_Area.ppuDataRequest([TParametros.coProjeto], [cbProjeto.EditValue], TOperadores.coAnd, true);
    end
  else
    begin
      dmLookup.cdslkAtividade.Close;
      dmLookup.cdslkProjeto_Area.Close;
      dmLookup.cdslkProjeto_Area_Atividade.Close;
    end;
end;

procedure TfrmContaReceber.FormCreate(Sender: TObject);
begin
  dmFinanceiro := TdmFinanceiro.Create(Self);
  dmFinanceiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  PesquisaPadrao := tppData;

  EditDataInicialPesquisa.Date := Now;
  EditDataFinalPesquisa.Date := IncDay(Now, 7);

  dmLookup.cdslkFin_For_Cli.ppuDataRequest([TParametros.coTipo], ['1' + coDelimitadorPadrao + '3'], TOperadores.coAnd, true);
  dmLookup.cdslkPlano_Contas.ppuDataRequest([TParametros.coTipo], [Ord(tpcReceita)], TOperadores.coAnd, true);
  dmLookup.cdslkConta_Corrente.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);

  dmLookup.cdslkProjeto.ppuDataRequest([TParametros.coStatusDiferente],
    [Ord(spRecusado).ToString + ';' + Ord(spExecutado).ToString + ';' + Ord(spCancelado).ToString]);
end;

function TfrmContaReceber.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaClienteFinanciador.Visible := cbPesquisarPor.EditValue = coPesquisaClienteFinanciador;
  cbPesquisaPlanoConta.Visible := cbPesquisarPor.EditValue = coPesquisaPlanoConta;
  EditPesquisa.Visible := EditPesquisa.Visible and (not(cbPesquisaClienteFinanciador.Visible or cbPesquisaPlanoConta.Visible));

  if cbPesquisaClienteFinanciador.Visible then
    Result := cbPesquisaClienteFinanciador
  else if cbPesquisaPlanoConta.Visible then
    Result := cbPesquisaPlanoConta;
end;

function TfrmContaReceber.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finContaReceber));
end;

function TfrmContaReceber.fprHabilitarAlterarDetail: Boolean;
begin
  //nao chamar o inherited
  Result := False;
end;

function TfrmContaReceber.fprHabilitarSalvar: Boolean;
begin
  Result := inherited or fprHabilitarSalvarDetail or (cdsLocalVinculo.Active and (cdsLocalVinculo.ChangeCount > 0));
end;

end.
