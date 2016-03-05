unit uUtils;

interface

uses
  System.SysUtils, Vcl.Dialogs, cxPC, Vcl.Forms, Vcl.Controls,
  Datasnap.DBClient, IdHashSHA, System.RegularExpressions,
  System.Types, Winapi.Windows, uTypes, System.Classes, Data.DB,
  System.Generics.Collections, cxCheckComboBox, System.Variants;

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
  end;

implementation

{ TUtils }

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

  vaArray := TRegEx.Split(ipInput, ipDelimitador);
  opValor := vaArray[0];
  if Length(vaArray) > 1 then
    opOperador := vaArray[1];
end;

class procedure TUtils.ppuExtrairValorParametro(ipInput: string;
  var opValor: string; ipDelimitador: String);
var
  vaArray: TArray<string>;
begin
  vaArray := TRegEx.Split(ipInput, ipDelimitador);
  opValor := vaArray[0];
end;

class function TUtils.fpuConverterStringToArrayInteger(ipValor: string; ipDelimitador: string): TArray<Integer>;
var
  vaArray: TArray<string>;
  I: Integer;
begin
  vaArray := TRegEx.Split(ipValor, coDelimitadorPadrao);
  SetLength(Result, Length(vaArray));
  for I := 0 to High(vaArray) do
    begin
      Result[I] := StrToIntDef(vaArray[I], 0);
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
      Exit(true);
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
              Exit;
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

  Result := Copy(Result, 1, Length(Result) - Length(ipDelimitador)); // retirando o ultimo delimitador

end;

class function TUtils.fpuValidarEmail(ipEmail: String): Boolean;
begin
  Result := TRegEx.IsMatch(ipEmail, '^([0-9a-zA-Z][-\._0-9a-zA-Z]*@' +
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
      Result := IntToStr(V1);
    viMinorVersion:
      Result := IntToStr(V1) + '.' + IntToStr(V2);
    viRelease:
      Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' + IntToStr(V3);
    viBuild:
      Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' + IntToStr(V3) + '.' + IntToStr(V4);
  end;

end;

class procedure TUtils.ppuAbrirFormAba<T>(ipPageControl: TcxPageControl; ipClassForm: TFormClass; var opForm: T;
ipCriarSeNecessario: Boolean);
var
  vaTab: TcxTabSheet;
  I: Integer;
begin
  for I := 0 to ipPageControl.PageCount - 1 do
    begin
      vaTab := ipPageControl.Pages[I];
      if (vaTab.ControlCount > 0) and (vaTab.Controls[0] is T) then
        begin
          ipPageControl.ActivePage := vaTab;
          Exit;
        end;
    end;

  if ipCriarSeNecessario then
    opForm := T(ipClassForm.Create(nil));

  vaTab := TcxTabSheet.Create(ipPageControl);
  vaTab.Caption := opForm.Caption;
  vaTab.Parent := ipPageControl;

  opForm.Align := alClient;
  opForm.BorderStyle := bsNone;
  opForm.Parent := vaTab;

  ipPageControl.ActivePage := vaTab;
  opForm.show;

end;

class function TUtils.fpuExtrairData(ipDateString: string;
ipPosicao: Integer): TDateTime;
var
  vaDatas: TArray<string>;
begin
  vaDatas := TRegEx.Split(ipDateString, ';', [roIgnoreCase]);
  if ipPosicao < Length(vaDatas) then
    begin
      if not TryStrToDateTime(vaDatas[ipPosicao], Result) then
        raise Exception.Create('Data inválida.');
    end
  else
    raise Exception.Create('Posição inválida.');
end;

class function TUtils.fpuExtrairValoresCheckComboBox(ipCheckBox: TcxCheckComboBox): string;
var
  vaCodigosProjetos: TStringList;
  vaIndices: TArray<String>;
  I: Integer;
begin
  Result := '';
  if not VarIsNull(ipCheckBox.EditValue) and (ipCheckBox.EditValue <> '') then
    begin
      vaCodigosProjetos := TStringList.Create;
      try
        vaCodigosProjetos.Delimiter := coDelimitadorPadrao;
        vaCodigosProjetos.StrictDelimiter := true;

        vaIndices := TRegEx.Split(Copy(ipCheckBox.EditValue, Pos(';', ipCheckBox.EditValue) + 1, Length(ipCheckBox.EditValue)), ',', [roIgnoreCase]);
        for I := 0 to High(vaIndices) do
          begin
            vaCodigosProjetos.Add(ipCheckBox.Properties.Items[vaIndices[I].ToInteger].Tag.ToString());
          end;

        if vaCodigosProjetos.Count > 0 then
          Result := vaCodigosProjetos.DelimitedText;
      finally
        vaCodigosProjetos.Clear;
        vaCodigosProjetos.free;
      end;
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
        Result := IntToStr(vaCod)
      else
        Result := Result + ' ' + ipDelimitador + ' ' + IntToStr(vaCod);
    end;

end;

end.
