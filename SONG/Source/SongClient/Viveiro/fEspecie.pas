unit fEspecie;

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
  Vcl.ExtCtrls, cxPC, dmuViveiro, uControleAcesso, System.TypInfo, uTypes,
  cxMemo, cxDBEdit, uClientDataSet, cxLocalization, cxCalc, cxCurrencyEdit,
  dmuLookup, cxSpinEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.ExtDlgs, cxCheckBox, cxCheckGroup, uUtils, uExceptions, cxCheckComboBox,
  fFamilia_Botanica;

type
  TfrmEspecie = class(TfrmBasicoCrud)
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    EditNomeCientifico: TcxDBTextEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditObsevacao: TcxDBMemo;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosNOME_CIENTIFICO: TcxGridDBColumn;
    viewRegistrosFAMILIA_BOTANICA: TcxGridDBColumn;
    EditQtdeSementeKilo: TcxDBCalcEdit;
    Label7: TLabel;
    viewRegistrosQTDE_POR_KILO: TcxGridDBColumn;
    Label8: TLabel;
    Label9: TLabel;
    EditValorKg: TcxDBCurrencyEdit;
    Label10: TLabel;
    EditValorUnidadeMuda: TcxDBCurrencyEdit;
    viewRegistrosVALOR_MUDA: TcxGridDBColumn;
    viewRegistrosVALOR_KG_SEMENTE: TcxGridDBColumn;
    viewRegistrosTEMPO_GERMINACAO: TcxGridDBColumn;
    EditTempoGerminacao: TcxDBSpinEdit;
    Label11: TLabel;
    lbl1: TLabel;
    viewRegistrosQTDE_SEMENTE_ESTOQUE: TcxGridDBColumn;
    Label12: TLabel;
    EditTempoDesenvolvimento: TcxDBSpinEdit;
    viewRegistrosTEMPO_DESENVOLVIMENTO: TcxGridDBColumn;
    viewRegistrosQTDE_MUDA_PRONTA: TcxGridDBColumn;
    viewRegistrosQTDE_MUDA_DESENVOLVIMENTO: TcxGridDBColumn;
    Label13: TLabel;
    cbMesInicioColeta: TcxDBImageComboBox;
    cbMesFimColeta: TcxDBImageComboBox;
    EditPesoMedio: TcxDBCalcEdit;
    viewRegistrosID_FAMILIA_BOTANICA: TcxGridDBColumn;
    viewRegistrosPESO_MEDIO_SEMENTE: TcxGridDBColumn;
    cbFamiliaBotanica: TcxDBLookupComboBox;
    viewRegistrosCALC_TOTAL_MUDAS: TcxGridDBColumn;
    viewRegistrosQTDE_SEMENTE_TUBETE: TcxGridDBColumn;
    Label14: TLabel;
    EditQtdeSementeTubete: TcxDBSpinEdit;
    viewRegistrosCLASSIFICACAO: TcxGridDBColumn;
    cbClassificacao: TcxDBImageComboBox;
    lb1: TLabel;
    cgBioma: TcxCheckGroup;
    cbClassifiacaoPesquisa: TcxImageComboBox;
    cbBiomaPesquisa: TcxCheckComboBox;
    Label15: TLabel;
    cxDBImageComboBox1: TcxDBImageComboBox;
    viewRegistrosMES_INICIO_COLETA: TcxGridDBColumn;
    viewRegistrosMES_FIM_COLETA: TcxGridDBColumn;
    viewRegistrosID_TIPO_ESPECIE: TcxGridDBColumn;
    viewRegistrosTIPO_ESPECIE: TcxGridDBColumn;
    viewRegistrosCATEGORIA_ARMAZENAMENTO: TcxGridDBColumn;
    cbTipo_Especie: TcxDBLookupComboBox;
    Label16: TLabel;
    btnAdicionarAreaAtuacao: TButton;
    Ac_Adicionar_Familia: TAction;
    procedure FormCreate(Sender: TObject);
    procedure EditPesoMedioPropertiesEditValueChanged(Sender: TObject);
    procedure cgBiomaPropertiesEditValueChanged(Sender: TObject);
    procedure Ac_Adicionar_FamiliaExecute(Sender: TObject);
    procedure cbFamiliaBotanicaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    dmViveiro: TdmViveiro;
    dmLookup: TdmLookup;
    procedure ppvAdicionarFamiliaBotanica;
    procedure ppvCarregarFamiliaBotanica;
  protected
    function fprGetPermissao: String; override;
    procedure pprBeforeIncluir; override;
    procedure pprBeforeAlterar; override;
    procedure pprAfterSalvar(ipAcaoExecutada: TDataSetState); override;
    procedure pprEfetuarPesquisa; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprValidarPesquisa; override;
  public
    { Public declarations }
  end;

var
  frmEspecie: TfrmEspecie;

const
  coNomeCientifico = 5;
  coFamiliaBotanica = 6;
  coClassificacao = 7;
  coBioma = 8;

implementation

{$R *.dfm}

{ TfrmEspecie }

procedure TfrmEspecie.Ac_Adicionar_FamiliaExecute(Sender: TObject);
begin
  inherited;
  ppvAdicionarFamiliaBotanica;
end;

procedure TfrmEspecie.ppvAdicionarFamiliaBotanica;
var
  vaFrmFamilia: TfrmFamiliaBotanica;
begin
  vaFrmFamilia := TfrmFamiliaBotanica.Create(nil);
  try
    vaFrmFamilia.ppuConfigurarModoExecucao(meSomenteCadastro);
    vaFrmFamilia.ShowModal;

    if vaFrmFamilia.IdEscolhido <> 0 then
      begin
        ppvCarregarFamiliaBotanica;
        if dmLookup.cdslkFamilia_Botanica.Locate(TBancoDados.coId, vaFrmFamilia.IdEscolhido, []) then
          begin
            cbFamiliaBotanica.EditValue := vaFrmFamilia.IdEscolhido;
            cbFamiliaBotanica.PostEditValue;
          end;
      end;
  finally
    vaFrmFamilia.Free;
  end;

end;

procedure TfrmEspecie.cbFamiliaBotanicaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarFamiliaBotanica;
end;

procedure TfrmEspecie.cgBiomaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if (pcPrincipal.ActivePage = tabCadastro) and (not (dmViveiro.cdsEspecie.state in [dsEdit,dsInsert])) then
    dmViveiro.cdsEspecie.Edit;
end;

procedure TfrmEspecie.EditPesoMedioPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastro then
    begin
      if not VarIsNull(EditPesoMedio.EditValue) then
        begin
          if not(dmViveiro.cdsEspecie.State in [dsEdit, dsInsert]) then
            dmViveiro.cdsEspecie.Edit;

          dmViveiro.cdsEspecieQTDE_SEMENTE_KILO.AsInteger := Trunc(1000 / EditPesoMedio.EditValue);
        end;
    end;
end;

procedure TfrmEspecie.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := Ord(tppNome);

  ppvCarregarFamiliaBotanica;

  dmLookup.cdslkTipo_Especie.ppuDataRequest([TParametros.coTodos],['NAO_IMPORTA']);
end;

procedure TfrmEspecie.ppvCarregarFamiliaBotanica;
begin
  dmLookup.cdslkFamilia_Botanica.Close;
  dmLookup.cdslkFamilia_Botanica.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
  dmLookup.ppuAbrirCache(dmLookup.cdslkFamilia_Botanica);
end;

function TfrmEspecie.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbClassifiacaoPesquisa.Visible := cbPesquisarPor.EditValue = coClassificacao;
  cbBiomaPesquisa.Visible := cbPesquisarPor.EditValue = coBioma;
  EditPesquisa.Visible := EditPesquisa.Visible and (not (cbClassifiacaoPesquisa.Visible or cbBiomaPesquisa.Visible));
  if cbClassifiacaoPesquisa.Visible then
    Result := cbClassifiacaoPesquisa
  else if cbBiomaPesquisa.Visible then
    Result := cbBiomaPesquisa;



end;

function TfrmEspecie.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivEspecie));
end;

procedure TfrmEspecie.pprAfterSalvar(ipAcaoExecutada: TDataSetState);
var
  I: Integer;
begin
  inherited;

  // vamos ver se existe algum registro gravado q nao esta marcado
  dmViveiro.cdsEspecie_Bioma.First;
  while not dmViveiro.cdsEspecie_Bioma.Eof do
    begin
      if cgBioma.States[dmViveiro.cdsEspecie_BiomaBIOMA.AsInteger] <> cbsChecked then
        dmViveiro.cdsEspecie_Bioma.Delete
      else
        dmViveiro.cdsEspecie_Bioma.Next;
    end;

  for I := 0 to TcxCheckGroupProperties(cgBioma.RepositoryItem.Properties).Items.Count - 1 do
    begin
      if (cgBioma.States[I] = cbsChecked) and
        (not dmViveiro.cdsEspecie_Bioma.Locate(dmViveiro.cdsEspecie_BiomaBIOMA.FieldName, I, [])) then
        begin
          dmViveiro.cdsEspecie_Bioma.Append;
          pprPreencherCamposPadroes(dmViveiro.cdsEspecie_Bioma);
          dmViveiro.cdsEspecie_BiomaBIOMA.AsInteger := I;
          dmViveiro.cdsEspecie_Bioma.Post;
        end;
    end;

  if dmViveiro.cdsEspecie_Bioma.ChangeCount > 0 then
    dmViveiro.cdsEspecie_Bioma.ApplyUpdates(0);
end;

procedure TfrmEspecie.pprBeforeAlterar;
begin
  inherited;
  cgBioma.Clear;
  TUtils.ppuPercorrerCds(dmViveiro.cdsEspecie_Bioma,
    procedure
    begin
      cgBioma.States[dmViveiro.cdsEspecie_BiomaBIOMA.AsInteger] := cbsChecked;
    end);
end;

procedure TfrmEspecie.pprBeforeIncluir;
begin
  inherited;
  cgBioma.Clear;
end;

procedure TfrmEspecie.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
var
  vaBiomas: String;
begin
  inherited;
  if cbPesquisarPor.EditValue = coNomeCientifico then
    ipCds.ppuAddParametro(TParametros.coNomeCientifico, EditPesquisa.Text)
  else if cbPesquisarPor.EditValue = coFamiliaBotanica then
    ipCds.ppuAddParametro(TParametros.coFamiliaBotanica, EditPesquisa.Text)
  else if cbPesquisarPor.EditValue = coClassificacao then
    ipCds.ppuAddParametro(TParametros.coClassificacao, cbClassifiacaoPesquisa.EditValue)
  else if cbPesquisarPor.EditValue = coBioma then
    begin
      vaBiomas := TUtils.fpuExtrairValoresCheckComboBox(cbBiomaPesquisa);
      ipCds.ppuAddParametro(TParametros.coBioma, vaBiomas);
    end;

end;

procedure TfrmEspecie.pprEfetuarPesquisa;
begin
  dmViveiro.cdsEspecie_Bioma.close;
  try
    inherited;
  finally
    dmViveiro.cdsEspecie_Bioma.Open;
  end;

end;

procedure TfrmEspecie.pprValidarPesquisa;
begin
  inherited;
  if cbClassifiacaoPesquisa.Visible and VarIsNull(cbClassifiacaoPesquisa.EditValue) then
    raise TControlException.Create('Informe a classificação a ser pesquisada', cbClassifiacaoPesquisa);

  if cbBiomaPesquisa.Visible and VarIsNull(cbBiomaPesquisa.EditValue) then
    raise TControlException.Create('Informe os biomas a serem pesquisados', cbBiomaPesquisa);

end;

end.
