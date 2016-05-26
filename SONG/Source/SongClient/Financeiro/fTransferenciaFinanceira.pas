unit fTransferenciaFinanceira;

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
  Vcl.ExtCtrls, cxPC, dmuFinanceiro, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, uClientDataSet, System.TypInfo, uControleAcesso,
  uExceptions, dmuLookup, uTypes, cxCurrencyEdit, cxDBEdit, dmuPrincipal,
  Datasnap.DBClient, System.DateUtils;

type
  TfrmTransferenciaFinanceira = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosVALOR: TcxGridDBColumn;
    viewRegistrosORIGEM: TcxGridDBColumn;
    viewRegistrosDESTINO: TcxGridDBColumn;
    cbPesquisaProjeto: TcxLookupComboBox;
    cbPesquisaFundo: TcxLookupComboBox;
    viewRegistrosID_FUNDO_ORIGEM: TcxGridDBColumn;
    viewRegistrosID_FUNDO_DESTINO: TcxGridDBColumn;
    viewRegistrosID_PROJETO_RUBRICA_ORIGEM: TcxGridDBColumn;
    viewRegistrosID_PROJETO_RUBRICA_DESTINO: TcxGridDBColumn;
    viewRegistrosFUNDO_ORIGEM: TcxGridDBColumn;
    viewRegistrosFUNDO_DESTINO: TcxGridDBColumn;
    viewRegistrosRUBRICA_ORIGEM: TcxGridDBColumn;
    viewRegistrosRUBRICA_DESTINO: TcxGridDBColumn;
    viewRegistrosID_PESSOA: TcxGridDBColumn;
    viewRegistrosRESPONSAVEL: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    rgTipoTransferencia: TcxRadioGroup;
    gbOrigem: TcxGroupBox;
    pnOrigemProjeto: TPanel;
    pnOrigemFundo: TPanel;
    cbProjetoOrigem: TcxLookupComboBox;
    Label4: TLabel;
    lb1: TLabel;
    cbRubricaOrigem: TcxDBLookupComboBox;
    lb2: TLabel;
    cbFundoOrigem: TcxDBLookupComboBox;
    Label8: TLabel;
    EditValor: TcxDBCurrencyEdit;
    gbDestino: TcxGroupBox;
    pnDestinoProjeto: TPanel;
    lb3: TLabel;
    lb4: TLabel;
    cbProjetoDestino: TcxLookupComboBox;
    cbRubricaDestino: TcxDBLookupComboBox;
    pnDestinoFundo: TPanel;
    Label3: TLabel;
    cbFundoDestino: TcxDBLookupComboBox;
    dsLocalRubricasOrigem: TDataSource;
    cdsLocalRubricasOrigem: TClientDataSet;
    cdsLocalRubricasOrigemID: TIntegerField;
    dsLocalRubricasDestino: TDataSource;
    cdsLocalRubricasDestino: TClientDataSet;
    IntegerField1: TIntegerField;
    cdsLocalRubricasOrigemNOME_RUBRICA: TStringField;
    cdsLocalRubricasDestinoNOME_RUBRICA: TStringField;
    cdsLocalRubricasOrigemSALDO_REAL: TFMTBCDField;
    cdsLocalRubricasDestinoSALDO_REAL: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure cbProjetoOrigemPropertiesEditValueChanged(Sender: TObject);
    procedure cbProjetoDestinoPropertiesEditValueChanged(Sender: TObject);
    procedure rgTipoTransferenciaPropertiesEditValueChanged(Sender: TObject);
  private
    dmFinanceiro: TdmFinanceiro;
    dmLookup: TdmLookup;
  protected
    function fprGetPermissao: String; override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprValidarPesquisa; override;
    procedure pprValidarDados; override;
    procedure pprBeforeSalvar; override;
    function fprHabilitarAlterar: Boolean; override;
    function fprHabilitarExcluir: Boolean; override;
  public
    procedure ppuIncluir; override;
  public const
    coPesquisaFundo = 5;
    coPesquisaProjeto = 6;
    coPesquisaResponsavel = 7;

    coProjetoFundo = 0;
    coProjetoProjeto = 1;
    coFundoProjeto = 2;
    coFundoFundo = 3;
  end;

var
  frmTransferenciaFinanceira: TfrmTransferenciaFinanceira;

implementation

{$R *.dfm}

{ TfrmTransferenciaFinanceira }

procedure TfrmTransferenciaFinanceira.cbProjetoDestinoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if cdsLocalRubricasDestino.Active then
    cdsLocalRubricasDestino.EmptyDataSet;

  if not VarIsNull(cbProjetoDestino.EditValue) then
    dmLookup.cdslkProjeto_Rubrica.ppuDataRequest([TParametros.coProjeto], [cbProjetoDestino.EditValue], TOperadores.coAnd, True)
  else
    dmLookup.cdslkProjeto_Rubrica.Close;

  cdsLocalRubricasDestino.Data := dmLookup.cdslkProjeto_Rubrica.Data;

end;

procedure TfrmTransferenciaFinanceira.cbProjetoOrigemPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if cdsLocalRubricasOrigem.Active then
    cdsLocalRubricasOrigem.EmptyDataSet;

  if not VarIsNull(cbProjetoOrigem.EditValue) then
    dmLookup.cdslkProjeto_Rubrica.ppuDataRequest([TParametros.coProjeto], [cbProjetoOrigem.EditValue], TOperadores.coAnd, True)
  else
    dmLookup.cdslkProjeto_Rubrica.Close;

  cdsLocalRubricasOrigem.Data := dmLookup.cdslkProjeto_Rubrica.Data;
end;

procedure TfrmTransferenciaFinanceira.FormCreate(Sender: TObject);
begin
  dmFinanceiro := TdmFinanceiro.Create(Self);
  dmFinanceiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;

  PesquisaPadrao := Ord(tppData);
  EditDataInicialPesquisa.Date := IncDay(Now, -7);
  EditDataFinalPesquisa.Date := Now;

  gbOrigem.Height := pnOrigemProjeto.Height + 25;
  gbDestino.Height := pnDestinoProjeto.Height + 25;

  dmLookup.cdslkProjeto.ppuDataRequest([TParametros.coStatusDiferente],
    [Ord(spRecusado).ToString + ';' + Ord(spExecutado).ToString + ';' + Ord(spCancelado).ToString]);

  dmLookup.cdslkFundo.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);
end;

function TfrmTransferenciaFinanceira.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaFundo.Visible := cbPesquisarPor.EditValue = coPesquisaFundo;
  cbPesquisaProjeto.Visible := cbPesquisarPor.EditValue = coPesquisaProjeto;
  EditPesquisa.Visible := EditPesquisa.Visible and not(cbPesquisaProjeto.Visible or cbPesquisaFundo.Visible);

  if cbPesquisaProjeto.Visible then
    Result := cbPesquisaProjeto
  else if cbPesquisaFundo.Visible then
    Result := cbPesquisaFundo;
end;

function TfrmTransferenciaFinanceira.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finTransferencia));
end;

function TfrmTransferenciaFinanceira.fprHabilitarAlterar: Boolean;
begin
  Result := false;
end;

function TfrmTransferenciaFinanceira.fprHabilitarExcluir: Boolean;
begin
  Result := false;
end;

procedure TfrmTransferenciaFinanceira.pprBeforeSalvar;
begin
  inherited;
  if rgTipoTransferencia.EditValue = coProjetoFundo then
    begin
      dmFinanceiro.cdsTransferencia_FinanceiraID_FUNDO_ORIGEM.Clear;
      dmFinanceiro.cdsTransferencia_FinanceiraID_PROJETO_RUBRICA_DESTINO.Clear;
    end
  else if rgTipoTransferencia.EditValue = coProjetoProjeto then
    begin
      dmFinanceiro.cdsTransferencia_FinanceiraID_FUNDO_ORIGEM.Clear;
      dmFinanceiro.cdsTransferencia_FinanceiraID_FUNDO_DESTINO.Clear;
    end
  else if rgTipoTransferencia.EditValue = coFundoFundo then
    begin
      dmFinanceiro.cdsTransferencia_FinanceiraID_PROJETO_RUBRICA_ORIGEM.Clear;
      dmFinanceiro.cdsTransferencia_FinanceiraID_PROJETO_RUBRICA_DESTINO.Clear;
    end
  else if rgTipoTransferencia.EditValue = coFundoProjeto then
    begin
      dmFinanceiro.cdsTransferencia_FinanceiraID_FUNDO_DESTINO.Clear;
      dmFinanceiro.cdsTransferencia_FinanceiraID_PROJETO_RUBRICA_ORIGEM.Clear;
    end

end;

procedure TfrmTransferenciaFinanceira.pprCarregarParametrosPesquisa(
  ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaFundo then
    ipCds.ppuAddParametro(TParametros.coFundo, cbPesquisaFundo.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaProjeto then
    ipCds.ppuAddParametro(TParametros.coProjeto, cbPesquisaProjeto.EditValue);
end;

procedure TfrmTransferenciaFinanceira.pprValidarDados;
begin
  inherited;

  if VarToStr(rgTipoTransferencia.EditValue).ToInteger in [coFundoProjeto, coFundoFundo] then
    begin
      if VarIsNull(cbFundoOrigem.EditValue) then
        raise TControlException.Create('Informe a conta de origem do recurso.', cbFundoOrigem);

      if rgTipoTransferencia.EditValue = coFundoFundo then
        begin
          if VarIsNull(cbFundoDestino.EditValue) then
            raise TControlException.Create('Informe a conta de destino do recurso.', cbFundoDestino);

          if cbFundoOrigem.EditValue = cbFundoDestino.EditValue then
            raise Exception.Create('A conta de origem não pode ser a mesma de destino.');
        end;

      if dmLookup.cdslkFundo.Locate(TBancoDados.coId, cbFundoOrigem.EditValue, []) then
        begin
          if dmFinanceiro.cdsTransferencia_FinanceiraVALOR.AsFloat > dmLookup.cdslkFundoSALDO.AsFloat then
            raise TControlException.Create('A conta selecionada não possui saldo suficiente para realizar esta transferência.', cbFundoOrigem);
        end
      else
        raise Exception.Create('Conta de origem não encontrado.');

    end;

  if VarToStr(rgTipoTransferencia.EditValue).ToInteger in [coProjetoProjeto, coProjetoFundo] then
    begin
      if VarIsNull(cbRubricaOrigem.EditValue) then
        raise TControlException.Create('Informe o projeto e a rubrica de origem do recurso.', cbRubricaOrigem);

      if rgTipoTransferencia.EditValue = coProjetoProjeto then
        begin
          if VarIsNull(cbRubricaDestino.EditValue) then
            raise TControlException.Create('Informe a rubrica de destino do recurso.', cbRubricaDestino);

          if cbRubricaOrigem.EditValue = cbRubricaDestino.EditValue then
            raise Exception.Create('A rubrica de origem não pode ser a mesma de destino.');
        end;

      if cdsLocalRubricasOrigem.Locate(TBancoDados.coId, cbRubricaOrigem.EditValue, []) then
        begin
          if dmFinanceiro.cdsTransferencia_FinanceiraVALOR.AsFloat > cdsLocalRubricasOrigemSALDO_REAL.AsFloat then
            raise TControlException.Create('A rubrica selecionada não possui saldo suficiente para realizar esta transferência.', cbRubricaOrigem);
        end
      else
        raise Exception.Create('Rubrica de origem não encontrada.');

    end;

end;

procedure TfrmTransferenciaFinanceira.pprValidarPesquisa;
begin
  inherited;
  if cbPesquisaFundo.Visible and VarIsNull(cbPesquisaFundo.EditValue) then
    raise TControlException.Create('Informe a conta a ser pesquisada.', cbPesquisaFundo);

  if cbPesquisaProjeto.Visible and VarIsNull(cbPesquisaProjeto.EditValue) then
    raise TControlException.Create('Informe o projeto a ser pesquisado.', cbPesquisaProjeto);
end;

procedure TfrmTransferenciaFinanceira.ppuIncluir;
begin
  inherited;
  rgTipoTransferencia.EditValue := coProjetoFundo;
  rgTipoTransferencia.PostEditValue;

  // vamos limpar os valores para garantir que vai carregar os valores atualizados
  cbProjetoOrigem.Clear;
  cbProjetoDestino.Clear;
  // vamos recarregar os fundos para atualizar os saldos
  dmLookup.cdslkFundo.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, True);

  dmFinanceiro.cdsTransferencia_FinanceiraID_PESSOA.AsInteger := TInfoLogin.fpuGetInstance.Usuario.Id;
  dmFinanceiro.cdsTransferencia_FinanceiraDATA.AsDateTime := StrToDateTime(dmPrincipal.FuncoesGeral.fpuDataHoraAtual);
end;

procedure TfrmTransferenciaFinanceira.rgTipoTransferenciaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  pnOrigemProjeto.Visible := VarToStr(rgTipoTransferencia.EditValue).ToInteger in [coProjetoProjeto, coProjetoFundo];
  pnDestinoProjeto.Visible := VarToStr(rgTipoTransferencia.EditValue).ToInteger in [coFundoProjeto, coProjetoProjeto];
  pnOrigemFundo.Visible := VarToStr(rgTipoTransferencia.EditValue).ToInteger in [coFundoProjeto, coFundoFundo];
  pnDestinoFundo.Visible := VarToStr(rgTipoTransferencia.EditValue).ToInteger in [coProjetoFundo, coFundoFundo];
end;

end.
