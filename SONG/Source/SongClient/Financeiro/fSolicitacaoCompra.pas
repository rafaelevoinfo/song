unit fSolicitacaoCompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, System.Actions, Vcl.ActnList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxGroupBox, cxRadioGroup, Vcl.StdCtrls,
  cxDropDownEdit, cxImageComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  Vcl.ExtCtrls, cxPC, dmuFinanceiro, cxCheckBox, cxCheckComboBox, dmuLookup,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, uTypes, System.DateUtils;

type
  TfrmSolicitacaoCompra = class(TfrmBasicoCrud)
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_ITEM: TcxGridDBColumn;
    viewRegistrosID_PESSOA_SOLICITOU: TcxGridDBColumn;
    viewRegistrosID_PESSOA_ANALISOU: TcxGridDBColumn;
    viewRegistrosID_COMPRA: TcxGridDBColumn;
    viewRegistrosQTDE: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    viewRegistrosDATA_ANALISE: TcxGridDBColumn;
    viewRegistrosSTATUS: TcxGridDBColumn;
    viewRegistrosSOLICITANTE: TcxGridDBColumn;
    viewRegistrosNOME_ITEM: TcxGridDBColumn;
    viewRegistrosRESPONSAVEL_ANALISE: TcxGridDBColumn;
    cbStatusPesquisa: TcxCheckComboBox;
    Label3: TLabel;
    Label7: TLabel;
    cbItem: TcxDBLookupComboBox;
    Label4: TLabel;
    cbSolicitante: TcxDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
  private
    dmLookup: TdmLookup;
    dmFinanceiro: TdmFinanceiro;
  public
    { Public declarations }
  end;

var
  frmSolicitacaoCompra: TfrmSolicitacaoCompra;

implementation

{$R *.dfm}


procedure TfrmSolicitacaoCompra.FormCreate(Sender: TObject);
begin
  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  dmFinanceiro := TdmFinanceiro.Create(Self);
  dmFinanceiro.Name := '';

  inherited;

  PesquisaPadrao := tppData;
  EditDataInicialPesquisa.Date := IncDay(Now, -7);;
  EditDataFinalPesquisa.Date := IncDay(Now, 7);

  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);

end;

end.
