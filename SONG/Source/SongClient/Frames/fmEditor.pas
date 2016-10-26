unit fmEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmuPrincipal, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, Vcl.ExtActns, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.StdActns, cxSpinEdit, cxMaskEdit, cxDropDownEdit,
  cxFontNameComboBox, cxGroupBox, Vcl.ExtCtrls, cxTextEdit, cxMemo, cxRichEdit,
  uUtils, cxDBRichEdit, Vcl.ComCtrls, Vcl.ToolWin, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TframeEditor = class(TFrame)
    ActionListEditor: TActionList;
    FormatRichEditBold1: TRichEditBold;
    FormatRichEditItalic1: TRichEditItalic;
    FormatRichEditUnderline1: TRichEditUnderline;
    FormatRichEditAlignLeft1: TRichEditAlignLeft;
    FormatRichEditAlignRight1: TRichEditAlignRight;
    FormatRichEditAlignCenter1: TRichEditAlignCenter;
    FormatRichEditBullets1: TRichEditBullets;
    pnRich: TPanel;
    Rich: TcxDBRichEdit;
    ToolBar1: TToolBar;
    btnBold: TToolButton;
    btnItalico: TToolButton;
    btnSublinhado: TToolButton;
    btnMarcador: TToolButton;
    btnAlinharEsquerda: TToolButton;
    btnAlinharCentro: TToolButton;
    btnAlinharDireita: TToolButton;
    cbFonte: TcxFontNameComboBox;
    EditFonteSize: TcxSpinEdit;
    procedure RichPropertiesSelectionChange(Sender: TObject);
    procedure EditFonteSizePropertiesEditValueChanged(Sender: TObject);
    procedure cbFontePropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ppuIniciar;
  end;

const
  coInicioMarcador = '[§';
  coFimMarcador = '§]';

implementation

{$R *.dfm}

{ TframeEditor }

procedure TframeEditor.cbFontePropertiesEditValueChanged(Sender: TObject);
begin
  Rich.SelAttributes.Name := cbFonte.FontName;
  Application.Processmessages;
end;

procedure TframeEditor.EditFonteSizePropertiesEditValueChanged(Sender: TObject);
begin
  Rich.SelAttributes.Size := EditFonteSize.Value;
  Application.Processmessages;
end;

procedure TframeEditor.ppuIniciar;
begin
  Rich.Width := TUtils.fpuCentimetroToPixel(21)+23; //23 é por causa do scroll. A4 = 21cm de largura
  Rich.Left := Trunc((pnRich.Width / 2) - (Rich.Width / 2));

  Rich.Top := 2;
  Rich.Height := pnRich.Height;

   cbFonte.LockChangeEvents(true);
   EditFonteSize.LockChangeEvents(true);
  try
    cbFonte.FontName := 'Calibri';
    EditFonteSize.Value := 12;

    Rich.SelAttributes.Name := cbFonte.FontName;
    Rich.SelAttributes.Size := EditFonteSize.Value;
  finally
     EditFonteSize.LockChangeEvents(false, false);
     cbFonte.LockChangeEvents(false, false);
  end;
end;

procedure TframeEditor.RichPropertiesSelectionChange(Sender: TObject);
begin
   cbFonte.LockChangeEvents(true);
   EditFonteSize.LockChangeEvents(true);
  try
    cbFonte.FontName := Rich.SelAttributes.Name;
    EditFonteSize.Value := Rich.SelAttributes.Size;

  finally
     EditFonteSize.LockChangeEvents(false, false);
     cbFonte.LockChangeEvents(false, false);
  end;
end;

end.
