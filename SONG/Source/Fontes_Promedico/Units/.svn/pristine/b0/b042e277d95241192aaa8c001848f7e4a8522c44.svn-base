unit pChatComponentes;

interface

uses
  Winapi.Messages, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, pChatTipos, System.SysUtils, Vcl.ImgList, Vcl.Forms,
  Winapi.Windows, Vcl.Samples.Gauges;

type
  // Eventos
  TChatAfterChangeSelectCtrl = procedure(const SelecionadoCtrl: Boolean) of object;
  TChatBeforeChangeSelectCtrl = procedure(var SelecionadoCtrl: Boolean) of object;

  // Classes
  TChatImage = class(TImage)
  private
    FOnCMMouseEnter: TNotifyEvent;
    FOnCMMouseLeave: TNotifyEvent;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure SetOnCMMouseEnter(const Value: TNotifyEvent);
    procedure SetOnCMMouseLeave(const Value: TNotifyEvent);
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    property OnCMMouseEnter: TNotifyEvent read FOnCMMouseEnter write SetOnCMMouseEnter;
    property OnCMMouseLeave: TNotifyEvent read FOnCMMouseLeave write SetOnCMMouseLeave;
    { Public declarations }
  end;

  TChatButton = class(TButton)
  private
    FCustomForm: TCustomForm;
    FActiveControl: TWinControl;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    { Public declarations }
  published
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    { Published declarations }
  end;

  TChatPanel = class(TPanel)
  private
    FBotaoFechar: TChatButton;
    FCorFonte: TColor;
    FCorPanel: TColor;
    FIdentificador: string;
    FImagem: TImage;
    FImgMouseMovePanel: TChatImage;
    FLabelInferior: TLabel;
    FLabelSuperior: TLabel;
    FMouseInControl: Boolean;
    FOnClose: TNotifyEvent;
    FPodeFechar: Boolean;
    function GetFotoThumbnail: TPicture;
    function GetTextoInferior: string;
    function GetTextoSuperior: string;
    procedure ppvFechar(Sender: TObject);
    procedure ppvOnClick(Sender: TObject);
    procedure ppvOnMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SetFotoThumbnail(const Value: TPicture);
    procedure SetIdentificador(const Value: string);
    procedure SetOnClose(const Value: TNotifyEvent);
    procedure SetPodeFechar(const Value: Boolean);
    procedure SetTextoInferior(const Value: string);
    procedure SetTextoSuperior(const Value: string);
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    { Private declarations }
  protected
    procedure pptAjustarPosicaoVerticalComponentes; virtual;
    procedure pptOnCMMouseEnter(Sender: TObject); virtual;
    procedure pptOnCMMouseLeave(Sender: TObject); virtual;
    procedure SetCorFonte(const Value: TColor); virtual;
    procedure SetCorPanel(const Value: TColor); virtual;
    property LabelInferior: TLabel read FLabelInferior;
    property LabelSuperior: TLabel read FLabelSuperior;
    property MouseInControl: Boolean read FMouseInControl;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    procedure Close;
    procedure ppuImagemBotaoFechar(const ipCustomImageList: TCustomImageList; const ipIndex: Integer);
    property CorFonte: TColor read FCorFonte write SetCorFonte;
    property CorPanel: TColor read FCorPanel write SetCorPanel;
    property FotoThumbnail: TPicture read GetFotoThumbnail write SetFotoThumbnail;
    property Identificador: string read FIdentificador write SetIdentificador;
    property PodeFechar: Boolean read FPodeFechar write SetPodeFechar;
    property OnClose: TNotifyEvent read FOnClose write SetOnClose;
    property TextoInferior: string read GetTextoInferior write SetTextoInferior;
    property TextoSuperior: string read GetTextoSuperior write SetTextoSuperior;
    { Public declarations }
  end;

  TChatPanelArquivo = class(TChatPanel)
  private
    FEnderecoArquivo: string;
    FTipoArquivo: TChatTipoArquivo;
    procedure SetEnderecoArquivo(const Value: string);
    procedure SetTipoArquivo(const Value: TChatTipoArquivo);
    { Public declarations }
  public
    constructor Create(AOwner: TComponent); override;
    property EnderecoArquivo: string read FEnderecoArquivo write SetEnderecoArquivo;
    property TipoArquivo: TChatTipoArquivo read FTipoArquivo write SetTipoArquivo;
    { Published declarations }
  end;

  TChatPanelConversa = class(TChatPanel)
  private
    FStatus: Integer;
    FShapeStatus: TShape;
    procedure SetStatus(const Value: Integer);
    { Public declarations }
  protected
    procedure pptAjustarPosicaoVerticalComponentes; override;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    property Status: Integer read FStatus write SetStatus;
    { Published declarations }
  end;

  TChatPanelConversaAba = class(TChatPanelConversa)
  private
    FCorFonteNotificacao: TColor;
    FCorFonteSelecionado: TColor;
    FCorFonteSelecionadoCtrl: TColor;
    FCorPanelNotificacao: TColor;
    FCorPanelSelecionado: TColor;
    FCorPanelSelecionadoCtrl: TColor;
    FMensagem: TChatMensagem;
    FNotificacao: Boolean;
    FNotificacaoTimer: TTimer;
    FNotificacaoTimerCount: Integer;
    FOnAfterChangeSelectCtrl: TChatAfterChangeSelectCtrl;
    FOnBeforeChangeSelectCtrl: TChatBeforeChangeSelectCtrl;
    FOnChangeSelect: TNotifyEvent;
    FOnChangeSelectCtrl: TNotifyEvent;
    FSelecionado: Boolean;
    FTipoAba: TChatTipoAba;
    FSelecionadoCtrl: Boolean;
    FSelecionarCtrlPermitido: Boolean;
    procedure ppvNotificacaoOnTimer(Sender: TObject);
    procedure SetCorFonteNotificacao(const Value: TColor);
    procedure SetCorFonteSelecionado(const Value: TColor);
    procedure SetCorFonteSelecionadoCtrl(const Value: TColor);
    procedure SetCorPanelNotificacao(const Value: TColor);
    procedure SetCorPanelSelecionado(const Value: TColor);
    procedure SetCorPanelSelecionadoCtrl(const Value: TColor);
    procedure SetNotificacao(const Value: Boolean);
    procedure SetOnAfterChangeSelectCtrl(const Value: TChatAfterChangeSelectCtrl);
    procedure SetOnBeforeChangeSelectCtrl(const Value: TChatBeforeChangeSelectCtrl);
    procedure SetOnChangeSelect(const Value: TNotifyEvent);
    procedure SetOnChangeSelectCtrl(const Value: TNotifyEvent);
    procedure SetSelecionado(const Value: Boolean);
    procedure SetSelecionadoCtrl(const Value: Boolean);
    procedure SetSelecionarCtrlPermitido(const Value: Boolean);
    procedure SetTipoAba(const Value: TChatTipoAba);
    { Public declarations }
  protected
    procedure pptOnCMMouseLeave(Sender: TObject); override;
    procedure SetCorFonte(const Value: TColor); override;
    procedure SetCorPanel(const Value: TColor); override;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Click; override;
    property CorFonteNotificacao: TColor read FCorFonteNotificacao write SetCorFonteNotificacao;
    property CorFonteSelecionado: TColor read FCorFonteSelecionado write SetCorFonteSelecionado;
    property CorFonteSelecionadoCtrl: TColor read FCorFonteSelecionadoCtrl write SetCorFonteSelecionadoCtrl;
    property CorPanelNotificacao: TColor read FCorPanelNotificacao write SetCorPanelNotificacao;
    property CorPanelSelecionado: TColor read FCorPanelSelecionado write SetCorPanelSelecionado;
    property CorPanelSelecionadoCtrl: TColor read FCorPanelSelecionadoCtrl write SetCorPanelSelecionadoCtrl;
    property Mensagem: TChatMensagem read FMensagem;
    property Notificacao: Boolean read FNotificacao write SetNotificacao;
    property OnAfterChangeSelectCtrl: TChatAfterChangeSelectCtrl read FOnAfterChangeSelectCtrl write SetOnAfterChangeSelectCtrl;
    property OnBeforeChangeSelectCtrl: TChatBeforeChangeSelectCtrl read FOnBeforeChangeSelectCtrl write SetOnBeforeChangeSelectCtrl;
    property OnChangeSelect: TNotifyEvent read FOnChangeSelect write SetOnChangeSelect;
    property OnChangeSelectCtrl: TNotifyEvent read FOnChangeSelectCtrl write SetOnChangeSelectCtrl;
    property Selecionado: Boolean read FSelecionado write SetSelecionado;
    property SelecionadoCtrl: Boolean read FSelecionadoCtrl write SetSelecionadoCtrl;
    property SelecionarCtrlPermitido: Boolean read FSelecionarCtrlPermitido write SetSelecionarCtrlPermitido;
    property TipoAba: TChatTipoAba read FTipoAba write SetTipoAba;
    { Published declarations }
  end;

  TChatPanelBarraProgresso = class(TPanel)
  private
    FGauge: TGauge;
    FImagem: TImage;
    FLabel: TLabel;
    function GetCorIndicadorProgresso: TColor;
    function GetExibirFotoThumbnail: Boolean;
    function GetFotoThumbnail: TPicture;
    function GetProgresso: Integer;
    function GetTitulo: string;
    function GetValorMaximo: Integer;
    function GetValorMinimo: Integer;
    procedure SetCorIndicadorProgresso(const Value: TColor);
    procedure SetExibirFotoThumbnail(const Value: Boolean);
    procedure SetFotoThumbnail(const Value: TPicture);
    procedure SetProgresso(const Value: Integer);
    procedure SetTitulo(const Value: string);
    procedure SetValorMaximo(const Value: Integer);
    procedure SetValorMinimo(const Value: Integer);
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    property CorIndicadorProgresso: TColor read GetCorIndicadorProgresso write SetCorIndicadorProgresso;
    property ExibirFotoThumbnail: Boolean read GetExibirFotoThumbnail write SetExibirFotoThumbnail;
    property FotoThumbnail: TPicture read GetFotoThumbnail write SetFotoThumbnail;
    property Progresso: Integer read GetProgresso write SetProgresso;
    property Titulo: string read GetTitulo write SetTitulo;
    property ValorMaximo: Integer read GetValorMaximo write SetValorMaximo;
    property ValorMinimo: Integer read GetValorMinimo write SetValorMinimo;
    { Public declarations }
  end;

implementation

{ TChatImage }

procedure TChatImage.CMMouseEnter(var Message: TMessage);
begin
  inherited;

  if (not (csDesigning in ComponentState)) and Assigned(FOnCMMouseEnter) then
    FOnCMMouseEnter(Self);
end;

procedure TChatImage.CMMouseLeave(var Message: TMessage);
begin
  inherited;

  if (not (csDesigning in ComponentState)) and Assigned(FOnCMMouseLeave) then
    FOnCMMouseLeave(Self);
end;

constructor TChatImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOnCMMouseEnter := nil;
  FOnCMMouseLeave := nil;
end;

procedure TChatImage.SetOnCMMouseEnter(const Value: TNotifyEvent);
begin
  FOnCMMouseEnter := Value;
end;

procedure TChatImage.SetOnCMMouseLeave(const Value: TNotifyEvent);
begin
  FOnCMMouseLeave := Value;
end;

{ TChatButton }

procedure TChatButton.CMMouseEnter(var Message: TMessage);
begin
  inherited;

  if (not (csDesigning in ComponentState)) then
    begin
      Font.Style := [fsBold];
      FCustomForm := GetParentForm(Self);

      if Assigned(FCustomForm) then
        FActiveControl := FCustomForm.ActiveControl;
    end;
end;

procedure TChatButton.CMMouseLeave(var Message: TMessage);
begin
  inherited;

  if (not (csDesigning in ComponentState)) then
    Font.Style := [];
end;

constructor TChatButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCustomForm := nil;
  FActiveControl := nil;
end;

procedure TChatButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;

  if (not (csDesigning in ComponentState)) and Self.Focused and Assigned(FCustomForm) and Assigned(FActiveControl) and FActiveControl.Showing and FActiveControl.Visible then
    FCustomForm.ActiveControl := FActiveControl;
end;

{ TChatPanel }

procedure TChatPanel.Close;
begin
  if FPodeFechar then
    begin
      if Assigned(FOnClose) then
        FOnClose(Self);

      Self.Free;
    end;
end;

constructor TChatPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  // Definindo as características do panel. Este panel será uma a "guia do usuário" na tela
  ShowCaption := False;
  Height := 35;
  ParentBackground := False;

  FMouseInControl := False;
  FOnClose := nil;
  FPodeFechar := True;
  FIdentificador := '';

  // Criando a imagem
  FImagem := TImage.Create(Self);
  FImagem.Parent := Self;
  FImagem.Center := True;
  FImagem.AutoSize := False;
  FImagem.Left := 1;
  FImagem.Top := 1;
  FImagem.Width := 33;
  FImagem.Height := 33;

  // Criando o label superior
  FLabelSuperior := TLabel.Create(Self);
  FLabelSuperior.Parent := Self;
  FLabelSuperior.Name := 'LabelSuperior';
  FLabelSuperior.Left := 36;
  FLabelSuperior.Top := 4;
  FLabelSuperior.Width := Self.Width - 67;
  FLabelSuperior.Anchors := [akLeft, akTop, akRight];
  FLabelSuperior.AutoSize := False;
  FLabelSuperior.Caption := '';

  // Criando o label inferior
  FLabelInferior := TLabel.Create(Self);
  FLabelInferior.Parent := Self;
  FLabelInferior.Name := 'LabelInferior';
  FLabelInferior.Left := 36;
  FLabelInferior.Top := 18;
  FLabelInferior.Width := Self.Width - 67;
  FLabelInferior.Anchors := [akLeft, akTop, akRight];
  FLabelInferior.AutoSize := False;
  FLabelInferior.Caption := '';

  // Criando um botão para fechar a conversa
  FBotaoFechar := TChatButton.Create(Self);
  FBotaoFechar.Parent := Self;
  FBotaoFechar.Name := 'sdbFechar';
  FBotaoFechar.Caption := 'X';
  FBotaoFechar.Align := alRight;
  FBotaoFechar.AlignWithMargins := True;
  FBotaoFechar.Margins.Right := 4;
  FBotaoFechar.Width := 22;
  FBotaoFechar.TabStop := False;
  FBotaoFechar.ImageAlignment := TImageAlignment.iaCenter;
  FBotaoFechar.OnClick := ppvFechar;

  // Criando uma imagem que vai ficar por cima de todos os componentes do
  // panel, exceto o speedbutton, para que receba todos os eventos de mouse
  FImgMouseMovePanel := TChatImage.Create(Self);
  FImgMouseMovePanel.Parent := Self;
  FImgMouseMovePanel.Align := alClient;
  FImgMouseMovePanel.Name := 'imgAlClient';
  FImgMouseMovePanel.OnClick := ppvOnClick;
  FImgMouseMovePanel.OnCMMouseEnter := pptOnCMMouseEnter;
  FImgMouseMovePanel.OnCMMouseLeave := pptOnCMMouseLeave;
  FImgMouseMovePanel.OnMouseUp := ppvOnMouseUp;

  // Definindo cores
  FCorFonte := FLabelSuperior.Font.Color;
  FCorPanel := Self.Color;

  // Ajustando a posição dos componentes no panel
  pptAjustarPosicaoVerticalComponentes;
end;

function TChatPanel.GetFotoThumbnail: TPicture;
begin
  Result := FImagem.Picture;
end;

function TChatPanel.GetTextoInferior: string;
begin
  Result := '';

  if Assigned(FLabelInferior) then
    Result := FLabelInferior.Caption;
end;

function TChatPanel.GetTextoSuperior: string;
begin
  Result := '';

  if Assigned(FLabelSuperior) then
    Result := FLabelSuperior.Caption;
end;

procedure TChatPanel.pptAjustarPosicaoVerticalComponentes;
begin
  // Ajustando a imagem
  if Self.Height <= 35 then
    FImagem.Top := 1
  else
    FImagem.Top := (Self.Height - FImagem.Height) div 2;

  // Ajustando os labels
  if Assigned(FLabelSuperior) and Assigned(FLabelInferior) then
    begin
      if (FLabelSuperior.Caption <> '') and (FLabelInferior.Caption <> '') then
        begin
          FLabelSuperior.Top := (Self.Height - 27) div 2;
          FLabelInferior.Top := FLabelSuperior.Top + FLabelSuperior.Height + 1;
        end
      else
        begin
          if FLabelSuperior.Caption <> '' then
            FLabelSuperior.Top := (Self.Height - 13) div 2
          else
            FLabelInferior.Top := (Self.Height - 13) div 2;
        end;
    end;

  // Ajustando o botão fechar
  if Assigned(FBotaoFechar) then
    begin
      FBotaoFechar.Margins.Top := (Self.Height - 22) div 2;
      FBotaoFechar.Margins.Bottom := Self.Height - FBotaoFechar.Margins.Top - 22;
    end;
end;

procedure TChatPanel.pptOnCMMouseEnter(Sender: TObject);
begin
  FMouseInControl := True;
  FLabelSuperior.Font.Style := [fsBold, fsItalic];
  FLabelInferior.Font.Style := [fsBold, fsItalic];

  if Assigned(Self.OnMouseEnter) then
    Self.OnMouseEnter(Self);
end;

procedure TChatPanel.pptOnCMMouseLeave(Sender: TObject);
begin
  FMouseInControl := False;
  FLabelSuperior.Font.Style := [];
  FLabelInferior.Font.Style := [];

  if Assigned(Self.OnMouseLeave) then
    Self.OnMouseLeave(Self);
end;

procedure TChatPanel.ppuImagemBotaoFechar(
  const ipCustomImageList: TCustomImageList; const ipIndex: Integer);
begin
  if (ipIndex >= 0) and Assigned(ipCustomImageList) then
    begin
      FBotaoFechar.Images := ipCustomImageList;
      FBotaoFechar.ImageIndex := ipIndex;
      FBotaoFechar.Caption := '';
    end
  else
    begin
      FBotaoFechar.ImageIndex := -1;
      FBotaoFechar.Images := nil;
      FBotaoFechar.Caption := 'X';
    end;
end;

procedure TChatPanel.ppvFechar(Sender: TObject);
begin
  Self.Close;
end;

procedure TChatPanel.ppvOnClick(Sender: TObject);
begin
  Self.Click;
end;

procedure TChatPanel.ppvOnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Self.MouseUp(Button, Shift, X, Y);
end;

procedure TChatPanel.SetCorFonte(const Value: TColor);
begin
  FCorFonte := Value;
  FLabelInferior.Font.Color := FCorFonte;
  FLabelSuperior.Font.Color := FCorFonte;
end;

procedure TChatPanel.SetCorPanel(const Value: TColor);
begin
  FCorPanel := Value;
  Self.Color := FCorPanel;
end;

procedure TChatPanel.SetFotoThumbnail(const Value: TPicture);
begin
  if Assigned(Value) then
    FImagem.Picture.Assign(Value);
end;

procedure TChatPanel.SetIdentificador(const Value: string);
begin
  FIdentificador := Value;
end;

procedure TChatPanel.SetOnClose(const Value: TNotifyEvent);
begin
  FOnClose := Value;
end;

procedure TChatPanel.SetPodeFechar(const Value: Boolean);
begin
  if FPodeFechar <> Value then
    begin
      FPodeFechar := Value;

      if Assigned(FBotaoFechar) then
        FBotaoFechar.Visible := FPodeFechar;

      if FBotaoFechar.Visible then
        FLabelSuperior.Width := Self.Width - FLabelSuperior.Left - 25
      else
        FLabelSuperior.Width := Self.Width - FLabelSuperior.Left - 4;

      FLabelInferior.Width := FLabelSuperior.Width;
    end;
end;

procedure TChatPanel.SetTextoInferior(const Value: string);
begin
  if Assigned(FLabelInferior) then
    FLabelInferior.Caption := Value;

  pptAjustarPosicaoVerticalComponentes;
end;

procedure TChatPanel.SetTextoSuperior(const Value: string);
begin
  if Assigned(FLabelSuperior) then
    FLabelSuperior.Caption := Value;

  pptAjustarPosicaoVerticalComponentes;
end;

procedure TChatPanel.WMSize(var Message: TWMSize);
begin
  inherited;
  pptAjustarPosicaoVerticalComponentes;
end;

{ TChatPanelArquivo }

constructor TChatPanelArquivo.Create(AOwner: TComponent);
begin
  inherited;
  FEnderecoArquivo := '';
  FTipoArquivo := TChatTipoArquivo.taqOutros;
end;

procedure TChatPanelArquivo.SetEnderecoArquivo(const Value: string);
begin
  FEnderecoArquivo := Value;
end;

procedure TChatPanelArquivo.SetTipoArquivo(const Value: TChatTipoArquivo);
begin
  FTipoArquivo := Value;
end;

{ TChatPanelConversa }

constructor TChatPanelConversa.Create(AOwner: TComponent);
begin
  inherited;
  FStatus := 0;

  // Criando o shape status
  FShapeStatus := TShape.Create(Self);
  FShapeStatus.Parent := Self;
  FShapeStatus.Name := 'shpStatus';
  FShapeStatus.Left := 1;
  FShapeStatus.Top := 1;
  FShapeStatus.Height := 33;
  FShapeStatus.Width := 5;
  FShapeStatus.Brush.Color := clGrayText;
  FShapeStatus.Pen.Style := psClear;

  // Ajustando a imagem
  FImagem.Left := 7;

  // Ajustando o label superior
  LabelSuperior.Left := 42;

  // Ajustando o label inferior
  LabelInferior.Left := LabelSuperior.Left;
end;

procedure TChatPanelConversa.pptAjustarPosicaoVerticalComponentes;
begin
  inherited;

  // Ajustando o shape do status e a imagem
  if Assigned(FShapeStatus) and Assigned(FImagem) then
    begin
      FShapeStatus.Top := (Self.Height - FShapeStatus.Height) div 2;
      FImagem.Top := FShapeStatus.Top;
    end;
end;

procedure TChatPanelConversa.SetStatus(const Value: Integer);
begin
  if Assigned(FShapeStatus) then
    begin
      FShapeStatus.Visible := (Value >= 0) and (Value <= 2);

      case Value of
        0: // Desconectado
          begin
            FStatus := 0;
            FShapeStatus.Brush.Color := clGrayText;
          end;
        1: // Conectado
          begin
            FStatus := 1;
            FShapeStatus.Brush.Color := clGreen;
          end;
        2: // Ausente
          begin
            FStatus := 2;
            FShapeStatus.Brush.Color := $0001C8EB;
          end;
      end;
    end;
end;

{ TChatPanelConversaAba }

procedure TChatPanelConversaAba.Click;
begin
  inherited;

  if (GetKeyState(VK_CONTROL) and 128 > 0) then
    Self.SelecionadoCtrl := not Self.SelecionadoCtrl
  else
    Self.Selecionado := True;
end;

constructor TChatPanelConversaAba.Create(AOwner: TComponent);
begin
  inherited;
  FCorFonteNotificacao := clWhite;
  FCorFonteSelecionado := clWindowText;
  FCorFonteSelecionadoCtrl := clWindowText;
  FCorPanelNotificacao := clRed;
  FCorPanelSelecionado := clSilver;
  FCorPanelSelecionadoCtrl := $00F8E3D1;
  FMensagem := TChatMensagem.Create;
  FNotificacao := False;
  FNotificacaoTimer := nil;
  FNotificacaoTimerCount := 0;
  FOnChangeSelect := nil;
  FOnChangeSelectCtrl := nil;
  FSelecionado := False;
  FSelecionadoCtrl := False;
  FSelecionarCtrlPermitido := True;
  FTipoAba := TChatTipoAba.taConfiguracao;
end;

destructor TChatPanelConversaAba.Destroy;
begin
  if Assigned(FMensagem) then
    FreeAndNil(FMensagem);

  if Assigned(FNotificacaoTimer) then
    begin
      FNotificacaoTimer.Enabled := False;
      FreeAndNil(FNotificacaoTimer);
    end;

  inherited;
end;

procedure TChatPanelConversaAba.pptOnCMMouseLeave(Sender: TObject);
begin
  inherited;

  if Notificacao or Selecionado then
    begin
      LabelSuperior.Font.Style := [fsBold];
      LabelInferior.Font.Style := [fsBold];
    end;
end;

procedure TChatPanelConversaAba.ppvNotificacaoOnTimer(Sender: TObject);
begin
  if FNotificacaoTimerCount < 0 then
    FNotificacaoTimerCount := 0
  else
    begin
      if FNotificacaoTimerCount > 1 then
        FNotificacaoTimerCount := 0;
    end;

  case FNotificacaoTimerCount of
    0:
      begin
        LabelSuperior.Font.Color := FCorFonteNotificacao;
        Self.Color := FCorPanelNotificacao;
      end;
    1:
      begin
        if FSelecionadoCtrl then
          begin
            LabelSuperior.Font.Color := FCorFonteSelecionadoCtrl;
            Self.Color := FCorPanelSelecionadoCtrl
          end
        else
          begin
            LabelSuperior.Font.Color := CorFonte;
            Self.Color := CorPanel;
          end;
      end;
  end;

  LabelInferior.Font.Color := LabelSuperior.Font.Color;
  Inc(FNotificacaoTimerCount);
end;

procedure TChatPanelConversaAba.SetCorFonte(const Value: TColor);
begin
  inherited;

  if FNotificacao then
    LabelSuperior.Font.Color := FCorFonteNotificacao
  else
    begin
      if FSelecionado then
        LabelSuperior.Font.Color := FCorFonteSelecionado
      else
        begin
          if FSelecionadoCtrl then
            LabelSuperior.Font.Color := FCorFonteSelecionadoCtrl;
        end;
    end;

  LabelInferior.Font.Color := LabelSuperior.Font.Color;
end;

procedure TChatPanelConversaAba.SetCorFonteNotificacao(const Value: TColor);
begin
  FCorFonteNotificacao := Value;

  if FNotificacao then
    begin
      LabelSuperior.Font.Color := FCorFonteNotificacao;
      LabelInferior.Font.Color := LabelSuperior.Font.Color;
    end;
end;

procedure TChatPanelConversaAba.SetCorFonteSelecionado(const Value: TColor);
begin
  FCorFonteSelecionado := Value;

  if FSelecionado then
    begin
      LabelSuperior.Font.Color := FCorFonteSelecionado;
      LabelInferior.Font.Color := LabelSuperior.Font.Color;
    end;
end;

procedure TChatPanelConversaAba.SetCorFonteSelecionadoCtrl(const Value: TColor);
begin
  FCorFonteSelecionadoCtrl := Value;

  if FSelecionadoCtrl then
    begin
      LabelSuperior.Font.Color := FCorFonteSelecionadoCtrl;
      LabelInferior.Font.Color := LabelSuperior.Font.Color;
    end;
end;

procedure TChatPanelConversaAba.SetCorPanel(const Value: TColor);
begin
  inherited;

  if FNotificacao then
    Self.Color := FCorPanelNotificacao
  else
    begin
      if FSelecionado then
        Self.Color := FCorPanelSelecionado
      else
        begin
          if FSelecionadoCtrl then
            Self.Color := FCorPanelSelecionadoCtrl;
        end;
    end;
end;

procedure TChatPanelConversaAba.SetCorPanelNotificacao(const Value: TColor);
begin
  FCorPanelNotificacao := Value;

  if FNotificacao then
    Self.Color := FCorPanelNotificacao;
end;

procedure TChatPanelConversaAba.SetCorPanelSelecionado(const Value: TColor);
begin
  FCorPanelSelecionado := Value;

  if FSelecionado then
    Self.Color := FCorPanelSelecionado;
end;

procedure TChatPanelConversaAba.SetCorPanelSelecionadoCtrl(const Value: TColor);
begin
  FCorPanelSelecionadoCtrl := Value;

  if FSelecionadoCtrl then
    Self.Color := FCorPanelSelecionadoCtrl;
end;

procedure TChatPanelConversaAba.SetNotificacao(const Value: Boolean);
var
  vaPiscar: Boolean;
begin
  vaPiscar := FNotificacao <> Value;
  FNotificacao := Value and (not FSelecionado);

  if FNotificacao then
    begin
      if vaPiscar then
        begin
          if MouseInControl then
            LabelSuperior.Font.Style := [fsBold, fsItalic]
          else
            LabelSuperior.Font.Style := [fsBold];

          LabelInferior.Font := LabelSuperior.Font;

          if not Assigned(FNotificacaoTimer) then
            FNotificacaoTimer := TTimer.Create(Self);

          FNotificacaoTimer.Enabled := False;
          FNotificacaoTimerCount := 0;
          FNotificacaoTimer.Interval := 500;
          FNotificacaoTimer.OnTimer := ppvNotificacaoOnTimer;
          FNotificacaoTimer.Enabled := True;
        end;
    end
  else
    begin
      if Assigned(FNotificacaoTimer) then
        begin
          FNotificacaoTimer.Enabled := False;
          FreeAndNil(FNotificacaoTimer);
        end;

      if FSelecionado then
        begin
          LabelSuperior.Font.Color := FCorFonteSelecionado;
          Self.Color := FCorPanelSelecionado;

          if MouseInControl then
            LabelSuperior.Font.Style := [fsBold, fsItalic]
          else
            LabelSuperior.Font.Style := [fsBold];
        end
      else
        begin
          if FSelecionadoCtrl then
            begin
              LabelSuperior.Font.Color := FCorFonteSelecionadoCtrl;
              Self.Color := FCorPanelSelecionadoCtrl;
            end
          else
            begin
              LabelSuperior.Font.Color := CorFonte;
              Self.Color := CorPanel;
            end;

          if MouseInControl then
            LabelSuperior.Font.Style := [fsBold, fsItalic]
          else
            LabelSuperior.Font.Style := [];
        end;

      LabelInferior.Font := LabelSuperior.Font;
    end;
end;

procedure TChatPanelConversaAba.SetOnAfterChangeSelectCtrl(
  const Value: TChatAfterChangeSelectCtrl);
begin
  FOnAfterChangeSelectCtrl := Value;
end;

procedure TChatPanelConversaAba.SetOnBeforeChangeSelectCtrl(
  const Value: TChatBeforeChangeSelectCtrl);
begin
  FOnBeforeChangeSelectCtrl := Value;
end;

procedure TChatPanelConversaAba.SetOnChangeSelect(const Value: TNotifyEvent);
begin
  FOnChangeSelect := Value;
end;

procedure TChatPanelConversaAba.SetOnChangeSelectCtrl(
  const Value: TNotifyEvent);
begin
  FOnChangeSelectCtrl := Value;
end;

procedure TChatPanelConversaAba.SetSelecionado(const Value: Boolean);
begin
  if FSelecionado <> Value then
    begin
      FSelecionado := Value;

      if FSelecionado then
        begin
          if FNotificacao then
            Notificacao := False;

          if FSelecionadoCtrl then
            SelecionadoCtrl := False;

          Self.Color := FCorPanelSelecionado;
          Self.BevelOuter := bvNone;
          LabelSuperior.Font.Color := FCorFonteSelecionado;

          if MouseInControl then
            LabelSuperior.Font.Style := [fsBold, fsItalic]
          else
            LabelSuperior.Font.Style := [fsBold];
        end
      else
        begin
          Self.Color := CorPanel;
          Self.BevelOuter := bvRaised;
          LabelSuperior.Font.Color := CorFonte;

          if MouseInControl then
            LabelSuperior.Font.Style := [fsBold, fsItalic]
          else
            LabelSuperior.Font.Style := [];
        end;

       // Atribuindo ao label inferior a mesma configuração de fonte do label superior
       LabelInferior.Font := LabelSuperior.Font;

      if Assigned(FOnChangeSelect) then
        FOnChangeSelect(Self);
    end;
end;

procedure TChatPanelConversaAba.SetSelecionadoCtrl(const Value: Boolean);
var
  vaNewValue: Boolean;
begin
  if (FSelecionadoCtrl <> (Value and (not FSelecionado))) and
    (FSelecionadoCtrl or ((not FSelecionadoCtrl) and FSelecionarCtrlPermitido)) then
    begin
      vaNewValue := Value;

      if Assigned(FOnBeforeChangeSelectCtrl) then
        FOnBeforeChangeSelectCtrl(vaNewValue);

      if vaNewValue and ((not FSelecionarCtrlPermitido) or FSelecionado) then
        vaNewValue := False;

      if vaNewValue <> FSelecionadoCtrl then
        begin
          FSelecionadoCtrl := (vaNewValue and FSelecionarCtrlPermitido and (not FSelecionado));

          if FSelecionadoCtrl then
            begin
              LabelSuperior.Font.Color := FCorFonteSelecionadoCtrl;
              Self.Color := FCorPanelSelecionadoCtrl;
            end
          else
            begin
              LabelSuperior.Font.Color := CorFonte;
              Self.Color := CorPanel;
            end;

          if MouseInControl then
            LabelSuperior.Font.Style := [fsBold, fsItalic]
          else
            LabelSuperior.Font.Style := [];

          LabelInferior.Font := LabelSuperior.Font;

          if Assigned(FOnChangeSelectCtrl) then
            FOnChangeSelectCtrl(Self);

          if Assigned(FOnAfterChangeSelectCtrl) then
            FOnAfterChangeSelectCtrl(Self.SelecionadoCtrl);
        end;
    end;
end;

procedure TChatPanelConversaAba.SetSelecionarCtrlPermitido(
  const Value: Boolean);
begin
  FSelecionarCtrlPermitido := Value;

  if (FSelecionadoCtrl and (not FSelecionarCtrlPermitido)) then
    SelecionadoCtrl := False;
end;

procedure TChatPanelConversaAba.SetTipoAba(const Value: TChatTipoAba);
begin
  FTipoAba := Value;
end;

{ TChatPanelBarraProgresso }

constructor TChatPanelBarraProgresso.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.Width := 161;
  Self.ShowCaption := False;

  FGauge := TGauge.Create(Self);
  FGauge.Parent := Self;
  FGauge.Height := 17;
  FGauge.Left := 40;
  FGauge.Top := 20;
  FGauge.Width := 116;

  FImagem := TImage.Create(Self);
  FImagem.Parent := Self;
  FImagem.Center := True;
  FImagem.AutoSize := False;
  FImagem.Height := 33;
  FImagem.Left := 4;
  FImagem.Top := 4;
  FImagem.Width := 33;

  FLabel := TLabel.Create(Self);
  FLabel.Parent := Self;
  FLabel.AutoSize := False;
  FLabel.Left := 40;
  FLabel.Top := 4;
  FLabel.Width := 116;
end;

function TChatPanelBarraProgresso.GetCorIndicadorProgresso: TColor;
begin
  Result := FGauge.ForeColor;
end;

function TChatPanelBarraProgresso.GetExibirFotoThumbnail: Boolean;
begin
  Result := FImagem.Visible;
end;

function TChatPanelBarraProgresso.GetFotoThumbnail: TPicture;
begin
  Result := FImagem.Picture;
end;

function TChatPanelBarraProgresso.GetProgresso: Integer;
begin
  Result := FGauge.Progress;
end;

function TChatPanelBarraProgresso.GetTitulo: string;
begin
  Result := FLabel.Caption;
end;

function TChatPanelBarraProgresso.GetValorMaximo: Integer;
begin
  Result := FGauge.MaxValue;
end;

function TChatPanelBarraProgresso.GetValorMinimo: Integer;
begin
  Result := FGauge.MinValue;
end;

procedure TChatPanelBarraProgresso.SetCorIndicadorProgresso(
  const Value: TColor);
begin
  FGauge.ForeColor := Value;
end;

procedure TChatPanelBarraProgresso.SetExibirFotoThumbnail(const Value: Boolean);
begin
  if FImagem.Visible <> Value then
    begin
      FImagem.Visible := Value;

      if FImagem.Visible then
        begin
          FGauge.Left := 40;
          FGauge.Width := 116;
        end
      else
        begin
          FGauge.Left := 4;
          FGauge.Width := 152;
        end;

      FLabel.Left := FGauge.Left;
      FLabel.Width := FGauge.Width;
    end;
end;

procedure TChatPanelBarraProgresso.SetFotoThumbnail(const Value: TPicture);
begin
  FImagem.Picture.Assign(Value);
end;

procedure TChatPanelBarraProgresso.SetProgresso(const Value: Integer);
begin
  FGauge.Progress := Value;
end;

procedure TChatPanelBarraProgresso.SetTitulo(const Value: string);
begin
  FLabel.Caption := Value;
end;

procedure TChatPanelBarraProgresso.SetValorMaximo(const Value: Integer);
begin
  FGauge.MaxValue := Value;
end;

procedure TChatPanelBarraProgresso.SetValorMinimo(const Value: Integer);
begin
  FGauge.MinValue := Value;
end;

end.
