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
  dmuLookup, cxSpinEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;

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
    procedure FormCreate(Sender: TObject);
    procedure EditPesoMedioPropertiesEditValueChanged(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
    dmLookup: TdmLookup;
  protected
    function fprGetPermissao: String; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
  public
    { Public declarations }
  end;

var
  frmEspecie: TfrmEspecie;

const
  coNomeCientifico = 5;
  coFamiliaBotanica = 6;

implementation

{$R *.dfm}

{ TfrmEspecie }

procedure TfrmEspecie.EditPesoMedioPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastro then
    begin
      if not VarIsNull(EditPesoMedio.EditValue) then
        begin
          if not(dmViveiro.cdsEspecie.State in [dsEdit, dsInsert]) then
            dmViveiro.cdsEspecie.Edit;

          dmViveiro.cdsEspecieQTDE_SEMENTE_KILO.AsInteger := Trunc(1000/EditPesoMedio.EditValue);
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

  dmLookup.cdslkFamilia_Botanica.ppuDataRequest([TParametros.coTodos],['NAO_IMPORTA'],TOperadores.coAnd,true);
end;

function TfrmEspecie.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivEspecie));
end;

procedure TfrmEspecie.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coNomeCientifico then
    ipCds.ppuAddParametro(TParametros.coNomeCientifico, EditPesquisa.Text)
  else if cbPesquisarPor.EditValue = coFamiliaBotanica then
    ipCds.ppuAddParametro(TParametros.coFamiliaBotanica, EditPesquisa.Text)
end;

end.
