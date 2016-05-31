unit smuRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uQuery,
  Datasnap.DBClient, uClientDataSet, uUtils;

type
  TsmRelatorio = class(TsmBasico)
    qSaldo_Rubrica: TRFQuery;
    qSaldo_RubricaID_RUBRICA: TIntegerField;
    qSaldo_RubricaID_PROJETO: TIntegerField;
    qSaldo_RubricaNOME_PROJETO: TStringField;
    qSaldo_RubricaNOME_RUBRICA: TStringField;
    qSaldo_RubricaRECEBIDO: TBCDField;
    qSaldo_RubricaGASTO: TFMTBCDField;
    qSaldo_RubricaAPROVISIONADO: TFMTBCDField;
    qSaldo_RubricaSALDO_REAL: TFMTBCDField;
    qSaldo_RubricaORCAMENTO: TBCDField;
    qSaldo_Semente_Muda: TRFQuery;
    qSaldo_Semente_MudaNOME: TStringField;
    qSaldo_Semente_MudaNOME_CIENTIFICO: TStringField;
    qSaldo_Semente_MudaFAMILIA_BOTANICA: TStringField;
    qSaldo_Semente_MudaQTDE_SEMENTE_ESTOQUE: TBCDField;
    qSaldo_Semente_MudaQTDE_MUDA_ESTOQUE: TIntegerField;
  private
    { Private declarations }
  protected

    
  end;

var
  smRelatorio: TsmRelatorio;



implementation

uses
  dmuPrincipal;

{$R *.dfm}





end.
