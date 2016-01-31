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
  uUtils, MidasLib, dmuLookup, dmuPrincipal, cxTL, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, cxDBTL, cxTLData;

type
  TfrmPerfil = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosDESCRICAO: TcxGridDBColumn;
    lbl1: TLabel;
    EditDescricao: TcxDBTextEdit;
    Label3: TLabel;
    EditNome: TcxDBTextEdit;
    cdsLocalPermissoes: TClientDataSet;
    cdsLocalPermissoesPERMISSAO: TStringField;
    cdsLocalPermissoesVISUALIZAR: TIntegerField;
    cdsLocalPermissoesINCLUIR: TIntegerField;
    cdsLocalPermissoesALTERAR: TIntegerField;
    cdsLocalPermissoesEXCLUIR: TIntegerField;
    dsLocalPermissao: TDataSource;
    cdsLocalModulos: TClientDataSet;
    cdsLocalModulosMODULO: TStringField;
    dsLocalModulos: TDataSource;
    cdsLocalPermissoesID_MODULO: TIntegerField;
    cdsLocalModulosID: TIntegerField;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailPERMISSAO: TcxGridDBColumn;
    viewRegistrosDetailVISUALIZAR: TcxGridDBColumn;
    viewRegistrosDetailINCLUIR: TcxGridDBColumn;
    viewRegistrosDetailALTERAR: TcxGridDBColumn;
    viewRegistrosDetailEXCLUIR: TcxGridDBColumn;
    cxDBTreeList1: TcxDBTreeList;
    cdsLocalPermissoesID: TIntegerField;
    cxDBTreeList1PERMISSAO: TcxDBTreeListColumn;
    cxDBTreeList1VISUALIZAR: TcxDBTreeListColumn;
    cxDBTreeList1INCLUIR: TcxDBTreeListColumn;
    cxDBTreeList1ALTERAR: TcxDBTreeListColumn;
    cxDBTreeList1EXCLUIR: TcxDBTreeListColumn;
    cxDBTreeList1ID_MODULO: TcxDBTreeListColumn;
    cxDBTreeList1ID: TcxDBTreeListColumn;
    procedure FormCreate(Sender: TObject);
  private
    FIdPerfilAtual: Integer;
    dmAdministrativo: TdmAdministrativo;
    dmLookup: TdmLookup;
    procedure ppvCarregarModulos;
    procedure ppvCarregarPermissoesPerfil;
    procedure ppvAlterarOpcaoPermissao(ipOpcao: string);
    { Private declarations }
  protected
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprBeforeSalvarDetail; override;
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

  dmLookup := TdmLookup.create(Self);
  dmLookup.Name := '';

  inherited;

  // vamos alimentar o cds dos modulos
  ppvCarregarModulos;
end;

procedure TfrmPerfil.ppvCarregarModulos;
var
  vaModulo, vaPermissao: string;
  vaControleAcesso: TControleAcesso;
  vaPermissoes: TList<string>;
  vaIdModulo,vaId: Integer;

begin
  vaIdModulo := 0;
  vaId := 0;

  if cdsLocalPermissoes.Active then
    cdsLocalPermissoes.EmptyDataSet
  else
    cdsLocalPermissoes.CreateDataSet;

  if cdsLocalModulos.Active then
    cdsLocalModulos.EmptyDataSet
  else
    cdsLocalModulos.CreateDataSet;

  vaControleAcesso := TControleAcesso.fpuGetInstance;
  for vaModulo in vaControleAcesso.Modulos.Keys do
    begin
      Inc(vaId);
      vaIdModulo := vaId;
      cdsLocalPermissoes.Append;
      cdsLocalPermissoesID.AsInteger := vaIdModulo;
      cdsLocalPermissoesPERMISSAO.AsString := vaModulo;
      cdsLocalPermissoes.Post;

      vaPermissoes := vaControleAcesso.Modulos.Items[vaModulo];
      for vaPermissao in vaPermissoes do
        begin
          Inc(vaId);
          cdsLocalPermissoes.Append;
          cdsLocalPermissoesID.AsInteger := vaId;
          cdsLocalPermissoesID_MODULO.AsInteger := vaIdModulo;
          cdsLocalPermissoesPERMISSAO.AsString := vaPermissao;
          cdsLocalPermissoesVISUALIZAR.AsInteger := 0;
          cdsLocalPermissoesINCLUIR.AsInteger := 0;
          cdsLocalPermissoesALTERAR.AsInteger := 0;
          cdsLocalPermissoesEXCLUIR.AsInteger := 0;
          cdsLocalPermissoes.Post;
        end;
    end;

end;

procedure TfrmPerfil.pprBeforeSalvarDetail;
begin
  inherited;
  TUtils.ppuPercorrerCds(dmAdministrativo.cdsPerfil_Permissao,
    procedure
    begin
      dmAdministrativo.cdsPerfil_Permissao.Edit;
      //vamos garantir que ninguem estara com o valor null
      dmAdministrativo.cdsPerfil_PermissaoVISUALIZAR.AsInteger := dmAdministrativo.cdsPerfil_PermissaoVISUALIZAR.AsInteger;
      dmAdministrativo.cdsPerfil_PermissaoINCLUIR.AsInteger := dmAdministrativo.cdsPerfil_PermissaoINCLUIR.AsInteger;
      dmAdministrativo.cdsPerfil_PermissaoALTERAR.AsInteger := dmAdministrativo.cdsPerfil_PermissaoALTERAR.AsInteger;
      dmAdministrativo.cdsPerfil_PermissaoEXCLUIR.AsInteger := dmAdministrativo.cdsPerfil_PermissaoEXCLUIR.AsInteger;
      dmAdministrativo.cdsPerfil_Permissao.Post;
    end);
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
  // nao quero que fique em insert
  dmAdministrativo.cdsPerfil_Permissao.Cancel;
  ppvCarregarPermissoesPerfil;
end;

procedure TfrmPerfil.ppvCarregarPermissoesPerfil;
begin
  if FIdPerfilAtual <> dmAdministrativo.cdsPerfilID.AsInteger then
    begin
      FIdPerfilAtual := dmAdministrativo.cdsPerfilID.AsInteger;

      TUtils.ppuPercorrerCds(cdsLocalPermissoes,
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
      dmAdministrativo.cdsPerfil_PermissaoPERMISSAO.AsString := cdsLocalPermissoesPERMISSAO.AsString;
      dmAdministrativo.cdsPerfil_Permissao.FieldByName(ipOpcao).AsInteger := cdsLocalPermissoes.FieldByName(ipOpcao)
        .AsInteger;
      dmAdministrativo.cdsPerfil_Permissao.Post;
    end
  else if cdsLocalPermissoes.FieldByName(ipOpcao).AsInteger = 1 then
    begin
      dmAdministrativo.cdsPerfil_Permissao.Append;
      pprPreencherCamposPadroes(dmAdministrativo.cdsPerfil_Permissao);
      dmAdministrativo.cdsPerfil_PermissaoPERMISSAO.AsString := cdsLocalPermissoesPERMISSAO.AsString;
      dmAdministrativo.cdsPerfil_Permissao.FieldByName(ipOpcao).AsInteger := 1;
      dmAdministrativo.cdsPerfil_Permissao.Post;
    end;
end;


end.
