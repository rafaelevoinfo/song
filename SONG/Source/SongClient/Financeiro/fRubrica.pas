unit fRubrica;

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
  Vcl.ExtCtrls, cxPC, dmuFinanceiro, cxDBEdit, uControleAcesso, System.TypInfo,
  uTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dmuPrincipal,
  dmuLookup, uMensagem, uClientDataSet;

type
  TfrmRubrica = class(TfrmBasicoCrud)
    EditNome: TcxDBTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    cbRubricaPai: TcxDBLookupComboBox;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosID_RUBRICA_PAI: TcxGridDBColumn;
    viewRegistrosIDENTIFICADOR: TcxGridDBColumn;
    btnIncluirSubItem: TButton;
    Ac_Incluir_Item: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Ac_Incluir_ItemExecute(Sender: TObject);
    procedure Ac_Incluir_ItemUpdate(Sender: TObject);
  private
    dmFinanceiro: TdmFinanceiro;
    dmLookup: TdmLookup;

    procedure ppvAtualizarLookupRubrica;
  protected
    function fprGetPermissao: string; override;
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); override;
    procedure pprAfterSalvar; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
  public
    function fpuExcluir(ipIds: TArray<Integer>): Boolean; override;
  public const
    coIdentificador = 5;
  end;

var
  frmRubrica: TfrmRubrica;

implementation

{$R *.dfm}

{ TfrmRubrica }

procedure TfrmRubrica.Ac_Incluir_ItemExecute(Sender: TObject);
var
  vaIdRubricaPai: Integer;
begin
  inherited;
  vaIdRubricaPai := dmFinanceiro.cdsRubricaID.AsInteger;
  ppuIncluir;
  dmFinanceiro.cdsRubricaID_RUBRICA_PAI.AsInteger := vaIdRubricaPai;
end;

procedure TfrmRubrica.Ac_Incluir_ItemUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := fprHabilitarAlterar;
end;

procedure TfrmRubrica.FormCreate(Sender: TObject);
begin
  dmFinanceiro := TdmFinanceiro.Create(Self);
  dmFinanceiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;
  PesquisaPadrao := tppTodos;

  ppvAtualizarLookupRubrica;
end;

function TfrmRubrica.fprGetPermissao: string;
begin
  Result := GetEnumName(TypeInfo(TPermissaoFinanceiro), Ord(finRubrica));
end;

function TfrmRubrica.fpuExcluir(ipIds: TArray<Integer>): Boolean;
var
  vaId: Integer;
  vaDependencias: Boolean;
begin
  vaDependencias := dmPrincipal.FuncoesFinanceiro.fpuVerificarDependenciasRubrica(dmFinanceiro.cdsRubricaIDENTIFICADOR.AsString);
  if vaDependencias then
    begin
      if TMensagem.fpuPerguntar('Excluindo essa rubrica irá causar a exclusão de todos as rubricas filhas. Deseja continuar?', ppSimNao) = rpNao then
        Exit(False);
    end;

  Result := inherited;
  if Result then
    begin
      if vaDependencias then
        begin
          ppvAtualizarLookupRubrica;
          pprEfetuarPesquisa;
        end
      else
        begin
          for vaId in ipIds do
            begin
              if dmLookup.cdslkRubrica.Locate(TBancoDados.coId, vaId, []) then
                dmLookup.cdslkRubrica.Delete;
            end;
        end;

    end;

end;

procedure TfrmRubrica.pprAfterSalvar;
begin
  inherited;
  // incluindo apenas localmente
  if not dmLookup.cdslkRubrica.Locate(TBancoDados.coId, dmFinanceiro.cdsRubricaID.AsInteger, []) then
    begin
      dmLookup.cdslkRubrica.Append;
      dmLookup.cdslkRubricaID.AsInteger := dmFinanceiro.cdsRubricaID.AsInteger;
    end
  else
    dmLookup.cdslkRubrica.Edit;

  dmLookup.cdslkRubricaID_RUBRICA_PAI.AsInteger := dmFinanceiro.cdsRubricaID_RUBRICA_PAI.AsInteger;
  dmLookup.cdslkRubricaNOME.AsString := dmFinanceiro.cdsRubricaIDENTIFICADOR.AsString + ' - ' + dmFinanceiro.cdsRubricaNOME.AsString;
  dmLookup.cdslkRubrica.Post;
end;

procedure TfrmRubrica.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coIdentificador then
    ipCds.ppuAddParametro(TParametros.coIdentificadorPlanoContasRubrica, EditPesquisa.Text);
end;

procedure TfrmRubrica.pprPreencherCamposPadroes(ipDataSet: TDataSet);
begin
  inherited;
  if dmFinanceiro.cdsRubricaIDENTIFICADOR.IsNull or
    (dmFinanceiro.cdsRubricaID_RUBRICA_PAI.NewValue <> dmFinanceiro.cdsRubricaID_RUBRICA_PAI.OldValue) then
    begin
      dmFinanceiro.cdsRubricaIDENTIFICADOR.AsString := dmPrincipal.FuncoesFinanceiro.fpuGerarIdentificadorRubrica
        (dmFinanceiro.cdsRubricaID_RUBRICA_PAI.AsInteger);
    end;
end;

procedure TfrmRubrica.ppvAtualizarLookupRubrica;
begin
  dmLookup.cdslkRubrica.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA'], TOperadores.coAnd, true);
end;

end.
