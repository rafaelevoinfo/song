unit uUtils;

interface

uses
  System.SysUtils, Vcl.Dialogs, cxPC, Vcl.Forms, Vcl.Controls,
  Datasnap.DBClient, IdHashSHA, System.RegularExpressions,
  System.Types, Winapi.Windows, uTypes, System.Classes;

type
  TUtils = class
  public
    class procedure ppuAbrirFormAba<T: TForm>(ipPageControl: TcxPageControl; ipClassForm: TFormClass; ipForm: T);
    class procedure ppuPercorrerCds(ipCDS: TClientDataSet; ipProc: TProc; ipManterPosicao: Boolean = True;
      ipOtimizarLoop: Boolean = True); overload;
    class procedure ppuPercorrerCds(ipCDS: TClientDataSet; ipFunc: TFunc<Boolean>; ipManterPosicao: Boolean = True;
      ipOtimizarLoop: Boolean = True); overload;
    class function fpuCriptografarSha1(ipValor: String): String;
    class function fpuValidarEmail(ipEmail: String): Boolean;
    class procedure ppuFocar(ipEdit: TWinControl);
    class function fpuVersaoExecutavel(ipArquivo: String; ipVersaoAte: TVersaoInfo): string;
    class procedure ppuCopyStreamToByteStream(ipOrigem: TStream; var ipDestino: TBytesStream);
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

class procedure TUtils.ppuPercorrerCds(ipCDS: TClientDataSet; ipProc: TProc; ipManterPosicao: Boolean = True;
  ipOtimizarLoop: Boolean = True);
var
  vaRecNo: Integer;
begin
  TUtils.ppuPercorrerCds(ipCDS,
    function: Boolean
    begin
      ipProc;
      Exit(True);
    end, ipManterPosicao, ipOtimizarLoop);
end;

class procedure TUtils.ppuPercorrerCds(ipCDS: TClientDataSet; ipFunc: TFunc<Boolean>; ipManterPosicao: Boolean = True;
ipOtimizarLoop: Boolean = True);
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

class procedure TUtils.ppuAbrirFormAba<T>(ipPageControl: TcxPageControl; ipClassForm: TFormClass; ipForm: T);
var
  vaTab: TcxTabSheet;
  vaFormCriado: Boolean;
  I: Integer;
begin
  vaFormCriado := False;

  if ipForm = nil then
    begin
      ipForm := T(ipClassForm.Create(nil));
      vaFormCriado := True;
    end;

  for I := 0 to ipPageControl.PageCount - 1 do
    begin
      vaTab := ipPageControl.Pages[I];
      if vaTab.Caption = ipForm.Caption then
        begin
          if vaFormCriado then
            FreeAndNil(ipForm);
          ipPageControl.ActivePage := vaTab;
          Exit;
        end;
    end;

  vaTab := TcxTabSheet.Create(ipPageControl);
  vaTab.Caption := ipForm.Caption;
  vaTab.Parent := ipPageControl;

  ipForm.Align := alClient;
  ipForm.BorderStyle := bsNone;
  ipForm.Parent := vaTab;

  ipPageControl.ActivePage := vaTab;
  ipForm.show;

end;

class procedure TUtils.ppuFocar(ipEdit: TWinControl);
begin
  try
    if ipEdit.CanFocus and ipEdit.Visible and ipEdit.Enabled then
      ipEdit.SetFocus;
  except
    // vamos ignorar
  end;
end;

end.
