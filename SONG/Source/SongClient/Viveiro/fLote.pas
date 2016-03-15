unit fLote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, cxLocalization, System.Actions,
  Vcl.ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuViveiro, cxDBEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalc, fmGrids,
  Datasnap.DBClient, dmuLookup, uClientDataSet, uTypes, System.TypInfo,
  uControleAcesso;

type
  TfrmLote = class(TfrmBasicoCrud)
    pnMatrizes: TPanel;
    pnTopEditsCadastro: TPanel;
    Label3: TLabel;
    EditNome: TcxDBTextEdit;
    lbl1: TLabel;
    cbEspecie: TcxDBLookupComboBox;
    Label4: TLabel;
    cbPessoaColetou: TcxDBLookupComboBox;
    Label5: TLabel;
    EditData: TcxDBDateEdit;
    Label6: TLabel;
    EditQtde: TcxDBCalcEdit;
    frameMatrizes: TframeGrids;
    cdsLocalMatrizes: TClientDataSet;
    dsLocalMatrizes: TDataSource;
    cdsLocalMatrizesID: TIntegerField;
    cdsLocalMatrizesNOME: TStringField;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_PESSOA_COLETOU: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosQTDE_GRAMAS: TcxGridDBColumn;
    viewRegistrosTIPO: TcxGridDBColumn;
    viewRegistrosNOME_ESPECIE: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cbEspeciePropertiesEditValueChanged(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
    dmLookup: TdmLookup;
    procedure ppvConfigurarGrids;
    procedure ppvCarregarMatrizes;

  protected
    procedure pprBeforeIncluir; override;
    procedure pprBeforeAlterar; override;
    procedure pprEfetuarPesquisa; override;

    function fprHabilitarSalvar(): Boolean; override;
    procedure pprExecutarSalvar; override;
    function fprGetPermissao: String; override;
    procedure ppuCancelar; override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLote: TfrmLote;

implementation

{$R *.dfm}


procedure TfrmLote.cbEspeciePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabCadastro then
    ppvCarregarMatrizes;
end;

procedure TfrmLote.pprBeforeAlterar;
begin
  inherited;
  ppvCarregarMatrizes;
end;

procedure TfrmLote.pprBeforeIncluir;
begin
  inherited;
  ppvCarregarMatrizes;
end;

procedure TfrmLote.pprEfetuarPesquisa;
begin
  dmViveiro.cdsLote_Matriz.Close;
  inherited;
  dmViveiro.cdsLote_Matriz.Open;
end;

procedure TfrmLote.pprExecutarSalvar;
begin
  inherited;
  if (dmViveiro.cdsLote_Matriz.ChangeCount > 0) then
    dmViveiro.cdsLote_Matriz.ApplyUpdates(0);
end;

procedure TfrmLote.ppuCancelar;
begin
  inherited;
  dmViveiro.cdsLote_Matriz.CancelUpdates;
end;

procedure TfrmLote.ppvCarregarMatrizes;
begin
  cbEspecie.PostEditValue;
  if not VarIsNull(cbEspecie.EditValue) then
    begin
      if (not dmLookup.cdslkMatriz.Active) or (dmLookup.cdslkMatrizID_ESPECIE.AsInteger <> cbEspecie.EditValue) then
        begin
          dmLookup.cdslkMatriz.ppuDataRequest([TParametros.coEspecie], [cbEspecie.EditValue], TOperadores.coAnd, true);

          cdsLocalMatrizes.Data := dmLookup.cdslkMatriz.Data;
        end;
    end;
end;

procedure TfrmLote.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  dmLookup.cdslkPessoa.Open;
  dmLookup.cdslkEspecie.Open;
end;

function TfrmLote.fprGetPermissao: String;
begin
   Result := GetEnumName(TypeInfo(TPermissaoViveiro), Ord(vivLote));
end;

function TfrmLote.fprHabilitarSalvar: Boolean;
begin
  Result := inherited;
  if not Result then
    Result := dmViveiro.cdsLote_Matriz.Active and ((dmViveiro.cdsLote_Matriz.State in [dsEdit, dsInsert]) or
      (dmViveiro.cdsLote_Matriz.ChangeCount > 0));
end;

procedure TfrmLote.ppvConfigurarGrids;
begin
  // Esquerda
  frameMatrizes.ppuAdicionarField(frameMatrizes.viewEsquerda, 'ID', false, nil);
  frameMatrizes.ppuAdicionarField(frameMatrizes.viewEsquerda, 'NOME', true);
  // Direita
  frameMatrizes.ppuAdicionarField(frameMatrizes.viewDireita, 'ID_MATRIZ', dmLookup.replcbMatriz);
  // mapeando
  frameMatrizes.ppuMapearFields('ID', 'ID_MATRIZ');
end;

end.
