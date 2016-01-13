unit pMetaPhone;

interface

uses
  StrUtils, SysUtils, RegularExpressions;

type
  TMetaPhone = class
  protected
    class function fprRetirarJuncao(ipTexto: string): string; virtual;
    class function fprRetirarDuplicadas(ipTexto: string): string; virtual;
    class function fprIgnorarVogaisLetras(ipTexto: string): string; virtual;
  public
    class function fpuExtrairAcentos(ipTexto: string): string; virtual;
    class function fpuCompararNome(ipNome, ipNome2: string): Boolean; virtual;
    class function fpuNomeFonetico(ipNome: string): string; overload; virtual;
    class function fpuNomeFonetico(ipNome: string; ipConsiderarCoringa: Boolean): string; overload; virtual;
  end;

implementation


{ TMethaPone }

uses pMethod2009;

class function TMetaPhone.fprIgnorarVogaisLetras(ipTexto: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(ipTexto) do
    begin
      // TODO: Futuramente procurar uma maneira mais eficiente de fazer isso, pois atualmente deixamos apenas o basico
      // nao deixamos a busca muito boa, mas evitando alguns problemas
      case ipTexto[i] of
        // so nao ignoro as letras caso seja a primeira letra da palavra ou seja A ou O
// 'A', 'E', 'I', 'O', 'U':
// if (i = 1) or (ipTexto[i - 1] = ' ') or (ipTexto[i] = 'A') or (ipTexto[i] = 'O') then
// Result := Result + ipTexto[i];

        'A', 'E', 'I', 'O', 'U', 'B', 'D', 'F', 'J', 'L', 'M', 'R', 'T', 'V':
          Result := Result + ipTexto[i];

// 'C': { CH = X, C[A,E,I,O]= K, C[E,I,Y]= s }
// if not((ipTexto[i - 1] = 'S') and (ipTexto[i + 1] in ['E', 'I'])) then//se nao for s antes e vogal depois ex.: ascenio
// begin
// if (ipTexto[i + 1] = 'H') and (ipTexto[i + 2] in ['A', 'E', 'I', 'O', 'U']) then
// Result := Result + 'X'
// else if (ipTexto[i + 1] in ['A', 'O', 'U']) or (ipTexto[i + 1] = 'K') or (ipTexto[i + 1] = 'Q') then { Carol = Karol }
// Result := Result + 'K'
// else if ipTexto[i + 1] in ['E', 'I', 'Y'] then { Celina = Selina, Cintia = Sintia }
// Result := Result + 'S'
// else
// Result :=  Result + 'C';
// end;

        '�':
          Result := Result + 'S';

// 'G': { Jeferson = Geferson }
// if (ipTexto[i + 1] = 'E') or (ipTexto[i + 1] = 'I') OR (ipTexto[i + 1] = 'Y') then
// Result := Result + 'J'
// else
// Result := Result + 'G';

// 'N': // N no final vira M
// if (i = Length(ipTexto)) or (ipTexto[i + 1] = ' ') then
// Result := Result + 'M'
// else
// Result := Result + 'N';

// 'P': { Phelipe = Felipe PH=F}
// if ipTexto[i + 1] = 'H' then
// Result := Result + 'F'
// else
// Result := Result + 'P';

        'K':
          if ipTexto[i - 1] <> 'C' then // K so aparece se nao for precedido de C
            Result := Result + 'K';

// 'Q': { Keila = Queila }
// if ipTexto[i - 1] <> 'C' then // Q so aparece se nao for precedido de C
// begin
// if ipTexto[i + 1] = 'U' then
// Result := Result + 'K'
// else
// Result := Result + 'Q';
// end;
// 'S':
// case ipTexto[i + 1] of
// 'H': { SH = X }
// Result := Result + 'X';
// 'A', 'E', 'I', 'O', 'U':
// if ipTexto[i - 1] in ['A', 'E', 'I', 'O', 'U'] then
// { S entre duas vogais = Z }
// Result := Result + 'Z'
// else
// Result := Result + 'S';
// 'C':
// if ipTexto[i + 2] in ['E', 'I'] then // ascenio
// Result := Result + 'S';
//
// else
// if ipTexto[i - 1] = ' ' then // se haver espaco antes do S nao desconsidero
// Result := Result + 'S';
//
// end;
        'W': { Walter = Valter }
          Result := Result + 'V';
// 'X':
// if (ipTexto[i - 1] = 'E') and not(ipTexto[i + 1] in ['A', 'E', 'I', 'O', 'U']  ) then // extenio
// Result := Result + 'S'
// else
// Result := Result + 'X';
        { no final do nome tem som de S ->
          Luiz = Luis }
// 'Z':
// if (i = Length(ipTexto)) or (ipTexto[i + 1] = ' ') then
// Result := Result + 'S'
// else
// Result := Result + 'Z';
        'Z':
          if (i > 1) and (ipTexto[i - 1] <> ' ') then
            Result := Result + 'S'
          else
            Result := Result + 'Z';
      else
        if ipTexto[i] <> ' ' then
          Result := Result + ipTexto[i];
      end;
    end;
end;

class function TMetaPhone.fprRetirarDuplicadas(ipTexto: string): string;
var
  i: Integer;
begin
  for i := 1 to Length(ipTexto) - 1 do
    if ipTexto[i] <> SoNumeros(ipTexto[i]) then // nao queremos fazer isso para numeros
      if ipTexto[i] = ipTexto[i + 1] then
        Delete(ipTexto, i, 1);

  Result := ipTexto;
end;

class function TMetaPhone.fprRetirarJuncao(ipTexto: string): string;
var
  i: Integer;
begin
  // procura por palavras q tenham um espaco seguido de DA,DE,DI,DO,DU ou DAS,DES, etc Seguido de espaco
  Result := TRegEx.Replace(ipTexto, '\s((D[A-U]S?)|(E))\s', ' ', [roIgnoreCase]);

  // substitui tudo o que nao for letra ou numero por espaco
  for i := 1 to Length(Result) do
    begin
      if not(CharInSet(Result[i], ['0' .. '9', 'a' .. 'z', 'A' .. 'Z'])) then
        Result[i] := ' ';
    end;
end;

class function TMetaPhone.fpuCompararNome(ipNome, ipNome2: string): Boolean;
begin
  try
    ipNome := UpperCase(ipNome);
    ipNome2 := UpperCase(ipNome2);
    { Tira acentos e cedilha }
    ipNome := fpuExtrairAcentos(ipNome);
    { Retira E, DA, DAS, DE, DI, DO e DOS do nome
      Jos� da Silva = Jos� Silva
      Jo�o Costa e Silva = Jo�o Costa Silva }
    ipNome := fprRetirarJuncao(ipNome);
    { Retira letras duplicadas
      Elizabette = Elizabete }
    ipNome := fprRetirarDuplicadas(ipNome);
    ipNome := fprIgnorarVogaisLetras(ipNome);

    ipNome2 := UpperCase(ipNome2);
    { Tira acentos e cedilha }
    ipNome2 := fpuExtrairAcentos(ipNome2);
    { Retira E, DA, DAS, DE, DI, DO e DOS do nome
      Jos� da Silva = Jos� Silva
      Jo�o Costa e Silva = Jo�o Costa Silva }
    ipNome2 := fprRetirarJuncao(ipNome2);
    { Retira letras duplicadas
      Elizabette = Elizabete }
    ipNome2 := fprRetirarDuplicadas(ipNome2);
    ipNome2 := fprIgnorarVogaisLetras(ipNome2);

    Result := ipNome = ipNome2;
  except
    on E: Exception do
      raise Exception.Create('Erro ao realizar a compara��o fon�tica das palavras.' + sLineBreak + 'Detalhes: ' + E.Message);
  end;

end;

class function TMetaPhone.fpuNomeFonetico(ipNome: string;
  ipConsiderarCoringa: Boolean): string;
var
  vaNome: string;
begin
  if ipNome = '' then
    Begin
      Result := '';
      Exit;
    End;
  if ipConsiderarCoringa then
    begin
      vaNome := ipNome;
      // retiro os coringas
      vaNome := StringReplace(vaNome, '%', '', [rfReplaceAll]);
      // gero codigo fonetico
      vaNome := TMetaPhone.fpuNomeFonetico(vaNome);
      // verifico se tinha os coringas e add novamente
      if ipNome[1] = '%' then
        vaNome := '%' + vaNome;

      if ipNome[Length(ipNome)] = '%' then
        vaNome := vaNome + '%';

      Result := vaNome;
    end
  else
    Result := fpuNomeFonetico(ipNome);
end;

class function TMetaPhone.fpuNomeFonetico(ipNome: string): string;
begin
  if ipNome = '' then
    Begin
      Result := '';
      Exit;
    End;
  try
    ipNome := UpperCase(ipNome);
    { Tira acentos e cedilha }
    ipNome := fpuExtrairAcentos(ipNome);
    { Retira E, DA, DAS, DE, DI, DO e DOS do nome
      Jos� da Silva = Jos� Silva
      Jo�o Costa e Silva = Jo�o Costa Silva }
    ipNome := fprRetirarJuncao(ipNome);
    { Retira letras duplicadas
      Elizabette = Elizabete }
    ipNome := fprRetirarDuplicadas(ipNome);
    ipNome := fprIgnorarVogaisLetras(ipNome);

    Result := ipNome;
  except
    on E: Exception do
      raise Exception.Create('Erro ao criar o nome fon�tico.' + sLineBreak + 'Detalhes: ' + E.Message);
  end;
end;

class function TMetaPhone.fpuExtrairAcentos(ipTexto: string): string;
var
  i: Integer;
begin
  for i := 1 to Length(ipTexto) do
    begin
      case ipTexto[i] of
        '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�':
          ipTexto[i] := 'A';
        '�', '�', '�', '�', '�', '�', '�', '�':
          ipTexto[i] := 'E';
        '�', '�', '�', '�', '�', '�', '�', '�':
          ipTexto[i] := 'I';
        '�', '�', '�', '�', '�', '�', '�', '�', '�', '�':
          ipTexto[i] := 'O';
        '�', '�', '�', '�', '�', '�', '�', '�':
          ipTexto[i] := 'U';
        '�', '�':
          ipTexto[i] := 'C';
        '�', '�':
          ipTexto[i] := 'N';
        '�', '�', 'Y', '�', '�', 'y':
          ipTexto[i] := 'I';
      else
        if Ord(ipTexto[i]) > 127 then
          ipTexto[i] := #32;
      end;
    end;

  Result := ipTexto;
end;

end.
