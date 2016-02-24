unit uUtils;

interface

uses
  System.SysUtils, Vcl.Dialogs, cxPC, Vcl.Forms, Vcl.Controls,
  Datasnap.DBClient, IdHashSHA, System.RegularExpressions,
  System.Types, Winapi.Windows, uTypes, System.Classes, Data.DB,
  System.Generics.Collections;

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
    class function fpuExtrairData(ipDateString: string; ipPosicao: Integer): TDateTime;
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
var
  vaRecNo: Integer;
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
  vaCod: Variant;
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

  Result := Copy(Result, 1, length(Result) - length(ipDelimitador)); // retirando o ultimo delimitador

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
  vaDatas := TRegex.Split(ipDateString, ';', [roIgnoreCase]);
  if ipPosicao < length(vaDatas) then
    begin
      if not TryStrToDateTime(vaDatas[ipPosicao], Result) then
        raise Exception.Create('Data inválida.');
    end
  else
    raise Exception.Create('Posição inválida.');
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

end.
