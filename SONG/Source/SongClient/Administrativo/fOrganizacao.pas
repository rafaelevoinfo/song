unit fOrganizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrudMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxGroupBox,
  cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuAdministrativo, dmuLookup,
  cxDBEdit, cxMemo, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  uControleAcesso, System.TypInfo, uUtils, uClientDataSet, uTypes;

type
  TfrmOrganizacao = class(TfrmBasicoCrudMasterDetail)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosCNPJ: TcxGridDBColumn;
    viewRegistrosINSCRICAO_ESTADUAL: TcxGridDBColumn;
    viewRegistrosENDERECO: TcxGridDBColumn;
    viewRegistrosBAIRRO: TcxGridDBColumn;
    viewRegistrosCOMPLEMENTO: TcxGridDBColumn;
    viewRegistrosCIDADE: TcxGridDBColumn;
    viewRegistrosTELEFONE: TcxGridDBColumn;
    viewRegistrosDetailID: TcxGridDBColumn;
    viewRegistrosDetailID_PESSOA: TcxGridDBColumn;
    viewRegistrosDetailFUNCAO: TcxGridDBColumn;
    Label3: TLabel;
    EditNome: TcxDBTextEdit;
    Label4: TLabel;
    EditCnpj: TcxDBMaskEdit;
    Label5: TLabel;
    EditInscricaoEstadual: TcxDBTextEdit;
    rgEndereco: TcxGroupBox;
    Label6: TLabel;
    EditEndereco: TcxDBTextEdit;
    EditBairro: TcxDBTextEdit;
    Label7: TLabel;
    Label8: TLabel;
    EditComplemento: TcxDBTextEdit;
    Label9: TLabel;
    EditCidade: TcxDBTextEdit;
    Label11: TLabel;
    EditFuncao: TcxDBTextEdit;
    Label12: TLabel;
    cbPessoa: TcxDBLookupComboBox;
    Label13: TLabel;
    EditObs: TcxDBMemo;
    Label10: TLabel;
    EditTelefone: TcxDBMaskEdit;
    procedure FormCreate(Sender: TObject);
  private
    dmAdministrativo: TdmAdministrativo;
    dmLookup: TdmLookup;
  protected
    function fprGetPermissao: String; override;
    procedure pprBeforeIncluirDetail; override;
    procedure pprBeforeAlterarDetail; override;

    procedure pprFiltrarPessoas(ipIdPessoaIgnorar: Integer = 0);
  public
    procedure ppuRetornar; override;

  end;

var
  frmOrganizacao: TfrmOrganizacao;

implementation

{$R *.dfm}

{ TfrmOrganizacao }

procedure TfrmOrganizacao.FormCreate(Sender: TObject);
begin
  dmAdministrativo := TdmAdministrativo.Create(Self);
  dmAdministrativo.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';
  inherited;
  PesquisaPadrao := tppTodos;

  dmLookup.cdslkPessoa.Open;
end;

function TfrmOrganizacao.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoAdministrativo), Ord(admOrganizacao));
end;

procedure TfrmOrganizacao.pprFiltrarPessoas(ipIdPessoaIgnorar: Integer);
var
  vaCodigosPessoa: string;
begin
  inherited;
  vaCodigosPessoa := TUtils.fpuMontarStringCodigo(dmAdministrativo.cdsOrganizacao_Pessoa,
    dmAdministrativo.cdsOrganizacao_PessoaID_PESSOA.FieldName, ', ');
  if vaCodigosPessoa <> '' then
    begin
      dmLookup.cdslkPessoa.Filter := Format('(NOT %s IN (' + vaCodigosPessoa + '))', [TBancoDados.coId]);
      if ipIdPessoaIgnorar <> 0 then
        dmLookup.cdslkPessoa.Filter := dmLookup.cdslkPessoa.Filter + ' OR (' + TBancoDados.coId + ' = ' +
          ipIdPessoaIgnorar.ToString + ')';
    end
  else
    dmLookup.cdslkPessoa.Filter := '';

  dmLookup.cdslkPessoa.Filtered := dmLookup.cdslkPessoa.Filter <> '';
end;

procedure TfrmOrganizacao.ppuRetornar;
begin
  inherited;
  dmLookup.cdslkPessoa.Filtered := False;
end;

procedure TfrmOrganizacao.pprBeforeAlterarDetail;
begin
  inherited;
  pprFiltrarPessoas(dmAdministrativo.cdsOrganizacao_PessoaID_PESSOA.AsInteger);
end;

procedure TfrmOrganizacao.pprBeforeIncluirDetail;
begin
  inherited;
  pprFiltrarPessoas;
end;

end.
