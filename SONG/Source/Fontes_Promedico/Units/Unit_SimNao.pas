unit Unit_SimNao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, OleServer, Db;

type
  TForm_SimNao = class(TForm)
    ComboBox1: TComboBox;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    btnSim: TLabel;
    btnNao: TLabel;
    btnOK: TLabel;
    Memo1: TMemo;
    Label1: TLabel;
    Timer1: TTimer;
    TimerMessage: TTimer;
    Timer2: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOKClick(Sender: TObject);
    procedure btnNaoClick(Sender: TObject);
    procedure btnSimClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TimerMessageTimer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    pvTempo : Integer;
  public
    function Gerar_Excel(ipTable : TIBDataSet; ipEmpresa, ipTitulo, ipFile : String; ipCabecalho : Boolean) : String;
    { Public declarations }
  end;

var
  Form_SimNao: TForm_SimNao;

implementation

uses Unit_Method;
{$R *.DFM}

function TForm_SimNao.Gerar_Excel(ipTable : TIBDataSet; ipEmpresa, ipTitulo, ipFile : String; ipCabecalho : Boolean) : String;
var
  F            : TextFile;
  I            : Integer;
  mySaveDialog : TSaveDialog;
begin
  Result := '';
  if not(ipTable.Active) then
    ShowMessage('Tabela esta fechada.')
  else
    begin
      try
        if not(FileExists(ipFile)) then
          begin
            mySaveDialog := TSaveDialog.Create(Self);
            mySaveDialog.Filter := '*.xls|*.xls';
            if mySaveDialog.Execute then
              begin
                if Pos('.XLS', UpperCase(Trim(mySaveDialog.Files.Text))) <= 0 then
                  ipFile := Trim(mySaveDialog.Files.Text) + '.xls';
              end;
            mySaveDialog.Free;
          end;

        AssignFile(F, ipFile);

        if ipCabecalho then
          begin//será criado um arquivo novo
            Rewrite(F);
            Writeln(F, ipEmpresa);
            Writeln(F, 'SAGE - Sistema de Automação e Gestão Empesarial - SOFT-DATA' + #9#9#9#9 + 'Data Emissão:' + #9 + DateToStr(Date));
            Writeln(F, ipTitulo + #9#9#9#9 + 'Hora:' + #9 + TimeToStr(Time));
          end
        else
          begin //será acrescentado informações ao arquivo existente
            Append(F);
            Writeln(F, '');
            Writeln(F, '');
          end;

        //sera criado as colunas dos campos
        Write(F, ipTable.Fields[0].DisplayLabel);
        for I := 1 to ipTable.Fields.Count - 1 do
          begin
            if i <> (ipTable.Fields.Count - 1) then
              Write(F, #9 + ipTable.Fields[I].DisplayLabel)
            else
              Writeln(F, #9 + ipTable.Fields[I].DisplayLabel);
            ipTable.Next;
          end;

        //sera passado as informações
        ipTable.First;
        while not(ipTable.Eof) do
          begin
            Write(F, ipTable.Fields[0].AsString);
            for I := 1 to ipTable.Fields.Count - 1 do
              begin
                if i <> (ipTable.Fields.Count - 1) then
                  Write(F, #9 + ipTable.Fields[I].AsString)
                else
                  Writeln(F, #9 + ipTable.Fields[I].AsString)
              end;
            ipTable.Next;
          end;
        CloseFile(F);
      except
        on E: Exception do
          begin
            CloseFile(F);
            ShowMessage('Problemas para gerar o arquivo do EXCEL.'+#13+E.Message);
            Exit;
          end;
      end;
    end;
  Result := ipFile;
end;

procedure TForm_SimNao.FormShow(Sender: TObject);
begin
  ComboBox1.ItemIndex := 0;
  btnSim.Visible := Not(btnOK.Visible);
  btnNao.Visible := Not(btnOK.Visible);
  Image1.Top := 10;
  Image1.Left := 10;
  Image1.Visible := Not(btnOK.Visible);
  Image2.Top := 10;
  Image2.Left := 10;
  Image2.Visible := btnOK.Visible;
  if Timer1.Interval > 0 then
    begin
      Timer1.Interval := Timer1.Interval * 1000;
      Timer1.Enabled := True;
      TimerMessage.Enabled := True;
      Label1.Caption := 'Mensagem será finalizada em ' + FloatToStr(Timer1.Interval / 1000) + ' segundos.';
    end;
  pvTempo := 0;
end;

procedure TForm_SimNao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if not(btnOK.Visible) then
    begin
      if (key = #78){N} or
         (key = #110){n} or
         (key = #83){S} or
         (key = #115){s} then
        begin
          if (key = #78) or (Key = #110) then//n ou N
            ComboBox1.ItemIndex := 0;

          if (Key = #83) or (Key = #115) then//s ou S
            ComboBox1.ItemIndex := 1;
          Close;
        end;
    end
  else
    if (Key = #79) or (key = #111) then
      Close;
end;

procedure TForm_SimNao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F4 then
    key := VK_F1;
end;

procedure TForm_SimNao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  btnOK.Visible := False;
end;

procedure TForm_SimNao.btnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_SimNao.btnNaoClick(Sender: TObject);
begin
  ComboBox1.ItemIndex := 0;
  Close;
end;

procedure TForm_SimNao.btnSimClick(Sender: TObject);
begin 
  ComboBox1.ItemIndex := 1;
  Close;
end;

procedure TForm_SimNao.Timer1Timer(Sender: TObject);
begin
  Close;
end;

procedure TForm_SimNao.TimerMessageTimer(Sender: TObject);
begin
  pvTempo := pvTempo + 1000;
  Label1.Caption := 'Mensagem será finalizada em ' + FloatToStr((Timer1.Interval - pvTempo)/1000) + ' segundos.';
end;

procedure TForm_SimNao.Timer2Timer(Sender: TObject);
begin
  Update;
end;

end.
