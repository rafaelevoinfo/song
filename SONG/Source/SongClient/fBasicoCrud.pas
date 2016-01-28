unit fBasicoCrud;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, Vcl.StdCtrls, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls, cxPC, cxButtonEdit, dmuPrincipal, cxImageComboBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, uMensagem, Datasnap.DBClient, System.Generics.Collections, System.Generics.Defaults,
  uTypes;

type
  TfrmBasicoCrud = class(TfrmBasico)
    pcPrincipal: TcxPageControl;
    tabPesquisa: TcxTabSheet;
    tabCadastro: TcxTabSheet;
    pnPesquisa: TPanel;
    pnGrid: TPanel;
    btnIncluir: TButton;
    ActionList1: TActionList;
    Ac_Incluir: TAction;
    pnEditsPesquisa: TPanel;
    Label1: TLabel;
    EditPesquisa: TcxButtonEdit;
    Ac_Pesquisar: TAction;
    cbPesquisarPor: TcxImageComboBox;
    viewRegistros: TcxGridDBTableView;
    level: TcxGridLevel;
    cxGridRegistros: TcxGrid;
    pnData: TPanel;
    EditDataInicial: TcxDateEdit;
    EditDataFinal: TcxDateEdit;
    De: TLabel;
    Label2: TLabel;
    ColumnAlterar: TcxGridDBColumn;
    ColumnExcluir: TcxGridDBColumn;
    Ac_Alterar: TAction;
    Ac_Excluir: TAction;
    pnBotoesCadastro: TPanel;
    pnEditsCadastro: TPanel;
    btnSalvar: TButton;
    Ac_Salvar: TAction;
    btnCancelar: TButton;
    Ac_Cancelar: TAction;
    dsMaster: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure Ac_AlterarExecute(Sender: TObject);
    procedure Ac_ExcluirExecute(Sender: TObject);
    procedure Ac_SalvarExecute(Sender: TObject);
    procedure Ac_CancelarExecute(Sender: TObject);
    procedure Ac_PesquisarExecute(Sender: TObject);
  private
  protected
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); virtual;

    procedure pprValidarDados; virtual;
    procedure pprValidarCamposObrigatorios(ipDataSet: TDataSet); virtual;

    procedure pprBeforeSalvar; virtual;
    procedure pprExecutarSalvar; virtual;
    procedure pprAfterSalvar; virtual;
  public
    procedure ppuIncluir; virtual;
    procedure ppuAlterar(ipId: Int64); virtual;
    function fpuExcluir(ipIds: TArray<Int64>): Boolean; virtual;
    function fpuSalvar: Boolean; virtual;
    procedure ppuCancelar; virtual;
  end;

var
  frmBasicoCrud: TfrmBasicoCrud;

implementation

{$R *.dfm}

procedure TfrmBasicoCrud.Ac_AlterarExecute(Sender: TObject);
begin
  inherited;
  ppuAlterar(dsMaster.DataSet.FieldByName(TBancoDados.coId).AsLargeInt);
end;

procedure TfrmBasicoCrud.Ac_CancelarExecute(Sender: TObject);
begin
  inherited;
  ppuCancelar;
end;

procedure TfrmBasicoCrud.Ac_ExcluirExecute(Sender: TObject);
var
  vaIds: TArray<Int64>;
begin
  inherited;
  SetLength(vaIds, 1);
  vaIds[0] := dsMaster.DataSet.FieldByName(TBancoDados.coId).AsLargeInt;
  fpuExcluir(vaIds);
end;

procedure TfrmBasicoCrud.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  ppuIncluir;
end;

procedure TfrmBasicoCrud.Ac_PesquisarExecute(Sender: TObject);
begin
  inherited;
  //TODO:Fazer a pesquisa
end;

procedure TfrmBasicoCrud.Ac_SalvarExecute(Sender: TObject);
begin
  inherited;
  fpuSalvar;
end;

procedure TfrmBasicoCrud.FormCreate(Sender: TObject);
begin
  inherited;
  pcPrincipal.HideTabs := True;
  pcPrincipal.ActivePage := tabPesquisa;
end;

procedure TfrmBasicoCrud.pprAfterSalvar;
begin
  pcPrincipal.ActivePage := tabPesquisa;
end;

procedure TfrmBasicoCrud.ppuAlterar(ipId: Int64);
begin
  pcPrincipal.ActivePage := tabCadastro;
end;

procedure TfrmBasicoCrud.ppuCancelar;
begin
  if (dsMaster.DataSet.State in [dsEdit, dsInsert]) or (TClientDataSet(dsMaster.DataSet).ChangeCount > 0) then
    begin
      if TMsg.fpuPerguntar('Desejar salvar o registro?', ppSimNao) = rpSim then
        begin
          fpuSalvar;
          Exit;
        end;
    end;

  TClientDataSet(dsMaster.DataSet).CancelUpdates;
  pcPrincipal.ActivePage := tabPesquisa;
end;

procedure TfrmBasicoCrud.pprBeforeSalvar;
begin
  pprPreencherCamposPadroes(dsMaster.DataSet);
  pprValidarDados;
end;

procedure TfrmBasicoCrud.pprExecutarSalvar;
begin
  if (dsMaster.DataSet.State in [dsEdit, dsInsert]) or (TClientDataSet(dsMaster.DataSet).ChangeCount > 0) then
    dsMaster.DataSet.Post;
end;

procedure TfrmBasicoCrud.pprPreencherCamposPadroes(ipDataSet: TDataSet);
var
  vaField: TField;
  vaTabela: String;
begin
  vaField := ipDataSet.FindField(TBancoDados.coId);
  if Assigned(vaField) then
    begin
      if vaField.IsNull then
        begin
          if ipDataSet.State in [dsEdit, dsInsert] then
            begin
              vaTabela := Copy(ipDataSet.Name, 4, length(ipDataSet.Name) - 4);
              vaField.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId(vaTabela);
            end;
        end;
    end;

end;

function TfrmBasicoCrud.fpuExcluir(ipIds: TArray<Int64>): Boolean;
var
  vaId: Integer;
begin
  Result := False;
  if TMsg.fpuPerguntar('Realmente deseja excluir?', ppSimNao) = rpSim then
    begin
      for vaId in ipIds do
        begin
          if dsMaster.DataSet.Locate(TBancoDados.coId, vaId, []) then
            dsMaster.DataSet.Delete;
        end;

      Result := True;

    end;

end;

procedure TfrmBasicoCrud.ppuIncluir;
begin
  dsMaster.DataSet.Append;
  pcPrincipal.ActivePage := tabCadastro;
end;

function TfrmBasicoCrud.fpuSalvar: Boolean;
begin
  Result := False;
  pprBeforeSalvar;
  pprExecutarSalvar;
  pprAfterSalvar;

  Result := True;
end;

procedure TfrmBasicoCrud.pprValidarCamposObrigatorios(ipDataSet: TDataSet);
var
  vaField: TField;
  vaMsg: TStringList;
begin
  vaMsg := TStringList.Create;
  try
    for vaField in ipDataSet.Fields do
      begin
        if vaField.Required and vaField.IsNull then
          begin
            vaMsg.Add(vaField.DisplayLabel);
          end;
      end;

    if vaMsg.Count > 0 then
      raise Exception.Create('Os seguintes campos são obrigatórios e não foram preenchidos:' + slineBreak + vaMsg.Text);

  finally
    vaMsg.Free;
  end;

end;

procedure TfrmBasicoCrud.pprValidarDados;
begin
  pprValidarCamposObrigatorios(dsMaster.DataSet);
end;

end.
