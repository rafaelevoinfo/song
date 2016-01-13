unit pChatTelaPesquisa;

interface

uses
  pDMChat, pMethod2009,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, pZero, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  pmPromedicoSkin, Vcl.ComCtrls, dxCore, cxDateUtils, cxCheckBox, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmChatTelaPesquisa = class(TfrmZero)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    EditPesquisa: TcxTextEdit;
    EditDataInicial: TcxDateEdit;
    EditDataFinal: TcxDateEdit;
    cbxPesquisarPeriodo: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cbxPesquisarPeriodoClick(Sender: TObject);
  private
    DMChat: TDMChat;
    FRealizarPesquisa: Boolean;
    procedure ppvPesquisarConversa(Sender: TObject);
    procedure ppvRetornar(Sender: TObject);
    { Private declarations }
  public
    property RealizarPesquisa: Boolean read FRealizarPesquisa;
    { Public declarations }
  end;

var
  frmChatTelaPesquisa: TfrmChatTelaPesquisa;

implementation

{$R *.dfm}

procedure TfrmChatTelaPesquisa.cbxPesquisarPeriodoClick(Sender: TObject);
begin
  inherited;
  EditDataInicial.Enabled := cbxPesquisarPeriodo.Checked;
  EditDataFinal.Enabled := cbxPesquisarPeriodo.Checked;
end;

procedure TfrmChatTelaPesquisa.FormCreate(Sender: TObject);
begin
  inherited;
  DMChat := TDMChat.Create(Self);
  FRealizarPesquisa := False;
  cbxPesquisarPeriodoClick(cbxPesquisarPeriodo);
  DMChat.Ac_PesquisarConversa.OnExecute := ppvPesquisarConversa;
  DMChat.Ac_Retornar.OnExecute := ppvRetornar;
end;

procedure TfrmChatTelaPesquisa.ppvPesquisarConversa(Sender: TObject);
var
  vaDataTemp: TDate;
begin
  EditDataInicial.PostEditValue;
  EditDataFinal.PostEditValue;

  if (EditPesquisa.Text = '') and VarIsNull(EditDataInicial.EditValue) and VarIsNull(EditDataFinal.EditValue) then
    begin
      MessageTela('Informe um parâmetro para realizar a pesquisa.');
      EditPesquisa.SetFocus;
      Exit;
    end;

  if cbxPesquisarPeriodo.Checked then
    begin
      if VarIsNull(EditDataInicial.EditValue) and VarIsNull(EditDataFinal.EditValue) then
        begin
          MessageTela('Informe uma data para realizar a pesquisa.');
          EditDataInicial.SetFocus;
          Exit;
        end;

      if VarIsNull(EditDataInicial.EditValue) or VarIsNull(EditDataFinal.EditValue) then
        begin
          if VarIsNull(EditDataInicial.EditValue) then
            begin
              EditDataInicial.EditValue := EditDataFinal.EditValue;
              EditDataInicial.PostEditValue;
            end
          else
            begin
              EditDataFinal.EditValue := EditDataInicial.EditValue;
              EditDataFinal.PostEditValue;
            end;
        end;

      if EditDataInicial.EditValue > EditDataFinal.EditValue then
        begin
          vaDataTemp := EditDataInicial.EditValue;

          EditDataInicial.EditValue := EditDataFinal.EditValue;
          EditDataInicial.PostEditValue;

          EditDataFinal.EditValue := vaDataTemp;
          EditDataFinal.PostEditValue;
        end;
    end;

  FRealizarPesquisa := True;
  Close;
end;

procedure TfrmChatTelaPesquisa.ppvRetornar(Sender: TObject);
begin
  Close;
end;

end.
