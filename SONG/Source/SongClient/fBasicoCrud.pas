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
  uTypes, uExceptions, uClientDataSet, System.Rtti, MidasLib, uUtils,
  uControleAcesso, System.TypInfo;

type
  TfrmBasicoCrud = class(TfrmBasico)
    pcPrincipal: TcxPageControl;
    tabPesquisa: TcxTabSheet;
    tabCadastro: TcxTabSheet;
    pnPesquisa: TPanel;
    pnGrid: TPanel;
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
    btnPesquisar: TButton;
    pnBotoes: TPanel;
    btnIncluir: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure Ac_AlterarExecute(Sender: TObject);
    procedure Ac_ExcluirExecute(Sender: TObject);
    procedure Ac_SalvarExecute(Sender: TObject);
    procedure Ac_CancelarExecute(Sender: TObject);
    procedure Ac_PesquisarExecute(Sender: TObject);
    procedure cbPesquisarPorPropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Ac_SalvarUpdate(Sender: TObject);
    procedure viewRegistrosDblClick(Sender: TObject);
    procedure EditPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    FPadraoPesquisa: TPadraoPesquisa;
    procedure SetPadraoPesquisa(const Value: TPadraoPesquisa);
  protected
    // SALVAR
    procedure pprPreencherCamposPadroes(ipDataSet: TDataSet); virtual;
    procedure pprValidarDados; virtual;
    procedure pprValidarCamposObrigatorios(ipDataSet: TDataSet); virtual;
    procedure pprBeforeSalvar; virtual;
    procedure pprExecutarSalvar; virtual;
    procedure pprAfterSalvar; virtual;
    function fprHabilitarSalvar(): Boolean; virtual;
    // PESQUISA
    procedure pprRealizarPesquisaInicial; virtual;
    procedure pprValidarPesquisa; virtual;
    procedure pprEfetuarPesquisa; virtual;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); virtual;
    // GERAL
    procedure pprConfigurarLabelsCamposObrigatorios;
    // TODA tela deve sobrescrever essa procedure e definir qual a permissao da tela
    function fprGetPermissao: String; virtual; abstract;
    procedure pprValidarPermissao(ipAcao: TAcaoTela; ipPermissao: string);
  public
    property PadraoPesquisa: TPadraoPesquisa read FPadraoPesquisa write SetPadraoPesquisa;
    property Permissao:string read fprGetPermissao;

    constructor Create(AOwner: TComponent); override;
    // CRUD
    procedure ppuIncluir; virtual;
    procedure ppuAlterar(ipId: Integer); virtual;
    function fpuExcluir(ipIds: TArray<Integer>): Boolean; virtual;
    function fpuSalvar: Boolean; virtual;
    procedure ppuCancelar; virtual;
    // PESQUISA
    procedure ppuPesquisar; virtual;
  public const
    coTodos = 0;
    coID = 1;
  end;

var

  frmBasicoCrud: TfrmBasicoCrud;

implementation

{$R *.dfm}


procedure TfrmBasicoCrud.Ac_AlterarExecute(Sender: TObject);
begin
  inherited;
  ppuAlterar(dsMaster.DataSet.FieldByName(TBancoDados.coID).AsInteger);
end;

procedure TfrmBasicoCrud.Ac_CancelarExecute(Sender: TObject);
begin
  inherited;
  ppuCancelar;
end;

procedure TfrmBasicoCrud.Ac_ExcluirExecute(Sender: TObject);
var
  vaIds: TArray<Integer>;
begin
  inherited;
  SetLength(vaIds, 1);
  vaIds[0] := dsMaster.DataSet.FieldByName(TBancoDados.coID).AsInteger;
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
  ppuPesquisar;
end;

procedure TfrmBasicoCrud.Ac_SalvarExecute(Sender: TObject);
begin
  inherited;
  fpuSalvar;
end;

procedure TfrmBasicoCrud.Ac_SalvarUpdate(Sender: TObject);
begin
  inherited;
  if Sender is TAction then
    TAction(Sender).Enabled := fprHabilitarSalvar();
end;

procedure TfrmBasicoCrud.cbPesquisarPorPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  EditPesquisa.Clear;

  EditPesquisa.Properties.EditMask := '.*';
  if cbPesquisarPor.ItemIndex = coID then
    EditPesquisa.Properties.EditMask := '\d+';

  EditPesquisa.SetFocus;
end;

constructor TfrmBasicoCrud.Create(AOwner: TComponent);
begin
  inherited;
  pprValidarPermissao(atVisualizar,fprGetPermissao);
end;

procedure TfrmBasicoCrud.EditPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = Char(VK_RETURN) then
    begin
      ppuPesquisar;
      TUtils.ppuFocar(EditPesquisa);
      Key := #0;
    end;
end;

procedure TfrmBasicoCrud.FormCreate(Sender: TObject);
begin
  inherited;

  pcPrincipal.HideTabs := True;
  pcPrincipal.ActivePage := tabPesquisa;

  pprConfigurarLabelsCamposObrigatorios;
end;

procedure TfrmBasicoCrud.FormShow(Sender: TObject);
begin
  inherited;
  pprRealizarPesquisaInicial;
end;

procedure TfrmBasicoCrud.pprAfterSalvar;
begin
  pcPrincipal.ActivePage := tabPesquisa;
end;

procedure TfrmBasicoCrud.ppuAlterar(ipId: Integer);
begin
  pprValidarPermissao(atAlterar,fprGetPermissao);
  pcPrincipal.ActivePage := tabCadastro;
end;

procedure TfrmBasicoCrud.ppuCancelar;
begin
  if fprHabilitarSalvar then
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

procedure TfrmBasicoCrud.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  ipCds.ppuLimparParametros;
  if cbPesquisarPor.ItemIndex = coTodos then
    ipCds.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA')
  else if (cbPesquisarPor.ItemIndex = coID) then
    ipCds.ppuAddParametro(TParametros.coID, EditPesquisa.Text);

end;

procedure TfrmBasicoCrud.pprEfetuarPesquisa;
begin
  viewRegistros.BeginUpdate(lsimImmediate);
  try
    TRFClientDataSet(dsMaster.DataSet).ppuDataRequest();
  finally
    viewRegistros.EndUpdate;
  end;

end;

procedure TfrmBasicoCrud.pprExecutarSalvar;
begin
  if (dsMaster.DataSet.State in [dsEdit, dsInsert]) or (TClientDataSet(dsMaster.DataSet).ChangeCount > 0) then
    dsMaster.DataSet.Post;
end;

function TfrmBasicoCrud.fprHabilitarSalvar(): Boolean;
begin
  Result := dsMaster.DataSet.Active and ((dsMaster.DataSet.State in [dsEdit, dsInsert]) or
    (TClientDataSet(dsMaster.DataSet).ChangeCount > 0));
end;

procedure TfrmBasicoCrud.pprPreencherCamposPadroes(ipDataSet: TDataSet);
var
  vaField: TField;
  vaTabela: String;
begin
  vaField := ipDataSet.FindField(TBancoDados.coID);
  if Assigned(vaField) then
    begin
      if vaField.IsNull then
        begin
          if ipDataSet.State in [dsEdit, dsInsert] then
            begin
              vaTabela := Copy(ipDataSet.Name, 4, Length(ipDataSet.Name) - 3);
              vaField.AsInteger := dmPrincipal.FuncoesGeral.fpuGetId(vaTabela);
            end;
        end;
    end;
end;

procedure TfrmBasicoCrud.pprRealizarPesquisaInicial;
begin
  case PadraoPesquisa of
    ppActive:
      cbPesquisarPor.ItemIndex := coID;
    // coloco o id, mas como nao vai ter valor no Edit nao vai trazer nada, vai apenas abrir a tabelas
    ppTodos:
      cbPesquisarPor.ItemIndex := coTodos;
  end;

  ppuPesquisar;
end;

function TfrmBasicoCrud.fpuExcluir(ipIds: TArray<Integer>): Boolean;
var
  vaId: Integer;
begin
  pprValidarPermissao(atExcluir,fprGetPermissao);
  Result := False;
  if TMsg.fpuPerguntar('Realmente deseja excluir?', ppSimNao) = rpSim then
    begin
      for vaId in ipIds do
        begin
          if dsMaster.DataSet.Locate(TBancoDados.coID, vaId, []) then
            dsMaster.DataSet.Delete;
        end;

      Result := True;

    end;

end;

procedure TfrmBasicoCrud.ppuIncluir;
begin
  pprValidarPermissao(atIncluir,fprGetPermissao);
  dsMaster.DataSet.Append;
  pcPrincipal.ActivePage := tabCadastro;
end;

procedure TfrmBasicoCrud.ppuPesquisar;
begin
  pprValidarPesquisa;
  pprCarregarParametrosPesquisa(dsMaster.DataSet as TRFClientDataSet);
  pprEfetuarPesquisa;
end;

procedure TfrmBasicoCrud.SetPadraoPesquisa(const Value: TPadraoPesquisa);
begin
  FPadraoPesquisa := Value;
end;

procedure TfrmBasicoCrud.viewRegistrosDblClick(Sender: TObject);
begin
  inherited;
  if dsMaster.DataSet.Active and (dsMaster.DataSet.RecordCount > 0) then
    ppuAlterar(dsMaster.DataSet.FieldByName(TBancoDados.coID).AsInteger);
end;

function TfrmBasicoCrud.fpuSalvar: Boolean;
begin
  Result := False;
  pprBeforeSalvar;
  pprExecutarSalvar;
  pprAfterSalvar;

  Result := True;
end;

procedure TfrmBasicoCrud.pprConfigurarLabelsCamposObrigatorios();
var
  vaField: TField;
  I: Integer;
  vaContext: TRTTIContext;
  vaLabel: TLabel;
  vaProp: TRttiProperty;
  vaDataBind: TObject;
  vaDataSet: TDataSet;
  vaFieldName: string;
begin
  for I := 0 to ComponentCount - 1 do
    begin
      if (Components[I] is TLabel) then
        begin
          vaLabel := TLabel(Components[I]);
          if Assigned(vaLabel.FocusControl) then
            begin
              vaContext := TRTTIContext.Create;
              vaProp := vaContext.GetType(vaLabel.FocusControl.ClassType).GetProperty('DataBinding');
              if Assigned(vaProp) then
                begin
                  vaDataBind := vaProp.GetValue(vaLabel.FocusControl).AsObject;
                  vaFieldName := vaContext.GetType(vaDataBind.ClassType).GetProperty('DataField')
                    .GetValue(vaDataBind).AsString;
                  vaProp := vaContext.GetType(vaDataBind.ClassType).GetProperty('DataSource');
                  if Assigned(vaProp) then
                    begin
                      vaDataSet := (vaProp.GetValue(vaDataBind).AsObject as TDataSource).DataSet;
                      if Assigned(vaDataSet) then
                        begin
                          vaField := vaDataSet.FindField(vaFieldName);
                          if Assigned(vaField) and vaField.Required then
                            begin
                              vaLabel.Font.Color := clRed;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
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

procedure TfrmBasicoCrud.pprValidarPermissao(ipAcao: TAcaoTela; ipPermissao: string);
begin
  if not TInfoLogin.fpuGetInstance.fpuValidarPermissao(ipAcao, ipPermissao) then
    raise Exception.Create('Operação não permitida.' + slineBreak + 'O usuário logado não possui a ação de ' +
      AcaoTelaDescricao[ipAcao].ToUpper + ' para a permissão ' + PermissaoDescricao[TPermissao(GetEnumValue(TypeInfo(TPermissao), ipPermissao))].ToUpper);
end;

procedure TfrmBasicoCrud.pprValidarPesquisa;
begin
  if EditPesquisa.Visible and (cbPesquisarPor.ItemIndex <> coTodos) and (cbPesquisarPor.ItemIndex <> coID) then
    begin
      if Trim(EditPesquisa.Text) = '' then
        raise TControlException.Create('Informe algo a ser pesquisado', EditPesquisa);
    end;
  if pnData.Visible then
    begin
      if (EditDataInicial.Date = 0) then
        raise Exception.Create('Informe a data inicial.');

      if (EditDataFinal.Date = 0) then
        raise Exception.Create('Informe a data final.');
    end;

end;

end.
