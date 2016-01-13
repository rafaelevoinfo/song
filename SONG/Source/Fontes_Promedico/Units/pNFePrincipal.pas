////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Este forme tem a responsabilidade de trabalhar como sistema ACBRNFeMonitor //
// o resultado será retornado para aplicação atraves do tag do form sendo     //
//    valores menor que zero é pq teve algum problema ai pode ir inclindo     //
//    -1 : ShowMessage('Algum problema não grava o registro de nota');        //
//     0 : ShowMessage('Não foi feita nenhuma ação para NFe.');               //
//     1 : ShowMessage('Efetuado com Sucesso');                               //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

unit pNFePrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Buttons, Db, jpeg;

type
  TfrmNFePrincipal = class(TForm)
    Panel1: TPanel;
    EditMensagem: TRichEdit;
    EditAcao: TMemo;
    btnContinuar: TBitBtn;
    btnRetornar: TBitBtn;
    LabelNomeTable: TLabel;
    LabelCondicao: TLabel;
    Image1: TImage;
    tbNFE: TIBDataSet;
    tbNFENFE_ARQUIVO: TBlobField;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  coArquivoSai : String = 'C:\ACBrNFeMonitor\SAINFE.txt';
  coArquivoEnt : String = 'C:\ACBrNFeMonitor\ENTNFE.txt';
  coEnderecoNFe : String = 'C:\ACBrNFeMonitor\NFE\';

var
  frmNFePrincipal: TfrmNFePrincipal;

implementation

uses DataModule1, Unit_Method;

{$R *.DFM}

procedure TfrmNFePrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F4 : Key := VK_F1;
  end;
end;

procedure TfrmNFePrincipal.btnRetornarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmNFePrincipal.btnContinuarClick(Sender: TObject);
var
  vaChave : String;
  Label Retorno;
begin
 Retorno:
  while FileExists(coArquivoSai) do
    begin
      EditMensagem.Text := 'Deletando arquivo de resposta.' +#13#10 + coArquivoSai;
      Update;
      DeleteFile(coArquivoSai);
    end;
  //Começa o Processo CRIANDO ENTNFE
  EditMensagem.Text := 'Salvando arquivo de Envio.' +#13#10 + coArquivoEnt;
  //verificando se existe o arquivo na pasta especifica
  if copy(EditAcao.Text, 1, 17) = 'NFE.IMPRIMIRDANFE' then
    begin
      if not(FileExists(coEnderecoNFe + copy(EditAcao.Text, 42, 44) + '-nfe.xml')) and (Trim(copy(EditAcao.Text, 20, 45)) <> '') then
        begin
          try
            tbNFE.Selectsql.text := 'select NFE_ARQUIVO from ' + frmNFePrincipal.LabelNomeTable.Caption  +
                                    ' where ' + frmNFePrincipal.LabelCondicao.Caption ;
            tbNFE.Open;
            tbNFENFE_ARQUIVO.SaveToFile(coEnderecoNFe + copy(EditAcao.Text, 42, 44) + '-nfe.xml') ;
            tbNFE.Close;
            DM1.IBTransaction1.CommitRetaining;
          except
            on E: Exception do
              begin
                EditMensagem.Text := 'Problemas na tentativa de gravar o arquivo de NFE.' + #13 + E.Message;
                frmNFePrincipal.Tag := -1;
                btnContinuar.Enabled := False;
                Exit;
              end;
          end;

        end;
    end;
  EditAcao.Lines.SaveToFile(coArquivoEnt);
  //fica aguardando o arquivo de resposta;
  while not(FileExists(coArquivoSai)) do
    begin
      EditMensagem.Text := 'Aguardando Resposta NFe.' + #13#10 + coArquivoSai;
      Sleep(1000);
      Update;
    end;
  EditAcao.Lines.Clear;
  //arquivo de resposta retornado, deve ser analisado para saber se pode continuar ou não;
  EditAcao.Lines.LoadFromFile(coArquivoSai);
  if copy(EditAcao.Text, 1,2) = 'OK' then
    begin
      //se estiver fazendo envio da nota pode se jogar o comando de fazer a impressão da Danfe;
      if (pos('ChNFe=',EditAcao.Text) > 0) and (pos('[CANCELAMENTO]',EditAcao.Text) = 0) then
        begin
          vaChave := Trim(copy(EditAcao.Text, pos('ChNFe=',EditAcao.Text) + 6, 45));
          //gravando a chave do arquivo e o arquivo no banco de dados;
          try
            while not FileExists(coEnderecoNFe + vaChave + '-nfe.xml') do
              begin
                EditMensagem.Text := 'Aguardando Arquivo XML da NFe.';
                Sleep(1000);
                Update;
              end;
            DM1.tbAux.Selectsql.text := 'update ' + frmNFePrincipal.LabelNomeTable.Caption +
                                        '   set NFE_CHAVE = :IP_NFE_CHAVE,' +
                                        '       NFE_ARQUIVO = :IP_NFE_ARQUIVO ' +
                                        ' where ' + frmNFePrincipal.LabelCondicao.Caption ;
            DM1.tbAux.ParamByName('IP_NFE_CHAVE').AsString := vaChave;
            DM1.tbAux.ParamByName('IP_NFE_ARQUIVO').LoadFromFile(coEnderecoNFe + vaChave + '-nfe.xml');
            DM1.tbAux.ExecSQL;
            DM1.IBTransaction1.CommitRetaining;
          except
            on E: Exception do
              begin
                EditMensagem.Text := 'Problemas na tentativa de atualizar a venda.' + #13 + E.Message;
                frmNFePrincipal.Tag := -1;
                btnContinuar.Enabled := False;
                Exit;
              end;
          end;     

          //vamos imprimir a DANFE
          EditAcao.Text := NFEImprime_Danfe(coEnderecoNFe, vaChave);
          goto retorno;
        end
      else
        EditMensagem.Text := EditAcao.Text;
        
      EditMensagem.Text := 'Concluído';
      frmNFePrincipal.Tag := 1;//recebe esse valor se deu tudo certo;
    end
  else
    frmNFePrincipal.Tag := -1;

  Close;
end;

procedure TfrmNFePrincipal.FormShow(Sender: TObject);
begin
  frmNFePrincipal.Show;
end;

procedure TfrmNFePrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeleteFile(coArquivoSai);
end;

end.
