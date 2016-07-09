unit uProxyGenerator;

interface

uses
  Classes, System.SysUtils, Datasnap.DSProxyDelphiNative, CodeSiteLogging,
  Datasnap.DSProxyWriter, System.RegularExpressions;

type
  TRFDelphiProxyWriter = class(TDSDelphiProxyWriter)
  private
    FAdicionarVirtual:Boolean;
  protected
    procedure WriteInterface; override;
  public
    procedure DerivedWrite(const Line: string); override;
  end;

  TRFClientProxyWriterDelphi = class(TDSClientProxyWriterDelphi)
  public
    function CreateProxyWriter: TDSCustomProxyWriter; override;
  end;

const
  coNomeWriter = 'Object Pascal DBX Customizado';

implementation

{ TRFDelphiProxyWriter }

procedure TRFDelphiProxyWriter.DerivedWrite(const Line: string);
var
  vaLinha:String;
begin
  if FAdicionarVirtual and TRegex.IsMatch(Line,'\s*((procedure)|(function))\s+.+;$',[roIgnoreCase]) then
    vaLinha := Line+' virtual;'
  else
    vaLinha := Line;

  inherited DerivedWrite(vaLinha);
end;

procedure TRFDelphiProxyWriter.WriteInterface;
begin
  FAdicionarVirtual := true;
  try
    inherited;
  finally
    FAdicionarVirtual := false;
  end;
end;

{ TRFClientProxyWriterDelphi }

function TRFClientProxyWriterDelphi.CreateProxyWriter: TDSCustomProxyWriter;
begin
  Result := TRFDelphiProxyWriter.Create;
end;

initialization

TDSProxyWriterFactory.RegisterWriter(coNomeWriter, TRFClientProxyWriterDelphi);

finalization

TDSProxyWriterFactory.UnregisterWriter(coNomeWriter);

end.
