unit fAtualizacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  cxButtonEdit, cxTextEdit, cxMaskEdit, cxSpinEdit, Vcl.StdCtrls, dmuPrincipal,
  uMensagem;

type
  TfrmAtualizacao = class(TForm)
    Label1: TLabel;
    EditMajor: TcxSpinEdit;
    EditMinor: TcxSpinEdit;
    EditRelease: TcxSpinEdit;
    EditBuild: TcxSpinEdit;
    Label2: TLabel;
    EditArquivo: TcxButtonEdit;
    foDialog: TFileOpenDialog;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure EditArquivoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtualizacao: TfrmAtualizacao;

implementation

{$R *.dfm}


procedure TfrmAtualizacao.btnSalvarClick(Sender: TObject);
var
  vaVersao: string;
begin
  if EditArquivo.Text <> '' then
    begin
      vaVersao := VarToStr(EditMajor.Value) + '.' + VarToStr(EditMinor.Value) + '.' + VarToStr(EditRelease.Value) + '.' + VarToStr(EditBuild.Value);
      dmPrincipal.ppuAdicionarAtualizacao(vaVersao, EditArquivo.Text);
      ModalResult := mrOk;
    end
  else
    TMensagem.ppuShowMessage('Informe a localização do arquivo de atualização.');
end;

procedure TfrmAtualizacao.EditArquivoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  if foDialog.Execute then
    EditArquivo.Text := foDialog.FileName;
end;

procedure TfrmAtualizacao.FormCreate(Sender: TObject);
begin
  EditMajor.Value := 1;
  EditMinor.Value := 0;
  EditRelease.Value := 0;
  EditBuild.Value := 0;
end;

end.
