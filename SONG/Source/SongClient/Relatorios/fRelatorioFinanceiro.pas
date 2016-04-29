unit fRelatorioFinanceiro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fRelatorioBasico, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, dmuPrincipal, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxPC, dmuLookup, uClientDataSet, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, dmuRelatorio, uExceptions, Data.DB, ppCtrls, ppPrnabl,
  ppBands, ppCache, ppDesignLayer, ppParameter;

type
  TfrmRelatorioFinanceiro = class(TfrmRelatorioBasico)
    pcPrincipal: TcxPageControl;
    tabSaldoProjeto: TcxTabSheet;
    cbProjetoSaldoProjeto: TcxLookupComboBox;
    lb1: TLabel;
    ppSaldoProjeto: TppReport;
    dsSaldoProjeto: TDataSource;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    DBPipeSaldoProjeto: TppDBPipeline;
    procedure FormCreate(Sender: TObject);
    procedure Ac_GerarRelatorioExecute(Sender: TObject);
  private
    dmLookup: TdmLookup;
    dmRelatorio: TdmRelatorio;
  public
    { Public declarations }
  end;

var
  frmRelatorioFinanceiro: TfrmRelatorioFinanceiro;

implementation

{$R *.dfm}


procedure TfrmRelatorioFinanceiro.Ac_GerarRelatorioExecute(Sender: TObject);
begin
  inherited;
  if pcPrincipal.ActivePage = tabSaldoProjeto then
    begin
      if VarIsNull(cbProjetoSaldoProjeto.EditValue) then
        raise TControlException.Create('Informe o projeto.', cbProjetoSaldoProjeto);

      dmRelatorio.cdsSaldoProjeto.Close;
      dmRelatorio.cdsSaldoProjeto.ParamByName('ID_PROJETO').AsInteger := cbProjetoSaldoProjeto.EditValue;
      dmRelatorio.cdsSaldoProjeto.Open;

      ppSaldoProjeto.PrintReport;
    end;
end;

procedure TfrmRelatorioFinanceiro.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  dmRelatorio := TdmRelatorio.Create(Self);
  dmRelatorio.Name := '';
  inherited;

  dmLookup.cdslkProjeto.ppuDataRequest([TParametros.coTodos], ['NAO_IMPORTA']);

end;

end.
