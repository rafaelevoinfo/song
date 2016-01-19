unit smuBasico;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  Datasnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, Datasnap.DBClient,
  System.Generics.Collections;

type
  TsmBasico = class(TDSServerModule)
    procedure DSServerModuleCreate(Sender: TObject);
  private
    FOriginalScripts:TDictionary<String, String>;

    procedure ppvCriarProvider(ipDataSet: TFDQuery);
    function fpvOnDataRequest(ipSender: TObject; ipInput: OleVariant):OleVariant;
  public

  end;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}
{ TDSServerModule1 }

procedure TsmBasico.DSServerModuleCreate(Sender: TObject);
var
  I: Integer;
  vaDataSet: TFDQuery;
begin
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TFDQuery then
    begin
      vaDataSet := TFDQuery(Components[I]);

      ppvCriarProvider(vaDataSet);
    end;
  end;

end;

procedure TsmBasico.ppvCriarProvider(ipDataSet: TFDQuery);
var
  vaProvider: TDataSetProvider;
begin
  vaProvider := TDataSetProvider.Create(Self);
  vaProvider.DataSet := ipDataSet;
  vaProvider.UpdateMode := upWhereKeyOnly;
  vaProvider.OnDataRequest := fpvOnDataRequest;
end;

function TsmBasico.fpvOnDataRequest(ipSender: TObject; ipInput: OleVariant):OleVariant;
var
  vaParams: TParams;
begin
  UnpackParams(ipInput, vaParams);
  if Assigned(vaParams) then
    begin

    end;
end;

end.
