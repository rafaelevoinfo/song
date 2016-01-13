unit Unit_Util;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, ExtCtrls, IBDatabase, Db, IBCustomDataSet, IBTable,
  ComCtrls, Cripto, DateUtils, DBGrids, ProfGrid, Printers, Provider, DBClient,
  RichEdit, System.Json, dxBarExtItems, cxDBRichEdit;

function IntToStrZero(Valor, Tamanho: Integer): String;
procedure Virgula_To_Ponto(var Key: char); // mesmo do virgulatoponto, mas È usado em  onkeypress
procedure Tab_To_Enter(Sender: TForm; var Key: char); // esta repetida na pMethod2009, tem que ser assim por enquanto ate deixar de existir a unit_util
function Define_Sexo(dsNome: String): String;
function NoRound(vValor: Double; vCasas: Integer): Double;
function Calcula_Depreciacao(vTaxa_Anual, vValor_Bem: Double; vData_Aquisicao: TDate): Double;
function StrToStrSize(vString: String; vTamanho, vAbsoluto: Integer; vPreenchimento: String): String;
function AMBExtractCodigo(CodigoAMB: String): String;
function AMBExtractNumero(CodigoAMB: String): String;
function UpperCaseFirsts(Value: String): String;
function AgeByDate(Data_Base, Data_Teto: TDate): Integer;
function LowerString(Texto_Old: String): String;
function UpperString(Texto_Old: String): String;
function RetornaMes(MesNum: integer): string;
function ExtractValFromStr(stValue: String): String;
function NumberOfChar(T, S: ShortString): Byte;
function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
procedure GetFontNames(FontName: TComboBox);
procedure GetdxFontNames(FontName: TdxBarFontNameCombo);
function CurrText(Editor: TDBRichEdit): TTextAttributes; overload;
function CurrText(Editor: TcxDBRichEdit): TTextAttributes; overload;
function Curr_Text(Editor: TRichEdit): TTextAttributes;
function BD_Abre(Tabela: TIBTable; TiraRO: String): Boolean;
procedure BD_Fecha(Tabela: TIBTable; ColocaRO: String);

function NetIsPresent: Boolean; { Retorna true se o computador est· configurado para rede }
function SysComputerName: string; { Retorna o nome do computador }
function SysWinDir: string; { Retorna o diretÛrio do Windows }
function SysSetComputerName(const S: string): Boolean; { Define o nome do computador }
function SysSystemDir: string; { Retorna o diretÛrio System do Windows }
function SysTempDir: string; { Retorna o diretÛrio Temp do Windows }
function SysUserName: string; { Retorna o nome do usu·rio logado no Windows }
function FileSize(const FileName: String): LongInt;
procedure WndProcessMessages(const Wnd: HWnd); { Processa as mensagens enviadas a uma janela }
procedure WndProcessMessagesEx(const Wnd: HWnd; const FromMsg, ToMsg: Cardinal); { Processa as mensagens enviadas a uma janela - somente o intervalo de mensagens informado }
function Tirar_Espacos(texto: string): string;
procedure Exporta_DbGrid(iDBGrid1: TDBGrid; iOpcao, iOrientacao: Integer; iRodape: String; iCabecalho: String; iForm: TForm);

const
  msg1 = 'Caractere(s) inv·lido(s) no inÌcio do e-mail.';
  msg2 = 'SÌmbolo @ n„o foi encontrado.';
  msg3 = 'Excesso do sÌmbolo @.';
  msg4 = 'Caractere(s) inv·lido(s) antes do sÌmbolo @.';
  msg5 = 'Caractere(s) inv·lido(s) depois do sÌmbolo @.';
  msg6 = 'Agrupamento de caractere(s) inv·lido(s) a esqueda do @.';
  msg7 = 'N„o existe ponto(s) digitado(s).';
  msg8 = 'Ponto encontrado no final do e-mail.';
  msg9 = 'AusÍncia de caractere(s) apÛs o ˙ltimo ponto.';
  msg10 = 'Excesso de ponto(s) a direita do @.';
  msg11 = 'Ponto(s) disposto(s) de forma errada apÛs o @.';
  msg12 = 'Caractere(s) inv·lido(s) antes do ponto.';
  msg13 = 'Caractere(s) inv·lido(s) depois do ponto.';

  vet_valido: array [0 .. 35] of string = ('0', '1', '2', '3', '4', '5', '6', '7', '8',
    '9', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
    'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
    'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z');

implementation

uses
  pMethod2009, pdmPrincipal;

// joga zero e retorna string
function IntToStrZero(Valor, Tamanho: Integer): String;
var
  VFinal: String;
begin
  VFinal := IntToStr(Valor);
  While Length(VFinal) < Tamanho do
    VFinal := '0' + VFinal;
  Result := VFinal;
end;

// troca o valor da key - geralmente do onkeypress e troca de , para .
procedure Virgula_To_Ponto(var Key: char);
begin
  if Key = #46 then
    Key := #44;
end;

procedure Tab_To_Enter(Sender: TForm; var Key: char);
begin
  if Key = #13 then
    begin
      Key := #0;
      SendMessage(Sender.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;

// Procedure que ir· pegar o conteudo de 1 dbgrid e imprimir, exportar para o excel,word,etc
procedure Exporta_DbGrid(iDBGrid1: TDBGrid; iOpcao, iOrientacao: Integer; iRodape: String; iCabecalho: String; iForm: TForm);
// iDBGrid -> grid que queremos exportar
// iOpcao-> 0 = print
// 1 = excel
// 2 = word
// iOrientacao-> 0=Retrato,1=Paisagem
// iRodape-> texto a ser colocado no rodape
// iForm->Form de Origem
var
  vaCol, vaRow: Integer;
  vaProfGrid: TProfGrid;
  vaPrinter: TPrintDialog;
begin
  // Criando o ProfGrid
  vaProfGrid := TProfGrid.Create(iForm);
  vaProfGrid.Visible := False;
  vaProfGrid.Parent := iForm;
  // Ajustando o dbgrid antes
  iDBGrid1.DataSource.DataSet.DisableControls;
  // dando fetchall para poder contar corretamente os registros
  (iDBGrid1.DataSource.DataSet as TIBDataSet).FetchAll;
  // Levando o registro para o primeiro
  iDBGrid1.DataSource.DataSet.First;
  // Ajustando as colunas
  vaProfGrid.ColCount := iDBGrid1.FieldCount;
  vaProfGrid.Width := 798;
  vaProfGrid.Height := 1100;
  // Tirando a quebra de linha
  vaProfGrid.WordWrap := False;

  vaProfGrid.BorderForText := 0;
  vaProfGrid.RowCount := 1;
  vaProfGrid.PrintOptions := []; // retirando o contorno das linhas
  // Colocando o nome do programa no rodapÈ
  vaProfGrid.Footer := iRodape;
  // Colocando o nome do cabecalho
  vaProfGrid.Header := iCabecalho;
  // montando o cabecalho
  for vaCol := 0 to iDBGrid1.FieldCount - 1 do
    Begin
      vaProfGrid.Cells[vaCol, 0].Text := iDBGrid1.Fields[vaCol].DisplayLabel + #9;
      vaProfGrid.Cols[vaCol].Width := iDBGrid1.Columns.Items[vaCol].Width;
    End;
  // colocando os dados do dbgrid no prof
  for vaRow := 0 to iDBGrid1.DataSource.DataSet.RecordCount - 1 do
    Begin
      // aumentando o tamanho do profgrid, por algum motivo o inc deu problema
      vaProfGrid.RowCount := vaProfGrid.RowCount + 1;
      // percorrendo as colunas
      for vaCol := 0 to iDBGrid1.FieldCount - 1 do
        vaProfGrid.Cells[vaCol, vaRow + 1].Text := iDBGrid1.Fields[vaCol].AsString + #9;
      iDBGrid1.DataSource.DataSet.Next;
    End;
  if iOpcao = 0 then
    Begin
      vaPrinter := TPrintDialog.Create(iForm);
      case iOrientacao of
        0:
          printer.Orientation := poPortrait;
        1:
          printer.Orientation := poLandscape;
      End;
      if vaPrinter.Execute then
        vaProfGrid.Print;
    End;
  if iOpcao = 1 then
    vaProfGrid.ExportToExcel();
  if iOpcao = 2 then
    vaProfGrid.ExportToWord();
  FreeAndNil(vaProfGrid);
End;


function Define_Sexo(dsNome: String): String;
var
  vCol: Integer;
  vLetra: String;
begin
  dsNome := Trim(dsNome);
  vLetra := '';
  for vCol := 1 to Length(dsNome) do
    begin
      if Copy(dsNome, vCol, 1) = ' ' then
        Break
      else
        vLetra := Copy(dsNome, vCol, 1);
    end;
  if (vLetra = 'A') or (vLetra = 'E') then
    Result := 'FEMININO'
  else
    Result := 'MASCULINO';
end;

function NoRound(vValor: Double; vCasas: Integer): Double;
var
  vAux: String;
  vPos: Integer;
begin
  vAux := FloatToStr(vValor);
  vPos := Pos(',', vAux);
  if vPos > 0 then
    Result := StrToFloat(Copy(vAux, 1, vPos - 1) + ',' + Trim(Copy(vAux, vPos + 1, vCasas)))
  else
    Result := StrToFloat(vAux);
end;

// calcula o valor que ja foi depreciado
function Calcula_Depreciacao(vTaxa_Anual, vValor_Bem: Double; vData_Aquisicao: TDate): Double;
var
  vTaxa_Diaria, vTaxa_Total: Double;
  vDias: Integer;
begin
  if vData_Aquisicao > 0 then
    begin
      vDias := Trunc(Now - vData_Aquisicao); // dias de aquisiÁ„o
      vTaxa_Diaria := vTaxa_Anual / 365; // taxa depreciaÁ„o diaria
      vTaxa_Total := vTaxa_Diaria * vDias; // taxa total depreciada
      if vTaxa_Total > 100 then
        vTaxa_Total := 100; // a taxa total deve ser no m·ximo 100%
      Result := ((vValor_Bem * vTaxa_Total) / 100);
    end
  else
    Result := 0;
end;

// devolve a string passada em vString no tamanho especificado em vTamanho completando com
// espaÁos em branco o que faltar no tamanho para alcanÁar o especificado em vTamanho.
// se vAbsoluto = 0 (N√O), a string È devolvido completa caso seu tamanho seja maior que
// vTamanho. se vAbsoluto = 1 (SIM), a string È devolvida no tamanho exato especificado em
// vTamanho
function StrToStrSize(vString: String; vTamanho, vAbsoluto: Integer; vPreenchimento: String): String;
var
  i: Integer;
begin
  if Trim(vPreenchimento) = '' then
    vPreenchimento := ' ';
  vPreenchimento := Copy(vPreenchimento, 1, 1);
  Result := vString;
  for i := 1 to vTamanho - Length(vString) do
    Result := Result + vPreenchimento;
  if vAbsoluto > 0 then
    begin
      if Length(Result) > vTamanho then
        Result := Copy(Result, 1, vTamanho);
    end;
end;

// extrai de uma string o codigo amb
// desconsiderando a formataÁ„o caso
// tenha sobrado no final do codigo
// ex: 32.01.___-_ fica 32.01
function AMBExtractCodigo(CodigoAMB: String): String;
var
  vTamanho, vPosicao: Integer;
begin
  vPosicao := 0; // iniciando a posiÁ„o
  // percorre a string para descobrir a posiÁ„o do ultimo n˙mero
  for vTamanho := 1 to Length(CodigoAMB) do
    begin
      if Pos(Copy(CodigoAMB, vTamanho, 1), '0123456789') > 0 then
        vPosicao := vTamanho;
    end;
  // o codigo È extraido da posiÁ„o inicial atÈ a posiÁ„o do ultimo n˙mero
  Result := Copy(CodigoAMB, 1, vPosicao);
end;

// extrai apens os numeros do codigo amb
// desconsiderando os separadores
// ex: 32.01.001-8 fica 32010018
function AMBExtractNumero(CodigoAMB: String): String;
var
  vPosicao: Integer;
begin
  Result := '';
  for vPosicao := 1 to Length(CodigoAMB) do
    begin
      if Pos(Copy(CodigoAMB, vPosicao, 1), '0123456789') > 0 then
        Result := Result + Copy(CodigoAMB, vPosicao, 1);
    end;
end;

function UpperCaseFirsts(Value: String): String;
//
// Converte a primeira letra de uma string para maiuscula
//
var
  P: Integer;
  Word: String;
begin
  Result := '';
  Value := AnsiLowerCase(Value);
  Value := Trim(Value);
  repeat
    P := Pos(' ', Value);
    if P <= 0 then
      begin
        P := Length(Value) + 1;
      end;
    Word := AnsiUpperCase(Copy(Value, 1, P - 1));
    if ((Length(Word) = 1) or (Word = 'DAS') or (Word = 'DA')
      or (Word = 'DOS') or (Word = 'D0') or (Word = 'DE')) then
      begin
        Result := Result + Copy(Value, 1, P - 1)
      end
    else
      begin
        Result := Result + AnsiUpperCase(Value[1]) + Copy(Value, 2, P - 2);
      end;
    Delete(Value, 1, P);
    if Value <> '' then
      begin
        Result := Result + ' ';
      end;
  until Value = '';
end;

function AgeByDate(Data_Base, Data_Teto: TDate): Integer;
var
  Dia_Base, Mes_Base, Ano_Base,
    Dia_Atual, Mes_Atual, Ano_Atual: Word;
  Idade: Integer;
begin
  if Data_Teto > Data_Base then
    begin
      DecodeDate(Data_Base, Ano_Base, Mes_Base, Dia_Base);
      DecodeDate(Data_Teto, Ano_Atual, Mes_Atual, Dia_Atual);

      Idade := Ano_Atual - Ano_Base;
      if Mes_Atual < Mes_Base then
        Idade := Idade - 1
      else
        begin
          if Mes_Atual = Mes_Base then
            begin
              if Dia_Atual < Dia_Base then
                begin
                  Idade := Idade - 1;
                end;
            end;
        end;
    end
  else
    Idade := 0;
  AgeByDate := Idade;
end;

function LowerString(Texto_Old: String): String;
var
  Lista_Old, Lista_New, Texto_Aux, Texto_New: String;
  NCol, TCol, NPos: Integer;
begin
  Lista_Old := '¡…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’ƒÀœ÷‹«';
  Lista_New := '·ÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ı‰ÎÔˆ¸Á';
  Texto_New := '';
  Texto_Aux := LowerCase(Texto_Old);
  NCol := 1;
  TCol := Length(Texto_Aux);
  while NCol <= TCol do
    begin
      NPos := Pos(Copy(Texto_Aux, NCol, 1), Lista_Old);
      if NPos > 0 then
        Texto_New := Texto_New + Copy(Lista_New, NPos, 1)
      else
        Texto_New := Texto_New + Copy(Texto_Aux, NCol, 1);
      Inc(NCol);
    end;
  LowerString := Texto_New;
end;

function UpperString(Texto_Old: String): String;
var
  Lista_Old, Lista_New, Texto_Aux, Texto_New: String;
  NCol, TCol, NPos: Integer;
begin
  Lista_Old := '·ÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ı‰ÎÔˆ¸Á';
  Lista_New := '¡…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’ƒÀœ÷‹«';
  Texto_New := '';
  Texto_Aux := UpperCase(Texto_Old);
  NCol := 1;
  TCol := Length(Texto_Aux);
  while NCol <= TCol do
    begin
      NPos := Pos(Copy(Texto_Aux, NCol, 1), Lista_Old);
      if NPos > 0 then
        Texto_New := Texto_New + Copy(Lista_New, NPos, 1)
      else
        Texto_New := Texto_New + Copy(Texto_Aux, NCol, 1);
      Inc(NCol);
    end;
  UpperString := Texto_New;
end;


function RetornaMes(MesNum: integer): string;
begin
  case MesNum of
    1:
      RetornaMes := 'Janeiro';
    2:
      RetornaMes := 'Fevereiro';
    3:
      RetornaMes := 'MarÁo';
    4:
      RetornaMes := 'Abril';
    5:
      RetornaMes := 'Maio';
    6:
      RetornaMes := 'Junho';
    7:
      RetornaMes := 'Julho';
    8:
      RetornaMes := 'Agosto';
    9:
      RetornaMes := 'Setembro';
    10:
      RetornaMes := 'Outubro';
    11:
      RetornaMes := 'Novembro';
    12:
      RetornaMes := 'Dezembro';
  end;
end;

function ExtractValFromStr(stValue: String): String;
var
  NPos, TPos: Integer;
  nwValue: String;
begin
  while Pos('.', stValue) > 0 do
    stValue[Pos('.', stValue)] := ' ';
  NPos := 1;
  TPos := Length(stValue);
  nwValue := '';
  while NPos <= TPos do
    begin
      if Copy(stValue, NPos, 1) <> ' ' then
        nwValue := nwValue + Copy(stValue, NPos, 1);
      Inc(NPos);
    end;
  ExtractValFromStr := nwValue;
end;

function NumberOfChar(T, S: ShortString): Byte;
var
  P: Byte;
begin
  Result := 0;
  P := Pos(T, S);
  while P > 0 do
    begin
      Inc(Result);
      S := Copy(S, P + Length(T), 255);
      P := Pos(T, S);
    end;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure GetFontNames(FontName: TComboBox);
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure GetdxFontNames(FontName: TdxBarFontNameCombo);
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

function CurrText(Editor: TDBRichEdit): TTextAttributes; overload;
begin
  if Editor.SelLength > 0 then
    Result := Editor.SelAttributes
  else
    Result := Editor.DefAttributes;
end;

function CurrText(Editor: TcxDBRichEdit): TTextAttributes; overload;
begin
  if Editor.SelLength > 0 then
    Result := Editor.SelAttributes
  else
    Result := Editor.DefAttributes;
end;

function Curr_Text(Editor: TRichEdit): TTextAttributes;
begin
  if Editor.SelLength > 0 then
    Result := Editor.SelAttributes
  else
    Result := Editor.DefAttributes;
end;

function BD_Abre(Tabela: TIBTable; TiraRO: String): Boolean;
begin
  // Tabela: Nome da Tabela a Manipular
  // TiraRO: Tirar o ReadOnly da Tabela (S/N)
  try
    if TiraRO = 'S' then
      Tabela.ReadOnly := False;
    Tabela.Open;
    BD_Abre := True;
  except
    on E: Exception do
      begin
        TdmPrincipal.fpuDetectarErroRedeReconectar(E);
        ShowMessage('Problemas na Tentativa de Abrir a Tabela ' + Tabela.TableName + '.' + Chr(13) + E.Message);
        BD_Abre := False;
      end;
  end;
end;

procedure BD_Fecha(Tabela: TIBTable; ColocaRO: String);
begin
  // Tabela: Nome da Tabela a Manipular
  // ColocaRO: Colocar o ReadOnly da Tabela (S/N)
  Tabela.Close;
  if ColocaRO = 'S' then
    Tabela.ReadOnly := True;
end;


function NetIsPresent: Boolean;
begin
  Result := GetSystemMetrics(SM_NETWORK) <> 0;
end;

function SysComputerName: string;
var
  i: DWord;
begin
  i := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Result, i);
  Windows.GetComputerName(PChar(Result), i);
  Result := string(PChar(Result));
end;

function SysWinDir: string;
begin
  SetLength(Result, MAX_PATH);
  Windows.GetWindowsDirectory(PChar(Result), MAX_PATH);
  Result := string(PChar(Result));
end;

function SysSetComputerName(const S: string): Boolean;
begin
  Result := Windows.SetComputerName(PChar(S));
end;

function SysSystemDir: string;
begin
  SetLength(Result, MAX_PATH);
  if GetSystemDirectory(PChar(Result), MAX_PATH) > 0 then
    Result := string(PChar(Result))
  else
    Result := '';
end;

function SysTempDir: string;
begin
  SetLength(Result, MAX_PATH);
  if GetTempPath(MAX_PATH, PChar(Result)) > 0 then
    Result := string(PChar(Result))
  else
    Result := '';
end;

function SysUserName: string;
var
  i: DWord;
begin
  i := 255;
  SetLength(Result, i);
  Windows.GetUserName(PChar(Result), i);
  Result := string(PChar(Result));
end;

function FileSize(const FileName: String): LongInt;
{ Retorna o tamanho de um arquivo }
var
  SearchRec: TSearchRec;
begin { !Win32! -> GetFileSize }
  if FindFirst(FileName, faAnyFile, SearchRec) = 0
  then
    Result := SearchRec.Size
  else
    Result := 0;
  FindClose(SearchRec);
end;

procedure WndProcessMessages(const Wnd: HWnd);
begin
  WndProcessMessagesEx(Wnd, 0, 0);
end;

procedure WndProcessMessagesEx(const Wnd: HWnd; const FromMsg, ToMsg: Cardinal);
var
  Msg: tagMsg;
begin
  while PeekMessage(Msg, Wnd, FromMsg, ToMsg, PM_REMOVE) do
    DispatchMessage(Msg);
end;

function Tirar_Espacos(texto: string): string;
var
  espaco, i, cont: Integer;
  posicao, Aux, aux_ant: string;
begin
  texto := Trim(texto);
  posicao := '';
  repeat
    // Variavel Espaco recebe a posicao em q ele achou um espaco no meio da string
    espaco := Pos(' ', texto);
    // Delete tira o espaco encontrado
    Delete(texto, espaco, 1);
    // Variavel posicao monta uma string com a pociÁ„o em deve ser inserido o espaÁo posteriormente
    if posicao = '' then
      posicao := IntToStr(espaco)
    else
      posicao := posicao + ',' + IntToStr(espaco);
  until espaco = 0;

  Aux := '';
  aux_ant := '';
  cont := 0;
  // laco em que se le a string montada com as posicoes em q se devem ser inseridos
  // os espacos e os incliu usando da funÁ„o insert
  for i := 1 to Length(posicao) do
    begin
      if posicao[i] <> ',' then
        Aux := Aux + posicao[i]
      else
        begin
          if Aux <> aux_ant then
            begin
              aux_ant := Aux;
              insert(' ', texto, StrToInt(Aux) + cont);
              Inc(cont);
              Aux := '';
            end
          else
            Aux := '';
        end;
    end;
  Tirar_Espacos := texto;
end;

end.

