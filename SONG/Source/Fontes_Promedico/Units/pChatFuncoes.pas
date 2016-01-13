unit pChatFuncoes;

interface

uses
  Winapi.Windows, System.Classes, System.SysUtils, RVEdit, RVStyle,
  System.Generics.Collections, Vcl.Graphics, Vcl.Imaging.jpeg, System.Math,
  System.Variants, RVItem, pDMChat, System.RegularExpressions, Vcl.ExtCtrls,
  Vcl.Controls, cxGraphics, RichView, Vcl.StdCtrls, System.DateUtils,
  Vcl.Imaging.PngImage, System.AnsiStrings, Vcl.Imaging.GIFImg, pUtils, RVTable,
  pChatTipos, Data.DB, CRVFData, Winapi.ShellAPI, Vcl.Forms, pZoomImg,
  pChatTelaleitoresMensagem, dxGalleryControl, pMethod2009, System.Zip,
  dxGDIPlusClasses;

type
  TChatFuncoes = class
  private
    const
      coMinGraphicSize = 44;
    { Private declarations }
  public
    class function fpuCodigoHospital(const ipIdentificador: string): Integer;
    class function fpuCodigosUsuarioHospital(const ipIdentificador: string): Variant;
    class function fpuCodigoUsuario(const ipIdentificador: string): Integer;
    class function fpuFindGraphicClass(const ipBuffer; const ipBufferSize: Int64; out ioGraphicClass: TGraphicClass): Boolean; overload;
    class function fpuFindGraphicClass(const ipStream: TStream; out ioGraphicClass: TGraphicClass): Boolean; overload;
    class function fpuIconeArquivo(const ipExtensaoArquivo: string; const ipDMChat: TDMChat): TPicture;
    class function fpuImagem(const ipBytesStream: TBytesStream; const ipFormatoSecundario: TWICImageFormat): TGraphic;
    class function fpuImagemTamanhoMaximo(const ipBytesStream: TBytesStream; const ipHeight, ipWidth: Integer): TGraphic; overload;
    class function fpuImagemTamanhoMaximo(const ipGraphic: TGraphic; const ipHeight, ipWidth: Integer): TGraphic; overload;
    class function fpuMontaIdentificador(const ipCodigoUsuario, ipCodigoHospital: Integer): string;
    class function fpuTamanhoFormatado(const ipTamanho: Int64): string;
    class procedure ppuAdicionarSmileysTela(const ipWidthParentSmileys: Integer; const ipOwnerAndParentSmileys: TWinControl; const ipImageCollectionItems: TcxImageCollectionItems; const ipOnClickSmileys: TNotifyEvent; var ioSmileysExpressaoRegular: string; var ioSmileys: TDictionary<string, string>);
    class procedure ppuArquivo(const ipTag, ipPastaInicialSalvarImagem: string; ipChatDownloadArquivo: TChatDownloadArquivo);
    class procedure ppuConverterSmileysParaTexto(const ipRVE: TRichViewEdit);
    class procedure ppuConverterTextoParaSmileys(const ipRVE: TRichViewEdit; const ipDMChat: TDMChat; const ipSmileys: TDictionary<string, string>; const ipSmileysExpressaoRegular: string);
    class procedure ppuDescompactarArquivo(const ipArquivo: TBytesStream; const ipDestinoArquivo: string); overload;
    class procedure ppuDescompactarArquivo(const ipArquivo: TBytesStream; var ioArquivoDescompactado: TBytesStream); overload;
    class procedure ppuIncluirStatusMensagem(ipCelula: TRVTableCellData; const ipParagrafo: Integer; const ipCodigoLeitura: string; ipMsgLida: Boolean; const ipDMChat: TDMChat);
    class procedure ppuInserirSmileysRichViewEdit(const ipGraphic: TGraphic; const ipIdentificacao: string; const ipRVE: TRichViewEdit);
    class procedure ppuLeitoresMensagem(const ipTag: string; ipPesquisarLeitoresMensagens: TChatPesquisarLeitoresMensagens);
    class procedure ppuLink(ipTag: TRVTag; ipItemNo: Integer; ipRVFormattedData: TCustomRVFormattedData);
    class procedure ppuPreencherRichViewEdit(const ipMensagem: OleVariant; ipRVE: TRichViewEdit; const ipIdentificador: string; const ipPosicaoScroll: Integer; const ipDestacarTextoPesquisa: string;
      const ipExibirLinkVisualizacaoPesquisa, ipExibirLinkVoltarPesquisa, ipLimparRichViewEdit: Boolean; const ipCodigoMensagemDestacar: Integer; const ipEstilo: TChatEstiloRich;
      const ipDMChat: TDMChat; const ipSmileys: TDictionary<string, string>; const ipSmileysExpressaoRegular: string; const ipAoConfirmarLeituraMensagens: TChatConfirmarLeituraMensagens;
      const ipUsuarioLogado: TChatIdentificacaoUsuario; var ioDadosConversas: TDictionary<string, TChatDadosConversa>; var ioCodigoPrimeiraMsgNaoLida: Integer);
    class procedure ppuSalvarArquivo(const ipCodigoHospital: Integer; const ipLocalArquivo, ipPastaInicialSalvarImagem: string; ipChatDownloadArquivo: TChatDownloadArquivo);
    class procedure ppuVisualizarArquivo(const ipCodigoHospital: Integer; const ipLocalArquivo, ipPastaInicialSalvarImagem: string; ipChatDownloadArquivo: TChatDownloadArquivo);
    { Public declarations }
  end;

implementation

{ TChatFuncoes }

class function TChatFuncoes.fpuCodigoHospital(
  const ipIdentificador: string): Integer;
begin
  Result := StrToIntDef(TRegEx.Replace(TRegEx.Match(ipIdentificador, '(?<=_)n?\d{1,}$', [roIgnoreCase, roSingleLine]).Value, '^n', '-', [roIgnoreCase, roSingleLine]), 0);
end;

class function TChatFuncoes.fpuCodigosUsuarioHospital(
  const ipIdentificador: string): Variant;
begin
  Result := VarArrayOf([fpuCodigoUsuario(ipIdentificador), fpuCodigoHospital(ipIdentificador)]);
end;

class function TChatFuncoes.fpuCodigoUsuario(
  const ipIdentificador: string): Integer;
begin
  Result := StrToIntDef(TRegEx.Replace(TRegEx.Match(ipIdentificador, '^n?\d{1,}(?=_)', [roIgnoreCase, roSingleLine]).Value, '^n', '-', [roIgnoreCase, roSingleLine]), 0);
end;

class function TChatFuncoes.fpuFindGraphicClass(const ipBuffer;
  const ipBufferSize: Int64; out ioGraphicClass: TGraphicClass): Boolean;
var
  vaLongWords: array [Byte] of LongWord absolute ipBuffer;
  vaWords: array [Byte] of Word absolute ipBuffer;
begin
  ioGraphicClass := nil;
  Result := False;

  if ipBufferSize < coMinGraphicSize then
    Exit;

  case vaWords[0] of
    $4D42:
      ioGraphicClass := TBitmap;
    $D8FF:
      ioGraphicClass := TJPEGImage;
    $4949:
      if vaWords[1] = $002A then
        ioGraphicClass := TWicImage; // i.e., TIFF
    $4D4D:
      if vaWords[1] = $2A00 then
        ioGraphicClass := TWicImage; // i.e., TIFF
  else
    if Int64(ipBuffer) = $A1A0A0D474E5089 then
      ioGraphicClass := TPNGImage
    else
      begin
        if vaLongWords[0] = $9AC6CDD7 then
          ioGraphicClass := TMetafile
        else
          begin
            if (vaLongWords[0] = 1) and (vaLongWords[10] = $464D4520) then
              ioGraphicClass := TMetafile
            else
              begin
                if System.AnsiStrings.StrLComp(PAnsiChar(@ipBuffer), 'GIF', 3) = 0 then
                  ioGraphicClass := TGIFImage
                else
                  begin
                    if vaWords[1] = 1 then
                      ioGraphicClass := TIcon;
                  end;
              end;
          end;
      end;
  end;

  Result := (ioGraphicClass <> nil);
end;

class function TChatFuncoes.fpuFindGraphicClass(const ipStream: TStream;
  out ioGraphicClass: TGraphicClass): Boolean;
var
  vaBuffer: PByte;
  vaCurPos: Int64;
  vaBytesRead: Integer;
begin
  if ipStream is TCustomMemoryStream then
    begin
      vaBuffer := TCustomMemoryStream(ipStream).Memory;
      vaCurPos := ipStream.Position;
      Inc(vaBuffer, vaCurPos);
      Result := fpuFindGraphicClass(vaBuffer^, ipStream.Size - vaCurPos, ioGraphicClass);
    end
  else
    begin
      GetMem(vaBuffer, coMinGraphicSize);

      try
        vaBytesRead := ipStream.Read(vaBuffer^, coMinGraphicSize);
        ipStream.Seek(-vaBytesRead, soCurrent);
        Result := fpuFindGraphicClass(vaBuffer^, vaBytesRead, ioGraphicClass);
      finally
        FreeMem(vaBuffer);
      end;
    end;
end;

class function TChatFuncoes.fpuIconeArquivo(
  const ipExtensaoArquivo: string; const ipDMChat: TDMChat): TPicture;
var
  vaImagemSelecionada: TPicture;
  vaBytesStream: TBytesStream;
  vaGraphic: TGraphic;
begin
  Result := TPicture.Create;
  vaBytesStream := nil;

  // Retornando o ícone de acordo com a extensão do arquivo

  // Excel - csv, ods, prn, slsm, xla, xlam, xls, xlsb, xlsx, xlt, xltm, xltx, xps
  if TRegEx.IsMatch(ipExtensaoArquivo, '^\.?(csv|ods|prn|slsm|xlam?|xls(b|x)?|xlt(m|x)?|xps)$', [roIgnoreCase, roSingleLine]) then
    vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoExcel.Picture
  else
    begin
      // Word - doc, docm, docx, dot, dotm, dotx, odt, rtf
      if TRegEx.IsMatch(ipExtensaoArquivo, '^\.?(do(c|t)(m|x)?|rtf|odt)$', [roIgnoreCase, roSingleLine]) then
        vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoWord.Picture
      else
        begin
          // Power Point - odp, pot, potm, potx, ppam, ppa, pps, ppsm, ppsx, ppt, pptm, pptx
          if TRegEx.IsMatch(ipExtensaoArquivo, '^\.?(odp|pot(m|x)?|ppam?|pp(s|t)(m|x)?)$', [roIgnoreCase, roSingleLine]) then
            vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoPowerPoint.Picture
          else
            begin
              // Texto - TXT
              if TRegEx.IsMatch(ipExtensaoArquivo, '^\.?(txt)$', [roIgnoreCase, roSingleLine]) then
                vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoTexto.Picture
              else
                begin
                  // PDF
                  if TRegEx.IsMatch(ipExtensaoArquivo, '^\.?pdf$', [roIgnoreCase, roSingleLine]) then
                    vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoPDF.Picture
                  else
                    begin
                      // RAR
                      if TRegEx.IsMatch(ipExtensaoArquivo, '^\.?rar$', [roIgnoreCase, roSingleLine]) then
                        vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoRar.Picture
                      else
                        begin
                          // ZIP
                          if TRegEx.IsMatch(ipExtensaoArquivo, '^\.?zip$', [roIgnoreCase, roSingleLine]) then
                            vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoZip.Picture
                          else
                            begin
                              // XML
                              if TRegEx.IsMatch(ipExtensaoArquivo, '^\.?(xml)$', [roIgnoreCase, roSingleLine]) then
                                vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoXML.Picture
                              else
                                begin
                                  // Configuração - DLL, INI, SYS
                                  if TRegEx.IsMatch(ipExtensaoArquivo, '^\.?(dll|ini|sys)$', [roIgnoreCase, roSingleLine]) then
                                    vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoConfiguracao.Picture
                                  else
                                    begin
                                      // Música - aac, ac3, mid, mp3, ogg, wav, wma
                                      if TRegEx.IsMatch(ipExtensaoArquivo, '^\.?(aac|ac3|mid|mp3|ogg|wav|wma)$', [roIgnoreCase, roSingleLine]) then
                                        vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoAudio.Picture
                                      else
                                        begin
                                          // Vídeo - avi, mkv, mov, mp4, mpeg, mpg, rm, rmvb, wmv
                                          if TRegEx.IsMatch(ipExtensaoArquivo, '^\.?(avi|mkv|mov|mp4|mpeg|mpg|rm|rmvb|wmv)$', [roIgnoreCase, roSingleLine]) then
                                            vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoVideo.Picture
                                          else
                                            begin
                                              // vaBitmap - bmp, eps, gif, ico, jpeg, jpg, pic, png
                                              if TRegEx.IsMatch(ipExtensaoArquivo, '^\.?(bmp|eps|gif|ico|jpe?g|pic|png)$', [roIgnoreCase, roSingleLine]) then
                                                vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoImagem.Picture
                                              else
                                                // Outros arquivos
                                                vaImagemSelecionada := ipDMChat.ImgCollectionItemArquivoDesconhecido.Picture;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;

  try
    vaBytesStream := TBytesStream.Create;
    vaImagemSelecionada.Graphic.SaveToStream(vaBytesStream);
    vaBytesStream.Position := 0;
    Result.Graphic := fpuImagem(vaBytesStream, TWICImageFormat.wifPng);
  finally
    if Assigned(vaBytesStream) then
      FreeAndNil(vaBytesStream);
  end;
end;

class function TChatFuncoes.fpuImagem(const ipBytesStream: TBytesStream;
  const ipFormatoSecundario: TWICImageFormat): TGraphic;

  procedure plcLerImagem;
  begin
    try
      ipBytesStream.Position := 0;
      Result.LoadFromStream(ipBytesStream);
    except
      if Assigned(Result) then
        FreeAndNil(Result);
    end;
  end;

var
  vaGraphicClass: TGraphicClass;
begin
  Result := nil;
  vaGraphicClass := nil;

  if Assigned(ipBytesStream) then
    begin
      ipBytesStream.Position := 0;

      if not fpuFindGraphicClass(ipBytesStream, vaGraphicClass) then
        begin
          // Não foi possível determinar a classe da imagem, então vamos utilizar
          // a classe secundária informada e tentar ler a imagem
          case ipFormatoSecundario of
            wifBmp:
              vaGraphicClass := TBitmap;
            wifPng:
              vaGraphicClass := TPNGImage;
            wifJpeg:
              vaGraphicClass := TJPEGImage;
            wifGif:
              vaGraphicClass := TGIFImage;
          end;
        end;

      Result := TGraphicClass(vaGraphicClass).Create;
      plcLerImagem;

      // Não foi possível ler a imagem ou foi informado um tipo secundário diferente dos que estão logo acima,
      // então vamos utilizar a classe TWICImage, pois esta classe aceita vários formatos de imagens
      if not Assigned(Result) then
        begin
          Result := TWicImage.Create;
          plcLerImagem;
        end;
    end;
end;

class function TChatFuncoes.fpuImagemTamanhoMaximo(
  const ipBytesStream: TBytesStream; const ipHeight,
  ipWidth: Integer): TGraphic;
var
  vaGraphic: TGraphic;
begin
  Result := nil;
  vaGraphic := nil;

  if Assigned(ipBytesStream) then
    begin
      try
        ipBytesStream.Position := 0;
        vaGraphic := TChatFuncoes.fpuImagem(ipBytesStream, TWICImageFormat.wifJpeg);
        Result := fpuImagemTamanhoMaximo(vaGraphic, ipHeight, ipWidth);
      finally
        if Assigned(vaGraphic) then
          FreeAndNil(vaGraphic);
      end;
    end;
end;

class function TChatFuncoes.fpuImagemTamanhoMaximo(const ipGraphic: TGraphic;
  const ipHeight, ipWidth: Integer): TGraphic;
var
  vaBytesStream: TBytesStream;
  vaGraphicBase, vaGraphicRedimensionado: TGraphic;
  vaGraphicClass: TGraphicClass;
  vadxSmartImage: TdxSmartImage;
  vaBitmap: TBitmap absolute vaGraphicRedimensionado;
  vaJPEGImage: TJPEGImage absolute vaGraphicRedimensionado;
begin
  Result := nil;
  vaBytesStream := nil;
  vaGraphicBase := nil;
  vaGraphicRedimensionado := nil;
  vaGraphicClass := nil;
  vadxSmartImage := nil;

  if Assigned(ipGraphic) then
    begin
      try
        Result := TGraphicClass(TJPEGImage).Create;

        if (ipGraphic.ClassType = TJPEGImage) and (ipGraphic.Height <= ipHeight) and (ipGraphic.Width <= ipWidth) then
          Result.Assign(ipGraphic)
        else
          begin
            vaBytesStream := TBytesStream.Create;
            ipGraphic.SaveToStream(vaBytesStream);
            vaBytesStream.Position := 0;

            vadxSmartImage := TdxSmartImage.Create;
            vadxSmartImage.LoadFromStream(vaBytesStream);
            vaGraphicBase := vadxSmartImage.GetAsBitmap;

            if ((vaGraphicBase.Height <= ipHeight) and (vaGraphicBase.Width <= ipWidth)) then
              Result.Assign(vaGraphicBase)
            else
              begin
                vaGraphicRedimensionado := TBitmap.Create;

                if (ipHeight / vaGraphicBase.Height) <= (ipWidth / vaGraphicBase.Width) then
                  begin
                    vaGraphicRedimensionado.Height := ipHeight;

                    if vaGraphicBase.Height = vaGraphicBase.Width then
                      vaGraphicRedimensionado.Width := vaGraphicRedimensionado.Height
                    else
                      vaGraphicRedimensionado.Width := Trunc(SimpleRoundTo(ipHeight / vaGraphicBase.Height * vaGraphicBase.Width, 0));
                  end
                else
                  begin
                    if vaGraphicBase.Height = vaGraphicBase.Width then
                      vaGraphicRedimensionado.Height := ipWidth
                    else
                      vaGraphicRedimensionado.Height := Trunc(SimpleRoundTo(ipWidth / vaGraphicBase.Width * vaGraphicBase.Height, 0));

                    vaGraphicRedimensionado.Width := ipWidth;
                  end;

                vaBitmap.Canvas.StretchDraw(vaBitmap.Canvas.ClipRect, vaGraphicBase);
                Result.Assign(vaGraphicRedimensionado);
              end;
          end;
      finally
        if Assigned(vaBytesStream) then
          FreeAndNil(vaBytesStream);

        if Assigned(vaGraphicBase) then
          FreeAndNil(vaGraphicBase);

        if Assigned(vaGraphicRedimensionado) then
          FreeAndNil(vaGraphicRedimensionado);

        if Assigned(vadxSmartImage) then
          FreeAndNil(vadxSmartImage);
      end;
    end;
end;

class function TChatFuncoes.fpuMontaIdentificador(const ipCodigoUsuario,
  ipCodigoHospital: Integer): string;
begin
  Result :=
    TRegEx.Replace(IntToStr(ipCodigoUsuario), '-', 'n', [roIgnoreCase, roSingleLine]) +
    '_' +
    TRegEx.Replace(IntToStr(ipCodigoHospital), '-', 'n', [roIgnoreCase, roSingleLine]);
end;

class function TChatFuncoes.fpuTamanhoFormatado(const ipTamanho: Int64): string;
const
  KB = 1024;
  MB = 1024 * KB;
  GB = 1024 * MB;
begin
  Result := '0B';

  if ipTamanho > 0 then
    begin
      case ipTamanho of
        0 .. (KB - 1):
          Result := FormatFloat(',0', ipTamanho) + 'B';
        KB .. (MB - 1):
          Result := FormatFloat(',0.00', ipTamanho / KB) + 'KB';
        MB .. (GB - 1):
          Result := FormatFloat(',0.00', ipTamanho / MB) + 'MB';
      else
        Result := FormatFloat(',0.00', ipTamanho / GB) + 'GB';
      end;
    end;
end;

class procedure TChatFuncoes.ppuAdicionarSmileysTela(
  const ipWidthParentSmileys: Integer;
  const ipOwnerAndParentSmileys: TWinControl;
  const ipImageCollectionItems: TcxImageCollectionItems;
  const ipOnClickSmileys: TNotifyEvent; var ioSmileysExpressaoRegular: string;
  var ioSmileys: TDictionary<string, string>);

var
  vaArrayChaves: System.TArray<string>;

  procedure plcAdicionarSmiley(const ipChave, ipNome: string);
  begin
    SetLength(vaArrayChaves, Length(vaArrayChaves) + 1);
    vaArrayChaves[High(vaArrayChaves)] := ipChave;
    ioSmileys.Add(ipChave, ipNome);
  end;

var
  vaLeft, vaTop, vaColuna, vaQtdeColuna: Integer;
  vaChave: string;
  vaImagem: TcxImageCollectionItem;
  vaImage: TImage;
begin
  SetLength(vaArrayChaves, 0);
  ioSmileys := TDictionary<string, string>.Create;

  plcAdicionarSmiley('>:(', 'People_AngryFace');
  plcAdicionarSmiley(':angustiado:', 'People_AnguishedFace');
  plcAdicionarSmiley(':atonito:', 'People_AstonishedFace');
  plcAdicionarSmiley(':s', 'People_ConfoundedFace');
  plcAdicionarSmiley('O.o', 'People_ConfusedFace');
  plcAdicionarSmiley(':''(', 'People_CryingFace');
  plcAdicionarSmiley(':desapontadomasaliviado:', 'People_DisappointedButRelievedFace');
  plcAdicionarSmiley(':desapontado:', 'People_DisappointedFace');
  plcAdicionarSmiley(':tonto:', 'People_DizzyFace');
  plcAdicionarSmiley('-_-', 'People_ExpressionlessFace');
  plcAdicionarSmiley(':delicia:', 'People_FaceSavouringDeliciousFood');
  plcAdicionarSmiley(':@', 'People_FaceScreamingInFear');
  plcAdicionarSmiley(':*<3', 'People_FaceThrowingAKiss');
  plcAdicionarSmiley(''':<', 'People_FaceWithColdSweat');
  plcAdicionarSmiley(':trinunfo:', 'People_FaceWithLookOfTriumph');
  plcAdicionarSmiley(':#', 'People_FaceWithMedicalMask');
  plcAdicionarSmiley(':o', 'People_FaceWithOpenMouth');
  plcAdicionarSmiley(''':o', 'People_FaceWithOpenMouthAndColdSweat');
  plcAdicionarSmiley(':p', 'People_FaceWithStuckOutTongue');
  plcAdicionarSmiley('¦p', 'People_FaceWithStuckOutTongueAndTightlyClosedEyes');
  plcAdicionarSmiley(';p', 'People_FaceWithStuckOutTongueAndWinkingEye');
  plcAdicionarSmiley('kkkk', 'People_FaceWithTearsOfJoy');
  plcAdicionarSmiley(':silencio:', 'People_FaceWithoutMouth');
  plcAdicionarSmiley(':temeroso:', 'People_FearfulFace');
  plcAdicionarSmiley(':vergonha:', 'People_FlushedFace');
  plcAdicionarSmiley(':(', 'People_FrowningFaceWithOpenMouth');
  plcAdicionarSmiley(':careta:', 'People_GrimacingFace');
  plcAdicionarSmiley(':D', 'People_GrinningFace');
  plcAdicionarSmiley('3:<', 'People_Imp');
  plcAdicionarSmiley(':*', 'People_KissingFace');
  plcAdicionarSmiley('¦*', 'People_KissingFaceWithClosedEyes');
  plcAdicionarSmiley(':_(', 'People_LoudlyCryingFace');
  plcAdicionarSmiley(':|', 'People_NeutralFace');
  plcAdicionarSmiley(':pensativo:', 'People_PensiveFace');
  plcAdicionarSmiley(':raiva:', 'People_PoutingFace');
  plcAdicionarSmiley(':alivio:', 'People_RelievedFace');
  plcAdicionarSmiley('zzzz', 'People_SleepingFace');
  plcAdicionarSmiley(':sonolento:', 'People_SleepyFace');
  plcAdicionarSmiley('O:)', 'People_SmilingFaceWithHalo');
  plcAdicionarSmiley('<3)', 'People_SmilingFaceWithHeartShapedEyes');
  plcAdicionarSmiley('3:)', 'People_SmilingFaceWithHorns');
  plcAdicionarSmiley(''':D', 'People_SmilingFaceWithOpenMouthAndColdSweat');
  plcAdicionarSmiley('8-)', 'People_SmilingFaceWithSunglasses');
  plcAdicionarSmiley(':-1', 'People_SmirkingFace');
  plcAdicionarSmiley('(:|', 'People_TiredFace');
  plcAdicionarSmiley(':cansado:', 'People_WearyFace');
  plcAdicionarSmiley(';)', 'People_WinkingFace');
  plcAdicionarSmiley('>w<', 'People_WorriedFace');
  plcAdicionarSmiley('~:0', 'People_Baby');
  plcAdicionarSmiley('O~:0', 'People_BabyAngel');
  plcAdicionarSmiley('(:-)', 'People_Boy');
  plcAdicionarSmiley('8:^)', 'People_Girl');
  plcAdicionarSmiley(':princesa:', 'People_Princess');
  plcAdicionarSmiley(':homem:', 'People_Man');
  plcAdicionarSmiley(':mulher:', 'People_Woman');
  plcAdicionarSmiley(':noiva:', 'People_BrideWithVeil');
  plcAdicionarSmiley(':idoso:', 'People_OlderMan');
  plcAdicionarSmiley(':idosa:', 'People_OlderWoman');
  plcAdicionarSmiley(':casal:', 'People_ManAndWomanHoldingHands');
  plcAdicionarSmiley(':casalcoracao:', 'People_CoupleWithHeart');
  plcAdicionarSmiley(':familia:', 'People_Family');
  plcAdicionarSmiley(':noel:', 'People_FatherChristmas');
  plcAdicionarSmiley(':construcao:', 'People_ConstructionWorker');
  plcAdicionarSmiley(':policia:', 'People_PoliceOfficer');
  plcAdicionarSmiley(':caveira:', 'People_Skull');
  plcAdicionarSmiley(':fantasma:', 'People_Ghost');
  plcAdicionarSmiley('<3', 'Celebration_HeavyBlackHeart');
  plcAdicionarSmiley(':coracaopartido:', 'Celebration_BrokenHeart');
  plcAdicionarSmiley(':pegadas:', 'People_Footprints');
  plcAdicionarSmiley(':oracao:', 'People_PersonWithFoldedHands');
  plcAdicionarSmiley(':manicure:', 'People_NailPolish');
  plcAdicionarSmiley(':palmas:', 'People_ClappingHandsSign');
  plcAdicionarSmiley(':pare:', 'People_RaisedHand');
  plcAdicionarSmiley(':positivo:', 'People_ThumbsUpSign');
  plcAdicionarSmiley(':negativo:', 'People_ThumbsDownSign');
  plcAdicionarSmiley(':ok:', 'People_OkHandSign');
  plcAdicionarSmiley(':vitoria:', 'People_VictoryHand');
  plcAdicionarSmiley(':tchau:', 'People_WavingHandSign');
  plcAdicionarSmiley(':beijo:', 'People_KissMark');
  plcAdicionarSmiley(':cafe:', 'FoodDrink_HotBeverage');
  plcAdicionarSmiley(':cerveja:', 'FoodDrink_BeerMug');
  plcAdicionarSmiley(':brinde:', 'FoodDrink_ClinkingBeerMugs');
  plcAdicionarSmiley(':vinho:', 'FoodDrink_WineGlass');
  plcAdicionarSmiley(':coquitel:', 'FoodDrink_CocktailGlass');
  plcAdicionarSmiley(':coquiteltropical:', 'FoodDrink_TropicalDrink');
  plcAdicionarSmiley(':nuvem:', 'Nature_Cloud');
  plcAdicionarSmiley(':nublado:', 'Nature_SunBehindCloud');
  plcAdicionarSmiley(':chuva:', 'Nature_UmbrellaWithRainDrops');
  plcAdicionarSmiley(':fogo:', 'Nature_Fire');
  plcAdicionarSmiley(':cacto:', 'Nature_Cactus');
  plcAdicionarSmiley(':palmeira:', 'Nature_PalmTree');
  plcAdicionarSmiley(':pinheiro:', 'Nature_EvergreenTree');
  plcAdicionarSmiley(':arvore:', 'Nature_DeciduousTree');
  plcAdicionarSmiley(':flor:', 'Nature_CherryBlossom');
  plcAdicionarSmiley(':rosa:', 'Nature_Rose');
  plcAdicionarSmiley(':girassol:', 'Nature_Sunflower');
  plcAdicionarSmiley(':tulipa:', 'Nature_Tulip');

  if Length(vaArrayChaves) <> ipImageCollectionItems.Count then
    raise Exception.Create('A quantidade de imagens no componente ImgCollectionSmileys está' + sLineBreak + 'diferente da quantidade de imagens adicionadas na tela.');

  // Montando a expressão regular dos smileys para poder incluí-los no texto das mensagens e incluindo
  // o smiley na tela, par o usuário clicar
  ioSmileysExpressaoRegular := ':[a-z1-9]{1,}:';
  vaLeft := 4;
  vaTop := 4;
  vaColuna := 1;
  vaQtdeColuna := (ipWidthParentSmileys - 25) div 24; // 25 é igual a 4 pixels de espaçamento a esquerda, 4 de espaçamento a direita e 17 do scroll horizontal

  for vaChave in vaArrayChaves do
    begin
      // Montando a expressão regular
      if not TRegEx.IsMatch(vaChave, ':[a-z1-9]{1,}:', [roSingleLine, roIgnoreCase]) then
        ioSmileysExpressaoRegular := ioSmileysExpressaoRegular + '|' + TRegEx.Escape(vaChave);

      // Incluindo o "botão" dos smileys na tela, na mesma ordem em que foram informados
      vaImagem := nil;
      ipImageCollectionItems.FindItemByName(ioSmileys.Items[vaChave], vaImagem);

      if Assigned(vaImagem) then
        begin
          vaImage := TImage.Create(ipOwnerAndParentSmileys);
          vaImage.Parent := ipOwnerAndParentSmileys;
          vaImage.Height := 24;
          vaImage.Width := 24;
          vaImage.Center := True;
          vaImage.Hint := vaChave;
          vaImage.ShowHint := True;
          vaImage.Cursor := crHandPoint;
          vaImage.OnClick := ipOnClickSmileys;
          vaImage.Picture.Graphic := vaImagem.Picture.Graphic;
          vaImage.Top := vaTop;
          vaImage.Left := vaLeft;

          // Calculando o posicionamento da próxima imagem
          Inc(vaColuna);

          if vaColuna >= vaQtdeColuna then
            begin
              vaColuna := 1;
              vaTop := vaTop + vaImage.Height + 2;
            end;

          vaLeft := 4 + ((vaColuna - 1) * (vaImage.Width + 2));
        end;
    end;
end;

class procedure TChatFuncoes.ppuArquivo(const ipTag,
  ipPastaInicialSalvarImagem: string; ipChatDownloadArquivo: TChatDownloadArquivo);
var
  vaLocalArquivo: string;
  vaCodigoHospital: Integer;
begin
  vaCodigoHospital := StrToInt(TRegEx.Match(ipTag, '((?<=arquivoDownload)|(?<=arquivoVisualizar))\d{1,}(?=_)', [roIgnoreCase]).Value);
  vaLocalArquivo := TRegEx.Match(ipTag, '((?<=arquivoDownload' + IntToStr(vaCodigoHospital) + '_)|(?<=arquivoVisualizar' + IntToStr(vaCodigoHospital) + '_)).*', [roIgnoreCase]).Value;

  if TRegEx.IsMatch(ipTag, '^arquivoDownload', [roIgnoreCase]) then
    ppuSalvarArquivo(vaCodigoHospital, vaLocalArquivo, ipPastaInicialSalvarImagem, ipChatDownloadArquivo)
  else
    ppuVisualizarArquivo(vaCodigoHospital, vaLocalArquivo, ipPastaInicialSalvarImagem, ipChatDownloadArquivo);
end;

class procedure TChatFuncoes.ppuConverterSmileysParaTexto(
  const ipRVE: TRichViewEdit);
var
  vaItemNo: Integer;
  vaItemRVE: TCustomRVItemInfo;
begin
  for vaItemNo := ipRVE.ItemCount - 1 downto 0 do
    begin
      vaItemRVE := ipRVE.GetItem(vaItemNo);

      if (vaItemRVE.ClassType = TRVGraphicItemInfo) then
        begin
          ipRVE.SetSelectionBounds(vaItemNo, 0, vaItemNo, 1);
          ipRVE.InsertTextA(vaItemRVE.Tag);
        end;
    end;

  ipRVE.Change;
end;

class procedure TChatFuncoes.ppuConverterTextoParaSmileys(
  const ipRVE: TRichViewEdit; const ipDMChat: TDMChat;
  const ipSmileys: TDictionary<string, string>;
  const ipSmileysExpressaoRegular: string);
var
  vaCodigosImagens: TMatchCollection;
  vaCodigo: TMatch;
  vaTexto, vaTextoParcial, vaNomeImagem: string;
  vaImagem: TcxImageCollectionItem;
  i, vaItemNo, vaItemOffs, vaComprimentoString: Integer;
  vaItemRVE: TCustomRVItemInfo;
  vaPrimeiroSmiley: Boolean;
begin
  vaItemNo := 0;

  while vaItemNo < ipRVE.ItemCount do
    begin
      vaItemRVE := ipRVE.GetItem(vaItemNo);

      // Armazenando o texto original em uma variável
      vaTexto := TRegEx.Replace(vaItemRVE.ItemText, TRegEx.Escape(Char(#0)), '', [roIgnoreCase]);

      if TRegEx.IsMatch(vaTexto, ipSmileysExpressaoRegular, [roIgnoreCase]) then
        begin
          // Posicionando o cursor logo após o item
          vaItemOffs := ipRVE.GetOffsAfterItem(vaItemNo);
          ipRVE.SetSelectionBounds(vaItemNo, vaItemOffs, vaItemNo, vaItemOffs);

          // Pegando os smileys
          vaCodigosImagens := TRegEx.Matches(vaTexto, ipSmileysExpressaoRegular, [roIgnoreCase]);
          vaPrimeiroSmiley := True;

          for vaCodigo in vaCodigosImagens do
            begin
              // Incluindo o texto que está antes do smiley
              vaTextoParcial := TRegEx.Match(vaTexto, '.*?(?=' + TRegEx.Escape(vaCodigo.Value) + ')', [roIgnoreCase]).Value;

              if vaPrimeiroSmiley then
                begin
                  vaItemRVE.ItemText := '';

                  if vaTextoParcial <> '' then
                    begin
                      for i := 1 to Length(vaTextoParcial) do
                        vaItemRVE.ItemText := vaItemRVE.ItemText + vaTextoParcial[i] + Char(#0);
                    end;
                end
              else
                begin
                  if vaTextoParcial <> '' then
                    begin
                      ipRVE.InsertTextA(vaTextoParcial, True);
                      ipRVE.Change;
                    end;
                end;

              // Incluindo o smiley
              if ipSmileys.TryGetValue(vaCodigo.Value, vaNomeImagem) and ipDMChat.ImgCollectionSmileys.Items.FindItemByName(vaNomeImagem, vaImagem) then
                ppuInserirSmileysRichViewEdit(vaImagem.Picture.Graphic, vaCodigo.Value, ipRVE);

              // Pegando todo o texto que está após o smiley
              vaTexto := TRegEx.Match(vaTexto, '(?<=' + TRegEx.Escape(vaCodigo.Value) + ').*', []).Value;
            end;

          // Imprimindo o texto restante
          if vaTexto <> '' then
            ipRVE.InsertTextA(vaTexto, True);

          ipRVE.Change;
          vaItemNo := 0;
        end
      else
        Inc(vaItemNo);
    end;
end;

class procedure TChatFuncoes.ppuDescompactarArquivo(
  const ipArquivo: TBytesStream; const ipDestinoArquivo: string);
var
  vaBytesStream: TBytesStream;
begin
  if Assigned(ipArquivo) then
    begin
      try
        ppuDescompactarArquivo(ipArquivo, vaBytesStream);
        vaBytesStream.SaveToFile(ipDestinoArquivo);
      finally
        if Assigned(vaBytesStream) then
          FreeAndNil(vaBytesStream);
      end;
    end;
end;

class procedure TChatFuncoes.ppuDescompactarArquivo(
  const ipArquivo: TBytesStream; var ioArquivoDescompactado: TBytesStream);

  function ExtractTempDir: String;
  var
    vaBuffer: array [0 .. 144] of Char;
  begin
    GetTempPath(144, vaBuffer);
    Result := IncludeTrailingPathDelimiter(StrPas(vaBuffer));
  end;

  function DescompactarArquivo(ipPastaDestino: string): string;
  var
    vaZip: TZipFile;
  begin
    vaZip := TZipFile.Create;
    Result := '';

    try
      vaZip.Open(ipArquivo, zmRead);
      vaZip.ExtractAll(IncludeTrailingPathDelimiter(ipPastaDestino)); // Local onde o arquivo será descompactado
      Result := vaZip.FileName[0];
    finally
      FreeAndNil(vaZip);
    end;
  end;

var
  vaPastaTemp, vaNomeArquivo: string;
begin
  ioArquivoDescompactado := TBytesStream.Create;

  try
    vaPastaTemp := ExtractTempDir + 'ProMedicoArquivosTemp';
    vaNomeArquivo := DescompactarArquivo(vaPastaTemp);
    ioArquivoDescompactado.LoadFromFile(IncludeTrailingPathDelimiter(vaPastaTemp) + vaNomeArquivo);
    DeleteFile(IncludeTrailingPathDelimiter(vaPastaTemp) + vaNomeArquivo);
  except
    on E: Exception do
      begin
        if Assigned(ioArquivoDescompactado) then
          FreeAndNil(ioArquivoDescompactado);

        MessageTela('Falha ao descompactar o arquivo.' + sLineBreak + E.Message);
      end;
  end;
end;

class procedure TChatFuncoes.ppuIncluirStatusMensagem(
  ipCelula: TRVTableCellData; const ipParagrafo: Integer;
  const ipCodigoLeitura: string; ipMsgLida: Boolean; const ipDMChat: TDMChat);
var
  vaGraphic: TGraphic;
  vaPicture: TPicture;
  i: Integer;
begin
  if ipMsgLida then
    vaPicture := ipDMChat.ImgCollectionItemStatusMensagemLida.Picture
  else
    vaPicture := ipDMChat.ImgCollectionItemStatusMensagemRecebida.Picture;

  if Assigned(vaPicture) then
    begin
      if ipCelula.ItemCount > 0 then
        ipCelula.DeleteItems(0, ipCelula.ItemCount);

      vaGraphic := TGraphicClass(vaPicture.Graphic.ClassType).Create;
      vaGraphic.Assign(vaPicture.Graphic);
      ipCelula.AddHotPictureTag('', vaGraphic, ipParagrafo, rvvaMiddle, 'status' + ipCodigoLeitura);
    end;
end;

class procedure TChatFuncoes.ppuInserirSmileysRichViewEdit(
  const ipGraphic: TGraphic; const ipIdentificacao: string;
  const ipRVE: TRichViewEdit);
var
  vaGraphic: TGraphic;
  vaItemNo, vaItemOffs: Integer;
  vaItemRVG: TRVGraphicItemInfo;
begin
  vaGraphic := TGraphicClass(ipGraphic.ClassType).Create;
  vaGraphic.Assign(ipGraphic);
  vaItemRVG := TRVGraphicItemInfo.CreateEx(ipRVE.RVData, vaGraphic, rvvaMiddle);
  vaItemRVG.ParaNo := 0;
  vaItemRVG.Tag := ipIdentificacao;
  ipRVE.InsertItem('', vaItemRVG);
  ipRVE.Change;

  // Posicionando o cursor logo após a inserção do smiley
  vaItemNo := ipRVE.GetItemNo(vaItemRVG);
  vaItemOffs := ipRVE.GetOffsAfterItem(vaItemNo);
  ipRVE.SetSelectionBounds(vaItemNo, vaItemOffs, vaItemNo, vaItemOffs);
end;

class procedure TChatFuncoes.ppuLeitoresMensagem(const ipTag: string;
  ipPesquisarLeitoresMensagens: TChatPesquisarLeitoresMensagens);
var
  vaChatTelaLeitoresMensagem: TfrmChatTelaLeitoresMensagem;
  vaData: OleVariant;
begin
  // O usuário está vendo quem leu a mensagem
  vaChatTelaLeitoresMensagem := nil;

  try
    Application.CreateForm(TfrmChatTelaLeitoresMensagem, vaChatTelaLeitoresMensagem);

    // Pesquisando os usuários que leram a mensagem
    vaData := ipPesquisarLeitoresMensagens(StrToInt(TRegEx.Match(ipTag, '(?<=_)-?\d{1,}$', [roIgnoreCase]).Value), StrToInt(TRegEx.Match(ipTag, '(?<=status)-?\d{1,}(?=_)', [roIgnoreCase]).Value));

    vaChatTelaLeitoresMensagem.ppuLeitoresMensagem(vaData);
    vaChatTelaLeitoresMensagem.Caption := 'Leitores da Mensagem';
    vaChatTelaLeitoresMensagem.ShowModal;
  finally
    if Assigned(vaChatTelaLeitoresMensagem) then
      FreeAndNil(vaChatTelaLeitoresMensagem);
  end;
end;

class procedure TChatFuncoes.ppuLink(ipTag: TRVTag; ipItemNo: Integer;
  ipRVFormattedData: TCustomRVFormattedData);
var
  vaLink: string;
begin
  ipRVFormattedData.GetTextInfo(ipItemNo, vaLink, ipTag);

  if TRegEx.IsMatch(ipTag, 'e-mail', [roIgnoreCase, roSingleLine]) then
    vaLink := 'mailto:' + vaLink;

  ShellExecute(Application.Handle, '', PChar(vaLink), '', '', SW_SHOWNORMAL);
end;

class procedure TChatFuncoes.ppuPreencherRichViewEdit(
  const ipMensagem: OleVariant; ipRVE: TRichViewEdit;
  const ipIdentificador: string; const ipPosicaoScroll: Integer;
  const ipDestacarTextoPesquisa: string; const ipExibirLinkVisualizacaoPesquisa,
  ipExibirLinkVoltarPesquisa, ipLimparRichViewEdit: Boolean;
  const ipCodigoMensagemDestacar: Integer; const ipEstilo: TChatEstiloRich;
  const ipDMChat: TDMChat; const ipSmileys: TDictionary<string, string>;
  const ipSmileysExpressaoRegular: string;
  const ipAoConfirmarLeituraMensagens: TChatConfirmarLeituraMensagens;
  const ipUsuarioLogado: TChatIdentificacaoUsuario;
  var ioDadosConversas: TDictionary<string, TChatDadosConversa>;
  var ioCodigoPrimeiraMsgNaoLida: Integer);

  function flcConfigTabela(const ipBorderWidth, ipLinhas, ipColunas: Integer; const ipRichViewEdit: TRichViewEdit): TRVTableItemInfo;
  var
    X, Y: Integer;
  begin
    // Criando a tabela e adicionando no RichViewEdit
    Result := TRVTableItemInfo.CreateEx(ipLinhas, ipColunas, ipRichViewEdit.RVData);
    ipRichViewEdit.AddItem('', Result);

    // Configurando a tabela
    Result.IgnoreBordersInvisible := true;
    Result.Options := [];
    Result.BorderWidth := ipBorderWidth;
    Result.BorderStyle := rvtbColor;
    Result.BorderColor := $00CACACA;

    Result.VisibleBorders.Left := False;
    Result.VisibleBorders.Right := False;
    Result.VisibleBorders.Top := ipBorderWidth > 0;
    Result.VisibleBorders.Bottom := False;

    Result.BorderVSpacing := 0;
    Result.BorderHSpacing := 0;

    Result.CellPadding := 0;
    Result.CellHPadding := 0;
    Result.CellVPadding := 2;
    Result.CellBorderWidth := 0;

    // Limpando o conteúdo de todas as células
    for X := 0 to Result.RowCount - 1 do
      begin
        for Y := 0 to Result.ColCount - 1 do
          Result.Cells[X, Y].Clear;
      end;
  end;

  procedure plcIncluirTextoComImagens(ipCelula: TRVTableCellData; const ipTexto: string; const ipEstiloTexto, ipNroParagrafo: Integer; const ipIncluirSmileys: Boolean);
  var
    vaCodigosImagens: TMatchCollection;
    vaCodigo: TMatch;
    vaTexto, vaNomeImagem: string;
    vaNroParagrafo: Integer;
    vaImagem: TcxImageCollectionItem;
    vaGraphic: TGraphic;
  begin
    // Verificando se existem smileys
    if (not ipIncluirSmileys) or (not TRegEx.IsMatch(ipTexto, ipSmileysExpressaoRegular, [roIgnoreCase])) then
      ipCelula.AddTextBlockNLA(ipTexto, ipEstiloTexto, ipNroParagrafo, 'texto')
    else
      begin
        vaNroParagrafo := ipNroParagrafo;
        vaTexto := ipTexto;

        // Pegando os smileys
        vaCodigosImagens := TRegEx.Matches(ipTexto, ipSmileysExpressaoRegular, [roIgnoreCase]);

        for vaCodigo in vaCodigosImagens do
          begin
            // Incluindo o texto que está antes do smiley
            ipCelula.AddTextBlockNLA(TRegEx.Match(vaTexto, '.*?(?=' + TRegEx.Escape(vaCodigo.Value) + ')', [roIgnoreCase]).Value, ipEstiloTexto, vaNroParagrafo, 'texto');

            // A partir deste ponto não haverá um parágrafo definito, para não incluir uma nova linha
            vaNroParagrafo := -1;

            // Incluindo o smiley
            if ipSmileys.TryGetValue(AnsiLowerCase(vaCodigo.Value), vaNomeImagem) then
              begin
                try
                  ipDMChat.ImgCollectionSmileys.Items.FindItemByName(vaNomeImagem, vaImagem);
                  vaGraphic := TGraphicClass(vaImagem.Picture.Graphic.ClassType).Create;
                  vaGraphic.Assign(vaImagem.Picture.Graphic);
                  ipCelula.AddPictureExTag('', vaGraphic, vaNroParagrafo, rvvaMiddle, 'Smiley');
                except
                  ipCelula.AddTextBlockNLA(vaCodigo.Value, ipEstiloTexto, vaNroParagrafo, 'texto');
                end;
              end
            else
              ipCelula.AddTextBlockNLA(vaCodigo.Value, ipEstiloTexto, vaNroParagrafo, 'texto');

            // Pegando todo o texto que está após o smiley
            vaTexto := TRegEx.Match(vaTexto, '(?<=' + TRegEx.Escape(vaCodigo.Value) + ').*', []).Value;
          end;

        // Imprimindo o texto restante
        if vaTexto <> '' then
          ipCelula.AddTextBlockNLA(vaTexto, ipEstiloTexto, vaNroParagrafo, 'texto');
      end;
  end;

  procedure plcIncluirAnexo(ipCelula: TRVTableCellData; ipCodigoHospital: Integer);
  const
    coSalvar = 'arquivoDownload';
    coVisualizar = 'arquivoVisualizar';
  var
    vaGraphic: TGraphic;
    vaPicture: TPicture;
    vaBytesStream: TBytesStream;
    vaTabela: TRVTableItemInfo;
    vaThumbnail: Boolean;
    vaIdentificacaoArquivo: string;
  begin
    vaGraphic := nil;
    vaPicture := nil;
    vaBytesStream := nil;
    vaThumbnail := not ipDMChat.cdsMensagemTHUMBNAIL.IsNull;
    vaIdentificacaoArquivo := IntToStr(ipCodigoHospital) + '_' + ipDMChat.cdsMensagemENDERECO_ANEXO.AsString;

    try
      if vaThumbnail then
        begin
          vaBytesStream := TBytesStream.Create;
          ipDMChat.cdsMensagemTHUMBNAIL.SaveToStream(vaBytesStream);
          vaBytesStream.Position := 0;
          vaGraphic := fpuImagem(vaBytesStream, TWICImageFormat.wifJpeg);
        end
      else
        begin
          vaPicture := fpuIconeArquivo(ipDMChat.cdsMensagemEXTENSAO.AsString, ipDMChat);

          if Assigned(vaPicture.Graphic) then
            begin
              vaGraphic := TGraphicClass(vaPicture.Graphic.ClassType).Create;
              vaGraphic.Assign(vaPicture.Graphic);
            end;
        end;
    finally
      if Assigned(vaBytesStream) then
        FreeAndNil(vaBytesStream);

      if Assigned(vaPicture) then
        FreeAndNil(vaPicture);
    end;

    vaTabela := TRVTableItemInfo.CreateEx(1, 2, ipRVE.RVData);
    ipCelula.AddItem('', vaTabela);

    // Configurando a tabela
    vaTabela.Options := [];
    vaTabela.BorderWidth := 0;
    vaTabela.Color := clNone;

    vaTabela.VisibleBorders.Left := False;
    vaTabela.VisibleBorders.Right := False;
    vaTabela.VisibleBorders.Top := False;
    vaTabela.VisibleBorders.Bottom := False;

    vaTabela.BorderVSpacing := 0;
    vaTabela.BorderHSpacing := 0;

    vaTabela.CellPadding := 0;
    vaTabela.CellHPadding := 0;
    vaTabela.CellVPadding := 0;
    vaTabela.CellBorderWidth := 0;

    vaTabela.Cells[0, 0].BestWidth := 1;
    vaTabela.Cells[0, 0].VAlign := rvcMiddle;
    vaTabela.Cells[0, 0].Clear;

    if Assigned(vaGraphic) then
      begin
        if vaThumbnail then
          vaTabela.Cells[0, 0].AddHotPictureTag('', vaGraphic, 4, rvvaMiddle, coVisualizar + vaIdentificacaoArquivo)
        else
          vaTabela.Cells[0, 0].AddHotPictureTag('', vaGraphic, 4, rvvaMiddle, coSalvar + vaIdentificacaoArquivo);
      end;

    vaTabela.Cells[0, 1].VAlign := rvcMiddle;
    vaTabela.Cells[0, 1].Clear;

    vaTabela.Cells[0, 1].AddTextBlockNLA(
      ipDMChat.cdsMensagemNOME_ARQUIVO.AsString + ' - ' + fpuTamanhoFormatado(ipDMChat.cdsMensagemTAMANHO_KB.AsInteger * 1024),
      0, 4, 'texto');

    vaTabela.Cells[0, 1].AddTextBlockNLA('Salvar', 4, 4, coSalvar + vaIdentificacaoArquivo);

    if not ipDMChat.cdsMensagemTHUMBNAIL.IsNull then
      begin
        vaTabela.Cells[0, 1].AddTextBlockNLA(' | ', 0, -1, 'texto');
        vaTabela.Cells[0, 1].AddTextBlockNLA('Visualizar', 4, -1, coVisualizar + vaIdentificacaoArquivo);
      end;
  end;

var
  vaTabela: TRVTableItemInfo;
  vaLabel: TLabel;
  vaTexto: string;
  i, vaCodigoHospital, vaCodigoMensagem, vaCodigoUltimaMensagem, vaQtdeLinhas, vaNroParagrafo, vaLinha, vaCodigoUltimoRemetente: Integer;
  vaLinhas: System.TArray<string>;
  vaLinks: TMatchCollection;
  vaLink: TMatch;
  vaIncluirSmileys, vaConversaEmGrupo, vaSepararMsg, vaMesmoDiaHoraMinuto: Boolean;
  vaDadosConversa: TChatDadosConversa;
  vaLeituraConfirmada: Boolean;
  vaDataUltimaMensagemRichView: TDateTime;
begin
  // **************************
  // Parágrafos               *
  // 0 - ParagrafoGenerico    * Este parágrafo existe por casa da tabela que usa o primeiro parágrafo como referência para se posicionar dentro do componente (TRichViewEdit)
  // 1 - ParagrafoRemetente   *
  // 2 - ParagrafoDataHora    *
  // 3 - ParagrafoMensagem    *
  // 4 - ParagrafoDivisaoData *
  // -------------------------*
  // Estilos                  *
  // 0 - FontRemetente        *
  // 1 - FontDataHora         *
  // 2 - FontMensagem         *
  // 3 - FontDivisaoData      *
  // **************************

  // Inicializando algumas variáveis
  vaLabel := nil;
  ioCodigoPrimeiraMsgNaoLida := 0;
  vaDataUltimaMensagemRichView := 0;
  vaCodigoUltimoRemetente := 0;

  // A variável está nula
  if VarIsNull(ipMensagem) then
    begin
      if ipLimparRichViewEdit then
        begin
          ipRVE.Clear;
          ipRVE.Change;
          ipRVE.Format;
        end;

      Exit;
    end;

  // Carregando os dados
  ipDMChat.cdsMensagem.Data := ipMensagem;

  // Se não tem nada no ClientDataSet
  if ipDMChat.cdsMensagem.RecordCount = 0 then
    begin
      if ipLimparRichViewEdit then
        begin
          ipRVE.Clear;
          ipRVE.Change;
          ipRVE.Format;
        end;

      ipDMChat.cdsMensagem.Close;
      Exit;
    end;

  vaCodigoHospital := fpuCodigoHospital(ipIdentificador);
  vaLabel := nil;

  // Verificando se a conversa é em grupo

  // *************************************
  // Mensagem                            *
  // Sem remetente: Enviada pelo sistema *
  // Sem destinatário: Grupo "todos"     *
  // *************************************

  // Se o destinatário for zero, então está no grupo "todos"
  vaConversaEmGrupo := ipDMChat.cdsMensagemCODIGO_SENHA_DESTINATARIO.AsInteger = 0;

  if not vaConversaEmGrupo then
    vaConversaEmGrupo := ipDMChat.cdsMensagemUSUARIO_GRUPO_DESTINATARIO.AsInteger = 1;

  try
    vaLabel := TLabel.Create(nil);
    vaLabel.Font.Name := ipDMChat.RVStyle1.TextStyles.Items[1].FontName;
    vaLabel.Font.Size := ipDMChat.RVStyle1.TextStyles.Items[1].Size;
    vaLabel.Font.Style := ipDMChat.RVStyle1.TextStyles.Items[1].Style;

    // Verificando se é para limpar o RichViewEdit
    if ipLimparRichViewEdit then
      ipRVE.Clear;

    // Iniciando a variável com um valor diferente da primeira mensagem
    vaCodigoUltimaMensagem := ipDMChat.cdsMensagemCODIGO.AsInteger - 1;

    // Incluindo no início um link para voltar a pesquisa
    if ipExibirLinkVoltarPesquisa then
      begin
        vaTabela := flcConfigTabela(1, 1, 1, ipRVE);
        vaTabela.Color := $00D2FFFF;

        vaTabela.MergeCells(0, 0, 4, 1, False);
        vaTabela.Cells[0, 0].AddTextBlockNLA(
          'Voltar para a pesquisa',
          4,
          3,
          'pesquisar#VoltarPesquisa' +
          '#idUserConversa' + ipIdentificador +
          '#DestacarTexto' + ipDestacarTextoPesquisa);
      end;

    // Buscando as informações da conversa para confirmar a leitura das mensagens
    vaDadosConversa := ioDadosConversas.Items[ipIdentificador];
    ipDMChat.cdsMensagem_Aux.Data := vaDadosConversa.Mensagens;
    ipDMChat.cdsMensagem_AuxMENSAGEM_LIDA.ProviderFlags := [pfInUpdate];
    ipDMChat.cdsMensagem_AuxMENSAGEM_LIDA_USUARIO_LOGADO.ProviderFlags := [pfInUpdate];

    //se não limpou o richview temos que pegar a data e hora da ultima msg exibida para nao duplicar a data
    if (not ipLimparRichViewEdit) and (ipDMChat.cdsMensagem_Aux.RecordCount > 1) then
      begin
        ipDMChat.cdsMensagem_Aux.Last;
        //temos que voltar uma posicao porque a mensagem que acabou de receber já esta inclusa no cdsMensagem_Aux
        ipDMChat.cdsMensagem_Aux.Prior;

        vaDataUltimaMensagemRichView := ipDMChat.cdsMensagem_AuxDATA_HORA_ENVIO.AsDateTime;
        vaCodigoUltimoRemetente := ipDMChat.cdsMensagem_AuxCODIGO_SENHAUS_REMETENTE.AsInteger;
      end;

    // Carregando as mensagens no RichViewEdit
    while (not ipDMChat.cdsMensagem.Eof) do
      begin
        // Verificando se houve mudança de registro. Se houve mudança vamos preencher todos os dados da mensagens, se não
        // vamos preencher apenas o anexo
        if vaCodigoUltimaMensagem <> ipDMChat.cdsMensagemCODIGO.AsInteger then
          begin
            vaCodigoUltimaMensagem := ipDMChat.cdsMensagemCODIGO.AsInteger;

            // Confirmando a leitura da mensagem
            vaLeituraConfirmada := ipDMChat.cdsMensagemMENSAGEM_LIDA.AsInteger = 1;
            if (not vaLeituraConfirmada) and (ioCodigoPrimeiraMsgNaoLida = 0) then
              ioCodigoPrimeiraMsgNaoLida := ipDMChat.cdsMensagemCODIGO.AsInteger;

            if (ipDMChat.cdsMensagemMENSAGEM_LIDA_USUARIO_LOGADO.AsInteger = 0) and (ipDMChat.cdsMensagemCODIGO_SENHAUS_REMETENTE.AsInteger <> ipUsuarioLogado.CodigoUsuario) then
              begin
                try
                  if ipDMChat.cdsMensagem_Aux.RecordCount = ipDMChat.cdsMensagem.RecordCount then
                    ipDMChat.cdsMensagem_Aux.RecNo := ipDMChat.cdsMensagem.RecNo;

                  if ipDMChat.cdsMensagem_AuxCODIGO.AsInteger = ipDMChat.cdsMensagemCODIGO.AsInteger then
                    begin
                      if Assigned(ipAoConfirmarLeituraMensagens) then
                        ipAoConfirmarLeituraMensagens(ipUsuarioLogado, IntToStr(ipDMChat.cdsMensagem_AuxCODIGO.AsInteger));

                      if not(ipDMChat.cdsMensagem_Aux.State in [dsEdit, dsInsert]) then
                        ipDMChat.cdsMensagem_Aux.Edit;

                      ipDMChat.cdsMensagem_AuxMENSAGEM_LIDA.AsInteger := 1;
                      ipDMChat.cdsMensagem_AuxMENSAGEM_LIDA_USUARIO_LOGADO.AsInteger := 1;
                      ipDMChat.cdsMensagem_Aux.Post;
                    end
                  else
                    begin
                      if ipDMChat.cdsMensagem_Aux.Locate('CODIGO', ipDMChat.cdsMensagemCODIGO.AsInteger, []) then
                        begin
                          if Assigned(ipAoConfirmarLeituraMensagens) then
                            ipAoConfirmarLeituraMensagens(ipUsuarioLogado, IntToStr(ipDMChat.cdsMensagem_AuxCODIGO.AsInteger));

                          if not(ipDMChat.cdsMensagem_Aux.State in [dsEdit, dsInsert]) then
                            ipDMChat.cdsMensagem_Aux.Edit;

                          ipDMChat.cdsMensagem_AuxMENSAGEM_LIDA.AsInteger := 1;
                          ipDMChat.cdsMensagem_Aux.Post;
                        end;
                    end;

                  vaLeituraConfirmada := True;
                except
                  vaLeituraConfirmada := False;

                  if (ipDMChat.cdsMensagem_Aux.State in [dsEdit, dsInsert]) then
                    ipDMChat.cdsMensagem_Aux.Cancel;
                end;
              end;

            // Verificando se há a necessidade de incluir a divisão da data
            if FormatDateTime('dd/mm/yyyy', vaDataUltimaMensagemRichView) <> FormatDateTime('dd/mm/yyyy', ipDMChat.cdsMensagemDATA_HORA_ENVIO.AsDateTime) then
              begin
                vaTabela := flcConfigTabela(1, 1, 1, ipRVE);
                vaTabela.Color := clSilver;

                vaTabela.Cells[0, 0].AddTextBlockNLA(TUtils.fpuCapitalize(TRegEx.Replace(FormatDateTime('dddd, dd of mmmm of yyyy', ipDMChat.cdsMensagemDATA_HORA_ENVIO.AsDateTime), 'of', 'de', [roSingleLine, roIgnoreCase])), 3, 5);

                // Se mudou o dia, então não precisa testar mais nada
                vaMesmoDiaHoraMinuto := False;
              end
            else
              begin
                vaMesmoDiaHoraMinuto := (HourOf(vaDataUltimaMensagemRichView) = HourOf(ipDMChat.cdsMensagemDATA_HORA_ENVIO.AsDateTime)) and
                  (MinuteOf(vaDataUltimaMensagemRichView) = MinuteOf(ipDMChat.cdsMensagemDATA_HORA_ENVIO.AsDateTime));
              end;

            vaSepararMsg := (ipEstilo <> erNormal) or (not vaMesmoDiaHoraMinuto) or (vaCodigoUltimoRemetente <> ipDMChat.cdsMensagemCODIGO_SENHAUS_REMETENTE.AsInteger);
            vaCodigoUltimoRemetente := ipDMChat.cdsMensagemCODIGO_SENHAUS_REMETENTE.AsInteger;
            vaDataUltimaMensagemRichView := ipDMChat.cdsMensagemDATA_HORA_ENVIO.AsDateTime;

            // Tabela da mensagem (uma linha e quatro colunas). Obs.: Pode haver duas linhas, caso deva exibir o link de visualização da mensagem
            // Primeira coluna: Nome de quem enviou a mensagem
            // Segunda coluna: Mensagem
            // Terceira coluna: Data e hora de envio
            // Quarta coluna: Leitores da mensagem
            if ipExibirLinkVisualizacaoPesquisa then
              begin
                vaTabela := flcConfigTabela(IfThen(vaSepararMsg, 1, 0), 2, 4, ipRVE);
                vaLinha := 1;
              end
            else
              begin
                vaLinha := 0;
                vaTabela := flcConfigTabela(IfThen(vaSepararMsg, 1, 0), 1, 4, ipRVE);
              end;

            // Identificando a tabela
            vaTabela.Tag := IntToStr(ipDMChat.cdsMensagemCODIGO.AsInteger) + '_' + IntToStr(vaCodigoHospital);

            // Ajustando o tamanho das células
            if ipExibirLinkVisualizacaoPesquisa then
              begin
                vaTabela.MergeCells(0, 0, 4, 1, False);
                vaTabela.Cells[0, 0].Color := clWhite;
                vaTabela.Cells[0, 0].AddTextBlockNLA(
                  'Visualizar',
                  4,
                  3,
                  'pesquisar#CodMsg' + IntToStr(ipDMChat.cdsMensagemCODIGO.AsInteger) +
                  '#idUserConversa' + ipIdentificador +
                  '#DestacarTexto' + ipDestacarTextoPesquisa);
              end;

            vaTabela.Cells[vaLinha, 0].BestWidth := 100; // Nome do remetente
            vaTabela.Cells[vaLinha, 2].BestWidth := 35; // Data e hora de envio da mensagem
            vaTabela.Cells[vaLinha, 3].BestWidth := 20; // Imagem de recebimento e leitura da mensagem

            // A princípio todas as mensagens terão smilyes
            vaIncluirSmileys := True;

            // Primeira coluna: Remetente da mensagem
            if ipDMChat.cdsMensagemCODIGO_SENHAUS_REMETENTE.AsInteger = 0 then
              begin
                 // Mensagem do sistema
                if vaSepararMsg then
                  vaTabela.Cells[vaLinha, 0].AddTextBlockNLA('Pro-Médico', 1, 1);

                // As mensagens do sistema não terão smileys
                vaIncluirSmileys := False;
              end
            else
              begin
                // Mensagem de algum usuário
                if vaSepararMsg then
                  begin
                    // Este label serve para ajustar o tamanho do nome do rementente da mensam ao espaço (100 px) atual da célula
                    vaLabel.Caption := TUtils.fpuCapitalize(ipDMChat.cdsMensagemNOME_REMETENTE.AsString);

                    if vaLabel.Width > 96 then
                      begin
                        vaLabel.Caption := vaLabel.Caption + '...';

                        while (vaLabel.Width > 96) do
                          vaLabel.Caption := TRegEx.Match(vaLabel.Caption, '.+?(?=.\.\.\.)', [roSingleLine, roIgnoreCase]).Value + '...';
                      end;

                    vaTabela.Cells[vaLinha, 0].AddTextBlockNLA(vaLabel.Caption, 1, 1);
                  end;
              end;

            // Segunda coluna: Mensagem
            // A mensagem será quebrada em linhas e cada linha será um novo parágrafo para facilitar o código.
            // Em cada linha será separado o texto dos links.
            // Em cada texto serão separadas as palavras dos smileys
            // O código será escrito seguindo a ordem da explicação acima

            // O texto será incluído, somentente se tiver algo escrito
            if Trim(ipDMChat.cdsMensagemTEXTO.AsString) <> '' then
              begin
                // Pegando as linhas do texto (cada linha será um novo parágrafo)
                vaLinhas := TRegEx.Split(ipDMChat.cdsMensagemTEXTO.AsString, '\r\n', []);
                vaQtdeLinhas := Length(vaLinhas);

                // Adicionando as linhas
                for i := 0 to vaQtdeLinhas - 1 do
                  begin
                    if (i + 1) = vaQtdeLinhas then
                      vaNroParagrafo := 3 // Este parágrafo possui um espaço após o parágrafo e deve ser usado somente na última linha do texto
                    else
                      vaNroParagrafo := 4; // Este parágrafo não possui espaço após o parágrafo

                    // Verificando se existem links na linha
                    vaLinks := TRegEx.Matches(vaLinhas[i], '(^|(?<=(\s|\(|\[|\{|\r)))((http(s\d?)?\:\/\/|www\.).+?|[\w\.]+?@[\w\.]+?\.[a-z0-9]{2,})(?=(\s|\)|\]|\}|,|;|\.\s|$))', [roIgnoreCase, roSingleLine]);

                    if vaLinks.Count = 0 then
                      // Nenhum link encontrado, então vamos apenas adicionar o texto e os smileys
                      plcIncluirTextoComImagens(vaTabela.Cells[vaLinha, 1], vaLinhas[i], 0, vaNroParagrafo, vaIncluirSmileys)
                    else
                      begin
                        // Existem links, então vamos adicioná-los

                        // Passando para a variável vaTexto todo o texto da linha, pois esta será uma variável de controle. Enquanto houver texto nesta variável,
                        // haverá impressão na tela
                        vaTexto := vaLinhas[i];

                        // Incluindo todos os links
                        for vaLink in vaLinks do
                          begin
                            // Incluindo o texto que está antes do link
                            plcIncluirTextoComImagens(vaTabela.Cells[vaLinha, 1], TRegEx.Match(vaTexto, '.*?(?=' + TRegEx.Escape(vaLink.Value) + ')', []).Value, 0, vaNroParagrafo, vaIncluirSmileys);

                            // A partir deste ponto não haverá um parágrafo definito, para não incluir uma nova linha
                            vaNroParagrafo := -1;

                            // Incluindo o link
                            if TRegEx.IsMatch(vaLink.Value, '[\w\.]+?@[\w\.]+?\.[a-z0-9]', [roIgnoreCase, roSingleLine]) then
                              vaTabela.Cells[vaLinha, 1].AddTextBlockNLA(vaLink.Value, 4, -1, 'e-mail')
                            else
                              vaTabela.Cells[vaLinha, 1].AddTextBlockNLA(vaLink.Value, 4, -1, 'link');

                            // Pegando todo o texto que está após o link
                            vaTexto := TRegEx.Match(vaTexto, '(?<=' + TRegEx.Escape(vaLink.Value) + ').*', []).Value;
                          end;

                        // Incluindo na linha o texto restante, ou seja, todo o texto que está após o último link da linha, caso ainda haja texto a ser incluído
                        if vaTexto <> '' then
                          plcIncluirTextoComImagens(vaTabela.Cells[vaLinha, 1], vaLinhas[i], 0, vaNroParagrafo, vaIncluirSmileys);
                      end;
                  end;
              end;

            // Terceira coluna: Data e hora de envio
            if vaSepararMsg then
              vaTabela.Cells[vaLinha, 2].AddTextBlockNLA(FormatDateTime('hh:mm', ipDMChat.cdsMensagemDATA_HORA_ENVIO.AsDateTime), 2, 2);

            // Quarta coluna: Leitores da mensagem, só irá aparecer nas mensagem enviadas, as recebidas nao irão aparecer
            if (ipDMChat.cdsMensagemCODIGO_SENHAUS_REMETENTE.AsInteger = ipUsuarioLogado.CodigoUsuario) then
              begin
                ppuIncluirStatusMensagem(
                  vaTabela.Cells[vaLinha, 3],
                  2,
                  IntToStr(ipDMChat.cdsMensagemCODIGO.AsInteger) + '_' +
                  IntToStr(vaCodigoHospital),
                  vaLeituraConfirmada,
                  ipDMChat);
              end;

            // Diferenciando a mensagem por cor
            if (ipCodigoMensagemDestacar <> 0) and (ipCodigoMensagemDestacar = ipDMChat.cdsMensagemCODIGO.AsInteger) then
              begin
                // Está fazendo uma pesquisa e selecionou uma mensagem específica, então vamos destacar
                // com uma cor diferente a mensagem selecionada
                // Amarelo
                vaTabela.Color := $00D2FFFF;
                vaTabela.Cells[vaLinha, 0].Color := $00B3FFFF;
              end
            else
              begin
                if ipDMChat.cdsMensagemTIPO.AsInteger = 1 then
                  begin
                    // Mensagem de alerta. A mensagem de alerta tem sempre a mesma cor, independente de quem tenha enviado
                    // Vermelho
                    vaTabela.Color := $00D5D5FF;
                    vaTabela.Cells[vaLinha, 0].Color := $00BFBFFF;
                  end
                else
                  begin
                    if ipDMChat.cdsMensagemCODIGO_SENHAUS_REMETENTE.AsInteger = 0 then
                      begin
                        // Mensagem enviada pelo sistema
                        // Verde
                        vaTabela.Color := $00D7FFD7;
                        vaTabela.Cells[vaLinha, 0].Color := $00B9FFB9;
                      end
                    else
                      begin
                        if (ipDMChat.cdsMensagemCODIGO_SENHAUS_REMETENTE.AsInteger = ipUsuarioLogado.CodigoUsuario) then
                          begin
                            // O usuário logado enviou a mensagem
                            // Branco e cinza
                            vaTabela.Color := clWhite;
                            vaTabela.Cells[vaLinha, 0].Color := $00DFDFDF;
                          end
                        else
                          begin
                            // O usuário logado recebeu a mensagem
                            // Azul
                            vaTabela.Color := $00FBEEE3;
                            vaTabela.Cells[vaLinha, 0].Color := $00F8E3D1;
                          end;
                      end;
                  end;
              end;
          end;

        // Incluindo os anexos da mensagem na céluala
        if (not ipDMChat.cdsMensagemCODIGO_MENSAGEM_ANEXO.IsNull) and (Trim(ipDMChat.cdsMensagemENDERECO_ANEXO.AsString) <> '') then
          plcIncluirAnexo(vaTabela.Cells[vaLinha, 1], vaCodigoHospital);

        // Passando para a próxima mensagem
        ipDMChat.cdsMensagem.Next;
      end;

    // Gravando a confirmação da leitura das mensagens
    vaDadosConversa.Mensagens := ipDMChat.cdsMensagem_Aux.Data;
    ioDadosConversas.Items[ipIdentificador] := vaDadosConversa;
  finally
    if ipDMChat.cdsMensagem.Active then
      ipDMChat.cdsMensagem.EmptyDataSet;

    ipDMChat.cdsMensagem.Close;

    if ipDMChat.cdsMensagem_Aux.Active then
      ipDMChat.cdsMensagem_Aux.EmptyDataSet;

    ipDMChat.cdsMensagem_Aux.Close;

    if Assigned(vaLabel) then
      FreeAndNil(vaLabel);
  end;

  ipRVE.Change;
  ipRVE.Format;
end;

class procedure TChatFuncoes.ppuSalvarArquivo(const ipCodigoHospital: Integer;
  const ipLocalArquivo, ipPastaInicialSalvarImagem: string;
  ipChatDownloadArquivo: TChatDownloadArquivo);
var
  vaArquivo: TBytesStream;
  vaDestinoArquivo, vaNomeArquivo, vaExtensaoArquivo: string;
begin
  vaArquivo := nil;

  try
    // Fazendo o download do arquivo
    vaArquivo := ipChatDownloadArquivo(ipCodigoHospital, ipLocalArquivo);

    // Verificando se conseguiu fazer o download do arquivo
    if not Assigned(vaArquivo) then
      begin
        MessageTela('Arquivo não encontrado.');
        Exit;
      end;

    // Extraindo o nome do arquivo
    vaNomeArquivo := ExtractFileName(ipLocalArquivo);

    if TRegEx.IsMatch(vaNomeArquivo, '_\d{1,}\.zip$', [roIgnoreCase]) then
      vaNomeArquivo := TRegEx.Match(vaNomeArquivo, '.*(?=' + TRegEx.Escape(TRegEx.Match(vaNomeArquivo, '_\d{1,}\.zip$', [roIgnoreCase]).Value) + ')', [roIgnoreCase]).Value;

    DMChat.SaveDialog1.InitialDir := ipPastaInicialSalvarImagem;
    DMChat.SaveDialog1.FileName := vaNomeArquivo;

    // Selecionando o local onde o arquivo será salvo
    if DMChat.SaveDialog1.Execute then
      begin
        vaDestinoArquivo := ExtractFileDir(DMChat.SaveDialog1.Files.Text);
        vaExtensaoArquivo := ExtractFileExt(DMChat.SaveDialog1.Files.Text);
        vaNomeArquivo := ExtractFileName(DMChat.SaveDialog1.Files.Text);

        while FileExists(IncludeTrailingPathDelimiter(vaDestinoArquivo) + vaNomeArquivo) do
          begin
            if TRegEx.IsMatch(vaNomeArquivo, '(?<=\()\d{1,}(?=\)' + TRegEx.Escape(vaExtensaoArquivo) + '$)', [roIgnoreCase]) then
              vaNomeArquivo := TRegEx.Replace(vaNomeArquivo, '(?<=\()\d{1,}(?=\)' + TRegEx.Escape(vaExtensaoArquivo) + '$)',
                IntToStr(StrToInt(TRegEx.Match(vaNomeArquivo, '(?<=\()\d{1,}(?=\)' + TRegEx.Escape(vaExtensaoArquivo) + '$)', [roIgnoreCase]).Value) + 1), [roIgnoreCase])
            else
              vaNomeArquivo := TRegEx.Match(vaNomeArquivo, '.*(?=' + TRegEx.Escape(vaExtensaoArquivo) + '$)', [roIgnoreCase]).Value + '(1)' + vaExtensaoArquivo;
          end;

        // Salvando o arquivo na pasta selecionada
        ppuDescompactarArquivo(vaArquivo, IncludeTrailingPathDelimiter(vaDestinoArquivo) + vaNomeArquivo);
        MessageTela('Arquivo salvo em:' + sLineBreak + IncludeTrailingPathDelimiter(vaDestinoArquivo) + vaNomeArquivo);
      end;
  finally
    if Assigned(vaArquivo) then
      FreeAndNil(vaArquivo);
  end;
end;

class procedure TChatFuncoes.ppuVisualizarArquivo(
  const ipCodigoHospital: Integer; const ipLocalArquivo,
  ipPastaInicialSalvarImagem: string;
  ipChatDownloadArquivo: TChatDownloadArquivo);
var
  vaArquivo, vaArquivoDescompactado: TBytesStream;
  vafrmZoomImg: TfrmZoomImg;
  vaGraphic: TGraphic;
  vaGraphicClass: TGraphicClass;
  vaPicture: TPicture;
  vaGalleryControlItem: TdxGalleryControlItem;
begin
  vaArquivo := nil;
  vaArquivoDescompactado := nil;
  vaGraphic := nil;
  vaPicture := nil;

  // Fazendo o download do arquivo
  vaArquivo := ipChatDownloadArquivo(ipCodigoHospital, ipLocalArquivo);

  if not Assigned(vaArquivo) then
    begin
      MessageTela('Arquivo não encontrado.');
      Exit;
    end;

  // Visualizando o arquivo
  vafrmZoomImg := TfrmZoomImg.Create(nil);

  try
    ppuDescompactarArquivo(vaArquivo, vaArquivoDescompactado);
    vafrmZoomImg.BorderStyle := bsSingle;
    vafrmZoomImg.pnConteudoEsquerda.Align := alClient;
    vafrmZoomImg.ImgMax.Properties.FitMode := ifmNormal;
    vafrmZoomImg.Ac_SavarImagem.Visible := True;
    vafrmZoomImg.pnAcoes.Visible := True;
    vafrmZoomImg.PanelAcoesSempreVisivel := True;
    vafrmZoomImg.btnDuplicar.Visible := False;
    vafrmZoomImg.AparecerGalerias := False;
    vafrmZoomImg.Caption := ExtractFileName(ipLocalArquivo);

    if TRegEx.IsMatch(vafrmZoomImg.Caption, '_\d{1,}\.zip$', [roIgnoreCase]) then
      vafrmZoomImg.Caption := TRegEx.Match(vafrmZoomImg.Caption, '.*(?=' + TRegEx.Escape(TRegEx.Match(vafrmZoomImg.Caption, '_\d{1,}\.zip$', [roIgnoreCase]).Value) + ')', [roIgnoreCase]).Value;

    vafrmZoomImg.NomeImagem := vafrmZoomImg.Caption;
    vafrmZoomImg.PastaInicialSalvarImagem := ipPastaInicialSalvarImagem;
    vafrmZoomImg.WindowState := wsMaximized;

    try
      if TChatFuncoes.fpuFindGraphicClass(vaArquivoDescompactado, vaGraphicClass) then
        begin
          vaGraphic := vaGraphicClass.Create;
          vaArquivoDescompactado.Position := 0;
          vaGraphic.LoadFromStream(vaArquivoDescompactado);

          vaPicture := TPicture.Create;
          vaPicture.Graphic := vaGraphic;

          vafrmZoomImg.ImgMax.Picture := vaPicture;
        end;
    finally
      if Assigned(vaGraphic) then
        FreeAndNil(vaGraphic);

      if Assigned(vaPicture) then
        FreeAndNil(vaPicture);
    end;

    vafrmZoomImg.ShowModal;
  finally
    FreeAndNil(vafrmZoomImg);

    if Assigned(vaArquivo) then
      FreeAndNil(vaArquivo);

    if Assigned(vaArquivoDescompactado) then
      FreeAndNil(vaArquivoDescompactado);
  end;
end;

end.
