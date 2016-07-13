unit fAgenda;

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
  Vcl.ExtCtrls, cxPC, dmuSistema, uTypes, System.TypInfo, uControleAcesso,
  cxDBEdit, fBasicoCrudMasterDetail, cxSplitter, dmuLookup, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, uClientDataSet, cxCheckBox;

type
  TfrmAgenda = class(TfrmBasicoCrudMasterDetail)
    EditNomeAgenda: TcxDBTextEdit;
    Label3: TLabel;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosID_PROJETO: TcxGridDBColumn;
    viewRegistrosPROJETO: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_PESSOA: TcxGridDBColumn;
    viewRegistrosDetailSOMENTE_VISUALIZACAO: TcxGridDBColumn;
    viewRegistrosDetailNOME_PESSOA: TcxGridDBColumn;
    cbProjeto: TcxDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    chkSomenteVisualizacao: TcxDBCheckBox;
    cbPessoa: TcxDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ColumnExcluirCustomDrawHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
  private
    dmSistema: TdmSistema;
    dmLookup: TdmLookup;
  protected
    function fprGetPermissao: String; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
  public
    procedure ppuIncluir; override;
    procedure ppuIncluirDetail; override;
  end;

var
  frmAgenda: TfrmAgenda;

implementation

{$R *.dfm}


procedure TfrmAgenda.ColumnExcluirCustomDrawHeader(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
begin
  inherited;
  if dmSistema.cdsAgenda.Active and (dmSistema.cdsAgenda.RecordCount > 0) then
    begin
      if dmSistema.cdsAgendaATIVO.AsInteger = coRegistroAtivo then
        AViewInfo.Text := 'Inativar'
      else
        AViewInfo.Text := 'Ativar';
    end
  else
    AViewInfo.Text := 'Ativar/Inativar';
end;

procedure TfrmAgenda.FormCreate(Sender: TObject);
begin
  dmSistema := TdmSistema.Create(Self);
  dmSistema.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := Ord(tppTodos);

  dmLookup.cdslkProjeto.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);
  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpMembroDiretoria, trpParceiro, trpEstagiario, trpVoluntario]);
end;

function TfrmAgenda.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoSistema), Ord(sisAgenda));
end;

procedure TfrmAgenda.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  ipCds.ppuAddParametro(TParametros.coAtivo, rgStatus.ItemIndex);
  ipCds.ppuAddParametro(TParametros.coTipo, Ord(taOutra));
end;

procedure TfrmAgenda.ppuIncluir;
begin
  inherited;
  dmSistema.cdsAgendaTIPO.AsInteger := 1;
  dmSistema.cdsAgendaATIVO.AsInteger := 0;
end;

procedure TfrmAgenda.ppuIncluirDetail;
begin
  inherited;
  dmSistema.cdsAgenda_PessoaSOMENTE_VISUALIZACAO.AsInteger := 0;
end;

end.
