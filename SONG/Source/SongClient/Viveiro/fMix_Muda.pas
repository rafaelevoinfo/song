unit fMix_Muda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrudMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, Vcl.ExtDlgs, System.Actions,
  Vcl.ActnList, cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuViveiro, dmuLookup,
  dmuPrincipal, cxCalc, cxDBEdit, cxMemo, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Datasnap.DBClient, fmGrids, uUtils, System.TypInfo,
  uControleAcesso, uClientDataSet, uTypes;

type
  TfrmMixMuda = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_CLIENTE: TcxGridDBColumn;
    viewRegistrosCLIENTE: TcxGridDBColumn;
    viewRegistrosID_PESSOA_RESPONSAVEL: TcxGridDBColumn;
    viewRegistrosRESPONSAVEL: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosQTDE_MUDA: TcxGridDBColumn;
    viewRegistrosQTDE_MUDA_ROCAMBOLE: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_ESPECIE: TcxGridDBColumn;
    viewRegistrosDetailESPECIE: TcxGridDBColumn;
    viewRegistrosDetailNOME_CIENTIFICO: TcxGridDBColumn;
    lbl5: TLabel;
    cbCliente: TcxDBLookupComboBox;
    btnAdicionarCliente: TButton;
    lbl1: TLabel;
    cbResponsavel: TcxDBLookupComboBox;
    EditData: TcxDBDateEdit;
    lbl2: TLabel;
    lbl4: TLabel;
    EditDescricao: TcxDBMemo;
    Ac_Adicionar_Cliente: TAction;
    Label3: TLabel;
    EditQtde: TcxDBCalcEdit;
    Label4: TLabel;
    EditQtdeRocambole: TcxDBCalcEdit;
    pnEditsCadastroSuperior: TPanel;
    frameGrids: TframeGrids;
    cdsLocalEspecie: TClientDataSet;
    cdsLocalEspecieID: TIntegerField;
    cdsLocalEspecieNOME: TStringField;
    btnGerarVenda: TButton;
    Ac_Gerar_Venda: TAction;
    procedure FormCreate(Sender: TObject);
  private
    dmLookup: TdmLookup;
    dmViveiro: TdmViveiro;
    procedure ppvConfigurarGrids;
    procedure ppvCarregarClientes;
    { Private declarations }
  protected
    procedure pprEfetuarPesquisa; override;
    function fprHabilitarAlterarDetail: Boolean; override;

    procedure pprAfterSalvar(ipAcaoExecutada: TDataSetState); override;

    function fprGetPermissao:String;override;
  public
    procedure ppuIncluir; override;
    procedure ppuAlterar(ipId: Integer); override;
  end;

var
  frmMixMuda: TfrmMixMuda;

implementation

{$R *.dfm}

{ TfrmMixMuda }

procedure TfrmMixMuda.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.name := '';

  dmViveiro := TdmViveiro.Create(Self);
  dmViveiro.name := '';
  inherited;

  dmLookup.ppuAbrirCache(dmLookup.cdslkEspecie);
  dmLookup.ppuCarregarPessoas(0,coTiposPessoaPadrao);

  ppvCarregarClientes;

  ppvConfigurarGrids;
end;

procedure TfrmMixMuda.ppvCarregarClientes;
begin
  dmLookup.cdslkFin_For_Cli.ppuDataRequest([TParametros.coTipo], [Ord(tfCliente)], TOperadores.coAnd, True);
end;

function TfrmMixMuda.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoViveiro), ord(vivMixMuda));
end;

function TfrmMixMuda.fprHabilitarAlterarDetail: Boolean;
begin
  Result := false;
end;

procedure TfrmMixMuda.pprAfterSalvar(ipAcaoExecutada: TDataSetState);
begin
  inherited;
  if dmViveiro.cdsMix_Muda_Especie.ChangeCount > 0 then
    dmViveiro.cdsMix_Muda_Especie.ApplyUpdates(0);

  //calcula as quantidades e insere os lotes para cada especie
  dmPrincipal.FuncoesViveiro.ppuCalcularQuantidadeMudasMix(dmViveiro.cdsMix_MudaID.AsInteger);

end;

procedure TfrmMixMuda.pprEfetuarPesquisa;
begin
  dmViveiro.cdsMix_Muda_Especie_Lote.Close;
  inherited;
  dmViveiro.cdsMix_Muda_Especie_Lote.Open;
end;

procedure TfrmMixMuda.ppuAlterar(ipId: Integer);
begin
  inherited;
  if cdsLocalEspecie.Active then
    cdsLocalEspecie.EmptyDataSet
  else
    cdsLocalEspecie.CreateDataSet;

  TUtils.ppuPercorrerCds(dmLookup.cdslkEspecie,
    procedure
    begin
      if (not dmViveiro.cdsMix_Muda_Especie.Locate(dmViveiro.cdsMix_Muda_EspecieID_ESPECIE.FieldName, dmLookup.cdslkEspecieID.AsInteger, [])) and
        (dmLookup.cdslkEspecieQTDE_MUDA_PRONTA.AsInteger > 0) then
        begin
          cdsLocalEspecie.Append;
          cdsLocalEspecieID.AsInteger := dmLookup.cdslkEspecieID.AsInteger;
          cdsLocalEspecieNOME.AsString := dmLookup.cdslkEspecieNOME.AsString;
          cdsLocalEspecie.Post;
        end;
    end);
end;

procedure TfrmMixMuda.ppuIncluir;
begin
  inherited;
  if cdsLocalEspecie.Active then
    cdsLocalEspecie.EmptyDataSet
  else
    cdsLocalEspecie.CreateDataSet;

  dmViveiro.cdsMix_MudaQTDE_MUDA_ROCAMBOLE.AsInteger := 30;
  TUtils.ppuPercorrerCds(dmLookup.cdslkEspecie,
    procedure
    begin
      if dmLookup.cdslkEspecieQTDE_MUDA_PRONTA.AsInteger > 0 then
        begin
          cdsLocalEspecie.Append;
          cdsLocalEspecieID.AsInteger := dmLookup.cdslkEspecieID.AsInteger;
          cdsLocalEspecieNOME.AsString := dmLookup.cdslkEspecieNOME.AsString;
          cdsLocalEspecie.Post;
        end;
    end);

  frameGrids.Ac_AddTodos.Execute;
end;

procedure TfrmMixMuda.ppvConfigurarGrids;
begin
  // Esquerda
  frameGrids.fpuAdicionarField(frameGrids.viewEsquerda, 'ID', false);
  frameGrids.fpuAdicionarField(frameGrids.viewEsquerda, 'NOME');
  // Direita
  frameGrids.fpuAdicionarField(frameGrids.viewDireita, 'ID_ESPECIE', false);
  frameGrids.fpuAdicionarField(frameGrids.viewDireita, 'ESPECIE');
  // mapeando
  frameGrids.ppuMapearFields('ID', 'ID_ESPECIE');
  frameGrids.ppuMapearFields('NOME', 'ESPECIE');
end;

end.
