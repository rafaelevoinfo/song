unit fBasicoCadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBasico, FMX.Controls.Presentation, FMX.MediaLibrary.Actions, FMX.StdActns,
  System.Actions, FMX.ActnList, Data.DB, FMX.Objects;

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
    { Private declarations }
  public
    property OnSalvar: TProc read FOnSalvar write SetOnSalvar;
  end;

var
  frmBasicoCadastro: TfrmBasicoCadastro;

implementation

{$R *.fmx}

procedure TfrmBasicoCadastro.Ac_SalvarUpdate(Sender: TObject);
begin
  inherited;
  TAction(Sender).Enabled := dsPrincipal.DataSet.Active and
    (dsPrincipal.DataSet.State in [dsEdit, dsInsert]);
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
  Result := true;

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
      if dsPrincipal.DataSet.State in [dsEdit, dsInsert] then
        dsPrincipal.DataSet.Post;

      if Assigned(FOnSalvar) then
        FOnSalvar();

      Close;
    end
    else
      showMessage('Não foi possível salvar. Detalhes:' + vaMsgErro);
  except
    on e: Exception do
      showMessage('Não foi possível salvar. Detalhes:' + slinebreak +
        e.Message);
  end;
end;

end.
