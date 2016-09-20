unit uUtils;

interface

uses
  System.SysUtils, Vcl.Dialogs, cxPC, Vcl.Forms, Vcl.Controls,
  Datasnap.DBClient, IdHashSHA, System.RegularExpressions,
  System.Types, Winapi.Windows, uTypes, System.Classes, Data.DB,
  System.Generics.Collections, cxCheckComboBox, System.Variants, System.Math,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.DateUtils;

type
  TUtils = class
  public
    class procedure ppuAbrirFormAba<T: TForm>(ipPageControl: TcxPageControl; ipClassForm: TFormClass; var opForm: T;
      ipCriarSeNecessario: Boolean = true);
    class procedure ppuPercorrerCds(ipCDS: TClientDataSet; ipProc: TProc; ipManterPosicao: Boolean = true;
      ipOtimizarLoop: Boolean = true); overload;
    class procedure ppuPercorrerCds(ipCDS: TClientDataSet; ipFunc: TFunc<Boolean>; ipManterPosicao: Boolean = true;
      ipOtimizarLoop: Boolean = true); overload;
    class function fpuCriptografarSha1(ipValor: String): String;
    class function fpuValidarEmail(ipEmail: String): Boolean;
    class function fpuFocar(ipEdit: TWinControl): Boolean;
    class function fpuVersaoExecutavel(ipArquivo: String; ipVersaoAte: TVersaoInfo): string;
    class procedure ppuCopyStreamToByteStream(ipOrigem: TStream; var ipDestino: TBytesStream);
    class function fpuMontarStringCodigo(ipDataSet: TDataSet; ipNomeField, ipDelimitador: String): String; overload;
    class function fpuMontarStringCodigo(ipDataSet: TDataSet; ipNomeField, ipDelimitador: String; ipQtde: Integer)
      : String; overload;
    class function fpuMontarStringCodigo(ipDataSet: TDataSet; ipNomeField, ipDelimitador: String;
      ipIgnorarDuplicados: Boolean): String; overload;
    class function fpuMontarStringCodigo(ipDataSet: TDataSet; ipNomeField, ipDelimitador: String; ipQtde: Integer;
      ipIgnorarDuplicados: Boolean): String; overload;
    class function fpuMontarStringCodigo(ipCods: Array of Integer; ipDelimitador: String): String; overload;
    class function fpuExtrairData(ipDateString: string; ipPosicao: Integer): TDateTime;

    class function fpuConverterStringToArrayInteger(ipValor: string; ipDelimitador: string = ';'): TArray<Integer>;

    class procedure ppuExtrairValorOperadorParametro(ipInput: string; var opValor: string; var opOperador: string; ipDelimitador: String);
    class procedure ppuExtrairValorParametro(ipInput: string; var opValor: string; ipDelimitador: String);
    class function fpuExtrairValoresCheckComboBox(ipCheckBox: TcxCheckComboBox): string;
    class function fpuExtrairNumeros(ipValor: string): string;

    class function fpuValidarCpfCnpj(ipCpfCnpj: string): Boolean;
    class function fpuValidarCpf(ipCpf: string): Boolean;
    class function fpuValidarCnpj(ipCnpj: string): Boolean;

    class function fpuTruncTo(ipValor: Double; ipCasasDecimais: Integer): Double;

    class function fpuEncapsularPanelForm(ipCaption: string; ipPanel: TPanel): TForm;

    class function fpuMontarDataBetween(ipDataInicial, ipDataFinal: TDateTime): String;

    class function fpuCalcularDepreciacao(ipDataAquisicao: TDateTime; ipValorInicial: Double; ipTaxaDepreciacaoAnual: Integer): Double;

    class function fpuGetValorPorExtenso(ipValor: Real): string;
  end;

const
  coRegexCPF = '\d{3}\.\d{3}\.\d{3}-\d{2}';
  coRegexCNPJ = '\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}';
  coQuebraLinhaHtml = '<br/><br/>';

implementation

{ TUtils }

class function TUtils.fpuGetValorPorExtenso(ipValor: Real): string;
const
  unidade: array [1 .. 19] of string = ('um', 'dois', 'três', 'quatro', 'cinco',
    'seis', 'sete', 'oito', 'nove', 'dez', 'onze',
    'doze', 'treze', 'quatorze', 'quinze', 'dezesseis',
    'dezessete', 'dezoito', 'dezenove');
  centena: array [1 .. 9] of string = ('cento', 'duzentos', 'trezentos',
    'quatrocentos', 'quinhentos', 'seiscentos',
    'setecentos', 'oitocentos', 'novecentos');
  dezena: array [2 .. 9] of string = ('vinte', 'trinta', 'quarenta', 'cinquenta',
    'sessenta', 'setenta', 'oitenta', 'noventa');
  qualificaS: array [0 .. 4] of string = ('', 'mil', 'milhão', 'bilhão', 'trilhão');
  qualificaP: array [0 .. 4] of string = ('', 'mil', 'milhões', 'bilhões', 'trilhões');
var
  inteiro: Int64;
  resto: real;
  vlrS, s, saux, vlrP, centavos: string;
  n, unid, dez, cent, tam, i: Integer;
  umReal, tem: Boolean;
begin
  if (ipValor = 0)
  then
    begin
      Result := 'Zero';
      exit;
    end;

  inteiro := trunc(ipValor); // parte inteira do valor
  resto := ipValor - inteiro; // parte fracionária do valor
  vlrS := inttostr(inteiro);
  if (length(vlrS) > 15)
  then
    begin
      Result := 'Erro: valor superior a 999 trilhões.';
      exit;
    end;

  s := '';
  centavos := inttostr(round(resto * 100));

  // definindo o extenso da parte inteira do valor
  i := 0;
  umReal := false;
  tem := false;
  while (vlrS <> '0') do
    begin
      tam := length(vlrS);
      // retira do valor a 1a. parte, 2a. parte, por exemplo, para 123456789:
      // 1a. parte = 789 (centena)
      // 2a. parte = 456 (mil)
      // 3a. parte = 123 (milhões)
      if (tam > 3)
      then
        begin
          vlrP := copy(vlrS, tam - 2, tam);
          vlrS := copy(vlrS, 1, tam - 3);
        end
      else
        begin // última parte do valor
          vlrP := vlrS;
          vlrS := '0';
        end;
      if (vlrP <> '000')
      then
        begin
          saux := '';
          if (vlrP = '100')
          then
            saux := 'cem'
          else
            begin
              n := strtoint(vlrP); // para n = 371, tem-se:
              cent := n div 100; // cent = 3 (centena trezentos)
              dez := (n mod 100) div 10; // dez  = 7 (dezena setenta)
              unid := (n mod 100) mod 10; // unid = 1 (unidade um)
              if (cent <> 0)
              then
                saux := centena[cent];
              if ((dez <> 0) or (unid <> 0))
              then
                begin
                  if ((n mod 100) <= 19)
                  then
                    begin
                      if (length(saux) <> 0)
                      then
                        saux := saux + ' e ' + unidade[n mod 100]
                      else
                        saux := unidade[n mod 100];
                    end
                  else
                    begin
                      if (length(saux) <> 0)
                      then
                        saux := saux + ' e ' + dezena[dez]
                      else
                        saux := dezena[dez];
                      if (unid <> 0)
                      then
                        if (length(saux) <> 0)
                        then
                          saux := saux + ' e ' + unidade[unid]
                        else
                          saux := unidade[unid];
                    end;
                end;
            end;
          if ((vlrP = '1') or (vlrP = '001'))
          then
            begin
              if (i = 0) // 1a. parte do valor (um real)
              then
                umReal := true
              else
                saux := saux + ' ' + qualificaS[i];
            end
          else if (i <> 0)
          then
            saux := saux + ' ' + qualificaP[i];
          if (length(s) <> 0)
          then
            s := saux + ', ' + s
          else
            s := saux;
        end;
      if (((i = 0) or (i = 1)) and (length(s) <> 0))
      then
        tem := true; // tem centena ou mil no valor
      i := i + 1; // próximo qualificador: 1- mil, 2- milhão, 3- bilhão, ...
    end;

  if (length(s) <> 0)
  then
    begin
      if (umReal)
      then
        s := s + ' real'
      else if (tem)
      then
        s := s + ' reais'
      else
        s := s + ' de reais';
    end;
  // definindo o extenso dos centavos do valor
  if (centavos <> '0') // valor com centavos
  then
    begin
      if (length(s) <> 0) // se não é valor somente com centavos
      then
        s := s + ' e ';
      if (centavos = '1')
      then
        s := s + 'um centavo'
      else
        begin
          n := strtoint(centavos);
          if (n <= 19)
          then
            s := s + unidade[n]
          else
            begin // para n = 37, tem-se:
              unid := n mod 10; // unid = 37 % 10 = 7 (unidade sete)
              dez := n div 10; // dez  = 37 / 10 = 3 (dezena trinta)
              s := s + dezena[dez];
              if (unid <> 0)
              then
                s := s + ' e ' + unidade[unid];
            end;
          s := s + ' centavos';
        end;
    end;
  Result := s.ToUpper;
end;

class function TUtils.fpuTruncTo(ipValor: Double; ipCasasDecimais: Integer): Double;
var
  vaAux: string;
  vaQuantCasas: string;
begin
  try
    vaQuantCasas := inttostr(ipCasasDecimais);
    vaAux := FloatToStr(ipValor);
    // considerando somente a quant de casas decimais informada
    vaAux := TRegex.Replace(vaAux, '(?<=,\d{' + vaQuantCasas + ',' + vaQuantCasas + '})\d*', '');
    Result := StrToFloat(vaAux);
  except
    on E: Exception do
      raise Exception.Create('Não foi possível truncar o valor especificado.' + sLineBreak + 'Detalhes: ' + E.Message);
  end;
end;

class procedure TUtils.ppuCopyStreamToByteStream(ipOrigem: TStream; var ipDestino: TBytesStream);
const
  LBufSize = $F000;
var
  LBuffer: PByte;
  LReadCount: Integer;
begin
  GetMem(LBuffer, LBufSize);
  ipDestino.Clear;
  try
    repeat
      LReadCount := ipOrigem.Read(LBuffer^, LBufSize);
      if LReadCount > 0 then
        ipDestino.WriteBuffer(LBuffer^, LReadCount);
    until LReadCount < LBufSize;
  finally
    FreeMem(LBuffer, LBufSize);
  end;

  ipDestino.Seek(0, TSeekOrigin.soBeginning);
end;

class procedure TUtils.ppuExtrairValorOperadorParametro(ipInput: string; var opValor,
  opOperador: string; ipDelimitador: String);
var
  vaArray: TArray<string>;
begin
  opOperador := TOperadores.coAnd;

  vaArray := TRegex.Split(ipInput, ipDelimitador);
  opValor := vaArray[0];
  if length(vaArray) > 1 then
    opOperador := vaArray[1];
end;

class procedure TUtils.ppuExtrairValorParametro(ipInput: string;
  var opValor: string; ipDelimitador: String);
var
  vaArray: TArray<string>;
begin
  vaArray := TRegex.Split(ipInput, ipDelimitador);
  opValor := vaArray[0];
end;

class function TUtils.fpuCalcularDepreciacao(ipDataAquisicao: TDateTime;
  ipValorInicial: Double; ipTaxaDepreciacaoAnual: Integer): Double;
var
  vaDifAnos: Integer;
begin
  Result := ipValorInicial;
  if (ipValorInicial > 0) and (ipTaxaDepreciacaoAnual > 0) then
    begin
      vaDifAnos := YearsBetween(now, ipDataAquisicao);
      if vaDifAnos > 0 then
        begin
          Result := ipValorInicial - ((ipValorInicial * (ipTaxaDepreciacaoAnual / 100)) * vaDifAnos);
          if Result < 0 then
            Result := 0;
        end;
    end;

end;

class function TUtils.fpuConverterStringToArrayInteger(ipValor: string; ipDelimitador: string): TArray<Integer>;
var
  vaArray: TArray<string>;
  i: Integer;
begin
  vaArray := TRegex.Split(ipValor, coDelimitadorPadrao);
  SetLength(Result, length(vaArray));
  for i := 0 to High(vaArray) do
    begin
      Result[i] := StrToIntDef(vaArray[i], 0);
    end;

end;

class function TUtils.fpuCriptografarSha1(ipValor: String): String;
var
  vaSha1: TIdHashSHA1;
begin
  vaSha1 := TIdHashSHA1.Create;
  try
    Result := vaSha1.HashStringAsHex(ipValor);
  finally
    vaSha1.free;
  end;
end;

class procedure TUtils.ppuPercorrerCds(ipCDS: TClientDataSet; ipProc: TProc; ipManterPosicao: Boolean = true;
  ipOtimizarLoop: Boolean = true);
begin
  TUtils.ppuPercorrerCds(ipCDS,
    function: Boolean
    begin
      ipProc;
      exit(true);
    end, ipManterPosicao, ipOtimizarLoop);
end;

class procedure TUtils.ppuPercorrerCds(ipCDS: TClientDataSet; ipFunc: TFunc<Boolean>; ipManterPosicao: Boolean = true;
ipOtimizarLoop: Boolean = true);
var
  vaRecNo: Integer;
begin
  if ipCDS.Active and (ipCDS.RecordCount > 0) then
    begin
      vaRecNo := 1;
      if ipManterPosicao then
        vaRecNo := ipCDS.RecNo;

      if ipOtimizarLoop then
        ipCDS.DisableControls;

      try
        ipCDS.First;
        while not ipCDS.Eof do
          begin
            if not ipFunc then // se retornar false, paro o loop
              exit;
            ipCDS.Next;
          end;
      finally
        if ipManterPosicao then
          if ipCDS.Active and (ipCDS.RecordCount > 0) and (vaRecNo <= ipCDS.RecordCount) then
            ipCDS.RecNo := vaRecNo;

        if ipOtimizarLoop then
          ipCDS.EnableControls;
      end;
    end;

end;

class function TUtils.fpuMontarStringCodigo(ipDataSet: TDataSet; ipNomeField,
  ipDelimitador: String): String;
begin
  Result := TUtils.fpuMontarStringCodigo(ipDataSet, ipNomeField, ipDelimitador, ipDataSet.RecordCount);
end;

class function TUtils.fpuMontarStringCodigo(ipDataSet: TDataSet; ipNomeField,
  ipDelimitador: String; ipQtde: Integer): String;
begin
  Result := TUtils.fpuMontarStringCodigo(ipDataSet, ipNomeField, ipDelimitador, ipQtde, false);
end;

class function TUtils.fpuMontarStringCodigo(ipDataSet: TDataSet; ipNomeField,
  ipDelimitador: String; ipIgnorarDuplicados: Boolean): String;
begin
  Result := TUtils.fpuMontarStringCodigo(ipDataSet, ipNomeField, ipDelimitador, ipDataSet.RecordCount,
    ipIgnorarDuplicados);
end;

class function TUtils.fpuMontarStringCodigo(ipDataSet: TDataSet; ipNomeField,
  ipDelimitador: String; ipQtde: Integer; ipIgnorarDuplicados: Boolean): String;
var
  vaList: TList<String>;
  vaRecNo: Integer;
begin
  Result := '';
  vaList := TList<String>.Create;
  try
    ipDataSet.DisableControls;
    try
      vaRecNo := ipDataSet.RecNo;
      ipDataSet.First;
      while (ipDataSet.RecNo <= ipQtde) and (not ipDataSet.Eof) do
        begin
          if ipIgnorarDuplicados and vaList.Contains(ipDataSet.FieldByName(ipNomeField).AsString) then
            begin
              ipDataSet.Next;
              continue;
            end;
          vaList.Add(ipDataSet.FieldByName(ipNomeField).AsString);

          if ipDataSet.FieldByName(ipNomeField).AsString <> '' then
            Result := Result + ipDataSet.FieldByName(ipNomeField).AsString + ipDelimitador;
          ipDataSet.Next;
        end;
      if (ipDataSet.RecordCount > 0) and (vaRecNo > 0) and (vaRecNo < ipDataSet.RecordCount) then
        ipDataSet.RecNo := vaRecNo;
    finally
      ipDataSet.EnableControls;
    end;
  finally
    vaList.free;
  end;

  Result := copy(Result, 1, length(Result) - length(ipDelimitador)); // retirando o ultimo delimitador

end;

class function TUtils.fpuValidarCnpj(ipCnpj: string): Boolean;
begin
  Result := TRegex.IsMatch(ipCnpj, coRegexCNPJ);
end;

class function TUtils.fpuValidarCpf(ipCpf: string): Boolean;
begin
  Result := TRegex.IsMatch(ipCpf, coRegexCPF);
end;

class function TUtils.fpuValidarCpfCnpj(ipCpfCnpj: string): Boolean;
begin
  Result := TRegex.IsMatch(ipCpfCnpj, '(' + coRegexCPF + ')|(' + coRegexCNPJ + ')');
end;

class function TUtils.fpuValidarEmail(ipEmail: String): Boolean;
begin
  Result := TRegex.IsMatch(ipEmail, '^([0-9a-zA-Z][-\._0-9a-zA-Z]*@' +
    '([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$');
end;

class function TUtils.fpuVersaoExecutavel(ipArquivo: String; ipVersaoAte: TVersaoInfo): string;
var
  VerInfoSize, VerValueSize, dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
  V1, V2, V3, V4: Word;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ipArquivo), dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ipArquivo), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '', Pointer(VerValue), VerValueSize);
  with VerValue^ do
    begin
      V1 := dwFileVersionMS shr 16;
      V2 := dwFileVersionMS and $FFFF;
      V3 := dwFileVersionLS shr 16;
      V4 := dwFileVersionLS and $FFFF;
    end;
  FreeMem(VerInfo, VerInfoSize);
  case ipVersaoAte of
    viMaJorVersion:
      Result := inttostr(V1);
    viMinorVersion:
      Result := inttostr(V1) + '.' + inttostr(V2);
    viRelease:
      Result := inttostr(V1) + '.' + inttostr(V2) + '.' + inttostr(V3);
    viBuild:
      Result := inttostr(V1) + '.' + inttostr(V2) + '.' + inttostr(V3) + '.' + inttostr(V4);
  end;

end;

class procedure TUtils.ppuAbrirFormAba<T>(ipPageControl: TcxPageControl; ipClassForm: TFormClass; var opForm: T;
ipCriarSeNecessario: Boolean);
var
  vaTab: TcxTabSheet;
  i: Integer;
begin
  for i := 0 to ipPageControl.PageCount - 1 do
    begin
      vaTab := ipPageControl.Pages[i];
      if (vaTab.ControlCount > 0) and (vaTab.Controls[0].ClassName = ipClassForm.ClassName) then
        begin
          ipPageControl.ActivePage := vaTab;
          exit;
        end;
    end;

  if ipCriarSeNecessario then
    opForm := T(ipClassForm.Create(nil));

  vaTab := TcxTabSheet.Create(ipPageControl);
  vaTab.Caption := opForm.Caption;
  vaTab.TabStop := false;
  vaTab.Parent := ipPageControl;

  opForm.Align := alClient;
  opForm.BorderStyle := bsNone;
  opForm.Parent := vaTab;

  ipPageControl.ActivePage := vaTab;
  opForm.show;

end;

class function TUtils.fpuEncapsularPanelForm(ipCaption: string; ipPanel: TPanel): TForm;
begin
  Result := TForm.Create(nil);
  Result.Caption := ipCaption;
  Result.KeyPreview := true;
  ipPanel.Parent := Result;
  ipPanel.Visible := true;
  ipPanel.Top := 0;
  ipPanel.Left := 0;
  ipPanel.bevelOuter := bvNone;

  Result.Width := ipPanel.Width + 10;
  Result.Height := ipPanel.Height + 35;

  Result.BorderIcons := [];
  Result.BorderStyle := bsSingle;

  Result.position := poMainFormCenter;
end;

class function TUtils.fpuExtrairData(ipDateString: string;
ipPosicao: Integer): TDateTime;
var
  vaDatas: TArray<string>;
begin
  vaDatas := TRegex.Split(ipDateString, ';', [roIgnoreCase]);
  if ipPosicao < length(vaDatas) then
    begin
      if not TryStrToDateTime(vaDatas[ipPosicao], Result) then
        raise Exception.Create('Data inválida.');
    end
  else
    raise Exception.Create('Posição inválida.');
end;

class function TUtils.fpuMontarDataBetween(ipDataInicial, ipDataFinal: TDateTime): String;
begin
  Result := DateToStr(ipDataInicial) + ';' + DateToStr(ipDataFinal);
end;

class function TUtils.fpuExtrairValoresCheckComboBox(ipCheckBox: TcxCheckComboBox): string;
var
  vaCodigosProjetos: TStringList;
  vaIndices: TArray<String>;
  i: Integer;
begin
  Result := '';
  if not VarIsNull(ipCheckBox.EditValue) and (ipCheckBox.EditValue <> '') then
    begin
      vaCodigosProjetos := TStringList.Create;
      try
        vaCodigosProjetos.Delimiter := coDelimitadorPadrao;
        vaCodigosProjetos.StrictDelimiter := true;

        vaIndices := TRegex.Split(copy(ipCheckBox.EditValue, Pos(';', ipCheckBox.EditValue) + 1, length(ipCheckBox.EditValue)), ',', [roIgnoreCase]);
        for i := 0 to High(vaIndices) do
          begin
            if assigned(ipCheckBox.RepositoryItem) then
              vaCodigosProjetos.Add(TcxCheckComboBoxProperties(ipCheckBox.RepositoryItem.Properties).Items[vaIndices[i].ToInteger].Tag.ToString())
            else
              vaCodigosProjetos.Add(ipCheckBox.Properties.Items[vaIndices[i].ToInteger].Tag.ToString());
          end;

        if vaCodigosProjetos.Count > 0 then
          Result := vaCodigosProjetos.DelimitedText;
      finally
        vaCodigosProjetos.Clear;
        vaCodigosProjetos.free;
      end;
    end;
end;

class function TUtils.fpuExtrairNumeros(ipValor: string): string;
var
  i: Integer;
begin
  Result := '';
  for i := Low(ipValor) to High(ipValor) do
    begin
      if TRegex.IsMatch(ipValor[i], '\d', []) then
        Result := Result + ipValor[i];
    end;
end;

class function TUtils.fpuFocar(ipEdit: TWinControl): Boolean;
begin
  Result := false;
  try
    if ipEdit.CanFocus and ipEdit.Visible and ipEdit.Enabled then
      begin
        ipEdit.SetFocus;
        Result := true;
      end;
  except
    // vamos ignorar
    Result := false;
  end;
end;

class function TUtils.fpuMontarStringCodigo(ipCods: array of Integer;
ipDelimitador: String): String;
var
  vaCod: Variant;
begin
  Result := '';
  for vaCod in ipCods do
    begin
      if Result = '' then
        Result := inttostr(vaCod)
      else
        Result := Result + ' ' + ipDelimitador + ' ' + inttostr(vaCod);
    end;

end;

end.
