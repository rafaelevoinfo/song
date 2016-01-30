unit fPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrudMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls,
  cxDropDownEdit, cxImageComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  Vcl.ExtCtrls, cxPC, dmuAdministrativo, cxDBEdit, uClientDataSet,
  Datasnap.DBClient, uControleAcesso, System.Generics.Collections, cxCheckBox,
  uUtils, MidasLib;

type
  TfrmPerfil = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosDESCRICAO: TcxGridDBColumn;
    lbl1: TLabel;
    EditDescricao: TcxDBTextEdit;
    Label3: TLabel;
    EditNome: TcxDBTextEdit;
    viewPermissoes: TcxGridDBTableView;
    levelGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cdsLocalPermissoes: TClientDataSet;
    cdsLocalPermissoesPERMISSAO: TStringField;
    cdsLocalPermissoesVISUALIZAR: TIntegerField;
    cdsLocalPermissoesINCLUIR: TIntegerField;
    cdsLocalPermissoesALTERAR: TIntegerField;
    cdsLocalPermissoesEXCLUIR: TIntegerField;
    dsLocalPermissao: TDataSource;
    viewPermissoesPERMISSAO: TcxGridDBColumn;
    viewPermissoesVISUALIZAR: TcxGridDBColumn;
    viewPermissoesINCLUIR: TcxGridDBColumn;
    viewPermissoesALTERAR: TcxGridDBColumn;
    viewPermissoesEXCLUIR: TcxGridDBColumn;
    cdsLocalModulos: TClientDataSet;
    cdsLocalModulosMODULO: TStringField;
    dsLocalModulos: TDataSource;
    viewModulos: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    viewModulosMODULO: TcxGridDBColumn;
    cdsLocalPermissoesID_MODULO: TIntegerField;
    cdsLocalModulosID: TIntegerField;
    viewModulosID: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure viewPermissoesVISUALIZARPropertiesEditValueChanged(Sender: TObject);
    procedure viewPermissoesINCLUIRPropertiesEditValueChanged(Sender: TObject);
    procedure viewPermissoesALTERARPropertiesEditValueChanged(Sender: TObject);
    procedure viewPermissoesEXCLUIRPropertiesEditValueChanged(Sender: TObject);
  private
    FIdPerfilAtual: Integer;
    dmAdministrativo: TdmAdministrativo;
    procedure ppvCarregarModulos;
    procedure ppvCarregarPermissoesPerfil;
    procedure ppvAlterarOpcaoPermissao(ipOpcao: string);
    { Private declarations }
  protected
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
  public
    procedure ppuIncluirDetail; override;
    procedure ppuAlterarDetail(ipId: Int64); override;
  public const
    coNome = 2;

    { Public declarations }
  end;

var
  frmPerfil: TfrmPerfil;

implementation

{$R *.dfm}

procedure TfrmPerfil.FormCreate(Sender: TObject);
begin
  dmAdministrativo := TdmAdministrativo.create(Self);
  dmAdministrativo.Name := '';

  inherited;

  // vamos alimentar o cds dos modulos
  ppvCarregarModulos;
end;

procedure TfrmPerfil.ppvCarregarModulos;
var
  vaModulo, vaPermissao: string;
  vaControleAcesso: TControleAcesso;
  vaPermissoes: TList<string>;

begin
  if cdsLocalPermissoes.Active then
    cdsLocalPermissoes.EmptyDataSet
  else
    cdsLocalPermissoes.CreateDataSet;

  vaControleAcesso := TControleAcesso.fpuGetInstance;
  for vaModulo in vaControleAcesso.Modulos.Keys do
    begin
      vaPermissoes := vaControleAcesso.Modulos.Items[vaModulo];
      for vaPermissao in vaPermissoes do
        begin
          cdsLocalPermissoes.Append;
          cdsLocalPermissoesPERMISSAO.AsString := vaPermissao;
          cdsLocalPermissoesVISUALIZAR.AsInteger := 0;
          cdsLocalPermissoesINCLUIR.AsInteger := 0;
          cdsLocalPermissoesALTERAR.AsInteger := 0;
          cdsLocalPermissoesEXCLUIR.AsInteger := 0;
          cdsLocalPermissoes.Post;
        end;
    end;

end;

procedure TfrmPerfil.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.ItemIndex = coNome then
    ipCds.ppuAddParametro(TParametros.coNome, EditPesquisa.Text);
end;

procedure TfrmPerfil.ppuAlterarDetail(ipId: Int64);
begin
  inherited;
  ppvCarregarPermissoesPerfil;
end;

procedure TfrmPerfil.ppuIncluirDetail;
begin
  inherited;
  ppvCarregarPermissoesPerfil;
end;

procedure TfrmPerfil.ppvCarregarPermissoesPerfil;
begin
  if FIdPerfilAtual <> dmAdministrativo.cdsPerfilID.AsInteger then
    begin
      FIdPerfilAtual := dmAdministrativo.cdsPerfilID.AsInteger;

      TUtils.fpuPercorrerCds(cdsLocalPermissoes,
        procedure
        begin
          cdsLocalPermissoes.Edit;
          if dmAdministrativo.cdsPerfil_Permissao.Locate(dmAdministrativo.cdsPerfil_PermissaoPERMISSAO.FieldName,
            cdsLocalPermissoesPERMISSAO.AsString, [loCaseInsensitive]) then
            begin
              cdsLocalPermissoesVISUALIZAR.AsInteger := dmAdministrativo.cdsPerfil_PermissaoVISUALIZAR.AsInteger;
              cdsLocalPermissoesINCLUIR.AsInteger := dmAdministrativo.cdsPerfil_PermissaoINCLUIR.AsInteger;
              cdsLocalPermissoesALTERAR.AsInteger := dmAdministrativo.cdsPerfil_PermissaoALTERAR.AsInteger;
              cdsLocalPermissoesEXCLUIR.AsInteger := dmAdministrativo.cdsPerfil_PermissaoEXCLUIR.AsInteger;
            end
          else
            begin
              cdsLocalPermissoesVISUALIZAR.AsInteger := 0;
              cdsLocalPermissoesINCLUIR.AsInteger := 0;
              cdsLocalPermissoesALTERAR.AsInteger := 0;
              cdsLocalPermissoesEXCLUIR.AsInteger := 0;
            end;

          cdsLocalPermissoes.Post;
        end);
    end;
end;

procedure TfrmPerfil.ppvAlterarOpcaoPermissao(ipOpcao: string);
begin
  if dmAdministrativo.cdsPerfil_Permissao.Locate(dmAdministrativo.cdsPerfil_PermissaoPERMISSAO.FieldName,
    cdsLocalPermissoesPERMISSAO.AsString, [loCaseInsensitive]) then
    begin
      dmAdministrativo.cdsPerfil_Permissao.Edit;
      dmAdministrativo.cdsPerfil_Permissao.FieldByName(ipOpcao).AsInteger := cdsLocalPermissoes.FieldByName(ipOpcao).AsInteger;
      dmAdministrativo.cdsPerfil_Permissao.Post;
    end
  else if cdsLocalPermissoes.FieldByName(ipOpcao).AsInteger = 1 then
    begin
      dmAdministrativo.cdsPerfil_Permissao.Append;
      dmAdministrativo.cdsPerfil_Permissao.FieldByName(ipOpcao).AsInteger := 1;
      dmAdministrativo.cdsPerfil_Permissao.Post;
    end;
end;

procedure TfrmPerfil.viewPermissoesALTERARPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  ppvAlterarOpcaoPermissao(dmAdministrativo.cdsPerfil_PermissaoALTERAR.FieldName);
end;

procedure TfrmPerfil.viewPermissoesEXCLUIRPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  ppvAlterarOpcaoPermissao(dmAdministrativo.cdsPerfil_PermissaoEXCLUIR.FieldName);
end;

procedure TfrmPerfil.viewPermissoesINCLUIRPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  ppvAlterarOpcaoPermissao(dmAdministrativo.cdsPerfil_PermissaoINCLUIR.FieldName);
end;

procedure TfrmPerfil.viewPermissoesVISUALIZARPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  ppvAlterarOpcaoPermissao(dmAdministrativo.cdsPerfil_PermissaoVISUALIZAR.FieldName);
end;

end.
