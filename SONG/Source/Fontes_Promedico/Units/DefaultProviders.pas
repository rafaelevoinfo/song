{*************************************************************}
{                                                             }
{ Default Providers Unit                                      }
{                                                             }
{ By Daniel Maltarolli, 2008                                  }
{ http://singularsistemas.com.br/blog                         }
{Adaptador para o d2009 by Waldir Silva Junior, 2009          }
{*************************************************************}

unit DefaultProviders;

interface

uses DB, DataBkr, Provider,DSServer;

const
  coDefaultProviderNameFormat: String = 'dsp%s';

procedure CreateDefaultProviders(RDM: TDSServerModule;
  UpdateMode: TUpdateMode = upWhereKeyOnly); overload;

procedure CreateDefaultProviders(RDM: TDSServerModule;
  DataSets: array of TDataSet; UpdateMode: TUpdateMode = upWhereKeyOnly); overload;

implementation

uses SysUtils, Classes;

procedure CreateDefaultProvider(RDM: TDSServerModule;
  DataSet: TDataSet; UpdateMode: TUpdateMode);
var
  ProviderName: String;
  Provider: TDataSetProvider;
begin
  ProviderName := Format(coDefaultProviderNameFormat, [DataSet.Name]);
  if RDM.FindComponent(ProviderName) = nil then
    begin
      Provider := TDataSetProvider.Create(RDM);
      Provider.Name := ProviderName;
      Provider.DataSet := DataSet;
      Provider.UpdateMode := UpdateMode;
      //usar poFetchBlobsOnDemand faz os registros ficarem mais lentos;
    end;
end;

procedure CreateDefaultProviders(RDM: TDSServerModule;
  UpdateMode: TUpdateMode = upWhereKeyOnly); overload;
var
  i: Integer;
  C: TComponent;
begin
//  RDM.
  try
    for i := 0 to RDM.ComponentCount - 1 do
    begin
      C := RDM.Components[i];
      if (C is TDataSet) then
        CreateDefaultProvider(RDM, TDataSet(C), UpdateMode)
    end;
  finally
//    RDM.Unlock;
  end;
end;

procedure CreateDefaultProviders(RDM: TDSServerModule;
  DataSets: array of TDataSet; UpdateMode: TUpdateMode = upWhereKeyOnly); overload;
var
  i: Integer;
begin
//  RDM.Lock;
  try
    for i := Low(DataSets) to High(DataSets) do
      CreateDefaultProvider(RDM, DataSets[i], UpdateMode);
  finally
 //   RDM.Unlock;
  end;
end;

end.


