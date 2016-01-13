unit pChatTelaModal;

interface

uses
  pDMChat, System.Generics.Collections, pChatTipos, pChatFuncoes,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, pZero, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  pmPromedicoSkin, cxSplitter, RVScroll, RichView, RVEdit, Vcl.StdCtrls, cxPC,
  cxScrollBox, dxDockPanel, dxDockControl, cxContainer, cxEdit, cxGroupBox,
  cxRadioGroup, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxImageComboBox, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxCheckBox,
  dxBarBuiltInMenu;

type
  TfrmChatTelaModal = class(TfrmZero)
    pgcPrincipal: TcxPageControl;
    tabConversa: TcxTabSheet;
    TabConfiguracao: TcxTabSheet;
    pnlConversaEdit: TPanel;
    pnlConversaEditBotoes: TPanel;
    bttEnviar: TButton;
    bttSmiley: TButton;
    rveMensagensEdit: TRichViewEdit;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    cxSplitter1: TcxSplitter;
    rveMensagens: TRichViewEdit;
    Panel1: TPanel;
    spStatusUsuario: TShape;
    imgFotoUsuario: TImage;
    lblNomeUsuario: TLabel;
    lblStatusUsuario: TLabel;
    lblNovaMensagem: TLabel;
    dockSiteSmileys: TdxDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dockPanelSmileys: TdxDockPanel;
    slbSmileys: TcxScrollBox;
    Panel2: TPanel;
    Button4: TButton;
    Button5: TButton;
    rgConfigNovaMensagemApenasAlerta: TcxRadioGroup;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure pmfrmZeroFormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    DMChat: TDMChat;
    FAoEnviarMensagem: TChatEnviarMensagem;
    FAoPesquisarConfiguracoes: TChatPesquisarConfiguracoes;
    FAoSalvarConfiguracoes: TChatSalvarConfiguracoes;
    FCodigoUsuarioSistema: Integer;
    FConfiguracao: TChatConfiguracoes;
    FConversaAtual: string;
    FConversasModal: TDictionary<string, System.TArray<string>>;
    FConversasOrdemRecebimento: System.TArray<string>;
    FMensagem: TChatMensagem;
    FMensagemDados: OleVariant;
    FAoPesquisarMensagens: TChatPesquisarMensagens;
    FSmileys: TDictionary<string, string>;
    FSmileysExpressaoRegular: string;
    FTimer: TTimer;
    FTimerQtdePiscadasNovaMensagem: Integer;
    FUsuarioLogado: TDictionary<Integer, TChatUsuarioLogado>;
    procedure ppvAdicionarSmileys(Sender: TObject);
    procedure ppvAcConfigGravar(Sender: TObject);
    procedure ppvAcConfigRestaurar(Sender: TObject);
    procedure ppvAcConfiguracao(Sender: TObject);
    procedure ppvAcEnviar(Sender: TObject);
    procedure ppvAcRetornar(Sender: TObject);
    procedure ppvAcSmiles(Sender: TObject);
    procedure ppvOnTimer(Sender: TObject);
    procedure SetAoEnviarMensagem(const Value: TChatEnviarMensagem);
    procedure SetAoPesquisarConfiguracoes(
      const Value: TChatPesquisarConfiguracoes);
    procedure SetAoPesquisarMensagens(const Value: TChatPesquisarMensagens);
    procedure SetAoSalvarConfiguracoes(const Value: TChatSalvarConfiguracoes);
    { Private declarations }
  public
    procedure ppuNovaMensagemModal(const ipCodigoMensagem, ipCodigoRemetente, ipCodigoHospital, ipCodigoDestinatario: Integer);
//    property AoCapturarImagem: TNotifyEvent read FAoCapturarImagem write SetAoCapturarImagem;
//    property AoConfirmarLeituraMensagens: TChatConfirmarLeituraMensagens read FAoConfirmarLeituraMensagens write SetAoConfirmarLeituraMensagens;
    property AoEnviarMensagem: TChatEnviarMensagem read FAoEnviarMensagem write SetAoEnviarMensagem;
//    property AoFazerDownloadArquivo: TChatDownloadArquivo read FAoFazerDownloadArquivo write SetAoFazerDownloadArquivo;
//    property AoMudarStatusConversa: TChatMudarStatusConversa read FAoMudarStatusConversa write SetAoMudarStatusConversa;
//    property AoPesquisarAnexos: TChatPesquisarAnexos read FAoPesquisarAnexos write SetAoPesquisarAnexos;
    property AoPesquisarConfiguracoes: TChatPesquisarConfiguracoes read FAoPesquisarConfiguracoes write SetAoPesquisarConfiguracoes;
//    property AoPesquisarGrupos: TChatPesquisarGrupos read FAoPesquisarGrupos write SetAoPesquisarGrupos;
//    property AoPesquisarLeitores: TChatPesquisarLeitoresMensagens read FAoPesquisarLeitores write SetAoPesquisarLeitores;
    property AoPesquisarMensagens: TChatPesquisarMensagens read FAoPesquisarMensagens write SetAoPesquisarMensagens;
//    property AoPesquisarUsuarios: TChatPesquisarUsuarios read FAoPesquisarUsuarios write SetAoPesquisarUsuarios;
    property AoSalvarConfiguracoes: TChatSalvarConfiguracoes read FAoSalvarConfiguracoes write SetAoSalvarConfiguracoes;
//    property CodigoUsuarioConversaInicial: Integer read FCodigoUsuarioConversaInicial write SetCodigoUsuarioConversaInicial;
//    property DataSourceFotoConfig: TDataSource read GetDataSourceFotoConfig;
//    property TelaModalSimplificada: Boolean read FTelaModalSimplificada write SetTelaModalSimplificada;
    { Public declarations }
  end;

var
  frmChatTelaModal: TfrmChatTelaModal;

implementation

{$R *.dfm}

procedure TfrmChatTelaModal.FormCreate(Sender: TObject);
begin
  inherited;
  DMChat := TDMChat.Create(Self);
  DMChat.Name := '';

  DMChat.Ac_Enviar.Caption := '';
  lblNovaMensagem.Visible := False;

  FCodigoUsuarioSistema := -2147483648;
  FTimerQtdePiscadasNovaMensagem := 0;
  FTimer := TTimer.Create(Self);
  FTimer.Enabled := False;
  FTimer.Interval := 500;
  FTimer.OnTimer := ppvOnTimer;
  FTimer.Enabled := True;

  // Inicializando as vriáveis globais
  FAoEnviarMensagem := nil;
  FAoPesquisarConfiguracoes := nil;
  FAoSalvarConfiguracoes := nil;
  FConfiguracao := TChatConfiguracoes.Create;
  FConversaAtual := '';
  FConversasModal := TDictionary < string, System.TArray < string >>.Create;
  SetLength(FConversasOrdemRecebimento, 0);
  FMensagem := TChatMensagem.Create;
  FMensagemDados := null;
  FAoPesquisarMensagens := nil;
  FUsuarioLogado := TDictionary<Integer, TChatUsuarioLogado>.Create;

  // Configurações iniciais da tela
  pgcPrincipal.ActivePage := TabConversa;
  pgcPrincipal.HideTabs := True;

  // Configurando os actions
  DMChat.Ac_ConfigGravar.OnExecute := ppvAcConfigGravar;
  DMChat.Ac_ConfigRestaurar.OnExecute := ppvAcConfigRestaurar;
  DMChat.Ac_Configuracao.OnExecute := ppvAcConfiguracao;
  DMChat.Ac_Enviar.OnExecute := ppvAcEnviar;
  DMChat.Ac_Retornar.OnExecute := ppvAcRetornar;
  DMChat.Ac_Smiles.OnExecute := ppvAcSmiles;

  // Preparando a tela dos smileys
  dockSiteSmileys.Height := 200;
  dockSiteSmileys.Width := 318;
  dockSiteSmileys.Visible := False;
  dockSiteSmileys.AutoSize := False;
  dockPanelSmileys.AutoHide := True;
  dockPanelSmileys.CaptionButtons := [cbMaximize];

  // Montando os smileys
  TChatFuncoes.ppuAdicionarSmileysTela(dockSiteSmileys.Width, slbSmileys, DMChat.ImgCollectionSmileys.Items, ppvAdicionarSmileys, FSmileysExpressaoRegular, FSmileys);
end;

procedure TfrmChatTelaModal.FormDestroy(Sender: TObject);
begin

  if Assigned(FConversasModal) then
    begin
      FConversasModal.Clear;
      FreeAndNil(FConversasModal);
    end;

  if Assigned(FUsuarioLogado) then
    begin
      FUsuarioLogado.Clear;
      FreeAndNil(FUsuarioLogado);
    end;

  if Assigned(FConfiguracao) then
    FreeAndNil(FConfiguracao);

  if Assigned(FMensagem) then
    FreeAndNil(FMensagem);

  inherited;
end;

procedure TfrmChatTelaModal.pmfrmZeroFormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;

  if FConversasModal.Count > 0 then
    begin
      CanClose := False;




    end;
end;

procedure TfrmChatTelaModal.ppuNovaMensagemModal(const ipCodigoMensagem,
  ipCodigoRemetente, ipCodigoHospital, ipCodigoDestinatario: Integer);
var
  vaIdentificador, vaDadosMensagem: string;
  vaArray: System.TArray<string>;
  vaBytesStream: TBytesStream;
  vaMensagem: OleVariant;
begin
{  // Montando o identificador da conversa
  if FUsuarioLogado.Items[ipCodigoHospital].IdentificacaoUsuario.CodigoUsuario = ipCodigoRemetente then
    vaIdentificador := TChatFuncoes.fpuMontaIdentificador(ipCodigoDestinatario, ipCodigoHospital)
  else
    vaIdentificador := TChatFuncoes.fpuMontaIdentificador(ipCodigoRemetente, ipCodigoHospital);

  if (FUsuarioLogado.Count = 0) or ((FConversaAtual <> '') and (FConversaAtual <> vaIdentificador)) then
    begin
      // Nova conversa com um novo usuário. Será verificada assim que fechar a tela

      vaDadosMensagem := IntToStr(ipCodigoMensagem) + ';' + IntToStr(ipCodigoRemetente) + ';' + IntToStr(ipCodigoHospital) + ';' + IntToStr(ipCodigoDestinatario);

      if FConversasModal.ContainsKey(vaIdentificador) then
        begin
          vaArray := FConversasModal.Items[vaIdentificador];
          SetLength(vaArray, Length(vaArray) + 1);
          vaArray[Length(vaArray) - 1] := vaDadosMensagem;
          FConversasModal.Items[vaIdentificador] := vaArray;
        end
      else
        begin
          FConversasModal.Add(vaIdentificador, [vaDadosMensagem]);
          SetLength(FConversasOrdemRecebimento, Length(FConversasOrdemRecebimento) + 1);
          FConversasOrdemRecebimento[Length(FConversasOrdemRecebimento) - 1] := vaIdentificador;
        end;
    end
  else
    begin
      // Verificando se existe usuário logado para o hospital informado
      if FUsuarioLogado.ContainsKey(ipCodigoHospital) then
        begin
          vaMensagem := FAoPesquisarMensagens(
            TChatTipoPesquisa.tpqCodigo,
            IntToStr(ipCodigoMensagem),
            StrToDate('01/01/1900'),
            StrToDate('01/01/1900'),
            FUsuarioLogado[ipCodigoHospital].IdentificacaoUsuario.CodigoUsuario,
            TChatFuncoes.fpuCodigoUsuario(FConversaAtual),
            False,
            False);

          if not VarIsNull(vaMensagem) then
            begin
              DMChat.cdsMensagem_Aux.Data := vaMensagem;

              if VarIsNull(FMensagemDados) then
                FMensagemDados := vaMensagem
              else
                begin
                  DMChat.cdsMensagem_Aux.Data := vaMensagem;
                  DMChat.cdsMensagem.Data := FMensagemDados;

                  try
                    if not (DMChat.cdsMensagem.State in [dsEdit, dsInsert]) then
                      DMChat.cdsMensagem.Append;

                    DMChat.cdsMensagemCODIGO.AsInteger := DMChat.cdsMensagem_AuxCODIGO.AsInteger;
                    DMChat.cdsMensagemCODIGO_SENHAUS_REMETENTE.AsInteger := DMChat.cdsMensagem_AuxCODIGO_SENHAUS_REMETENTE.AsInteger;
                    DMChat.cdsMensagemCODIGO_SENHA_DESTINATARIO.AsInteger := DMChat.cdsMensagem_AuxCODIGO_SENHA_DESTINATARIO.AsInteger;
                    DMChat.cdsMensagemTEXTO.AsString := DMChat.cdsMensagem_AuxTEXTO.AsString;
                    DMChat.cdsMensagemDATA_HORA_ENVIO.AsDateTime := DMChat.cdsMensagem_AuxDATA_HORA_ENVIO.AsDateTime;
                    DMChat.cdsMensagemTIPO.AsInteger := DMChat.cdsMensagem_AuxTIPO.AsInteger;
                    DMChat.cdsMensagemMENSAGEM_LIDA.AsInteger := DMChat.cdsMensagem_AuxMENSAGEM_LIDA.AsInteger;
                    DMChat.cdsMensagemMENSAGEM_LIDA_USUARIO_LOGADO.AsInteger := DMChat.cdsMensagem_AuxMENSAGEM_LIDA_USUARIO_LOGADO.AsInteger;
                    DMChat.cdsMensagemCODIGO_MENSAGEM_ANEXO.AsInteger := DMChat.cdsMensagem_AuxCODIGO_MENSAGEM_ANEXO.AsInteger;
                    DMChat.cdsMensagemENDERECO_ANEXO.AsString := DMChat.cdsMensagem_AuxENDERECO_ANEXO.AsString;
                    DMChat.cdsMensagemTAMANHO_KB.AsInteger := DMChat.cdsMensagem_AuxTAMANHO_KB.AsInteger;
                    DMChat.cdsMensagemEXTENSAO.AsString := DMChat.cdsMensagem_AuxEXTENSAO.AsString;

                    if DMChat.cdsMensagem_AuxTHUMBNAIL.isNull then
                      DMChat.cdsMensagemTHUMBNAIL.Clear
                    else
                      begin
                        try
                          vaBytesStream := TBytesStream.Create;
                          DMChat.cdsMensagem_AuxTHUMBNAIL.SaveToStream(vaBytesStream);
                          vaBytesStream.Position := 0;
                          DMChat.cdsMensagemTHUMBNAIL.LoadFromStream(vaBytesStream);
                        finally
                          FreeAndNil(vaBytesStream);
                        end;
                      end;

                    DMChat.cdsMensagemNOME_REMETENTE.AsString := DMChat.cdsMensagem_AuxNOME_REMETENTE.AsString;
                    DMChat.cdsMensagemNOME_DESTINATARIO.AsString := DMChat.cdsMensagem_AuxNOME_DESTINATARIO.AsString;
                    DMChat.cdsMensagemUSUARIO_GRUPO_DESTINATARIO.AsInteger := DMChat.cdsMensagem_AuxUSUARIO_GRUPO_DESTINATARIO.AsInteger;
                    DMChat.cdsMensagem.Post;
                    FMensagemDados := DMChat.cdsMensagem.Data;
                  finally
                    DMChat.cdsMensagem.EmptyDataSet;
                    DMChat.cdsMensagem.Close;
                  end;
                end;

              TChatFuncoes.ppuPreencherRichViewEdit(
                FMensagemDados,
                rveMensagens,


              const ipIdentificador: string; const ipPosicaoScroll: Integer; const ipDestacarTextoPesquisa: string;
      const ipExibirLinkVisualizacaoPesquisa, ipExibirLinkVoltarPesquisa, ipLimparRichViewEdit: Boolean; const ipCodigoMensagemDestacar: Integer; const ipEstilo: TChatEstiloRich;
      const ipDMChat: TDMChat; const ipSmileys: TDictionary<string, string>; const ipSmileysExpressaoRegular: string; const ipAoConfirmarLeituraMensagens: TChatConfirmarLeituraMensagens;
      const ipUsuarioLogado: TChatIdentificacaoUsuario; var ioDadosConversas: TDictionary<string, TChatDadosConversa>; var ioCodigoPrimeiraMsgNaoLida: Integer);



            end;
         end;
    end;}
end;

procedure TfrmChatTelaModal.ppvAcConfigGravar(Sender: TObject);
var
  vaUsuarioLogado: TDictionary<Integer, TChatUsuarioLogado>.TPairEnumerator;
begin
  // Outras configurações
  FConfiguracao.NovasMensagensApenasAlerta := rgConfigNovaMensagemApenasAlerta.EditValue;

  // Gravando as configurações no banco
  if Assigned(FAoSalvarConfiguracoes) then
    begin
      vaUsuarioLogado := FUsuarioLogado.GetEnumerator;

      while vaUsuarioLogado.MoveNext do
        FAoSalvarConfiguracoes(FConfiguracao, vaUsuarioLogado.Current.Value.IdentificacaoUsuario);
    end;
end;

procedure TfrmChatTelaModal.ppvAcConfigRestaurar(Sender: TObject);
var
  i, vaIndiceApenasAlerta: Integer;
begin
  // Outras configurações

  // Alerta de mensagens
  // 0|null - tela em modal completa
  // 1 - apenas alerta
  // 2 - modal resumida

  vaIndiceApenasAlerta := -1;
  i := 0;

  while (i < rgConfigNovaMensagemApenasAlerta.Properties.Items.Count) and (vaIndiceApenasAlerta < 0) do
    begin
      if rgConfigNovaMensagemApenasAlerta.Properties.Items[i].Value = 1 then
        vaIndiceApenasAlerta := i;

      Inc(i);
    end;

  if FConfiguracao.PermitirAlterarAlertaMensagens then
    rgConfigNovaMensagemApenasAlerta.Properties.Items[vaIndiceApenasAlerta].Caption := 'Apenas alerta'
  else
    begin
      rgConfigNovaMensagemApenasAlerta.Properties.Items[vaIndiceApenasAlerta].Caption := 'Apenas alerta (Sem permissão)';

      if FConfiguracao.NovasMensagensApenasAlerta = 1 then
        FConfiguracao.NovasMensagensApenasAlerta := 0;
    end;

  rgConfigNovaMensagemApenasAlerta.EditValue := FConfiguracao.NovasMensagensApenasAlerta;
  rgConfigNovaMensagemApenasAlerta.Controls[vaIndiceApenasAlerta].Enabled := FConfiguracao.PermitirAlterarAlertaMensagens;
end;

procedure TfrmChatTelaModal.ppvAcConfiguracao(Sender: TObject);
var
  vaGraphic: TGraphic;
  vaPicture: TPicture;
  vaConfiguracao: TChatConfiguracoes;
  vaUsuarioLogado: TDictionary<Integer, TChatUsuarioLogado>.TPairEnumerator;
begin
  // Pesquisando as configurações
  if Assigned(FAoPesquisarConfiguracoes) then
    begin
      vaUsuarioLogado := FUsuarioLogado.GetEnumerator;
      vaUsuarioLogado.MoveNext;

      // Não pode dar "Free" na variável vaConfiguracao porque ela veio do server e o DataSnap já faz
      // isso, então se der "Free" vai gerar um erro
      vaConfiguracao := FAoPesquisarConfiguracoes(vaUsuarioLogado.Current.Value.IdentificacaoUsuario);

      if Assigned(vaConfiguracao) then
        begin
          FConfiguracao.ppuCopiarDe(vaConfiguracao);
          vaGraphic := nil;
          vaPicture := nil;

          if Assigned(vaConfiguracao.Foto) then
            begin
              try
                vaGraphic := TChatFuncoes.fpuImagemTamanhoMaximo(vaConfiguracao.Foto.Graphic, 256, 256);
                vaPicture := TPicture.Create;
                vaPicture.Graphic := vaGraphic;
                FConfiguracao.Foto := vaPicture;
              finally
                if Assigned(vaGraphic) then
                  FreeAndNil(vaGraphic);

                if Assigned(vaPicture) then
                  FreeAndNil(vaPicture);
              end;
            end;
        end;
    end;

  pgcPrincipal.ActivePage := TabConfiguracao;
  rgConfigNovaMensagemApenasAlerta.SetFocus;

  // Carregando as configurações para a tela
  ppvAcConfigRestaurar(Self);
end;

procedure TfrmChatTelaModal.ppvAcEnviar(Sender: TObject);
var
  i, p: Integer;
  vaPicture: TPicture;
  vaBytesStream: TBytesStream;
  vaUsuarioSelecionado: Boolean;
  vaUsuarioLogado: TChatUsuarioLogado;
  vaDestinatarios: TArray<TChatDadosUsuario>;
//  vaChatPanelSelecionadoCtrl: TDictionary<string, TChatPanelConversaAba>.TPairEnumerator;
begin
{  if fpvUsuarioLogado(TChatFuncoes.fpuCodigoHospital(FChatPanelSelecionado.Identificador), vaUsuarioLogado) and
    (vaUsuarioLogado.IdentificacaoUsuario.CodigoHospital = FChatPanelSelecionado.Mensagem.Remetente.CodigoHospital) and
    (vaUsuarioLogado.IdentificacaoUsuario.CodigoUsuario = FChatPanelSelecionado.Mensagem.Remetente.CodigoUsuario) then
    begin
      if DMChat.cdsUsuarios.Locate('CODIGO;CODIGO_HOSPITAL', TChatFuncoes.fpuCodigosUsuarioHospital(FChatPanelSelecionado.Identificador), []) then
        begin
          if DMChat.cdsUsuariosCODIGO.AsInteger = FCodigoUsuarioSistema then
            begin
              MessageTela('Usuário do sistema. A mensagem não pode ser enviada.' + sLineBreak + 'Este usuário é exclusivo para recebimento de mensagens do sistema.');
              Exit;
            end
          else
            begin
              if DMChat.cdsUsuariosATIVO_INATIVO.AsInteger = 1 then
                begin
                  MessageTela('Usuário inativo. A mensagem não pode ser enviada.');
                  Exit;
                end
              else
                begin
                  if (not vaUsuarioLogado.EnviaMensagemGrupoTodos) and ((DMChat.cdsUsuariosTIPO_PAPEL.AsInteger = Ord(TTiposPapeis.tpUsuarioSistema)) or pnlEnviarMensagemUsuariosConectados.Visible) then
                    begin
                      if DMChat.cdsUsuariosNOME.AsString = 'TODOS' then
                        MessageTela('Usuário sem permissão para enviar mensagem para o grupo "Todos"')
                      else
                        begin
                          MessageTela('Usuário sem permissão para enviar mensagem para o grupo "Todos".' + sLineBreak +
                            'Para enviar mensagem para todos os usuários logados é necessário' + sLineBreak +
                            'ter permissão para enviar mensagem para o grupo "Todos".');
                        end;

                      Exit;
                    end;
                end;
            end;
        end
      else
        begin
          MessageTela('Usuário não localizado.');
          Exit;
        end;

      // Salvando a mensagem para enviá-la
      vaBytesStream := TBytesStream.Create;

      try
        rveMensagensEdit.SaveRVFToStream(vaBytesStream, False);
        FChatPanelSelecionado.Mensagem.MensagemRVF := vaBytesStream;
      finally
        FreeAndNil(vaBytesStream);
      end;

      // Convertendo os smileys em texto
      TChatFuncoes.ppuConverterSmileysParaTexto(rveMensagensEdit);

      if (FChatPanelSelecionado.Mensagem.AnexosQtde = 0) and (Trim(FChatPanelSelecionado.Mensagem.MensagemTXT) = '') then
        begin
          MessageTela('Escreva uma mensagem ou anexe algum arquivo antes de enviar.');
          rveMensagensEdit.SetFocus;
          Exit;
        end;

      // Enviando a mensagem
      if Assigned(FAoEnviarMensagem) then
        begin
          // Enviando a mensagem para o destinatário
          SetLength(vaDestinatarios, 1);
          i := 0;
          vaDestinatarios[i] := TChatDadosUsuario.Create;
          vaDestinatarios[i].FotoUsuario := FChatPanelSelecionado.FotoThumbnail;
          vaDestinatarios[i].Identificacao.ppuCopiarDe(FChatPanelSelecionado.Mensagem.Destinatario);
          vaDestinatarios[i].Nome := FChatPanelSelecionado.TextoSuperior;

          vaChatPanelSelecionadoCtrl := FChatPanelSelecionadoCtrl.GetEnumerator;

          // Enviando a mensagem para todos os usuários ativos
          if pnlEnviarMensagemUsuariosConectados.Visible then
            begin
              FSecaoCriticaBancoDadosUsuarios.Enter;
              DMChat.cdsUsuarios.DisableControls;

              try
                DMChat.cdsUsuarios.Filtered := False;
                DMChat.cdsUsuarios.Filter := 'status = 1 and usuario_grupo = 0 and codigo_hospital = ' + IntToStr(FChatPanelSelecionado.Mensagem.Remetente.CodigoHospital);
                DMChat.cdsUsuarios.Filtered := True;
                DMChat.cdsUsuarios.First;

                while not DMChat.cdsUsuarios.Eof do
                  begin
                    SetLength(vaDestinatarios, i + 1);
                    vaDestinatarios[i] := TChatDadosUsuario.Create;

                    if DMChat.cdsUsuariosFOTO_THUMBNAIL_AJUSTAR.AsInteger = 1 then
                      ppvAjustarImagem(DMChat.cdsUsuarios, False, True);

                    vaBytesStream := nil;
                    vaPicture := nil;

                    try
                      if not DMChat.cdsUsuariosFOTO_THUMBNAIL.isNull then
                        begin
                          vaBytesStream := TBytesStream.Create;
                          DMChat.cdsUsuariosFOTO_THUMBNAIL.SaveToStream(vaBytesStream);
                          vaBytesStream.Position := 0;
                          vaPicture := fpuRetornaImagem(vaBytesStream);

                          if Assigned(vaPicture) then
                            vaDestinatarios[i].FotoUsuario := vaPicture
                          else
                            begin
                              vaPicture := TPicture.Create;
                              vaPicture.Assign(DMChat.ImgCollectionItemUsuario.Picture);
                            end;
                        end
                      else
                        begin
                          vaPicture := TPicture.Create;
                          vaPicture.Assign(DMChat.ImgCollectionItemUsuario.Picture);
                        end;
                    finally
                      if Assigned(vaBytesStream) then
                        FreeAndNil(vaBytesStream);

                      if Assigned(vaPicture) then
                        FreeAndNil(vaPicture);
                    end;

                    vaDestinatarios[i].Identificacao.CodigoHospital := DMChat.cdsUsuariosCODIGO_HOSPITAL.AsInteger;
                    vaDestinatarios[i].Identificacao.CodigoUsuario := DMChat.cdsUsuariosCODIGO.AsInteger;
                    vaDestinatarios[i].Nome := DMChat.cdsUsuariosNOME.AsString;
                    Inc(i);
                  end;
              finally
                DMChat.cdsUsuarios.Filtered := False;
                DMChat.cdsUsuarios.Filter := '';
                DMChat.cdsUsuarios.EnableControls;
                FSecaoCriticaBancoDadosUsuarios.Release;
              end;
            end;

          // Enviando a mensagem para todos os usuários selecionados na lista de usuários
          while vaChatPanelSelecionadoCtrl.MoveNext do
            begin
              begin
                vaUsuarioSelecionado := False;
                p := 0;

                while (p <= i) and (not vaUsuarioSelecionado) do
                  begin
                    vaUsuarioSelecionado :=
                      (vaDestinatarios[p].Identificacao.CodigoHospital = vaChatPanelSelecionadoCtrl.Current.Value.Mensagem.Destinatario.CodigoHospital) and
                      (vaDestinatarios[p].Identificacao.CodigoUsuario = vaChatPanelSelecionadoCtrl.Current.Value.Mensagem.Destinatario.CodigoUsuario);
                    Inc(p);
                  end;

                if not vaUsuarioSelecionado then
                  begin
                    SetLength(vaDestinatarios, i + 1);
                    vaDestinatarios[i] := TChatDadosUsuario.Create;
                    vaDestinatarios[i].FotoUsuario := vaChatPanelSelecionadoCtrl.Current.Value.FotoThumbnail;
                    vaDestinatarios[i].Identificacao.ppuCopiarDe(vaChatPanelSelecionadoCtrl.Current.Value.Mensagem.Destinatario);
                    vaDestinatarios[i].Nome := vaChatPanelSelecionadoCtrl.Current.Value.TextoSuperior;
                    Inc(i);
                  end;

                vaChatPanelSelecionadoCtrl.Current.Value.SelecionadoCtrl := False;
              end;
            end;

          FAoEnviarMensagem(FChatPanelSelecionado.Mensagem, vaDestinatarios);
        end;

      // Limpando a lista de destinatarios
      for i := Low(vaDestinatarios) to High(vaDestinatarios) do
        begin
          if Assigned(vaDestinatarios[i]) then
            FreeAndNil(vaDestinatarios[i]);
        end;

      // Limpando a mensagem
      FChatPanelSelecionado.Mensagem.ppuLimparAnexos;
      FChatPanelSelecionado.Mensagem.ppuLimparMensagem;
      rveMensagensEdit.Clear;
      rveMensagensEdit.Change;
      rveMensagensEdit.Format;

      // Limpando os anexos da conversa
      while slbAnexos.ComponentCount > 0 do
        slbAnexos.Components[0].Free;

      // Fechando o panel dos anexos e avisos
      ppvPanelConversaAnexosVisivel(False);
      ppvPanelEnviarMensagemUsuariosConectados(False);

      // Voltando o foco para o edit da mensagem
      rveMensagensEdit.SetFocus;
    end
  else
    begin
      if (vaUsuarioLogado.IdentificacaoUsuario.CodigoHospital <> FChatPanelSelecionado.Mensagem.Remetente.CodigoHospital) or
        (vaUsuarioLogado.IdentificacaoUsuario.CodigoUsuario <> FChatPanelSelecionado.Mensagem.Remetente.CodigoUsuario) then
        MessageTela('O usuário logado está diferente do usuário remetente da mensagem.' + sLineBreak + 'A mensagem não foi enviada.')
      else
        MessageTela('O usuário logado não foi localizado.' + sLineBreak + 'A mensagem não foi enviada.');
    end;}
end;

procedure TfrmChatTelaModal.ppvAcRetornar(Sender: TObject);
begin
  if pgcPrincipal.ActivePage = tabConversa then
    Close
  else
    pgcPrincipal.ActivePage := tabConversa;
end;

procedure TfrmChatTelaModal.ppvAcSmiles(Sender: TObject);
begin
  dockSiteSmileys.AutoSize := False;
  dockSiteSmileys.Height := 1;
  dockPanelSmileys.Height := cxSplitter1.Top;
  dockSiteSmileys.Top := pnlConversaEdit.Top - dockPanelSmileys.Height - 2;
  dockSiteSmileys.Left := pnlConversaEditBotoes.Left - dockSiteSmileys.Width + bttSmiley.Width - 1;

  dockPanelSmileys.Visible := True;
  dockPanelSmileys.Activate;
end;

procedure TfrmChatTelaModal.ppvAdicionarSmileys(Sender: TObject);
begin
  if (Sender is TImage) and (TImage(Sender).Hint <> '') then
    TChatFuncoes.ppuInserirSmileysRichViewEdit(TImage(Sender).Picture.Graphic, TImage(Sender).Hint, rveMensagensEdit);
end;

procedure TfrmChatTelaModal.ppvOnTimer(Sender: TObject);
begin
  if FTimerQtdePiscadasNovaMensagem < 0 then
    FTimerQtdePiscadasNovaMensagem := 0;

  Inc(FTimerQtdePiscadasNovaMensagem);
  lblNovaMensagem.Visible := (FTimerQtdePiscadasNovaMensagem mod 2) <> 0;

  if FTimerQtdePiscadasNovaMensagem >= 10 then
    begin
      FTimer.Enabled := False;
      FTimerQtdePiscadasNovaMensagem := 0;
      lblNovaMensagem.Visible := False;
    end;
end;

procedure TfrmChatTelaModal.SetAoEnviarMensagem(
  const Value: TChatEnviarMensagem);
begin
  FAoEnviarMensagem := Value;
end;

procedure TfrmChatTelaModal.SetAoPesquisarConfiguracoes(
  const Value: TChatPesquisarConfiguracoes);
begin
  FAoPesquisarConfiguracoes := Value;
end;

procedure TfrmChatTelaModal.SetAoPesquisarMensagens(
  const Value: TChatPesquisarMensagens);
begin
  FAoPesquisarMensagens := Value;
end;

procedure TfrmChatTelaModal.SetAoSalvarConfiguracoes(
  const Value: TChatSalvarConfiguracoes);
begin
  FAoSalvarConfiguracoes := Value;
end;

end.

