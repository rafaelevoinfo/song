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
  uControleAcesso, fPessoa, uUtils, System.DateUtils;

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
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_PESSOA_COLETOU: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosNOME_ESPECIE: TcxGridDBColumn;
    viewRegistrosQTDE: TcxGridDBColumn;
    btnPesquisarAtividade: TButton;
    Ac_Pesquisar_Pessoa: TAction;
    Label7: TLabel;
    cbEspeciePesquisa: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cbEspeciePropertiesEditValueChanged(Sender: TObject);
    procedure cbPessoaColetouKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Pesquisar_PessoaExecute(Sender: TObject);
  private
    dmViveiro: TdmViveiro;
    dmLookup: TdmLookup;

    procedure ppvConfigurarGrids;
    procedure ppvCarregarMatrizes;
    procedure ppvPesquisarPessoa;
    procedure ppvCarregarPessoas(ipIdEspecifico: Integer);
    procedure ppvRemoverMatrizesOutrasEspecie;
  protected

    procedure pprBeforeAlterar; override;
    procedure pprEfetuarPesquisa; override;

    function fprHabilitarSalvar(): Boolean; override;
    procedure pprExecutarSalvar; override;
    function fprGetPermissao: String; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;

    procedure pprExecutarCancelar; override;
  public

    procedure ppuIncluir; override;
  end;

var
  frmLote: TfrmLote;

implementation

{$R *.dfm}


procedure TfrmLote.Ac_Pesquisar_PessoaExecute(Sender: TObject);
begin
  inherited;
  ppvPesquisarPessoa;
end;

procedure TfrmLote.ppvCarregarPessoas(ipIdEspecifico: Integer);
var
  vaValor: String;
begin
  dmLookup.cdslkPessoa.ppuLimparParametros;
  if ipIdEspecifico <> 0 then
    dmLookup.cdslkPessoa.ppuAddParametro(TParametros.coID, ipIdEspecifico, TOperadores.coOR);

  // recusado, cancelado, executado
  dmLookup.cdslkPessoa.ppuDataRequest([TParametros.coTipo], [Ord(trpFuncionario).ToString + ',' + Ord(trpEstagiario).ToString + ',' +
    Ord(trpVoluntario).ToString + ',' + Ord(trpMembroDiretoria).ToString]);
end;

procedure TfrmLote.ppvPesquisarPessoa();
var
  vaFrmPessoa: TfrmPessoa;
begin
  inherited;
  vaFrmPessoa := TfrmPessoa.Create(nil);
  try
    vaFrmPessoa.ppuConfigurarModoExecucao(mePesquisa);

    vaFrmPessoa.ShowModal;
    if vaFrmPessoa.IdEscolhido <> 0 then
      begin
        if dmLookup.cdslkPessoa.Locate(TBancoDados.coID, vaFrmPessoa.IdEscolhido, []) then
          begin
            cbPessoaColetou.EditValue := vaFrmPessoa.IdEscolhido;
            cbPessoaColetou.PostEditValue;
          end
        else
          begin
            ppvCarregarPessoas(vaFrmPessoa.IdEscolhido);
            if dmLookup.cdslkPessoa.Locate(TBancoDados.coID, vaFrmPessoa.IdEscolhido, []) then
              begin
                cbPessoaColetou.EditValue := vaFrmPessoa.IdEscolhido;
                cbPessoaColetou.PostEditValue;
              end;
          end;

      end;
  finally
    vaFrmPessoa.Free;
  end;
end;

procedure TfrmLote.cbEspeciePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if (pcPrincipal.ActivePage = tabCadastro) and (dmViveiro.cdsLote.State in [dsEdit, dsInsert]) then
    begin
      cbEspecie.PostEditValue;
      ppvCarregarMatrizes;
      // caso tenha trocado de especie, todos os registros filho desse lote devem ser excluidos
      ppvRemoverMatrizesOutrasEspecie;
    end;
end;

procedure TfrmLote.ppvRemoverMatrizesOutrasEspecie;
begin
  cbEspecie.PostEditValue;
  dmViveiro.cdsLote_Matriz.DisableControls;
  try
    dmViveiro.cdsLote_Matriz.First;
    while not dmViveiro.cdsLote_Matriz.Eof do
      begin
        dmViveiro.cdsLote_Matriz.Delete;
      end;
  finally
    dmViveiro.cdsLote_Matriz.EnableControls;
  end;

end;

procedure TfrmLote.pprBeforeAlterar;
begin
  inherited;
  ppvCarregarMatrizes;
end;

procedure TfrmLote.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if not VarIsNull(cbEspeciePesquisa.EditValue) then
    ipCds.ppuAddParametro(TParametros.coEspecie, cbEspeciePesquisa.EditValue);
end;

procedure TfrmLote.pprEfetuarPesquisa;
begin
  dmViveiro.cdsLote_Matriz.Close;
  inherited;
  dmViveiro.cdsLote_Matriz.Open;
end;

procedure TfrmLote.pprExecutarCancelar;
begin
  if dmViveiro.cdsLote_Matriz.ChangeCount > 0 then
    dmViveiro.cdsLote_Matriz.CancelUpdates;
  inherited;
end;

procedure TfrmLote.pprExecutarSalvar;
begin
  inherited;
  if (dmViveiro.cdsLote_Matriz.ChangeCount > 0) then
    dmViveiro.cdsLote_Matriz.ApplyUpdates(0);
end;

procedure TfrmLote.ppuIncluir;
begin
  inherited;
  ppvCarregarMatrizes;
  pprPreencherCamposPadroes(dmViveiro.cdsLote);
end;

procedure TfrmLote.ppvCarregarMatrizes;
begin
  cbEspecie.PostEditValue;

  if cdsLocalMatrizes.Active then
    cdsLocalMatrizes.EmptyDataSet
  else
    cdsLocalMatrizes.CreateDataSet;

  if not VarIsNull(cbEspecie.EditValue) then
    begin
      if (not dmLookup.cdslkMatriz.Active) or (dmLookup.cdslkMatrizID_ESPECIE.AsInteger <> cbEspecie.EditValue) then
        begin
          dmLookup.cdslkMatriz.ppuDataRequest([TParametros.coEspecie], [cbEspecie.EditValue], TOperadores.coAnd, true);
        end;

      dmViveiro.cdsLote_Matriz.DisableControls;
      try
        TUtils.ppuPercorrerCds(dmLookup.cdslkMatriz,
          procedure
          begin
            if not dmViveiro.cdsLote_Matriz.Locate(dmViveiro.cdsLote_MatrizID_MATRIZ.FieldName, dmLookup.cdslkMatrizID.AsInteger, []) then
              begin
                cdsLocalMatrizes.Append;
                cdsLocalMatrizesID.AsInteger := dmLookup.cdslkMatrizID.AsInteger;
                cdsLocalMatrizes.Post;
              end;
          end);
      finally
        dmViveiro.cdsLote_Matriz.EnableControls;
      end;
    end;
end;

procedure TfrmLote.cbPessoaColetouKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvPesquisarPessoa;
end;

procedure TfrmLote.FormCreate(Sender: TObject);
begin
  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := tppData;

  ppvCarregarPessoas(0);
  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);

  ppvConfigurarGrids;

  EditDataInicialPesquisa.Date := IncDay(Now, -7);
  EditDataFinalPesquisa.Date := Now;
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
  frameMatrizes.ppuAdicionarField(frameMatrizes.viewEsquerda, 'ID', dmLookup.replcbMatriz);
  // Direita
  frameMatrizes.ppuAdicionarField(frameMatrizes.viewDireita, 'ID_MATRIZ', dmLookup.replcbMatriz);
  // mapeando
  frameMatrizes.ppuMapearFields('ID', 'ID_MATRIZ');
end;

end.
