unit smuFuncoesEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuFuncoesBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery, uTypes;

type
  TsmFuncoesEstoque = class(TsmFuncoesBasico)
  private
    { Private declarations }
  public
    function fpuValidarTipoItem(ipId, ipTipo: Integer): Boolean;
  end;

var
  smFuncoesEstoque: TsmFuncoesEstoque;

implementation

{$R *.dfm}

{ TsmFuncoesEstoque }

function TsmFuncoesEstoque.fpuValidarTipoItem(ipId, ipTipo: Integer): Boolean;
var
  vaResult: Boolean;
begin
  pprEncapsularConsulta(
    procedure(ipDataSet: TRFQuery)
    begin
      vaResult := True;
      if TTipoItem(ipTipo) in [tiSemente, tiMuda] then
        begin
          ipDataSet.SQL.Text := 'Select count(*) as QTDE from ' +
            '                     item ' +
            '                    where item.tipo = :tipo and ' +
            '                          item.id <> :id';
          ipDataSet.ParamByName('ID').AsInteger := ipId;
          ipDataSet.ParamByName('TIPO').AsInteger := ipTipo;
          ipDataSet.Open();

          vaResult := ipDataSet.FieldByName('QTDE').AsInteger = 0;
        end;
    end);

  Result := vaResult;
end;

end.
