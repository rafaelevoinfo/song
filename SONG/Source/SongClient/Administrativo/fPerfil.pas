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
  cxInplaceContainer, cxDBTL, cxTLData, uTypes;

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
    cdsLocalPermissoesID_MODULO: TIntegerField;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailPERMISSAO: TcxGridDBColumn;
    viewRegistrosDetailVISUALIZAR: TcxGridDBColumn;
    viewRegistrosDetailINCLUIR: TcxGridDBColumn;
    viewRegistrosDetailALTERAR: TcxGridDBColumn;
    viewRegistrosDetailEXCLUIR: TcxGridDBColumn;
    cdsLocalPermissoesID: TIntegerField;
    tlPermissoes: TcxDBTreeList;
    cxDBTreeList1PERMISSAO: TcxDBTreeListColumn;
    cxDBTreeList1VISUALIZAR: TcxDBTreeListColumn;
    cxDBTreeList1INCLUIR: TcxDBTreeListColumn;
    cxDBTreeList1ALTERAR: TcxDBTreeListColumn;
    cxDBTreeList1EXCLUIR: TcxDBTreeListColumn;
    cxDBTreeList1ID_MODULO: TcxDBTreeListColumn;
    cxDBTreeList1ID: TcxDBTreeListColumn;
    procedure FormCreate(Sender: TObject);
    procedure tlPermissoesEditValueChanged(Sender: TcxCustomTreeList; AColumn: TcxTreeListColumn);
  private
    FIdPerfilAtual: Integer;
    dmAdministrativo: TdmAdministrativo;
    dmLookup: TdmLookup;
    procedure ppvCarregarModulos;
    procedure ppvCarregarPermissoesPerfil;
    procedure ppvZerarPermissoes;
    { Private declarations }
  protected
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;
    procedure pprBeforeSalvarDetail; override;
    function fprHabilitarSalvarDetail(): Boolean; override;
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

procedure TfrmPerfil.ppvZerarPermissoes;
begin
  if cdsLocalPermissoes.State in [dsEdit, dsInsert] then
    begin
      cdsLocalPermissoesVISUALIZAR.AsInteger := 0;
      cdsLocalPermissoesINCLUIR.AsInteger := 0;
      cdsLocalPermissoesALTERAR.AsInteger := 0;
      cdsLocalPermissoesEXCLUIR.AsInteger := 0;
    end;
end;

procedure TfrmPerfil.ppvCarregarModulos;
var
  vaModulo, vaPermissao: string;
  vaControleAcesso: TControleAcesso;
  vaPermissoes: TList<string>;
  vaIdModulo, vaId: Integer;

begin
  vaIdModulo := 0;
  vaId := 0;

  if cdsLocalPermissoes.Active then
    cdsLocalPermissoes.EmptyDataSet
  else
    cdsLocalPermissoes.CreateDataSet;

  vaControleAcesso := TControleAcesso.fpuGetInstance;
  for vaModulo in vaControleAcesso.Modulos.Keys do
    begin
      Inc(vaId);
      vaIdModulo := vaId;
      cdsLocalPermissoes.Append;
      cdsLocalPermissoesID.AsInteger := vaId;
      cdsLocalPermissoesPERMISSAO.AsString := vaModulo;
      ppvZerarPermissoes;
      cdsLocalPermissoes.Post;

      vaPermissoes := vaControleAcesso.Modulos.Items[vaModulo];
      for vaPermissao in vaPermissoes do
        begin
          Inc(vaId);
          cdsLocalPermissoes.Append;
          cdsLocalPermissoesID.AsInteger := vaId;
          cdsLocalPermissoesID_MODULO.AsInteger := vaIdModulo;
          cdsLocalPermissoesPERMISSAO.AsString := vaPermissao;
          ppvZerarPermissoes;
          cdsLocalPermissoes.Post;
        end;
    end;

end;

procedure TfrmPerfil.pprBeforeSalvarDetail;
var
  vaPossuiPermissao: Boolean;
begin
  TUtils.ppuPercorrerCds(cdsLocalPermissoes,
    procedure
    begin
      if not cdsLocalPermissoesID_MODULO.IsNull then
        begin
          vaPossuiPermissao := (cdsLocalPermissoesVISUALIZAR.AsInteger <> 0) or
            (cdsLocalPermissoesINCLUIR.AsInteger <> 0) or (cdsLocalPermissoesALTERAR.AsInteger <> 0) or
            (cdsLocalPermissoesEXCLUIR.AsInteger <> 0);

          if dmAdministrativo.cdsPerfil_Permissao.Locate(dmAdministrativo.cdsPerfil_PermissaoPERMISSAO.FieldName,
            cdsLocalPermissoesPERMISSAO.AsString, [loCaseInsensitive]) then
            begin
              dmAdministrativo.cdsPerfil_Permissao.Edit;
            end
          else if vaPossuiPermissao then
            begin
              dmAdministrativo.cdsPerfil_Permissao.Append;
              dmAdministrativo.cdsPerfil_PermissaoPERMISSAO.AsString := cdsLocalPermissoesPERMISSAO.AsString;
              pprPreencherCamposPadroes(dmAdministrativo.cdsPerfil_Permissao);

            end;

          if dmAdministrativo.cdsPerfil_Permissao.State in [dsEdit, dsInsert] then
            begin
              dmAdministrativo.cdsPerfil_PermissaoVISUALIZAR.AsInteger := cdsLocalPermissoesVISUALIZAR.AsInteger;
              dmAdministrativo.cdsPerfil_PermissaoINCLUIR.AsInteger := cdsLocalPermissoesINCLUIR.AsInteger;
              dmAdministrativo.cdsPerfil_PermissaoALTERAR.AsInteger := cdsLocalPermissoesALTERAR.AsInteger;
              dmAdministrativo.cdsPerfil_PermissaoEXCLUIR.AsInteger := cdsLocalPermissoesEXCLUIR.AsInteger;
              dmAdministrativo.cdsPerfil_Permissao.Post
            end;

        end;
    end);

  inherited;
end;

procedure TfrmPerfil.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.ItemIndex = coNome then
    ipCds.ppuAddParametro(TParametros.coNome, EditPesquisa.Text);
end;

function TfrmPerfil.fprHabilitarSalvarDetail(): Boolean;
begin
  Result := inherited;
  if not Result then
    Result := (cdsLocalPermissoes.Active and (cdsLocalPermissoes.ChangeCount > 0));
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
  dmAdministrativo.cdsPerfil_Permissao.DisableControls;
  try
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
            ppvZerarPermissoes;
          end;

        cdsLocalPermissoes.Post;
      end);
  finally
    dmAdministrativo.cdsPerfil_Permissao.EnableControls;
  end;

  cdsLocalPermissoes.MergeChangeLog;
end;

procedure TfrmPerfil.tlPermissoesEditValueChanged(Sender: TcxCustomTreeList; AColumn: TcxTreeListColumn);
var
  vaField: string;
  vaValor, vaId: Integer;
begin
  inherited;
  if cdsLocalPermissoesID_MODULO.IsNull then
    begin
      vaField := TcxDBItemDataBinding(AColumn.DataBinding).FieldName;
      vaValor := AColumn.Value;
      vaId := cdsLocalPermissoesID.AsInteger;

      TUtils.ppuPercorrerCds(cdsLocalPermissoes,
        procedure
        begin
          if cdsLocalPermissoesID_MODULO.AsInteger = vaId then
            begin
              cdsLocalPermissoes.Edit;
              cdsLocalPermissoes.FieldByName(vaField).AsInteger := vaValor;
              cdsLocalPermissoes.Post;
            end;
        end);
    end
  else
    tlPermissoes.Post;
end;

end.