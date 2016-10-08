unit fmEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dmuPrincipal, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, Vcl.ExtActns, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.StdActns, cxSpinEdit, cxMaskEdit, cxDropDownEdit,
  cxFontNameComboBox, cxGroupBox, Vcl.ExtCtrls, cxTextEdit, cxMemo, cxRichEdit;

type
  TframeEditor = class(TFrame)
    pnFormatacao: TPanel;
    gbFonte: TcxGroupBox;
    cxFontNameComboBox1: TcxFontNameComboBox;
    EditFonteSize: TcxSpinEdit;
    ActionList1: TActionList;
    FormatRichEditBold1: TRichEditBold;
    FormatRichEditItalic1: TRichEditItalic;
    FormatRichEditUnderline1: TRichEditUnderline;
    FormatRichEditAlignLeft1: TRichEditAlignLeft;
    FormatRichEditAlignRight1: TRichEditAlignRight;
    FormatRichEditAlignCenter1: TRichEditAlignCenter;
    gbAlinhamento: TcxGroupBox;
    Button1: TButton;
    btnAlinhamentoCentro: TButton;
    btnAlinhamentoDireita: TButton;
    btnNegrito: TButton;
    btnItalico: TButton;
    btnSublinhado: TButton;
    FormatRichEditBullets1: TRichEditBullets;
    btnBullet: TButton;
    pnRich: TPanel;
    Rich: TcxRichEdit;
    procedure EditFonteSizePropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TframeEditor.EditFonteSizePropertiesEditValueChanged(Sender: TObject);
begin
  Rich.Style.Font.
end;

end.
