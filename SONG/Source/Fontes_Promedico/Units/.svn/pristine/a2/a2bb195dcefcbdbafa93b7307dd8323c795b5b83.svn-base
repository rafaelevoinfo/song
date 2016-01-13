unit pChatTelaLeitoresMensagem;

interface

uses
  pDMChat,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, pZero, dxSkinsCore, pmPromedicoSkin,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, Vcl.StdCtrls, cxPC;

type
  TfrmChatTelaLeitoresMensagem = class(TfrmZero)
    pnlRodape: TPanel;
    bttRetornar: TButton;
    pnlLegenda: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label3: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    pnlMensagemNaoLida: TPanel;
    Label4: TLabel;
    cxGrid1DBTableView1NOME_PC: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_SENHAUS: TcxGridDBColumn;
    cxGrid1DBTableView1MENSAGEM_LIDA: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_HORA: TcxGridDBColumn;
    Shape3: TShape;
    procedure pmfrmZeroFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    DMChat: TDMChat;
    procedure ppvAcRetornar(Sender: TObject);
    { Private declarations }
  public
    procedure ppuLeitoresMensagem(const ipLeitores: OleVariant);
    { Public declarations }
  end;

var
  frmChatTelaLeitoresMensagem: TfrmChatTelaLeitoresMensagem;

implementation

{$R *.dfm}

procedure TfrmChatTelaLeitoresMensagem.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;

  if not VarIsNull(AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('MENSAGEM_LIDA').Index]) then
    begin
      if AViewInfo.GridRecord.Values[TcxGridDBTableView(Sender).GetColumnByFieldName('MENSAGEM_LIDA').Index] = '0' then
        begin
          ACanvas.Brush.Color := $009D9DFF; // vermelho mais claro;
          if AViewInfo.GridRecord.Selected then
            begin
              ACanvas.Brush.Color := $006666FF; // vermelho mais escuro
              ACanvas.Font.Color := clBlack;
            end;
        end;
    end;
end;

procedure TfrmChatTelaLeitoresMensagem.FormCreate(Sender: TObject);
begin
  inherited;

  // Inicializando as variáveis globais
  DMChat := TDMChat.Create(Self);
  DMChat.Name := '';

  // Configurando os actions
  DMChat.Ac_Retornar.OnExecute := ppvAcRetornar;
end;

procedure TfrmChatTelaLeitoresMensagem.pmfrmZeroFormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;

  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmChatTelaLeitoresMensagem.ppuLeitoresMensagem(
  const ipLeitores: OleVariant);
begin
  pnlLegenda.Visible := False;

  if VarIsNull(ipLeitores) then
    begin
      pnlMensagemNaoLida.Visible := True;
      cxGrid1.Visible := False;
    end
  else
    begin
      DMChat.cdsLeitoresMensagem.Close;
      DMChat.cdsLeitoresMensagem.Data := ipLeitores;
      cxGrid1.Visible := DMChat.cdsLeitoresMensagem.RecordCount > 0;
      pnlLegenda.Visible := (DMChat.cdsLeitoresMensagem.RecordCount > 0) and (DMChat.cdsLeitoresMensagemDESTINATARIO_USUARIO_GRUPO.AsInteger = 1);

      try
        DMChat.cdsLeitoresMensagem.Filtered := False;
        DMChat.cdsLeitoresMensagem.Filter := 'MENSAGEM_LIDA = 1';
        DMChat.cdsLeitoresMensagem.Filtered := True;
        pnlMensagemNaoLida.Visible := DMChat.cdsLeitoresMensagem.RecordCount = 0;
      finally
        DMChat.cdsLeitoresMensagem.Filtered := False;
        DMChat.cdsLeitoresMensagem.Filter := '';
      end;
    end;
end;

procedure TfrmChatTelaLeitoresMensagem.ppvAcRetornar(Sender: TObject);
begin
  Close;
end;

end.
