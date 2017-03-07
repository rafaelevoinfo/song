unit fBasicoCadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.Rtti,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBasico, FMX.Controls.Presentation, FMX.MediaLibrary.Actions, FMX.StdActns,
  System.Actions, FMX.ActnList, Data.DB, FMX.Objects, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, FMX.Edit, uClientDataSet;

type
  TfrmBasicoCadastro = class(TfrmBasico)
    tbAcao: TToolBar;
    btnRetornar: TButton;
    btnSalvar: TButton;
    ActionList1: TActionList;
    Ac_Salvar: TAction;
    Ac_Retornar: TAction;
    Ac_Tirar_Foto: TTakePhotoFromCameraAction;
    Ac_Carregar_Foto: TTakePhotoFromLibraryAction;
    Ac_Pegar_Localizacao: TAction;
    dsPrincipal: TDataSource;
    recFade: TRectangle;
    recModal: TRectangle;
    LoadLocalizacao: TAniIndicator;
    Label6: TLabel;
    procedure Ac_SalvarExecute(Sender: TObject);
    procedure Ac_SalvarUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Ac_RetornarExecute(Sender: TObject);
  private
    FOnSalvar: TProc;
    procedure SetOnSalvar(const Value: TProc);

  protected
    function fprValidarDados(var opMsgErro: String): Boolean; virtual;
    function fprValidarCamposObrigatorios(ipDataSet: TDataSet; var opMsgErro: String): Boolean;

    procedure pprBeforeSalvar; virtual;
    procedure pprAfterSalvar; virtual;
    procedure pprExecutarSalvar; virtual;
    { Private declarations }
  public
    property OnSalvar: TProc read FOnSalvar write SetOnSalvar;

    procedure ppuAlterar(ipId: Integer); virtual;
    procedure ppuIncluir; virtual;
    procedure ppuSalvar; virtual;
  end;

var
  frmBasicoCadastro: TfrmBasicoCadastro;

implementation

{$R *.fmx}

procedure TfrmBasicoCadastro.Ac_SalvarUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := dsPrincipal.DataSet.Active and ((dsPrincipal.DataSet.State in [dsEdit, dsInsert]) or (TRFClientDataSet(dsPrincipal.DataSet).changeCount > 0));
end;

procedure TfrmBasicoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  recFade.Visible := false;
  recModal.Visible := false;

  recFade.BringToFront;
  recModal.BringToFront;
end;

function TfrmBasicoCadastro.fprValidarDados(var opMsgErro: String): Boolean;
begin
  Result := fprValidarCamposObrigatorios(dsPrincipal.DataSet, opMsgErro);

end;

procedure TfrmBasicoCadastro.pprAfterSalvar;
begin
  //
end;

procedure TfrmBasicoCadastro.pprBeforeSalvar;
begin
  //
end;

procedure TfrmBasicoCadastro.ppuAlterar(ipId: Integer);
var
  vaParam: TFDParam;
begin
  dsPrincipal.DataSet.Close;
  vaParam := TRFQuery(dsPrincipal.DataSet).FindParam('ID');
  if Assigned(vaParam) then
    vaParam.AsInteger := ipId;
  dsPrincipal.DataSet.Open();
  if not dsPrincipal.DataSet.Eof then
    dsPrincipal.DataSet.Edit;
end;

procedure TfrmBasicoCadastro.ppuIncluir;
begin
  dsPrincipal.DataSet.Open();
  dsPrincipal.DataSet.Append;

end;

procedure TfrmBasicoCadastro.pprExecutarSalvar;
begin
  if dsPrincipal.DataSet.State in [dsEdit, dsInsert] then
    dsPrincipal.DataSet.Post;
end;

procedure TfrmBasicoCadastro.ppuSalvar;
begin
  pprBeforeSalvar;
  pprExecutarSalvar;
  pprAfterSalvar;

  if Assigned(FOnSalvar) then
    FOnSalvar();

end;

function TfrmBasicoCadastro.fprValidarCamposObrigatorios(ipDataSet: TDataSet; var opMsgErro: String): Boolean;
var
  vaField: TField;
  vaMsg: TStringList;
begin
  Result := true;
  // tem q estar em edit ou insert ou entao tem q ter algo no cds. Se isso nao acontecer é pq o usuario
  // deletou todos os registros e mandou gravar. Isso é possivel quando se usa o frameGrids
  if (ipDataSet.State in [dsInsert, dsEdit]) or (ipDataSet.RecordCount > 0) then
    begin
      vaMsg := TStringList.Create;
      try
        for vaField in ipDataSet.Fields do
          begin
            if vaField.Required and (vaField.IsNull or (vaField.AsString.Trim = '')) then
              begin
                vaMsg.Add(vaField.DisplayLabel);

              end;
          end;

        if vaMsg.Count > 0 then
          begin
            opMsgErro := 'Os seguintes campos são obrigatórios:' + slineBreak + vaMsg.Text;
            Result := false;
          end;

      finally
        vaMsg.Free;
      end;
    end;

end;

procedure TfrmBasicoCadastro.SetOnSalvar(const Value: TProc);
begin
  FOnSalvar := Value;
end;

procedure TfrmBasicoCadastro.Ac_RetornarExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmBasicoCadastro.Ac_SalvarExecute(Sender: TObject);
var
  vaMsgErro: String;
begin
  try
    if fprValidarDados(vaMsgErro) then
      begin
        ppuSalvar;
        Close;
      end
    else
      showMessage('Não foi possível salvar. Detalhes:' + vaMsgErro);
  except
    on e: Exception do
      showMessage('Não foi possível salvar. Detalhes:' + slineBreak + e.Message);
  end;
end;

end.
