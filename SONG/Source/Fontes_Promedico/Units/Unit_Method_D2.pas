unit Unit_Method_D2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls, DB, DBTables, Registry, Printers,
  inifiles, FileCtrl, Cripto;

function CriptoDecripto(ipForm : TForm; ipCripDecrip : Integer; ipKey, ipTexto : String) : String;
function DiaSemana(Data: TDateTime): String;
function Verifica_Email(email: string): boolean;
procedure Definir_Impressora_Padrao(Impressora: string);
procedure LigaCapsLock;
function Testa_Mes_Ano(ip_mes_ano_anterior, ip_mes_ano_novo : String) : Boolean;
function PegaNomeArquivo(IP_Endereco : String) : String;
function PegaDiretorioArquivo(IP_Endereco : String) : String;
procedure CriptografaArquivo(InFName, OutFName: String; Chave: Word); //by Sérgio V. Maia, procedimento para criptografar qualquer tipo de arquivo
function CriptografaArquivoToStream(Arquivo: TMemoryStream; Chave: Word): TMemoryStream; //by Sérgio V. Maia
function FormaPadraoData(Formato : String) : Boolean;
procedure Atualiza_Data_Hora_Computador(ssData, ssHora: TDateTime);
function PesquisarTexto (TextoCompleto, TextoPesquisa : String) : Integer;
function LerIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini : String) : String;
procedure GravarINI(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini, valor_ini : String);
function ImpressoraPadrao : String;//by Eliomar Retorna o nome da impressora padrão do Windows
function Pega_Impressora(ipCopias : Integer; var opImpressora : String; var opCopias : Integer) : Boolean;//by Eliomar função pegas as impressoras cadastradas e o usuario seleciona a impressora e a quantidade;
function Tirar_Espacos (Texto : String) : String;
function ObterData(Titulo : String; Data_Inicial : String; var Data: String): Boolean;//by Eliomar função cria um formulário e retorna a data digitada.
function CopiarArquivos(Nome_Arquivo, End_Origem, End_Destino : String) : Boolean;//by Eliomar copiar todos os arquivos (desconsiderando a extensão) de da origem para destino;
function SubtraiMes(Data_Final, Data_Inicial : TDateTime) : String;//by Eliomar subtrai um mes do outro e retorna a diferença em string;
function MaskCpf_Cnpj(Texto : String) : String;//by Eliomar função para colocar os pontos do cpf ou cnpj;
function AlterarEspeciais(Str:String): String;//by eliomar função que substitui os caracteres especiais por caracteres válidos
function StrToChar(MyString : String) : CHAR;
function RemoveAcento(Str:String): String;
function ExtractValFromStr(stValue: String): String;
function Ponto(Cap : String; Tipo : Boolean) : String;
function Preenchimento(Texto : String; Text : Char; Tamanho : Integer; Adireita : Boolean) : String;
function BooleanToInt(Valor : Boolean) : Integer;
function SoNumeros(Texto : String) : String;//by Eliomar função para pegar a string e deixar somente numeros;
function FatMult(PercInicial: Double; Qtde: Integer): Double;
function ConsisteInscricaoEstadual(Insc, UF: string): Integer; stdcall; external('DllInscE32.dll');
function TemDiscoNoDrive(const drive : char): boolean;
function GetTextValue(gtValue: String): Double; //funcao para pegar um valor de uma string, desconsiderando os pontos da formatação
function SecurityKey(skChave: String): Boolean; {Verifica se a cópia não é pirata, baseado no registro do windows}
function SenhaDiaria: String; //Retorna a senha diária
function ExecAndWait(const FileName, Params: string; const WindowState: Word): Boolean;
function DataExtenso(Cidade_Estado : String; Data:TDateTime): String;{Retorna uma data por extenso}
function ArrastaMouseToControl(const Control: TControl; Jump, JumpTime: Word): boolean;
function Bissexto(AYear: Integer): Boolean;
function DiasDoMes(AYear, AMonth: Integer): Integer;
function DataMaisDiasUteis(DataIni : TDateTime; Dias_Uteis : Integer) : TDateTime;
function DataBarraStringPonto(Data : TDateTime) : String;
function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
procedure GetFontNames(FontName: TComboBox);
procedure MoveMouse(Controle : TControl);
procedure Espera_Tempo(Quanto_Tempo: TDateTime);
procedure Tab_To_Enter(Sender: TForm; var Key: char);
procedure Virgula_To_Ponto(var Key: char);
function  IntToStrZero(Valor, Tamanho: Integer): String;
function  DouToStrZero(Valor, Tamanho: Double): String;
procedure Novo_Grava_S(Arquivo: TTable;
                       Botao1, Botao2, Botao3: TButton;
                       SBotao1, SBotao2: TSpeedButton;
                       CampoFocus: TDBEdit;
                       CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                       Navegador: TDBNavigator);
procedure Modifica_Grava_S(Arquivo: TTable;
                           Botao1, Botao2, Botao3: TButton;
                           SBotao1, SBotao2: TSpeedButton;
                           CampoFocus: TDBEdit;
                           CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                           Navegador: TDBNavigator);
procedure Exclui_Cancela_S(PodeExcluir: String;
                           Arquivo: TTable;
                           Botao1, Botao2, Botao3: TButton;
                           SBotao1, SBotao2: TSpeedButton;
                           CampoFocus: TDBEdit;
                           CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                           Navegador: TDBNavigator);
procedure RefreshTable(Arquivo: TTable);
procedure RefreshTablePF(Arquivo_P, Arquivo_F: TTable);
procedure Novo_Grava_P(Arquivo_P, Arquivo_F: TTable;
                       Botao1, Botao2, Botao3, Botao4, Botao5, Botao6: TButton;
                       SBotao1, SBotao2: TSpeedButton;
                       CampoFocus1, CampoFocus2: TDBEdit;
                       CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                       Navegador1, Navegador2: TDBNavigator);
procedure Modifica_Grava_P(Arquivo_P, Arquivo_F: TTable;
                           Botao1, Botao2, Botao3, Botao4, Botao5, Botao6: TButton;
                           SBotao1, SBotao2: TSpeedButton;
                           CampoFocus1, CampoFocus2: TDBEdit;
                           CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                           Navegador1, Navegador2: TDBNavigator);
procedure Exclui_Cancela_P(PodeExcluir: String;
                           Arquivo_P, Arquivo_F: TTable;
                           Botao1, Botao2, Botao3, Botao4, Botao5, Botao6: TButton;
                           SBotao1, SBotao2: TSpeedButton;
                           CampoFocus1, CampoFocus2: TDBEdit;
                           CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                           Navegador1, Navegador2: TDBNavigator);
procedure Novo_Grava_F(Arquivo_P, Arquivo_F: TTable;
                       Botao1, Botao2, Botao3, Botao4, Botao5, Botao6: TButton;
                       SBotao1, SBotao2: TSpeedButton;
                       CampoFocus: TDBEdit;
                       CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                       Navegador1, Navegador2: TDBNavigator);
procedure Modifica_Grava_F(Arquivo_P, Arquivo_F: TTable;
                           Botao1, Botao2, Botao3, Botao4, Botao5, Botao6: TButton;
                           SBotao1, SBotao2: TSpeedButton;
                           CampoFocus: TDBEdit;
                           CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                           Navegador1, Navegador2: TDBNavigator);
procedure Exclui_Cancela_F(PodeExcluir: String;
                           Arquivo_P, Arquivo_F: TTable;
                           Botao1, Botao2, Botao3, Botao4, Botao5, Botao6: TButton;
                           SBotao1, SBotao2: TSpeedButton;
                           CampoFocus: TDBEdit;
                           CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                           Navegador1, Navegador2: TDBNavigator);
procedure Novo_Grava_FS(Arquivo_F: TTable;
                        Botao1, Botao2, Botao3: TButton;
                        SBotao1, SBotao2: TSpeedButton;
                        CampoFocus: TDBEdit;
                        CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                        Navegador1, Navegador2: TDBNavigator);
procedure Modifica_Grava_FS(Arquivo_F: TTable;
                            Botao1, Botao2, Botao3: TButton;
                            SBotao1, SBotao2: TSpeedButton;
                            CampoFocus: TDBEdit;
                            CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                            Navegador1, Navegador2: TDBNavigator);
procedure Exclui_Cancela_FS(PodeExcluir: String;
                            Arquivo_F: TTable;
                            Botao1, Botao2, Botao3: TButton;
                            SBotao1, SBotao2: TSpeedButton;
                            CampoFocus: TDBEdit;
                            CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                            Navegador1, Navegador2: TDBNavigator);
function ValiData(Teste_Data, Base_Data, Teto_Data: TDateTime): Boolean;
function RoundTo(ValorBase: Double; Casas:Integer): Double;
function TruncDec(Valor : Double; Casas : Integer) : Double;
function VirgulaToPonto(Valor : Double) : String;

function DvModulo11 ( str: String ): Char;
function DvModulo10 ( str: String ): Char;
function DvCGC ( str: String ): String;
function DvCPF ( str: String ): String;
function ValidaCGC ( str: String ): Boolean;
function ValidaCPF ( str: String ): Boolean;

const
  msg1 = 'Caractere(s) inválido(s) no início do e-mail.';
  msg2 = 'Símbolo @ não foi encontrado.';
  msg3 = 'Excesso do símbolo @.';
  msg4 = 'Caractere(s) inválido(s) antes do símbolo @.';
  msg5 = 'Caractere(s) inválido(s) depois do símbolo @.';
  msg6 = 'Agrupamento de caractere(s) inválido(s) a esqueda do @.';
  msg7 = 'Não existe ponto(s) digitado(s).';
  msg8 = 'Ponto encontrado no final do e-mail.';
  msg9 = 'Ausência de caractere(s) após o último ponto.';
  msg10 = 'Excesso de ponto(s) a direita do @.';
  msg11 = 'Ponto(s) disposto(s) de forma errada após o @.';
  msg12 = 'Caractere(s) inválido(s) antes do ponto.';
  msg13 = 'Caractere(s) inválido(s) depois do ponto.';

  vet_valido: array [0..35] of string = ('0','1','2','3','4','5','6','7', '8',
                                         '9','a','b','c','d','e','f', 'g','h',
                                         'i','j','k','l','m','n', 'o','p','q',
                                         'r','s','t','u','v', 'w','x','y','z');

implementation

////////////////////////////////////////////////////////////////////////////////
// Esta função irá receber uma string e irá criptografar ou descriptografar   //
//  de acordo com a ipKey que for passada.                                    //
////////////////////////////////////////////////////////////////////////////////
function CriptoDecripto(ipForm : TForm; ipCripDecrip : Integer; ipKey, ipTexto : String) : String;
var
  MyCripto : TCriptografa;
begin
  if ipKey = '' then
    begin
      Result := '';
      ShowMessage( 'Não foi passado a Chave para Criptografar ou Descriptografar.');
      Exit;
    end;
  MyCripto := TCriptografa.Create(ipForm);
  if ipKey = MyCripto.Key then
    begin
      MyCripto.Free;
      Result := '';
      ShowMessage('Favor informar Chave diferente de Chave padrão.');
      Exit;
    end;
  MyCripto.Key := ipKey;
  case ipCripDecrip of
    0 : Result := MyCripto.TextToCriptoHex(ipTexto);//iremos criptografar a string;
    1 : Result := MyCripto.CriptoHexToText(ipTexto);//iremos descriptografar a string;
  end;
  MyCripto.Free;
end;

function DiaSemana(Data: TDateTime): String;
const
  Dias : Array[1..7] of String[07] = ('DOMINGO', 'SEGUNDA', 'TERCA','QUARTA','QUINTA', 'SEXTA','SABADO');
begin
  Result := Dias[DayOfWeek(Data)];
end;

function Verifica_Email(email: string): boolean;
var
  i, j, tam_email, simb_arroba, simb_arroba2, qtd_arroba, qtd_pontos,
  qtd_pontos_esq, qtd_pontos_dir, posicao, posicao2, ponto, ponto2: integer;
  vet_email: array [0..59] of string; //50 posições, capacidade do Edit
  msg: string;
begin
  {Por Jaci Jr em 12-10-2001 (00:28 às 03:57)
  Contatos por jrcordeiro@eletroacre.com.br ou
  jrcordeiro@bol.com.br
  Nesta função (func_VerifEmail) é utilizada a função Copy, exemplo:
  Copy(s,i,t) significa trecho de s que começa em i com tamanho t}

  qtd_pontos:= 0;
  qtd_pontos_esq:= 0;
  qtd_pontos_dir:= 0;
  qtd_arroba:= 0;
  posicao:=0;
  posicao2:=0;
  simb_arroba:=0;
  simb_arroba2:=0;
  ponto:= 0;
  ponto2:= 0;
  msg:='';
  Result:= True;

  //Verificando parte inicial do E-mail
  tam_email:= Length(email);
  for i:= 0 to tam_email-1 do
    begin
      vet_email[i]:= Copy(email,i+1,1);
      if vet_email[i] = '@' then
        begin
          Inc(qtd_arroba);
          posicao:= i;
        end;
    end;

  if ((vet_email[0] = '@') or (vet_email[0] = '.') or (vet_email[0] = '-')) then
    begin
      Result:= False;
      msg:= msg1;
    end;

  //Verificando se tem o símbolo @ e quantos tem
  if qtd_arroba < 1 then
    begin
      Result:= False;
      msg:= msg2;
    end
  else
    if qtd_arroba > 1 then
      begin
        Result:= False;
        msg:= msg3 + ' Encontrado(s): '+IntToStr(qtd_arroba)+'.';
      end
    else//Verificando o que vem antes e depois do símbolo @
      begin
        for i:=0 to 35 do
          begin
            if vet_email[posicao-1] <> vet_valido[i] then
              Inc(simb_arroba)
            else
              Dec(simb_arroba);
            if vet_email[posicao+1] <> vet_valido[i] then
              Inc(simb_arroba2)
            else
              Dec(simb_arroba2);
          end;
        if simb_arroba = 36 then
          begin
            //Antes do arroba há um símbolo desconhecido do vetor válido
            Result:= False;
            msg:= msg4;
          end
        else
          if simb_arroba2 = 36 then
            begin
              //Depois do arroba há um símbolo desconhecido do vetor válido
              Result:= False;
              msg:= msg5;
            end
      end;

  //Verificando se há pontos e quantos, e Verificando parte final do e-mail
  for j:=0 to tam_email-1 do
    if vet_email[j] = '-' then
      if ((vet_email[j-1] = '.') or (vet_email[j-1] = '-')) then
        begin
          Result:= False;
          msg:= msg6;
        end;
  for i:=0 to tam_email-1 do
    if vet_email[i] = '.' then
      begin
        Inc(qtd_pontos);
        posicao2:= i+1;
        if i > posicao then
          Inc(qtd_pontos_dir)
        else
          Inc(qtd_pontos_esq);
        if ((vet_email[i-1] = '.') or (vet_email[i-1] = '-')) then
          begin
            Result:= False;
            msg:= msg6;
          end;
      end;
  if qtd_pontos < 1 then
    begin
      Result:= False;
      msg:= msg7;
    end
  else
    if vet_email[tam_email-1] = '.' then
      begin
        Result:= False;
        msg:= msg8;
      end
    else
      if vet_email[tam_email-2] = '.' then
        begin
          Result:= False;
          msg:= msg9;
        end
      else
        if qtd_pontos_dir > 2 then
          begin
            Result:= False;
            msg:= msg10 + ' Encontrado(s): '+
            IntToStr(qtd_pontos)+#10+'Encontrado(s) a direita do @: '+
            IntToStr(qtd_pontos_dir)+'.';
          end
        else
          if (not ((((tam_email - posicao2) = 3) and (qtd_pontos_dir = 1)) or
             (((tam_email - posicao2) = 2) and (qtd_pontos_dir = 2)) or
             (((tam_email - posicao2) = 2) and (qtd_pontos_dir = 1)))) then
            begin
              Result:= False;
              msg:= msg11 +#10+ 'Encontrado(s) a esquerda do @: '+
              IntToStr(qtd_pontos_esq) +#10+ 'Encontrado(s) a direita do @: '+
              IntToStr(qtd_pontos_dir)+'.';
            end
          else//Verificando o que vem antes e depois do ponto
            begin
              for i:=0 to 35 do
                begin
                  if vet_email[posicao2-2] <> vet_valido[i] then
                    Inc(ponto)
                  else
                    Dec(ponto);
                  if vet_email[posicao2] <> vet_valido[i] then
                    Inc(ponto2)
                  else
                    Dec(ponto2);
                end;
              if ponto = 36 then
                begin //Antes do ponto há um símbolo desconhecido do vetor válido
                  Result:= False;
                  msg:= msg12;
                end
              else
                if ponto2 = 36 then
                  begin //Depois do ponto há um símbolo desconhecido do vetor válido
                    Result:= False;
                    msg:= msg13;
                  end
            end;
  //Verificação final
  if not Result then
    begin
      msg:= msg +#10+ 'Formato de E-mail não aceitável!!';
      Application.MessageBox(Pchar(msg), 'Atenção', MB_ICONWARNING);
    end;
end;

//Define uma impressora padrao no windows;
procedure Definir_Impressora_Padrao(Impressora: string);
var
  DriverPort : string;
  s : array[0..64] of char;
  WinIni : TIniFile;
  WinIniFileName : array[0..MAX_PATH] of char;
begin
  GetWindowsDirectory(WinIniFileName, SizeOf(WinIniFileName));
  StrCat(WinIniFileName, '\win.ini');
  WinIni := TIniFile.Create(WinIniFileName);
  try
    DriverPort := WinIni.ReadString('devices', Impressora, '');
    WinIni.WriteString('windows','device', Impressora +',' + DriverPort);
  finally
    WinIni.Free;
  end;
  WritePrivateProfileString(NIL, NIL, NIL, WinIniFileName);
  s := 'windows';
  SendMessage(HWND_BROADCAST, WM_WININICHANGE,0,Cardinal(@s));
end;

procedure LigaCapsLock;
var
  KeyState : TKeyboardState;
begin
  GetKeyboardState(KeyState);
  KeyState[VK_NUMLOCK] := 1;
  KeyState[VK_CAPITAL] := 1;
  SetKeyboardState(KeyState);
end;

function Testa_Mes_Ano(ip_mes_ano_anterior, ip_mes_ano_novo : String) : Boolean;
begin
  Result := False;
  try
    if StrToInt(Copy(ip_mes_ano_novo,4,2)) < StrToInt(Copy(ip_mes_ano_anterior,4,2)) then
      ShowMessage('Ano de Fechamento esta menor menor que ' + Copy(ip_mes_ano_anterior,4,2))
    else
      if ( (StrToInt(Copy(ip_mes_ano_novo,1,2)) <= StrToInt(Copy(ip_mes_ano_anterior,1,2))) and
           (StrToInt(Copy(ip_mes_ano_novo,4,2)) <=StrToInt(Copy(ip_mes_ano_anterior,4,2))) )then
        ShowMessage('Mês de Fechamento esta menor ou igual a ' + Copy(ip_mes_ano_anterior,1,2))
      else
        Result := True;
  except
    ShowMessage('Mês / Ano de Fechamento Inválidos.');
  end;
end;

function PegaNomeArquivo(IP_Endereco : String) : String;
var
  I : Integer;
  Nome_Invertido : String;
begin
  Nome_Invertido := '';
  I := Length(IP_Endereco);
  while (Copy(IP_Endereco,I,1) <> '\') and (I > 0) do
    begin
      Nome_Invertido := Nome_Invertido + Copy(IP_Endereco,I,1);
      Dec(I);
    end;
  //Montar o arquivo na posição certa;
  Result := '';
  for I := Length(Nome_Invertido) DownTo 1 do
    Result := Result + Copy(Nome_Invertido,I,1);
end;

function PegaDiretorioArquivo(IP_Endereco : String) : String;
var
  I : Integer;
begin
  I := Length(IP_Endereco);
  while (Copy(IP_Endereco,I,1) <> '\') and (I > 0) do
    Dec(I);
  Result := Copy(IP_Endereco, 1, i);
end;

//by Sérgio V. Maia
//Procedimento que criptografa qualquer tipo de arquivo.
//Parâmetros: Localização do arquivo original, onde será gravado o arquivo
//criptografado e a chave de criptografia e descriptografia.
procedure CriptografaArquivo(InFName, OutFName: String; Chave: Word);
var
  InMS, OutMS: TMemoryStream;
  I: Integer;
  C: byte;
begin
  InMS := TMemoryStream.Create;
  OutMS := TMemoryStream.Create;

  Try
    InMS.LoadFromFile(InFName);
    InMS.Position := 0;

    for I := 0 to InMS.Size - 1 do
      begin
        InMS.Read(C, 1);
        C := (C xor not(ord(chave shr I)));
        OutMS.Write(C, 1);
      end;

    OutMS.SaveToFile(OutFName);
  finally
    InMS.Free;
    OutMS.Free;
  end;
end;

//by Sérgio V. Maia
//Criptografa qualquer arquivo salvo em um MemoryStream e o devolve
//na função
function CriptografaArquivoToStream(Arquivo: TMemoryStream; Chave: Word): TMemoryStream;
var
  InMS, OutMS: TMemoryStream;
  I: Integer;
  C: byte;
begin
  InMS := TMemoryStream.Create;
  OutMS := TMemoryStream.Create;

  Try
    InMS.LoadFromStream(Arquivo);
    InMS.Position := 0;

    for I := 0 to InMS.Size - 1 do
      begin
        InMS.Read(C, 1);
        C := (C xor not(ord(chave shr I)));
        OutMS.Write(C, 1);
      end;

    OutMS.SaveToStream(Result);
  finally
    InMS.Free;
    OutMS.Free;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Se a Função testa se o formato da data esta igual ao pedido se não tiver  //
//    a função irá corrigir e retornar false se não a função já irá retornar  //
//      True                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

function FormaPadraoData(Formato : String) : Boolean;
var
  Reg : TRegistry;
begin
  if ((Pos(Formato,FormatSettings.ShortDateFormat)>0) = False) then
    begin
      Result := False;
      Reg:=Tregistry.Create;
      Reg.RootKey := HKEY_CURRENT_USER;
      try
        Reg.OpenKey('\Control Panel\International',True);
        Reg.WriteString('sShortDate',Formato);
        Reg.CloseKey;
        Reg.Free;
        Application.MessageBox(PChar('Formatação da Data foi atualizado para ' + Formato + '.' ), 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
      except
        Application.MessageBox('Erro ao Tentar Gravar Formato Padrão de Data.','Erro', MB_OK + MB_ICONERROR);
      end;
    end
  else
    Result := True;
end;

procedure Atualiza_Data_Hora_Computador(ssData, ssHora: TDateTime);
var
  SystemTime : TSystemTime;
begin
  With SystemTime do
    begin
      //Definindo o dia do sistema
      wDay   := StrToInt(Copy(DateToStr(ssData), 1, 2));
      wMonth := StrToInt(Copy(DateToStr(ssData), 4, 2));
      wYear  := StrToInt(Copy(DateToStr(ssData), 7, 4));
      //Definindo a hora do sistema
      wHour   := StrToInt(Copy(TimeToStr(ssHora), 1, 2));
      wMinute := StrToInt(Copy(TimeToStr(ssHora), 4, 2));
      wSecond := StrToInt(Copy(TimeToStr(ssHora), 7, 2));
    end;
  SetLocalTime(SystemTime);
end;

function PesquisarTexto (TextoCompleto, TextoPesquisa : String) : Integer;
var
  I : Integer;
begin
  Result := 0;
  for I := 1 to Length(TextoCompleto) do
    if UpperCase(TextoPesquisa) = UpperCase(Copy(TextoCompleto,I,Length(TextoPesquisa))) then//quer dizer que encontrou o texto pesquisado
      begin
        Result := I;
        Break;
      end;
end;

function LerIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini : String) : String;
var
  ServerIni : TIniFile;
begin
  ServerIni := TIniFile.Create(arquivo_endereco + arquivo_nome);
  Result := ServerIni.ReadString(tabela_ini, campo_ini, '');
  ServerIni.Free;
end;

procedure GravarINI(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini, valor_ini : String);
var
  ServerINI : TIniFile;
begin
  ServerIni := TIniFile.Create(arquivo_endereco + arquivo_nome);
  ServerIni.WriteString(tabela_ini, campo_ini, valor_ini);
  //ServerIni.UpdateFile;
  ServerIni.Free;
end;

function ImpressoraPadrao : String;//by Eliomar Retorna o nome da impressora padrão do Windows
begin
  if(Printer.PrinterIndex >= 0)then
    Result := Printer.Printers[Printer.PrinterIndex]
  else
    Result := '';
end;

{ Esta função retorna true se for pressionado OK e false em caso contrário.
Se for OK, o texto digitado pelo usuário será copiado para a variável Data}
function Pega_Impressora(ipCopias : Integer; var opImpressora : String; var opCopias : Integer) : Boolean;//by Eliomar função pegas as impressoras cadastradas e o usuario seleciona a impressora e a quantidade;
var
  frm_Impressora: TForm; { Variável para o Form }
  EditImpressora: TComboBox; { Variável para o ComboBox - Impressoras }
  EditQuantidade: TEdit; { Variável para o Edit - Quantidade }
  Label1, Label2: TLabel;

  procedure Carrega_Impressoras;
  var
    I : Integer;
  begin
    EditImpressora.Items.Clear;
    for I := 1 to Printer.Printers.Count do
      begin//Esta comentado para pegar todas as impressoras cadastradas não somente as da rede.
  //      if Pos('LPT', printer.Printers.Strings[I-1]) > 0 then
    //      EditImpressora.Items.Add('LPT1');
  //      else
    //      if Pos('\\', printer.Printers.Strings[I-1]) > 0 then
            EditImpressora.Items.Add(Copy(printer.Printers.Strings[I-1],
                                     Pos('\\', printer.Printers.Strings[I-1]),
                                     length(printer.Printers.Strings[I-1]) - Pos('\\', printer.Printers.Strings[I-1]) + 1));
    end;
  end;
begin
  Result := False; { Por padrão retorna False }
  { Cria o form }
  frm_Impressora := TForm.Create(Application);
  try
    { Altera algumas propriedades do Form }
    frm_Impressora.BorderIcons := [];
    frm_Impressora.BorderStyle := bsSingle;
    frm_Impressora.Caption := 'Seleção de Impressora';
    frm_Impressora.Position := poScreenCenter;
    frm_Impressora.Width := 491;
    frm_Impressora.Height := 108;
    { Cria o Label1 }
    Label1 := TLabel.Create(frm_Impressora);
    with Label1 do
      begin
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Parent := frm_Impressora;
        AutoSize := True;
        Caption := 'Selecione a Impressora';
        Left := 3;
        Top := 2;
      end;
    { Cria o EditImpressora }
    EditImpressora := TComboBox.Create(frm_Impressora);
    with EditImpressora do
      begin
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Parent := frm_Impressora;
        Width := 415;
        Height := 30;
        Style := csDropDownList;
        { Posiciona de acordo com a largura do form }
        Left := 3;
        Top := 18;
      end;

    { Cria o EditQuantidade }
    EditQuantidade := TEdit.Create(frm_Impressora);
    with EditQuantidade do
      begin
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Parent := frm_Impressora;
        Width := 55;
        Height := 30;
        Text := IntToStr(ipCopias);
        { Posiciona de acordo com a largura do form }
        Left := (frm_Impressora.Width - 63);
        Top := 18;
      end;
    { Cria o Label2 }
    Label2 := TLabel.Create(frm_Impressora);
    with Label2 do
      begin
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Parent := frm_Impressora;
        AutoSize := True;
        Caption := 'Cópias';
        Left := EditQuantidade.Left;
        Top := 2;
      end;
    { Coloca o botão OK }
    with TBitBtn.Create(frm_Impressora) do
      begin
        Parent := frm_Impressora;
        Height := 30;
        Width := 90;
        Left := 3;
        Top := 50;
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Kind := bkOK; { Botão Ok }
      end;
    { Coloca o botão Cancel }
    with TBitBtn.Create(frm_Impressora) do
      begin
        Parent := frm_Impressora;
        Height := 30;
        Width := 90;
        { Posiciona de acordo com a largura do form }
        Left := (frm_Impressora.Width - 98);
        Top := 50;
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Kind := bkCancel; { Botão Cancel }
        Caption := 'Parar';
      end;
    //carregar para EditImpressora todas as impressoras cadastradas.
    Carrega_Impressoras;
    //Coloca na Impressa Padrão.
    EditImpressora.ItemIndex := EditImpressora.Items.IndexOf(ImpressoraPadrao);

    { Exibe o form e aguarda a ação do usuário. Se for OK... }
    if frm_Impressora.ShowModal = mrOK then
      begin
        //Testando a quantidade
        try
          if StrToInt(EditQuantidade.Text) < 1 then
            opCopias := 1
          else
            opCopias := StrToInt(EditQuantidade.Text);
        except
          opCopias := 1;
        end;

        //Testando se selecionou a impressora
        if EditImpressora.Text = '' then
          ShowMessage('Impressora não Selecionada.')
        else
          begin
            opImpressora := EditImpressora.Text;
            Result := True;
          end;
      end;
  finally
    frm_Impressora.Free;
  end;
end;

function Tirar_Espacos (texto : string): string;
var
  espaco, i , cont : integer;
  posicao, aux, aux_ant : string;
begin
  Texto := Trim (texto);
  posicao := '';
  repeat
    //Variavel Espaco recebe a posicao em q ele achou um espaco no meio da string
    espaco := pos(' ',texto);
    //Delete tira o espaco encontrado
    delete(texto,espaco,1);
    //Variavel posicao monta uma string com a pocição em deve ser inserido o espaço posteriormente
    if posicao = '' then
      posicao := IntToStr(espaco)
    else
      posicao := posicao + ',' + IntToStr(espaco);
  until espaco = 0;

  aux := '';
  aux_ant := '';
  cont := 0;
  // laco em que se le a string montada com as posicoes em q se devem ser inseridos
  // os espacos e os incliu usando da função insert
  for i := 1 to length(posicao) do
    begin
      if posicao[i] <> ',' then
        aux := aux + posicao[i]
      else
        begin
          if aux <> aux_ant then
            begin
              aux_ant := aux;
              insert(' ' , texto, StrToInt(aux) + Cont);
              Inc(Cont);
              aux := '';
            end
          else
            aux := '';
        end;
    end;
  Tirar_Espacos := texto;
end;

{ Esta função retorna true se for pressionado OK e false em caso contrário.
Se for OK, o texto digitado pelo usuário será copiado para a variável Data}
function ObterData(Titulo : String; Data_Inicial : String; var Data: String): Boolean;
var
  Form_DataSis: TForm; { Variável para o Form }
  MaskEdit1: TMaskEdit; { Variável para o MaskEdit }
begin
  Result := False; { Por padrão retorna false }
  { Cria o form }
  Form_DataSis := TForm.Create(Application);
  try
    { Altera algumas propriedades do Form }
    Form_DataSis.BorderIcons := [];
    Form_DataSis.BorderStyle := bsSingle;
    Form_DataSis.Caption := Titulo;
    Form_DataSis.Position := poScreenCenter;
    Form_DataSis.Width := 192;
    Form_DataSis.Height := 98;
    { Coloca o MaskEdit }
    MaskEdit1 := TMaskEdit.Create(Form_DataSis);
    with MaskEdit1 do
      begin
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Parent := Form_DataSis;
        Width := 85;
        Height := 30;
        { Posiciona de acordo com a largura do form }
        Left := Trunc((Form_DataSis.Width - Width) / 2) - 5;
        Top := 10;
        EditMask := '99/99/9999';
        Text := Data_Inicial;
      end;
    { Coloca o botão OK }
    with TBitBtn.Create(Form_DataSis) do
      begin
        Parent := Form_DataSis;
        Height := 30;
        Width := 90;
        Left := 3;
        Top := 40;
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Kind := bkOK; { Botão Ok }
      end;
    { Coloca o botão Cancel }
    with TBitBtn.Create(Form_DataSis) do
      begin
        Parent := Form_DataSis;
        Height := 30;
        Width := 90;
        { Posiciona de acordo com a largura do form }
        Left := (Form_DataSis.Width - 98);
        Top := 40;
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Kind := bkCancel; { Botão Cancel }
      end;
    { Exibe o form e aguarda a ação do usuário. Se for OK... }
    if Form_DataSis.ShowModal = mrOK then
      begin
        try
          Data := DateToStr(StrToDate(MaskEdit1.Text));
          if (StrToDate(Data) > Date) or (StrToDate(Data) < Date-1980) then
            begin
              ShowMessage('Data ' + MaskEdit1.Text + ' maior que ' + DateToStr(Date));
              Data := '';
            end;
          Result := True;
        except
          on E: Exception do
            begin
              ShowMessage('Data Inválida');
              Data := '';
            end;
        end;
      end;
  finally
    Form_DataSis.Free;
  end;
end;

function CopiarArquivos(Nome_Arquivo, End_Origem, End_Destino : String) : Boolean;//by Eliomar copiar todos os arquivos (desconsiderando a extensão) de da origem para destino;
var
  I : Integer;
  SR: TSearchRec;
  Origem, Destino : String;
begin
  Result := False;
  //Vamos copiar os arquivos (com mesmo nome) da pasta origem para destino
  I := FindFirst(End_Origem + '\*.*', faAnyFile, SR);
  while I = 0 do
    begin
      if (SR.Attr and faDirectory) <> faDirectory then
        begin
          Origem := End_Origem + '\' + SR.Name;
          Destino := End_Destino + '\' + SR.Name;
          if (UpperCase(Copy(SR.Name,1,Length(Nome_Arquivo))) = UpperCase(Nome_Arquivo)) then
            if not CopyFile(PChar(Origem), PChar(Destino), False) then
              begin
                ShowMessage('Erro ao Atualizar Arquivo de ' + Origem + ' para ' + Destino);
                Exit;
              end;
        end;
      I := FindNext(SR);
    end;
  //Fim de Vamos copiar os arquivos (com mesmo nome) da pasta origem para destino
  Result := True;
end;

function SubtraiMes(Data_Final, Data_Inicial : TDateTime) : String;//by Eliomar subtrai um mes do outro e retorna a diferença em string;
var
  Total_Dias : Integer;
begin
  Total_Dias := Trunc(Data_Final - Data_Inicial);
  Result := IntToStr(Total_Dias div 30);
end;

function MaskCpf_Cnpj(Texto : String) : String;//By eliomar função para colocar os pontos do cpf ou do cnpj
begin
  Texto := SoNumeros(Texto);
  if Texto <> '' then
    begin
      if Length(Texto) < 14 then
        Texto := Copy(Texto,1,3) + '.' + Copy(Texto,4,3) + '.' + Copy(Texto,7,3) + '-' + Copy(Texto,10,2)
      else
        Texto := Copy(Texto,1,2) + '.' + Copy(Texto,3,3) + '.' + Copy(Texto,6,3) + '/' + Copy(Texto,9,4) + '-' + Copy(Texto,13,2);
    end;
  Result := Texto;
end;

function AlterarEspeciais(Str:String): String;//by eliomar
Const
  Especiais = '€§¦‡‚… Ž£“„¢ƒ¡Ö™âµ¶';
  Normal =    'ÇºªÉçéàáÃú ôãóâíÍÕÁÔÁÂ';
Var
  x : Integer;
begin
  for x := 1 to Length(Str) do
    if Pos(Str[x],Especiais)<>0 then
      Str[x] := Normal[Pos(Str[x],Especiais)];
  Result := Str;
end;

function StrToChar(MyString : String) : CHAR;
var
  i: Integer;
  MyChars: array[ 1..100] of Char;
begin
  for i:=1 to length( MyString) do
    MyChars[ i]:= MyString[ i];
  Result := MyChars[length( MyString)];
end;

function RemoveAcento(Str:String): String;//by eliomar
Const
  ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
Var
  x : Integer;
begin
  for x := 1 to Length(Str) do
    if Pos(Str[x],ComAcento)<>0 then
      Str[x] := SemAcento[Pos(Str[x],ComAcento)];
  Result := Str;
end;

function ExtractValFromStr(stValue: String): String;
var
  NPos, TPos: Integer;
  nwValue: String;
begin
 while Pos('.', stValue) > 0 do stValue[Pos('.', stValue)] := ' ';
 NPos := 1;
 TPos := Length(stValue);
 nwValue := '';
 while NPos <= TPos do
   begin
     if Copy(stValue, NPos, 1) <> ' ' then nwValue := nwValue + Copy(stValue, NPos, 1);
     Inc(NPos);
   end;
 ExtractValFromStr := nwValue;
end;

function Ponto(Cap : String; Tipo : Boolean) : String;
begin
  if Tipo = False then
    begin
      if copy(Cap,length(Cap),1) = '.' then
        Ponto := copy(Cap,1,length(Cap)-1)
      else
        Ponto := Cap;
    end
  else
    Ponto := Cap + '.';
end;

function Preenchimento(Texto : String; Text : Char; Tamanho : Integer; Adireita : Boolean) : String;
begin//by eliomar
  Texto := Copy(Texto,1,Tamanho);
  if Adireita = True then
    Preenchimento := Texto + StringOfChar(Text, Tamanho - Length(Texto))
  else
    Preenchimento := StringOfChar(Text, Tamanho - Length(Texto)) + Texto;
end;

function  BooleanToInt(Valor : Boolean) : Integer;
begin//by eliomar
  if Valor = False then
    BooleanToInt := 0
  else
    BooleanToInt := 1;
end;

function SoNumeros(Texto : String) : String;//pega uma string e retorna somente os números contidos na string
var//by eliomar
  I : Integer;
  vaAux : String;
begin
  vaAux := '';
  for I := 1 to Length(Texto) do
    if ((Texto[i] = '0') or
        (Texto[i] = '1') or
        (Texto[i] = '2') or
        (Texto[i] = '3') or
        (Texto[i] = '4') or
        (Texto[i] = '5') or
        (Texto[i] = '6') or
        (Texto[i] = '7') or
        (Texto[i] = '8') or
        (Texto[i] = '9')) then
      vaAux := vaAux + Texto[I];
  SoNumeros := vaAux;
end;

function  DataBarraStringPonto(Data : TDateTime) : String;
var//by eliomar
  Aux : String;
begin
  Aux := DateToStr(Data);
  DataBarraStringPonto := copy(Aux,1,2) + '.' +
                          copy(Aux,4,2) + '.' +
                          copy(Aux,7,4);
end;

function FatMult(PercInicial: Double; Qtde: Integer): Double;
var//by eliomar
  FatorMult : Double;
begin
  FatorMult := 1;
  while Qtde >= 1 do
    begin
      FatorMult := FatorMult * PercInicial;
      Qtde := Qtde - 1;
    end;
  FatMult := FatorMult;
end;

function TemDiscoNoDrive(const drive : char): boolean;//testa se tem disco no drive
var//by eliomar
  DriveNumero : byte;
  EMode : word;
begin
  result := false;
  DriveNumero := ord(Drive);
  if DriveNumero >= ord('a') then
    dec(DriveNumero,$20);
  EMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  try
    if DiskSize(DriveNumero-$40) <> -1 then
      Result := true
    else
      messagebeep(0);
  finally
    SetErrorMode(EMode);
  end;
end;

function GetTextValue(gtValue: String): Double; //funcao para pegar um valor de uma string, desconsiderando os pontos da formatação
var
  nCaractere: Integer;
  nValue: String;
begin
  nValue := '';
  for nCaractere := 1 to Length(gtValue) do
    begin
      if Pos(Copy(gtValue, nCaractere, 1), ',0123456789') > 0 then
        nValue := nValue + Copy(gtValue, nCaractere, 1);
    end;
  Result := StrToFloat(nValue);
end;

function SecurityKey(skChave: String): Boolean; {Verifica se a cópia não é pirata, baseado no registro do windows}
var
  MyReg: TRegistry;
  sUsuario: String;
  rKey: Integer;
begin
  Result := False;
  if Length(skChave) <> 20 then
    begin
      ShowMessage('A chave de licença do software deve ser uma string de 20 posições.');
      Exit;
    end;
  MyReg := TRegistry.Create;
  MyReg.RootKey := HKEY_CLASSES_ROOT; //A chave será uma subchave desta
  if MyReg.KeyExists('WinSystemInfo.DllSystemFiles.NetFiles.' + skChave) = False then //a chave não foi encontrada
    begin
      if Application.MessageBox('Este software não está licenciado. Deseja licenciá-lo agora?', 'Licença do Software', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = idYES then
        begin
          sUsuario := InputBox('Senha Para Licença do Software', 'Informe a Senha', '');
          if sUsuario = SenhaDiaria then
            begin
              try
                MyReg.CreateKey('WinSystemInfo.DllSystemFiles.NetFiles.' + skChave);
                MyReg.OpenKey('WinSystemInfo.DllSystemFiles.NetFiles.' + skChave, True);
                MyReg.WriteInteger('WinSystemInfo.DllSystemFiles.NetFiles.' + skChave, 72538419);
                MyReg.CloseKey;
                Result := True;
                ShowMessage('A licença do software foi registrada no banco de dados com sucesso.');
              except
                on E: Exception do
                  begin
                    ShowMessage('Problemas na tentativa de registrar a licença do software.' + #13 + E.Message);
                    Result := False;
                  end;
              end;
            end
          else
            ShowMessage('Senha Inválida.');
        end;
    end
  else
    begin
      try
        MyReg.OpenKey('WinSystemInfo.DllSystemFiles.NetFiles.' + skChave, True);
        rKey := MyReg.ReadInteger('WinSystemInfo.DllSystemFiles.NetFiles.' + skChave);
        MyReg.CloseKey;
        if rKey = 72538419 then Result := True;
      except
        on E: Exception do
          begin
            ShowMessage('Problemas na tentativa de checar a licença do software.' + #13 + E.Message);
            Result := False;
          end;
      end;
    end;
  MyReg.Free;
end;

function SenhaDiaria: String; //Retorna a senha diária
var
  VSenha, Data_Base: String;
  TDia_Semana: Array[1..7,1..7] of Integer;
  VSubtra: Integer;
begin
  TDia_Semana[1,1] := 7;
  TDia_Semana[2,1] := 7;
  TDia_Semana[3,1] := 5;
  TDia_Semana[4,1] := 6;
  TDia_Semana[5,1] := 6;
  TDia_Semana[6,1] := 5;
  TDia_Semana[7,1] := 6;

  TDia_Semana[1,2] := 7;
  TDia_Semana[2,2] := 6;
  TDia_Semana[3,2] := 5;
  TDia_Semana[4,2] := 4;
  TDia_Semana[5,2] := 3;
  TDia_Semana[6,2] := 2;
  TDia_Semana[7,2] := 1;

  VSubtra := TDia_Semana[DayOfWeek(Date),2];

  Data_Base := Copy(DateToStr(Date-VSubtra),4,2)+
               Copy(DateToStr(Date-VSubtra),7,4)+
               Copy(DateToStr(Date-VSubtra),1,2);
  VSenha := IntToStr((StrToInt(Data_Base) * DayOfWeek(Date)) + TDia_Semana[DayOfWeek(Date),1]);

  Result := VSenha;
end;

function ExecAndWait(const FileName, Params: string; const WindowState: Word): Boolean; //esta funçao serve executa outro software
var                                                                                     //e espera sua finalização para prosseguir com o processamento
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto é necessário devido aos espaços contidos em nomes longos }
  CmdLine := '"' + Filename + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
    begin
      cb := SizeOf(SUInfo);
      dwFlags := STARTF_USESHOWWINDOW;
      wShowWindow := WindowState;
    end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, False,
                          CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
                          PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);
  { Aguarda até ser finalizado }
  if Result then
    begin
      WaitForSingleObject(ProcInfo.hProcess, INFINITE);
      { Libera os Handles }
      CloseHandle(ProcInfo.hProcess);
      CloseHandle(ProcInfo.hThread);
    end;
end;

function DataExtenso(Cidade_Estado: String; Data: TDateTime): String;{Retorna uma data por extenso}
var
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'Março';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  if Cidade_Estado <> '' then
    Cidade_Estado := Cidade_Estado + ', ';
  Result := Cidade_Estado + IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
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

procedure MoveMouse(Controle : TControl);
var
  IrPara: TPoint;
begin
  IrPara.X := Controle.Left + (Controle.Width div 2);
  IrPara.Y := Controle.Top + (Controle.Height div 2);
  if Controle.Parent <> nil then
    IrPara := Controle.Parent.ClientToScreen(IrPara);
  SetCursorPos(IrPara.X, IrPara.Y);
end;

function ArrastaMouseToControl(const Control: TControl; Jump, JumpTime: Word): boolean;
var
  ToPoint, Pt: TPoint;

  function ExecJump: boolean;
    begin
      if (Pt.x = ToPoint.x) and (Pt.y = ToPoint.y) then
        begin
          Result := false; { Chegou }
          Exit;
        end;
      { Calcula X }
      if Pt.x < ToPoint.x then
        begin
          Inc(Pt.x, Jump);
          if Pt.x > ToPoint.x then { Se passou... }
            Pt.x := ToPoint.x;
        end
      else
        if Pt.x > ToPoint.x then
          begin
            Dec(Pt.x, Jump);
            if Pt.x < ToPoint.x then
              Pt.x := ToPoint.x;
          end;
      { Calcula Y }
      if Pt.y < ToPoint.y then
        begin
          Inc(Pt.y, Jump);
          if Pt.y > ToPoint.y then { Se passou... }
          Pt.y := ToPoint.y;
        end
      else
        if Pt.y > ToPoint.y then
          begin
            Dec(Pt.y, Jump);
            if Pt.y < ToPoint.y then
              Pt.y := ToPoint.y;
          end;
      Result := SetCursorPos(Pt.x, Pt.y);
    end;

begin
  if Jump = 0 then
    Jump := 1;
  SetCursor(Screen.Cursors[Control.Cursor]);
  with Control do
    begin
      ToPoint.x := Width div 2;
      ToPoint.y := Height div 2;
      ToPoint := ClientToScreen(ToPoint);
    end;
  if GetCursorPos(Pt) then
    while ExecJump do
      Sleep(JumpTime);
  Result := GetCursorPos(Pt) and (Pt.x = ToPoint.x) and (Pt.y = ToPoint.y);
end;

function Bissexto(AYear: Integer): Boolean;
begin
  Result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0));
end;

function DiasDoMes(AYear, AMonth: Integer): Integer;
const
  DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  Result := DaysInMonth[AMonth];
  if (AMonth = 2) and Bissexto(AYear) then
    Inc(Result);
end;

function DataMaisDiasUteis(DataIni : TDateTime; Dias_Uteis : integer): TDateTime;
// Retorna uma data acresçida de mais um certo número de dias
// uteis descontando os fins de semana
var Dw : integer;
begin
  Dw := DayOfWeek(DataIni)-1;
  result := DataIni + Dias_Uteis + ((Dias_Uteis - 1 + Dw) div 5) * 2;
end;

procedure Espera_Tempo(Quanto_Tempo: TDateTime);
var
  Hora1, Hora2: TDateTime;
begin
  Hora1 := Time;
  Hora2 := Time;
  While (Hora2 - Hora1) < Quanto_Tempo do
    Hora2 := Time;
end;

procedure Tab_To_Enter(Sender: TForm; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0;
      SendMessage(Sender.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure Virgula_To_Ponto(var Key: Char);
begin
  if Key = #46 then
    Key := #44;
end;

function IntToStrZero(Valor, Tamanho: Integer): String;
var
  VFinal: String;
begin
  VFinal := IntToStr(Valor);
  While Length(VFinal) < Tamanho do
    VFinal := '0' + VFinal;
  IntToStrZero := VFinal;
end;

function DouToStrZero(Valor, Tamanho: Double): String;
var
  VFinal: String;
begin
  VFinal := FloatToStr(Valor);
  While Length(VFinal) < Tamanho do
    VFinal := '0' + VFinal;
  DouToStrZero := VFinal;
end;

procedure Novo_Grava_S(Arquivo: TTable; {Table utilizada pelo formulario}
                       Botao1, Botao2, Botao3: TButton; {Botões do formulario}
                       SBotao1, SBotao2: TSpeedButton; {Speed Botões do formulario}
                       CampoFocus: TDBEdit; {Campo do formulario que sera focado na inclusao}
                       CampoChave1, CampoChave2, CampoChave3: TDBEdit; {Campos chaves da table}
                       Navegador: TDBNavigator); {Navegador do formulario}
begin
  If Botao1.Caption = '&Novo' then
    begin
      try
        Arquivo.Active := False;
        Arquivo.ReadOnly := False;
        Arquivo.Active := True;
        Arquivo.Append;
        Botao1.Caption := '&Grava/Novo';
        Botao1.Font.Style := [fsItalic];
        Botao2.Enabled := False;
        Botao3.Caption := '&Cancela Novo';
        Botao3.Font.Style := [fsItalic];
        Navegador.Enabled := False;
        SBotao1.Enabled := False;
        SBotao2.Enabled := False;
        CampoFocus.SetFocus;
      except
        on E: Exception do
          begin
            MessageDlg('ERRO NA TENTATIVA DE INCLUIR. MENSAGEM: ' +
                       E.Message, mtError, [mbOK], 0);
            Arquivo.Active := False;
            Arquivo.ReadOnly := True;
            Arquivo.Active := True;
            Botao1.Enabled := True;
            Botao1.Caption := '&Novo';
            Botao1.Font.Style := [];
            Botao2.Enabled := True;
            Botao2.Caption := '&Modifica';
            Botao3.Enabled := True;
            Botao3.Caption := '&Exclui';
            Botao3.Font.Style := [];
            Navegador.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
            Arquivo.Last;
          end;
      end;
    end
  else
    begin
      try
        Arquivo.Post;
        Arquivo.Append;
        CampoFocus.SetFocus;
      except
        on E: Exception do
          begin
            if E.Message = 'Key violation' then
              begin
                MessageDlg('Este registro já existe no arquivo.',
                            mtInformation, [mbOK], 0);
                CampoChave1.SetFocus;
              end
            else
              begin
                MessageDlg('ERRO NA TENTATIVA DE GRAVAR/INCLUIR. MENSAGEM: ' +
                            E.Message, mtInformation, [mbOK], 0);
                Arquivo.Active := False;
                Arquivo.ReadOnly := True;
                Arquivo.Active := True;
                Botao1.Enabled := True;
                Botao1.Caption := '&Novo';
                Botao1.Font.Style := [];
                Botao2.Enabled := True;
                Botao2.Caption := '&Modifica';
                Botao3.Enabled := True;
                Botao3.Caption := '&Exclui';
                Navegador.Enabled := True;
                SBotao1.Enabled := True;
                SBotao2.Enabled := True;
                Arquivo.Last;
              end;
          end;
      end;
    end;
end;

procedure Modifica_Grava_S(Arquivo: TTable; {Table utilizada pelo formulario}
                           Botao1, Botao2, Botao3: TButton; {Botões do formulario}
                           SBotao1, SBotao2: TSpeedButton; {Speed Botões do formulario}
                           CampoFocus: TDBEdit; {Campo do formulario que sera focado na inclusao}
                           CampoChave1, CampoChave2, CampoChave3: TDBEdit; {Campos chaves da table}
                           Navegador: TDBNavigator); {Navegador do formulario}
var
  MyBookmark: TBookmark;
begin
  if Botao2.Caption = '&Modifica' then
    begin
      try
        MyBookmark := Arquivo.GetBookmark;
        Arquivo.Active := False;
        Arquivo.ReadOnly := False;
        Arquivo.Active := True;
        Arquivo.GotoBookmark(MyBookmark);
        Arquivo.FreeBookmark(MyBookmark);
        Arquivo.Edit;
        CampoChave1.ReadOnly := True;
        CampoChave2.ReadOnly := True;
        CampoChave3.ReadOnly := True;
        CampoFocus.SetFocus;
        Botao1.Enabled := False;
        Botao2.Caption := '&Grava';
        Botao2.Font.Style := [fsItalic];
        Botao3.Enabled := False;
        Navegador.Enabled := False;
        SBotao1.Enabled := False;
        SBotao2.Enabled := False;
      except
        on E: Exception do
          begin
            MessageDlg('No momento este registro está bloqueado ' +
                       'por outro usuário. Sua modificação não é ' +
                       'permitida. '+Chr(13)+E.Message, mtInformation, [mbOK], 0);
            MyBookmark := Arquivo.GetBookmark;
            Arquivo.Active := False;
            Arquivo.ReadOnly := True;
            Arquivo.Active := True;
            Arquivo.GotoBookmark(MyBookmark);
            Arquivo.FreeBookmark(MyBookmark);
            CampoChave1.ReadOnly := False;
            CampoChave2.ReadOnly := False;
            CampoChave3.ReadOnly := False;
            Botao1.Enabled := True;
            Botao2.Caption := '&Modifica';
            Botao2.Font.Style := [];
            Botao3.Enabled := True;
            Navegador.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
          end;
      end;
    end
  else
    begin
      try
        Arquivo.Post;
        MyBookmark := Arquivo.GetBookmark;
        Arquivo.Active := False;
        Arquivo.ReadOnly := True;
        Arquivo.Active := True;
        Arquivo.GotoBookmark(MyBookmark);
        Arquivo.FreeBookmark(MyBookmark);
        CampoChave1.ReadOnly := False;
        CampoChave2.ReadOnly := False;
        CampoChave3.ReadOnly := False;
        Botao1.Enabled := True;
        Botao2.Caption := '&Modifica';
        Botao2.Font.Style := [];
        Botao3.Enabled := True;
        Navegador.Enabled := True;
        SBotao1.Enabled := True;
        SBotao2.Enabled := True;
      except
        on E: Exception do
          begin
            MessageDlg('ERRO NA TENTATIVA DE GRAVAR ALTERAÇÃO. MENSAGEM: ' +
                       E.Message, mtInformation, [mbOK], 0);
            MyBookmark := Arquivo.GetBookmark;
            Arquivo.Active := False;
            Arquivo.ReadOnly := True;
            Arquivo.Active := True;
            Arquivo.GotoBookmark(MyBookmark);
            Arquivo.FreeBookmark(MyBookmark);
            CampoChave1.ReadOnly := False;
            CampoChave2.ReadOnly := False;
            CampoChave3.ReadOnly := False;
            Botao1.Enabled := True;
            Botao2.Caption := '&Modifica';
            Botao2.Font.Style := [];
            Botao3.Enabled := True;
            Navegador.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
          end;
      end;
    end;
end;

procedure Exclui_Cancela_S(PodeExcluir: String;
                           Arquivo: TTable; {Table utilizada pelo formulario}
                           Botao1, Botao2, Botao3: TButton; {Botões do formulario}
                           SBotao1, SBotao2: TSpeedButton; {Speed Botões do formulario}
                           CampoFocus: TDBEdit; {Campo do formulario que sera focado na inclusao}
                           CampoChave1, CampoChave2, CampoChave3: TDBEdit; {Campos chaves da table}
                           Navegador: TDBNavigator); {Navegador do formulario}
var
  MyBookmark: TBookmark;
begin
  if Botao3.Caption = '&Cancela Novo' then
    begin
      try
        Arquivo.Cancel;
        MyBookmark := Arquivo.GetBookmark;
        Arquivo.Active := False;
        Arquivo.ReadOnly := True;
        Arquivo.Active := True;
        Arquivo.GotoBookmark(MyBookMark);
        Arquivo.FreeBookmark(MyBookMark);
        CampoChave1.ReadOnly := False;
        CampoChave2.ReadOnly := False;
        CampoChave3.ReadOnly := False;
        Botao1.Enabled := True;
        Botao1.Caption := '&Novo';
        Botao1.Font.Style := [];
        Botao2.Enabled := True;
        Botao2.Caption := '&Modifica';
        Botao3.Enabled := True;
        Botao3.Caption := '&Exclui';
        Botao3.Font.Style := [];
        Navegador.Enabled := True;
        SBotao1.Enabled := True;
        SBotao2.Enabled := True;
      except
        on E: Exception do
          begin
            MessageDlg('ERRO NA TENTATIVA DE CANCELAR A INCLUSÃO. MENSAGEM: ' +
                       E.Message, mtInformation, [mbOK], 0);
            MyBookmark := Arquivo.GetBookmark;
            Arquivo.Active := False;
            Arquivo.ReadOnly := True;
            Arquivo.Active := True;
            Arquivo.GotoBookmark(MyBookMark);
            Arquivo.FreeBookmark(MyBookMark);
            CampoChave1.ReadOnly := False;
            CampoChave2.ReadOnly := False;
            CampoChave3.ReadOnly := False;
            Botao1.Enabled := True;
            Botao1.Caption := '&Novo';
            Botao1.Font.Style := [];
            Botao2.Enabled := True;
            Botao2.Caption := '&Modifica';
            Botao3.Enabled := True;
            Botao3.Caption := '&Exclui';
            Botao3.Font.Style := [];
            Navegador.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
          end;
      end;
    end
  else
    begin
      if PodeExcluir <> 'S' then
        begin
          ShowMessage('Você não tem permissão para efetuar exclusões.');
          Exit;
        end;
      If MessageDlg('Deletar o registro?', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then
        begin
          try
            MyBookmark := Arquivo.GetBookmark;
            Arquivo.Active := False;
            Arquivo.ReadOnly := False;
            Arquivo.Active := True;
            Arquivo.GotoBookmark(MyBookmark);
            Arquivo.FreeBookmark(MyBookmark);
            Arquivo.Delete;
            MyBookmark := Arquivo.GetBookmark;
            Arquivo.Active := False;
            Arquivo.ReadOnly := True;
            Arquivo.Active := True;
            Arquivo.GotoBookmark(MyBookmark);
            Arquivo.FreeBookmark(MyBookmark);
          except
            on E: Exception do
              begin
                MessageDlg('No momento este registro está bloqueado ' +
                           'por outro usuário. Sua exclusão não é ' +
                           'permitida. ', mtInformation, [mbOK], 0);
                MyBookmark := Arquivo.GetBookmark;
                Arquivo.Active := False;
                Arquivo.ReadOnly := True;
                Arquivo.Active := True;
                Arquivo.GotoBookmark(MyBookmark);
                Arquivo.FreeBookmark(MyBookmark);
              end;
          end;
        end;
    end;
end;

procedure RefreshTable(Arquivo: TTable);
var
  MyBookmark: TBookmark;
begin
  If (Arquivo.ReadOnly = True) and (Arquivo.RecordCount > 0) then
    begin
      MyBookmark := Arquivo.GetBookmark;
      Arquivo.Active := False;
      Arquivo.Active := True;
      Arquivo.GotoBookmark(MyBookmark);
      Arquivo.FreeBookmark(MyBookmark);
    end;
end;

procedure RefreshTablePF(Arquivo_P, Arquivo_F: TTable);
var
  MyBookmark1, MyBookmark2: TBookmark;
begin
  If (Arquivo_P.ReadOnly = True) and (Arquivo_P.RecordCount > 0) and (Arquivo_F.ReadOnly = True) and (Arquivo_F.RecordCount > 0) then
    begin
      MyBookmark2 := Arquivo_F.GetBookmark;
      MyBookmark1 := Arquivo_P.GetBookmark;
      Arquivo_F.Active := False;
      Arquivo_P.Active := False;
      Arquivo_P.Active := True;
      Arquivo_F.Active := True;
      Arquivo_P.GotoBookmark(MyBookmark1);
      Arquivo_P.FreeBookmark(MyBookmark1);
      Arquivo_F.GotoBookmark(MyBookmark2);
      Arquivo_F.FreeBookmark(MyBookmark2);
    end;
end;

procedure Novo_Grava_P(Arquivo_P, Arquivo_F: TTable; {Table utilizada pelo formulario}
                       Botao1, Botao2, Botao3, Botao4, Botao5, Botao6: TButton; {Botões do formulario}
                       SBotao1, SBotao2: TSpeedButton; {Speed Botões do formulario}
                       CampoFocus1, CampoFocus2: TDBEdit; {Campo do formulario que sera focado na inclusao}
                       CampoChave1, CampoChave2, CampoChave3: TDBEdit; {Campos chaves da table}
                       Navegador1, Navegador2: TDBNavigator); {Navegador do formulario}
var
  MyBookmark: TBookmark;
begin
  If Botao1.Caption = '&Novo' then
    begin
      try
        Arquivo_P.Active := False;
        Arquivo_P.ReadOnly := False;
        Arquivo_P.Active := True;
        Arquivo_P.Append;
        Botao1.Caption := '&Grava/Novo';
        Botao1.Font.Style := [fsItalic];
        Botao2.Enabled := False;
        Botao3.Caption := '&Cancela Novo';
        Botao3.Font.Style := [fsItalic];
        Botao4.Enabled := False;
        Botao5.Enabled := False;
        Botao6.Enabled := False;
        Navegador1.Enabled := False;
        Navegador2.Enabled := False;
        SBotao1.Enabled := False;
        SBotao2.Enabled := False;
        CampoFocus1.SetFocus;
      except
        on E: Exception do
          begin
            MessageDlg('ERRO NA TENTATIVA DE INCLUIR. MENSAGEM: ' +
                       E.Message, mtError, [mbOK], 0);
            Arquivo_P.Active := False;
            Arquivo_P.ReadOnly := True;
            Arquivo_P.Active := True;
            Botao1.Enabled := True;
            Botao1.Caption := '&Novo';
            Botao1.Font.Style := [];
            Botao2.Enabled := True;
            Botao2.Caption := '&Modifica';
            Botao3.Enabled := True;
            Botao3.Caption := '&Exclui';
            Botao3.Font.Style := [];
            Botao4.Enabled := True;
            Botao5.Enabled := True;
            Botao6.Enabled := True;
            Navegador1.Enabled := True;
            Navegador2.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
            Arquivo_P.Last;
          end;
      end;
    end
  else
    begin
      try
        Arquivo_P.Post;
        MyBookmark := Arquivo_P.GetBookmark;
        Arquivo_P.Active := False;
        Arquivo_P.ReadOnly := True;
        Arquivo_P.Active := True;
        Arquivo_P.GotoBookmark(MyBookmark);
        Arquivo_P.FreeBookmark(MyBookmark);
        Botao1.Enabled := True;
        Botao1.Caption := '&Novo';
        Botao1.Font.Style := [];
        Botao2.Enabled := True;
        Botao2.Caption := '&Modifica';
        Botao3.Enabled := True;
        Botao3.Caption := '&Exclui';
        Botao3.Font.Style := [];
        Novo_Grava_F(Arquivo_P, Arquivo_F,
                     Botao1, Botao2, Botao3, Botao4, Botao5, Botao6,
                     SBotao1, SBotao2,
                     CampoFocus2,
                     CampoChave1, CampoChave2, CampoChave3,
                     Navegador1, Navegador2);
      except
        on E: Exception do
          begin
            if E.Message = 'Key violation' then
              begin
                MessageDlg('Este registro já existe no arquivo.',
                            mtInformation, [mbOK], 0);
                CampoFocus1.SetFocus;
              end
            else
              begin
                MessageDlg('ERRO NA TENTATIVA DE GRAVAR/INCLUIR. MENSAGEM: ' +
                            E.Message, mtInformation, [mbOK], 0);
                Arquivo_P.Active := False;
                Arquivo_P.ReadOnly := True;
                Arquivo_P.Active := True;
                Botao1.Enabled := True;
                Botao1.Caption := '&Novo';
                Botao1.Font.Style := [];
                Botao2.Enabled := True;
                Botao2.Caption := '&Modifica';
                Botao3.Enabled := True;
                Botao3.Caption := '&Exclui';
                Botao3.Font.Style := [];
                Botao4.Enabled := True;
                Botao5.Enabled := True;
                Botao6.Enabled := True;
                Navegador1.Enabled := True;
                Navegador2.Enabled := True;
                SBotao1.Enabled := True;
                SBotao2.Enabled := True;
                Arquivo_P.Last;
              end;
          end;
      end;
    end;
end;

procedure Modifica_Grava_P(Arquivo_P, Arquivo_F: TTable; {Table utilizada pelo formulario}
                           Botao1, Botao2, Botao3, Botao4, Botao5, Botao6: TButton; {Botões do formulario}
                           SBotao1, SBotao2: TSpeedButton; {Speed Botões do formulario}
                           CampoFocus1, CampoFocus2: TDBEdit; {Campo do formulario que sera focado na inclusao}
                           CampoChave1, CampoChave2, CampoChave3: TDBEdit; {Campos chaves da table}
                           Navegador1, Navegador2: TDBNavigator); {Navegador do formulario}
var
  MyBookmark: TBookmark;
begin
  if Botao2.Caption = '&Modifica' then
    begin
      try
        MyBookmark := Arquivo_P.GetBookmark;
        Arquivo_P.Active := False;
        Arquivo_P.ReadOnly := False;
        Arquivo_P.Active := True;
        Arquivo_P.GotoBookmark(MyBookmark);
        Arquivo_P.FreeBookmark(MyBookmark);
        Arquivo_P.Edit;
        CampoChave1.ReadOnly := True;
        CampoChave2.ReadOnly := True;
        CampoChave3.ReadOnly := True;
        Botao1.Enabled := False;
        Botao2.Caption := '&Grava';
        Botao2.Font.Style := [fsItalic];
        Botao3.Enabled := False;
        Botao4.Enabled := False;
        Botao5.Enabled := False;
        Botao6.Enabled := False;
        Navegador1.Enabled := False;
        Navegador2.Enabled := False;
        SBotao1.Enabled := False;
        SBotao2.Enabled := False;
      except
        on E: Exception do
          begin
            MessageDlg('No momento este registro está bloqueado ' +
                       'por outro usuário. Sua modificação não é ' +
                       'permitida. ', mtInformation, [mbOK], 0);
            MyBookmark := Arquivo_P.GetBookmark;
            Arquivo_P.Active := False;
            Arquivo_P.ReadOnly := True;
            Arquivo_P.Active := True;
            Arquivo_P.GotoBookmark(MyBookmark);
            Arquivo_P.FreeBookmark(MyBookmark);
            CampoChave1.ReadOnly := False;
            CampoChave2.ReadOnly := False;
            CampoChave3.ReadOnly := False;
            Botao1.Enabled := True;
            Botao2.Caption := '&Modifica';
            Botao2.Font.Style := [];
            Botao3.Enabled := True;
            Botao4.Enabled := True;
            Botao5.Enabled := True;
            Botao6.Enabled := True;
            Navegador1.Enabled := True;
            Navegador2.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
          end;
      end;
    end
  else
    begin
      try
        Arquivo_P.Post;
        MyBookmark := Arquivo_P.GetBookmark;
        Arquivo_P.Active := False;
        Arquivo_P.ReadOnly := True;
        Arquivo_P.Active := True;
        Arquivo_P.GotoBookmark(MyBookmark);
        Arquivo_P.FreeBookmark(MyBookmark);
        CampoChave1.ReadOnly := False;
        CampoChave2.ReadOnly := False;
        CampoChave3.ReadOnly := False;
        Botao1.Enabled := True;
        Botao2.Caption := '&Modifica';
        Botao2.Font.Style := [];
        Botao3.Enabled := True;
        Botao4.Enabled := True;
        Botao5.Enabled := True;
        Botao6.Enabled := True;
        Navegador1.Enabled := True;
        Navegador2.Enabled := True;
        SBotao1.Enabled := True;
        SBotao2.Enabled := True;
      except
        on E: Exception do
          begin
            MessageDlg('ERRO NA TENTATIVA DE GRAVAR ALTERAÇÃO. MENSAGEM: ' +
                       E.Message, mtInformation, [mbOK], 0);
            MyBookmark := Arquivo_P.GetBookmark;
            Arquivo_P.Active := False;
            Arquivo_P.ReadOnly := True;
            Arquivo_P.Active := True;
            Arquivo_P.GotoBookmark(MyBookmark);
            Arquivo_P.FreeBookmark(MyBookmark);
            CampoChave1.ReadOnly := False;
            CampoChave2.ReadOnly := False;
            CampoChave3.ReadOnly := False;
            Botao1.Enabled := True;
            Botao2.Caption := '&Modifica';
            Botao2.Font.Style := [];
            Botao3.Enabled := True;
            Botao4.Enabled := True;
            Botao5.Enabled := True;
            Botao6.Enabled := True;
            Navegador1.Enabled := True;
            Navegador2.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
          end;
      end;
    end;
end;

procedure Exclui_Cancela_P(PodeExcluir: String;
                           Arquivo_P, Arquivo_F: TTable; {Table utilizada pelo formulario}
                           Botao1, Botao2, Botao3, Botao4, Botao5, Botao6: TButton; {Botões do formulario}
                           SBotao1, SBotao2: TSpeedButton; {Speed Botões do formulario}
                           CampoFocus1, CampoFocus2: TDBEdit; {Campo do formulario que sera focado na inclusao}
                           CampoChave1, CampoChave2, CampoChave3: TDBEdit; {Campos chaves da table}
                           Navegador1, Navegador2: TDBNavigator); {Navegador do formulario}
var
  MyBookmark: TBookmark;
begin
  if Botao3.Caption = '&Cancela Novo' then
    begin
      try
        Arquivo_P.Cancel;
        MyBookmark := Arquivo_P.GetBookmark;
        Arquivo_P.Active := False;
        Arquivo_P.ReadOnly := True;
        Arquivo_P.Active := True;
        Arquivo_P.GotoBookmark(MyBookMark);
        Arquivo_P.FreeBookmark(MyBookMark);
        CampoChave1.ReadOnly := False;
        CampoChave2.ReadOnly := False;
        CampoChave3.ReadOnly := False;
        Botao1.Enabled := True;
        Botao1.Caption := '&Novo';
        Botao1.Font.Style := [];
        Botao2.Enabled := True;
        Botao2.Caption := '&Modifica';
        Botao3.Enabled := True;
        Botao3.Caption := '&Exclui';
        Botao3.Font.Style := [];
        Botao4.Enabled := True;
        Botao5.Enabled := True;
        Botao6.Enabled := True;
        Navegador1.Enabled := True;
        Navegador2.Enabled := True;
        SBotao1.Enabled := True;
        SBotao2.Enabled := True;
      except
        on E: Exception do
          begin
            MessageDlg('ERRO NA TENTATIVA DE CANCELAR A INCLUSÃO. MENSAGEM: ' +
                       E.Message, mtInformation, [mbOK], 0);
            MyBookmark := Arquivo_P.GetBookmark;
            Arquivo_P.Active := False;
            Arquivo_P.ReadOnly := True;
            Arquivo_P.Active := True;
            Arquivo_P.GotoBookmark(MyBookMark);
            Arquivo_P.FreeBookmark(MyBookMark);
            CampoChave1.ReadOnly := False;
            CampoChave2.ReadOnly := False;
            CampoChave3.ReadOnly := False;
            Botao1.Enabled := True;
            Botao1.Caption := '&Novo';
            Botao1.Font.Style := [];
            Botao2.Enabled := True;
            Botao3.Enabled := True;
            Botao3.Caption := '&Exclui';
            Botao3.Font.Style := [];
            Botao4.Enabled := True;
            Botao5.Enabled := True;
            Botao6.Enabled := True;
            Navegador1.Enabled := True;
            Navegador2.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
          end;
      end;
    end
  else
    begin
      if PodeExcluir <> 'S' then
        begin
          ShowMessage('Você não tem permissão para efetuar exclusões.');
          Exit;
        end;
      If MessageDlg('Deletar o registro?'+Chr(13)+
                    '(Inclusive os Relacionados)', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then
        begin
          try
            MyBookmark := Arquivo_P.GetBookmark;
            Arquivo_P.Active := False;
            Arquivo_P.ReadOnly := False;
            Arquivo_P.Active := True;
            Arquivo_P.GotoBookmark(MyBookmark);
            Arquivo_P.FreeBookmark(MyBookmark);
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := False;
            Arquivo_F.Active := True;
            Arquivo_F.First;
            While Arquivo_F.Eof = False do
              Arquivo_F.Delete;
            Arquivo_P.Delete;
            MyBookmark := Arquivo_P.GetBookmark;
            Arquivo_P.Active := False;
            Arquivo_P.ReadOnly := True;
            Arquivo_P.Active := True;
            Arquivo_P.GotoBookmark(MyBookmark);
            Arquivo_P.FreeBookmark(MyBookmark);
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := True;
            Arquivo_F.Active := True;
          except
            on E: Exception do
              begin
                MessageDlg('No momento este registro está bloqueado ' +
                           'por outro usuário. Sua exclusão não é ' +
                           'permitida. ', mtInformation, [mbOK], 0);
                MyBookmark := Arquivo_P.GetBookmark;
                Arquivo_P.Active := False;
                Arquivo_P.ReadOnly := True;
                Arquivo_P.Active := True;
                Arquivo_P.GotoBookmark(MyBookmark);
                Arquivo_P.FreeBookmark(MyBookmark);
                Arquivo_F.Active := False;
                Arquivo_F.ReadOnly := True;
                Arquivo_F.Active := True;
              end;
          end;
        end;
    end;
end;

procedure Novo_Grava_F(Arquivo_P, Arquivo_F: TTable;
                       Botao1, Botao2, Botao3, Botao4, Botao5, Botao6: TButton;
                       SBotao1, SBotao2: TSpeedButton;
                       CampoFocus: TDBEdit;
                       CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                       Navegador1, Navegador2: TDBNavigator);
begin
  If Botao4.Caption = '&Novo' then
    begin
      try
        Arquivo_F.Active := False;
        Arquivo_F.ReadOnly := False;
        Arquivo_F.Active := True;
        Arquivo_F.Append;
        Botao4.Enabled := True;
        Botao4.Caption := '&Grava/Novo';
        Botao4.Font.Style := [fsItalic];
        Botao5.Enabled := False;
        Botao6.Enabled := True;
        Botao6.Caption := '&Cancela Novo';
        Botao6.Font.Style := [fsItalic];
        Botao1.Enabled := False;
        Botao2.Enabled := False;
        Botao3.Enabled := False;
        Navegador1.Enabled := False;
        Navegador2.Enabled := False;
        SBotao1.Enabled := False;
        SBotao2.Enabled := False;
        CampoFocus.SetFocus;
      except
        on E: Exception do
          begin
            MessageDlg('ERRO NA TENTATIVA DE INCLUIR. MENSAGEM: ' +
                       E.Message, mtError, [mbOK], 0);
            Arquivo_P.Active := False;
            Arquivo_P.ReadOnly := True;
            Arquivo_P.Active := True;
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := True;
            Arquivo_F.Active := True;
            Botao1.Enabled := True;
            Botao1.Caption := '&Novo';
            Botao2.Enabled := True;
            Botao2.Caption := '&Modifica';
            Botao3.Enabled := True;
            Botao3.Caption := '&Exclui';
            Botao4.Enabled := True;
            Botao4.Caption := '&Novo';
            Botao4.Font.Style := [];
            Botao5.Enabled := True;
            Botao5.Caption := '&Modifica';
            Botao6.Enabled := True;
            Botao6.Caption := '&Exclui';
            Botao6.Font.Style := [];
            Navegador1.Enabled := True;
            Navegador2.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
            Arquivo_P.Last;
          end;
      end;
    end
  else
    begin
      try
        Arquivo_F.Post;
        Arquivo_F.Append;
        CampoFocus.SetFocus;
      except
        on E: Exception do
          begin
            if E.Message = 'Key violation' then
              begin
                MessageDlg('Este registro já existe no arquivo.',
                            mtInformation, [mbOK], 0);
                CampoFocus.SetFocus;
              end
            else
              begin
                MessageDlg('ERRO NA TENTATIVA DE GRAVAR/INCLUIR. MENSAGEM: ' +
                            E.Message, mtInformation, [mbOK], 0);
                Arquivo_P.Active := False;
                Arquivo_P.ReadOnly := True;
                Arquivo_P.Active := True;
                Arquivo_F.Active := False;
                Arquivo_F.ReadOnly := True;
                Arquivo_F.Active := True;
                Botao1.Enabled := True;
                Botao1.Caption := '&Novo';
                Botao2.Enabled := True;
                Botao2.Caption := '&Modifica';
                Botao3.Enabled := True;
                Botao3.Caption := '&Exclui';
                Botao4.Enabled := True;
                Botao4.Caption := '&Novo';
                Botao4.Font.Style := [];
                Botao5.Enabled := True;
                Botao5.Caption := '&Modifica';
                Botao6.Enabled := True;
                Botao6.Caption := '&Exclui';
                Botao6.Font.Style := [];
                Navegador1.Enabled := True;
                Navegador2.Enabled := True;
                SBotao1.Enabled := True;
                SBotao2.Enabled := True;
                Arquivo_P.Last;
              end;
          end;
      end;
    end;
end;

procedure Modifica_Grava_F(Arquivo_P, Arquivo_F: TTable;
                           Botao1, Botao2, Botao3, Botao4, Botao5, Botao6: TButton;
                           SBotao1, SBotao2: TSpeedButton;
                           CampoFocus: TDBEdit;
                           CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                           Navegador1, Navegador2: TDBNavigator);
var
  MyBookmark: TBookmark;
begin
  if Botao5.Caption = '&Modifica' then
    begin
      try
        MyBookmark := Arquivo_F.GetBookmark;
        Arquivo_F.Active := False;
        Arquivo_F.ReadOnly := False;
        Arquivo_F.Active := True;
        Arquivo_F.GotoBookmark(MyBookmark);
        Arquivo_F.FreeBookmark(MyBookmark);
        Arquivo_F.Edit;
        CampoChave1.ReadOnly := True;
        CampoChave2.ReadOnly := True;
        CampoChave3.ReadOnly := True;
        Botao4.Enabled := False;
        Botao5.Caption := '&Grava';
        Botao5.Font.Style := [fsItalic];
        Botao6.Enabled := False;
        Botao1.Enabled := False;
        Botao2.Enabled := False;
        Botao3.Enabled := False;
        Navegador1.Enabled := False;
        Navegador2.Enabled := False;
        SBotao1.Enabled := False;
        SBotao2.Enabled := False;
      except
        on E: Exception do
          begin
            MessageDlg('No momento este registro está bloqueado ' +
                       'por outro usuário. Sua modificação não é ' +
                       'permitida. ', mtInformation, [mbOK], 0);
            MyBookmark := Arquivo_F.GetBookmark;
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := True;
            Arquivo_F.Active := True;
            Arquivo_F.GotoBookmark(MyBookmark);
            Arquivo_F.FreeBookmark(MyBookmark);
            CampoChave1.ReadOnly := False;
            CampoChave2.ReadOnly := False;
            CampoChave3.ReadOnly := False;
            Botao4.Enabled := True;
            Botao5.Caption := '&Modifica';
            Botao5.Font.Style := [];
            Botao6.Enabled := True;
            Botao1.Enabled := True;
            Botao2.Enabled := True;
            Botao3.Enabled := True;
            Navegador1.Enabled := True;
            Navegador2.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
          end;
      end;
    end
  else
    begin
      try
        Arquivo_F.Post;
        MyBookmark := Arquivo_F.GetBookmark;
        Arquivo_F.Active := False;
        Arquivo_F.ReadOnly := True;
        Arquivo_F.Active := True;
        Arquivo_F.GotoBookmark(MyBookmark);
        Arquivo_F.FreeBookmark(MyBookmark);
        CampoChave1.ReadOnly := False;
        CampoChave2.ReadOnly := False;
        CampoChave3.ReadOnly := False;
        Botao4.Enabled := True;
        Botao5.Caption := '&Modifica';
        Botao5.Font.Style := [];
        Botao6.Enabled := True;
        Botao1.Enabled := True;
        Botao2.Enabled := True;
        Botao3.Enabled := True;
        Navegador1.Enabled := True;
        Navegador2.Enabled := True;
        SBotao1.Enabled := True;
        SBotao2.Enabled := True;
      except
        on E: Exception do
          begin
            MessageDlg('ERRO NA TENTATIVA DE GRAVAR ALTERAÇÃO. MENSAGEM: ' +
                       E.Message, mtInformation, [mbOK], 0);
            MyBookmark := Arquivo_F.GetBookmark;
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := True;
            Arquivo_F.Active := True;
            Arquivo_F.GotoBookmark(MyBookmark);
            Arquivo_F.FreeBookmark(MyBookmark);
            CampoChave1.ReadOnly := False;
            CampoChave2.ReadOnly := False;
            CampoChave3.ReadOnly := False;
            Botao4.Enabled := True;
            Botao5.Caption := '&Modifica';
            Botao5.Font.Style := [];
            Botao6.Enabled := True;
            Botao1.Enabled := True;
            Botao2.Enabled := True;
            Botao3.Enabled := True;
            Navegador1.Enabled := True;
            Navegador2.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
          end;
      end;
    end;
end;

procedure Exclui_Cancela_F(PodeExcluir: String;
                           Arquivo_P, Arquivo_F: TTable;
                           Botao1, Botao2, Botao3, Botao4, Botao5, Botao6: TButton;
                           SBotao1, SBotao2: TSpeedButton;
                           CampoFocus: TDBEdit;
                           CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                           Navegador1, Navegador2: TDBNavigator);
var
  MyBookmark: TBookmark;
begin
  if Botao6.Caption = '&Cancela Novo' then
    begin
      try
        Arquivo_F.Cancel;
        MyBookmark := Arquivo_F.GetBookmark;
        Arquivo_F.Active := False;
        Arquivo_F.ReadOnly := True;
        Arquivo_F.Active := True;
        Arquivo_F.GotoBookmark(MyBookMark);
        Arquivo_F.FreeBookmark(MyBookMark);
        CampoChave1.ReadOnly := False;
        CampoChave2.ReadOnly := False;
        CampoChave3.ReadOnly := False;
        If Botao6.Caption = '&Cancela Novo' then
          begin
            Botao1.Enabled := True;
            Botao1.SetFocus;
          end;
        Botao4.Enabled := True;
        Botao4.Caption := '&Novo';
        Botao4.Font.Style := [];
        Botao5.Enabled := True;
        Botao5.Caption := '&Modifica';
        Botao6.Enabled := True;
        Botao6.Caption := '&Exclui';
        Botao6.Font.Style := [];
        Botao2.Enabled := True;
        Botao3.Enabled := True;
        Navegador1.Enabled := True;
        Navegador2.Enabled := True;
        SBotao1.Enabled := True;
        SBotao2.Enabled := True;
      except
        on E: Exception do
          begin
            MessageDlg('ERRO NA TENTATIVA DE CANCELAR A INCLUSÃO. MENSAGEM: ' +
                       E.Message, mtInformation, [mbOK], 0);
            MyBookmark := Arquivo_F.GetBookmark;
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := True;
            Arquivo_F.Active := True;
            Arquivo_F.GotoBookmark(MyBookMark);
            Arquivo_F.FreeBookmark(MyBookMark);
            CampoChave1.ReadOnly := False;
            CampoChave2.ReadOnly := False;
            CampoChave3.ReadOnly := False;
            If Botao6.Caption = '&Cancela Novo' then
              begin
                Botao1.Enabled := True;
                Botao1.SetFocus;
              end;
            Botao4.Enabled := True;
            Botao4.Caption := '&Novo';
            Botao4.Font.Style := [];
            Botao5.Enabled := True;
            Botao6.Enabled := True;
            Botao6.Caption := '&Exclui';
            Botao6.Font.Style := [];
            Botao2.Enabled := True;
            Botao3.Enabled := True;
            Navegador1.Enabled := True;
            Navegador2.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
          end;
      end;
    end
  else
    begin
      if PodeExcluir <> 'S' then
        begin
          ShowMessage('Você não tem permissão para efetuar exclusões.');
          Exit;
        end;
      If MessageDlg('Deletar o registro?', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then
        begin
          try
            MyBookmark := Arquivo_F.GetBookmark;
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := False;
            Arquivo_F.Active := True;
            Arquivo_F.GotoBookmark(MyBookmark);
            Arquivo_F.FreeBookmark(MyBookmark);
            Arquivo_F.Delete;
            MyBookmark := Arquivo_F.GetBookmark;
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := True;
            Arquivo_F.Active := True;
            Arquivo_F.GotoBookmark(MyBookmark);
            Arquivo_F.FreeBookmark(MyBookmark);
          except
            on E: Exception do
              begin
                MessageDlg('No momento este registro está bloqueado ' +
                           'por outro usuário. Sua exclusão não é ' +
                           'permitida. ', mtInformation, [mbOK], 0);
                MyBookmark := Arquivo_F.GetBookmark;
                Arquivo_F.Active := False;
                Arquivo_F.ReadOnly := True;
                Arquivo_F.Active := True;
                Arquivo_F.GotoBookmark(MyBookmark);
                Arquivo_F.FreeBookmark(MyBookmark);
              end;
          end;
        end;
    end;
end;

procedure Novo_Grava_FS(Arquivo_F: TTable;
                        Botao1, Botao2, Botao3: TButton;
                        SBotao1, SBotao2: TSpeedButton;
                        CampoFocus: TDBEdit;
                        CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                        Navegador1, Navegador2: TDBNavigator);
begin
  If Botao1.Caption = '&Novo' then
    begin
      try
        Arquivo_F.Active := False;
        Arquivo_F.ReadOnly := False;
        Arquivo_F.Active := True;
        Arquivo_F.Append;
        Botao1.Enabled := True;
        Botao1.Caption := '&Grava/Novo';
        Botao1.Font.Style := [fsItalic];
        Botao2.Enabled := False;
        Botao3.Enabled := True;
        Botao3.Caption := '&Cancela Novo';
        Botao3.Font.Style := [fsItalic];
        Navegador1.Enabled := False;
        Navegador2.Enabled := False;
        SBotao1.Enabled := False;
        SBotao2.Enabled := False;
        CampoFocus.SetFocus;
      except
        on E: Exception do
          begin
            MessageDlg('ERRO NA TENTATIVA DE INCLUIR. MENSAGEM: ' +
                       E.Message, mtError, [mbOK], 0);
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := True;
            Arquivo_F.Active := True;
            Botao1.Enabled := True;
            Botao1.Caption := '&Novo';
            Botao1.Font.Style := [];
            Botao2.Enabled := True;
            Botao2.Caption := '&Modifica';
            Botao3.Enabled := True;
            Botao3.Caption := '&Exclui';
            Botao3.Font.Style := [];
            Navegador1.Enabled := True;
            Navegador2.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
            Arquivo_F.Last;
          end;
      end;
    end
  else
    begin
      try
        Arquivo_F.Post;
        Arquivo_F.Append;
        CampoFocus.SetFocus;
      except
        on E: Exception do
          begin
            if E.Message = 'Key violation' then
              begin
                MessageDlg('Este registro já existe no arquivo.',
                            mtInformation, [mbOK], 0);
                CampoFocus.SetFocus;
              end
            else
              begin
                MessageDlg('ERRO NA TENTATIVA DE GRAVAR/INCLUIR. MENSAGEM: ' +
                            E.Message, mtInformation, [mbOK], 0);
                Arquivo_F.Active := False;
                Arquivo_F.ReadOnly := True;
                Arquivo_F.Active := True;
                Botao1.Enabled := True;
                Botao1.Caption := '&Novo';
                Botao1.Font.Style := [];
                Botao2.Enabled := True;
                Botao2.Caption := '&Modifica';
                Botao3.Enabled := True;
                Botao3.Caption := '&Exclui';
                Botao3.Font.Style := [];
                Navegador1.Enabled := True;
                Navegador2.Enabled := True;
                SBotao1.Enabled := True;
                SBotao2.Enabled := True;
                Arquivo_F.Last;
              end;
          end;
      end;
    end;
end;

procedure Modifica_Grava_FS(Arquivo_F: TTable;
                            Botao1, Botao2, Botao3: TButton;
                            SBotao1, SBotao2: TSpeedButton;
                            CampoFocus: TDBEdit;
                            CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                            Navegador1, Navegador2: TDBNavigator);
var
  MyBookmark: TBookmark;
begin
  if Botao2.Caption = '&Modifica' then
    begin
      try
        MyBookmark := Arquivo_F.GetBookmark;
        Arquivo_F.Active := False;
        Arquivo_F.ReadOnly := False;
        Arquivo_F.Active := True;
        Arquivo_F.GotoBookmark(MyBookmark);
        Arquivo_F.FreeBookmark(MyBookmark);
        Arquivo_F.Edit;
        CampoChave1.ReadOnly := True;
        CampoChave2.ReadOnly := True;
        CampoChave3.ReadOnly := True;
        Botao1.Enabled := False;
        Botao2.Caption := '&Grava';
        Botao2.Font.Style := [fsItalic];
        Botao3.Enabled := False;
        Navegador1.Enabled := False;
        Navegador2.Enabled := False;
        SBotao1.Enabled := False;
        SBotao2.Enabled := False;
      except
        on E: Exception do
          begin
            MessageDlg('No momento este registro está bloqueado ' +
                       'por outro usuário. Sua modificação não é ' +
                       'permitida. ', mtInformation, [mbOK], 0);
            MyBookmark := Arquivo_F.GetBookmark;
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := True;
            Arquivo_F.Active := True;
            Arquivo_F.GotoBookmark(MyBookmark);
            Arquivo_F.FreeBookmark(MyBookmark);
            CampoChave1.ReadOnly := False;
            CampoChave2.ReadOnly := False;
            CampoChave3.ReadOnly := False;
            Botao1.Enabled := True;
            Botao2.Caption := '&Modifica';
            Botao2.Font.Style := [];
            Botao3.Enabled := True;
            Navegador1.Enabled := True;
            Navegador2.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
          end;
      end;
    end
  else
    begin
      try
        Arquivo_F.Post;
        MyBookmark := Arquivo_F.GetBookmark;
        Arquivo_F.Active := False;
        Arquivo_F.ReadOnly := True;
        Arquivo_F.Active := True;
        Arquivo_F.GotoBookmark(MyBookmark);
        Arquivo_F.FreeBookmark(MyBookmark);
        CampoChave1.ReadOnly := False;
        CampoChave2.ReadOnly := False;
        CampoChave3.ReadOnly := False;
        Botao1.Enabled := True;
        Botao2.Caption := '&Modifica';
        Botao2.Font.Style := [];
        Botao3.Enabled := True;
        Navegador1.Enabled := True;
        Navegador2.Enabled := True;
        SBotao1.Enabled := True;
        SBotao2.Enabled := True;
      except
        on E: Exception do
          begin
            MessageDlg('ERRO NA TENTATIVA DE GRAVAR ALTERAÇÃO. MENSAGEM: ' +
                       E.Message, mtInformation, [mbOK], 0);
            MyBookmark := Arquivo_F.GetBookmark;
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := True;
            Arquivo_F.Active := True;
            Arquivo_F.GotoBookmark(MyBookmark);
            Arquivo_F.FreeBookmark(MyBookmark);
            CampoChave1.ReadOnly := False;
            CampoChave2.ReadOnly := False;
            CampoChave3.ReadOnly := False;
            Botao1.Enabled := True;
            Botao2.Caption := '&Modifica';
            Botao2.Font.Style := [];
            Botao3.Enabled := True;
            Navegador1.Enabled := True;
            Navegador2.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
          end;
      end;
    end;
end;

procedure Exclui_Cancela_FS(PodeExcluir: String;
                            Arquivo_F: TTable;
                            Botao1, Botao2, Botao3: TButton;
                            SBotao1, SBotao2: TSpeedButton;
                            CampoFocus: TDBEdit;
                            CampoChave1, CampoChave2, CampoChave3: TDBEdit;
                            Navegador1, Navegador2: TDBNavigator);
var
  MyBookmark: TBookmark;
begin
  if Botao3.Caption = '&Cancela Novo' then
    begin
      try
        Arquivo_F.Cancel;
        MyBookmark := Arquivo_F.GetBookmark;
        Arquivo_F.Active := False;
        Arquivo_F.ReadOnly := True;
        Arquivo_F.Active := True;
        Arquivo_F.GotoBookmark(MyBookMark);
        Arquivo_F.FreeBookmark(MyBookMark);
        CampoChave1.ReadOnly := False;
        CampoChave2.ReadOnly := False;
        CampoChave3.ReadOnly := False;
        Botao1.Enabled := True;
        Botao1.Caption := '&Novo';
        Botao1.Font.Style := [];
        Botao2.Enabled := True;
        Botao2.Caption := '&Modifica';
        Botao3.Enabled := True;
        Botao3.Caption := '&Exclui';
        Botao3.Font.Style := [];
        Navegador1.Enabled := True;
        Navegador2.Enabled := True;
        SBotao1.Enabled := True;
        SBotao2.Enabled := True;
      except
        on E: Exception do
          begin
            MessageDlg('ERRO NA TENTATIVA DE CANCELAR A INCLUSÃO. MENSAGEM: ' +
                       E.Message, mtInformation, [mbOK], 0);
            MyBookmark := Arquivo_F.GetBookmark;
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := True;
            Arquivo_F.Active := True;
            Arquivo_F.GotoBookmark(MyBookMark);
            Arquivo_F.FreeBookmark(MyBookMark);
            CampoChave1.ReadOnly := False;
            CampoChave2.ReadOnly := False;
            CampoChave3.ReadOnly := False;
            Botao1.Enabled := True;
            Botao1.Caption := '&Novo';
            Botao1.Font.Style := [];
            Botao2.Enabled := True;
            Botao3.Enabled := True;
            Botao3.Caption := '&Exclui';
            Botao3.Font.Style := [];
            Navegador1.Enabled := True;
            Navegador2.Enabled := True;
            SBotao1.Enabled := True;
            SBotao2.Enabled := True;
          end;
      end;
    end
  else
    begin
      if PodeExcluir <> 'S' then
        begin
          ShowMessage('Você não tem permissão para efetuar exclusões.');
          Exit;
        end;
      If MessageDlg('Deletar o registro?', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then
        begin
          try
            MyBookmark := Arquivo_F.GetBookmark;
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := False;
            Arquivo_F.Active := True;
            Arquivo_F.GotoBookmark(MyBookmark);
            Arquivo_F.FreeBookmark(MyBookmark);
            Arquivo_F.Delete;
            MyBookmark := Arquivo_F.GetBookmark;
            Arquivo_F.Active := False;
            Arquivo_F.ReadOnly := True;
            Arquivo_F.Active := True;
            Arquivo_F.GotoBookmark(MyBookmark);
            Arquivo_F.FreeBookmark(MyBookmark);
          except
            on E: Exception do
              begin
                MessageDlg('No momento este registro está bloqueado ' +
                           'por outro usuário. Sua exclusão não é ' +
                           'permitida. ', mtInformation, [mbOK], 0);
                MyBookmark := Arquivo_F.GetBookmark;
                Arquivo_F.Active := False;
                Arquivo_F.ReadOnly := True;
                Arquivo_F.Active := True;
                Arquivo_F.GotoBookmark(MyBookmark);
                Arquivo_F.FreeBookmark(MyBookmark);
              end;
          end;
        end;
    end;
end;

function ValiData(Teste_Data, Base_Data, Teto_Data: TDateTime): Boolean;
begin
  try
    if (Teste_Data < Base_Data) or (Teste_Data > Teto_Data) then
      ValiData := False
    else
      ValiData := True;
  except
    on E: Exception do
      ValiData := False;
  end;
end;

function RoundTo(ValorBase: Double; Casas:Integer): Double;
var
  ValorST: String;
begin
  if Casas = 1 then
    ValorST := FormatFloat('##############0.0',ValorBase);
  if Casas = 2 then
    ValorST := FormatFloat('##############0.00',ValorBase);
  if Casas = 3 then
    ValorST := FormatFloat('##############0.000',ValorBase);
  if Casas = 4 then
    ValorST := FormatFloat('##############0.0000',ValorBase);
  if (Casas < 1) or (Casas > 4) then
    RoundTo := ValorBase
  else
    RoundTo := StrToFloat(ValorST);
end;

//Função para fazer truncamento de um valor com determinada casas decimais;
function TruncDec(Valor : Double; Casas : Integer) : Double;
var
  I, PosVir : Integer;
begin
  PosVir := 0;
//Encontrar Virgula;
  for I := 1 to Length(FloatToStr(Valor)) do
    if Copy(FloatToStr(Valor),I,1) = ',' then
      PosVir := I;
  if PosVir = 0 then
    TruncDec := Valor
  else                    (*Antes da virgula                          /* Depois da virgula com qtde casas*)
    TruncDec := StrToFloat(Copy(FloatToStr(Valor),1,PosVir -1) + ','+ Copy(FloatToStr(Valor),PosVir + 1,Casas));
end;

//Função para pegar um valor double e passa para string substituindo a virgula pelo ponto
function VirgulaToPonto(Valor : Double) : String;
var
  ValorTexto : String;
begin
  try
    ValorTexto := FormatFloat('########0.000', Valor);
    VirgulaToPonto := Copy(ValorTexto,1,Length(ValorTexto) - 4) + '.' + Copy(ValorTexto, Length(ValorTexto) - 2, 3);
  except
    begin
      ShowMessage('Valor Inválido.');
      VirgulaToPonto := '';
    end;
  end;
end;

{ chInt - Converte um caracter numérico para o valor inteiro correspondente. }

function chInt ( ch: Char ): ShortInt;
  begin
    Result := Ord ( ch ) - Ord ( '0' );
  end;

{ intCh = Converte um valor inteiro (de 0 a 9) para o caracter numérico
  correspondente. }

function intCh ( int: ShortInt ): Char;
  begin
    Result := Chr ( int + Ord ( '0' ) );
  end;

{ DvModulo11 - Retorna 1 dv calculado pelo método do modulo 11 padrão. }

function DvModulo11 ( str: String ): Char;
  var soma, fator, i: Integer;
  begin
    soma := 0;
    fator := 2;
    for i := Length ( str ) downto 1 do
      begin
        soma := soma + chInt ( str[i] ) * fator;
        Inc ( fator );
        if fator = 10 then
            fator := 2;
      end;
    soma := 11 - ( soma mod 11 );
    if soma >= 10 then
        Result := '0'
    else
        Result := intCh ( soma );
  end;

{ dvModulo11ParaCPF - Retorna 1 dv calculado pelo método do modulo 11
  ligeiramente alterado para o CPF. }

function dvModulo11ParaCPF ( str: String ): Char;
  var soma, fator, i: Integer;
  begin
    soma := 0;
    fator := 2;
    for i := Length ( str ) downto 1 do
      begin
        soma := soma + chInt ( str[i] ) * fator;
        Inc ( fator );
      end;
    soma := 11 - ( soma mod 11 );
    if soma >= 10 then
        Result := '0'
    else
        Result := intCh ( soma );
  end;

{ DvModulo10 - Retorna 1 dv calculado pelo método do modulo 10 padrão. }

function DvModulo10 ( str: String ): Char;
  var soma, fator, i: Integer;
  begin
    soma := 0;
    fator := 2;
    for i := Length ( str ) downto 1 do
      begin
        soma := soma + chInt ( str[i] ) * fator;
        Dec ( fator );
        if fator = 0 then
            fator := 2;
      end;
    soma := 10 - ( soma div 11 );
    if soma >= 10 then
        Result := '0'
    else
        Result := intCh ( soma );
  end;

{ DvCGC - Retorna os dois dvs de um CGC, dado o CGC sem os dvs em forma de
  string (12 caracteres numéricos). }

function DvCGC ( str: String ): String;
  var dv1: Char;
  begin
    dv1 := DvModulo11 ( str );
    Result := dv1 + DvModulo11 ( str + dv1 );
  end;

{ DvCPF - Retorna os dois dvs de um CPF, dado o CPF sem os dvs em forma de
  string (9 caracteres numéricos). }

function DvCPF ( str: String ): String;
  var dv1: Char;
  begin
    dv1 := dvModulo11ParaCPF ( str );
    Result := dv1 + dvModulo11ParaCPF ( str + dv1 );
  end;

{ ValidaCGC - Retorna true se o CGC dado é valido. O CGC deve ser um string
  de 14 caracteres numéricos. }

function ValidaCGC ( str: String ): Boolean;
  begin
    Result := Copy ( str, 13, 2 ) = DvCGC ( Copy ( str, 1, 12 ) );
  end;

{ ValidaCPF - Retorna true se o CPF dado é valido. O CPF deve ser um string
  de 11 caracteres numéricos. }

function ValidaCPF ( str: String ): Boolean;
  begin
    Result := Copy ( str, 10, 2 ) = DvCPF ( Copy ( str, 1, 9 ) );
  end;

end.

