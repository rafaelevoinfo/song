unit fmEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmuPrincipal, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, Vcl.ExtActns, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.StdActns, cxSpinEdit, cxMaskEdit, cxDropDownEdit,
  cxFontNameComboBox, cxGroupBox, Vcl.ExtCtrls, cxTextEdit, cxMemo, cxRichEdit,
  uUtils, cxDBRichEdit, Vcl.ComCtrls;

type
  TframeEditor = class(TFrame)
    pnFormatacao: TPanel;
    gbFonte: TcxGroupBox;
    cbFonte: TcxFontNameComboBox;
    EditFonteSize: TcxSpinEdit;
    ActionList1: TActionList;
    FormatRichEditBold1: TRichEditBold;
    FormatRichEditItalic1: TRichEditItalic;
    FormatRichEditUnderline1: TRichEditUnderline;
    FormatRichEditAlignLeft1: TRichEditAlignLeft;
    FormatRichEditAlignRight1: TRichEditAlignRight;
    FormatRichEditAlignCenter1: TRichEditAlignCenter;
    gbAlinhamento: TcxGroupBox;
    btnAlinhamentoEsquerda: TButton;
    btnAlinhamentoCentro: TButton;
    btnAlinhamentoDireita: TButton;
    btnNegrito: TButton;
    btnItalico: TButton;
    btnSublinhado: TButton;
    FormatRichEditBullets1: TRichEditBullets;
    btnBullet: TButton;
    pnRich: TPanel;
    Rich: TcxDBRichEdit;
  private
    { Private declarations }
  public
    procedure ppuIniciar;
  end;

implementation

{$R *.dfm}

{ TframeEditor }

procedure TframeEditor.ppuIniciar;
begin
  Rich.Width := TUtils.fpuCentimetroToPixel(21); // A4 = 21cm de largura
  Rich.Left := Trunc((pnRich.Width/2)-(Rich.Width/2));

  Rich.Top := 0;
  Rich.Height := pnRich.Height;
end;

end.
