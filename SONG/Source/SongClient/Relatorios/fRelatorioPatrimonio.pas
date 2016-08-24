unit fRelatorioPatrimonio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fRelatorioBasico, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, Data.DB, System.Actions, Vcl.ActnList, cxCheckBox,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.StdCtrls, Vcl.ExtCtrls, cxGroupBox, cxRadioGroup,
  dmuRelatorio, ppParameter, ppDesignLayer, ppModule, raCodMod, ppBands,
  ppCtrls, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, uClientDataSet, uTypes, System.TypInfo,
  uControleAcesso;

type
  TfrmRelatorioPatrimonio = class(TfrmRelatorioBasico)
    rgStatus: TcxRadioGroup;
    DBPipePatrimonio: TppDBPipeline;
    dsPatrimonio: TDataSource;
    ppPatrimonio: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppDBImage1: TppDBImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel2: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppSystemVariable3: TppSystemVariable;
    raCodeModule3: TraCodeModule;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppDBText5: TppDBText;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel4: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppShape2: TppShape;
    DBPipeOrganizacao: TppDBPipeline;
    DBPipeOrganizacaoppField1: TppField;
    DBPipeOrganizacaoppField2: TppField;
    DBPipeOrganizacaoppField3: TppField;
    DBPipeOrganizacaoppField4: TppField;
    procedure Ac_GerarRelatorioExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    function fprGetPermissao: String; override;
    { Public declarations }
  end;

var
  frmRelatorioPatrimonio: TfrmRelatorioPatrimonio;

implementation

{$R *.dfm}


procedure TfrmRelatorioPatrimonio.Ac_GerarRelatorioExecute(Sender: TObject);
begin
  inherited;
  dmRelatorio.cdsPatrimonio.ppuDataRequest([TParametros.coStatus], [rgStatus.ItemIndex], TOperadores.coAnd, true);
  ppPatrimonio.PrintReport;
end;

function TfrmRelatorioPatrimonio.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoRelatorio), ord(relPatrimonio));
end;

end.
