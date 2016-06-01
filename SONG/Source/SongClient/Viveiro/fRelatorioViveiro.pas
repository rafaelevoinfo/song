unit fRelatorioViveiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fRelatorioBasico, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, Data.DB, System.Actions, Vcl.ActnList, cxCheckBox,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.StdCtrls, Vcl.ExtCtrls, dmuLookup, dxSkinscxPCPainter,
  dxBarBuiltInMenu, cxPC, dmuRelatorio, ppDB, ppDBPipe, ppParameter,
  ppDesignLayer, ppModule, raCodMod, ppCtrls, ppBands, ppClass, ppVar, ppPrnabl,
  ppCache, ppComm, ppRelatv, ppProd, ppReport, uClientDataSet, uTypes,
  dmuPrincipal;

type
  TfrmRelatorioViveiro = class(TfrmRelatorioBasico)
    pcPrincipal: TcxPageControl;
    tabSaldos: TcxTabSheet;
    Label2: TLabel;
    cbSaldoEspecie: TcxLookupComboBox;
    chkSaldoTodasEspecies: TcxCheckBox;
    ppSaldoEspecie: TppReport;
    ppParameterList4: TppParameterList;
    DBPipeSaldoEspecie: TppDBPipeline;
    ppHeaderBand4: TppHeaderBand;
    ppLabel23: TppLabel;
    ppDBImage4: TppDBImage;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppDetailBand4: TppDetailBand;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppLabel24: TppLabel;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppSystemVariable12: TppSystemVariable;
    raCodeModule2: TraCodeModule;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    DBPipeOrganizacao: TppDBPipeline;
    procedure FormCreate(Sender: TObject);
    procedure Ac_GerarRelatorioExecute(Sender: TObject);
    procedure chkSaldoTodasEspeciesPropertiesEditValueChanged(Sender: TObject);
  private
    dmRelatorio: TdmRelatorio;
  public
    { Public declarations }
  end;

var
  frmRelatorioViveiro: TfrmRelatorioViveiro;

implementation

{$R *.dfm}


procedure TfrmRelatorioViveiro.Ac_GerarRelatorioExecute(Sender: TObject);
var
  vaIdOrganizacao:Integer;
  vaIdEspecie:Integer;
begin
  inherited;
  vaIdOrganizacao := fprExtrairValor(chkTodasOrganizacoes, cbOrganizacao, 'Informe a organização ou marque todas');
  vaIdEspecie := fprExtrairValor(chkSaldoTodasEspecies,cbSaldoEspecie,'Informe a espécie ou marque todas');

  //vamos garantir que o saldo esteja correto, para isso vamos chamar a função de ajustar os saldos
  dmPrincipal.FuncoesViveiro.ppuAjustarSaldoEspecie(vaIdEspecie);

  dmRelatorio.cdsSaldo_Semente_Muda.Close;
  if vaIdEspecie <> 0 then
    dmRelatorio.cdsSaldo_Semente_Muda.ParamByName('ID_ESPECIE').AsInteger := vaIdEspecie
  else
    dmRelatorio.cdsSaldo_Semente_Muda.ParamByName('ID_ESPECIE').Clear;

  dmRelatorio.cdsSaldo_Semente_Muda.Open;
  ppSaldoEspecie.PrintReport;


end;

procedure TfrmRelatorioViveiro.chkSaldoTodasEspeciesPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbSaldoEspecie.Enabled := not chkSaldoTodasEspecies.Checked;
end;

procedure TfrmRelatorioViveiro.FormCreate(Sender: TObject);
begin
  dmRelatorio := TdmRelatorio.Create(Self);
  dmRelatorio.Name := '';
  inherited;

  dmLookup.cdslkEspecie.ppuDataRequest([TParametros.coTodos],['NAO_IMPORTA'],TOperadores.coAnd,true);
end;

end.
