unit smuBasico;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  Datasnap.DSProviderDataModuleAdapter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, Datasnap.DBClient,
  System.Generics.Collections, uTypes;

type
  TsmBasico = class(TDSServerModule)
    procedure DSServerModuleCreate(Sender: TObject);
  private
    FScriptsOriginais: TDictionary<String, String>;

    function fpvOnDataRequest(ipSender: TObject; ipInput: OleVariant): OleVariant;
  protected
    procedure pprCriarProvider(ipDataSet: TFDQuery); virtual;
    function fprMontarWhere(ipTabela: string; ipParams: TParams): string; virtual;
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
  FScriptsOriginais := TDictionary<String, String>.Create;
  for I := 0 to ComponentCount - 1 do
    begin
      if Components[I] is TFDQuery then
        begin
          FScriptsOriginais.Add(vaDataSet.Name, vaDataSet.SQL.Text);
          vaDataSet := TFDQuery(Components[I]);

          pprCriarProvider(vaDataSet);
        end;
    end;

end;

procedure TsmBasico.pprCriarProvider(ipDataSet: TFDQuery);
var
  vaProvider: TDataSetProvider;
begin
  vaProvider := Self.FindComponent('dsp' + ipDataSet.Name) AS TDataSetProvider;
  if not Assigned(vaProvider) then
    begin
      vaProvider := TDataSetProvider.Create(Self);
      vaProvider.DataSet := ipDataSet;
      vaProvider.UpdateMode := upWhereKeyOnly;
    end;

  if not Assigned(vaProvider.OnDataRequest) then
    vaProvider.OnDataRequest := fpvOnDataRequest;
end;

function TsmBasico.fpvOnDataRequest(ipSender: TObject; ipInput: OleVariant): OleVariant;
var
  vaParams: TParams;
  vaParamTabela: TParam;
  vaDataSet: TFDQuery;
  vaScript, vaWhere: string;
  vaMacroWhere: TFDMacro;
begin
  vaParams := TParams.Create;
  try
    UnpackParams(ipInput, vaParams);
    vaParamTabela := vaParams.FindParam(TBancoDados.Tabela);
    if Assigned(vaParamTabela) then
      begin
        // voltando o SQL Original
        if ipSender is TDataSetProvider then
          begin
            vaDataSet := TDataSetProvider(ipSender).DataSet as TFDQuery;
            vaMacroWhere := vaDataSet.FindMacro(TBancoDados.MacroWhere);
            if Assigned(vaMacroWhere) and FScriptsOriginais.TryGetValue(vaDataSet.Name, vaScript) then
              begin
                vaDataSet.SQL.Text := vaScript;
                vaWhere := fprMontarWhere(vaParamTabela.Text, vaParams);
                vaMacroWhere.AsRaw := vaWhere;
              end;
          end;
      end;
  finally
    vaParams.Free;
  end;
end;

function TsmBasico.fprMontarWhere(ipTabela: string; ipParams: TParams): string;
begin
  Result := '';
end;

end.
