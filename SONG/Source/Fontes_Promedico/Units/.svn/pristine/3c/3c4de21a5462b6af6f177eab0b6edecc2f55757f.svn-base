unit pRichUtils;

interface

uses
  SclRView, System.Types, RVEdit, System.SysUtils, Datasnap.DBClient, Data.DB,
  DBSRVE, RVItem, RVLabelItem, RVERVData, RVFMisc, RVTypes, System.Classes,
  System.Generics.Collections, cxEdit, AdvSpin, asgspin,  RVSpinEdit, RVSpinEditReg,
  cxSpinButton, cxSpinEdit, CRVFData, Vcl.Graphics, RVStyle, DBRV,
  Winapi.Windows, Vcl.Controls, RVFuncs, RVClasses, System.RegularExpressions,
  RichView, CRVData, RVRTFProps, RVRTF;

const
  rvsIdentificadorTypeMarcador = -201; // me basie no valor do rvsLabel que é utilizado pela classe pai

type
  TTipoComponenteMarcador = (tcmAlinhamento, tcmLargura, tcmIdentificador, tcmDescricao, tcmCaracteres);

type
// TRVRTFReaderProperties = class(TRVRTFReaderProperties)
// private
// function CreateTextItem(const Text: TRVAnsiString;
// {$IFDEF RICHVIEWCBDEF3}const WideText: WideString;{$ENDIF}
// StyleNo, ParaNo: Integer; UseUnicode: Boolean;
// var ResText: TRVRawByteString): TRVTextItemInfo;
// end;

// Marcador utilizado para substituir o troca chave
  TRVMarcadorItemInfo = class(TRVLabelItemInfo)
  private
    FIdentificador: String;
    FQuantidadeCaracteres: Integer;
  protected
    function GetRVFExtraPropertyCount: Integer; override;
    procedure SaveRVFExtraProperties(Stream: TStream); override;
  public

    property Identificador: String read FIdentificador write FIdentificador;
    property QuantidadeCaracteres: Integer read FQuantidadeCaracteres write FQuantidadeCaracteres;

    constructor Create(RVData: TPersistent); override;
    constructor CreateEx(RVData: TPersistent; TextStyleNo: Integer;
      const ipIdentificador, Text: String); reintroduce;

    function SetExtraCustomProperty(const PropName: TRVAnsiString;
      const Value: String): Boolean; override;
  end;

  TWrapperMarcador = class
  private
    FMarcadorSelecionado: TRVMarcadorItemInfo;
    FRich: TRichViewEdit;
    FDBRich: TDBRichViewEdit;
    FIndexStyleMarcador: Integer;
    FIndexStyleMarcadorSelecionado: Integer;
    FIndexStyleNormal: Integer;

    FComponentes: TDictionary<TTipoComponenteMarcador, TcxCustomEdit>;
    procedure ppvBuscarCriarStylesMarcador;
    procedure ppvAtualizarRich();
    procedure ppvInicializarWrapper;
    function GetRich: TCustomRichViewEdit;
    procedure ppvPreencherEdit(ipTipo: TTipoComponenteMarcador;
      ipValor: Variant);
    procedure ppvConfigurarStyleMarcador(ipStyle: TFontInfo);
    function fpvConverterPixelToQuantCharacteres(ipMarcador: TRVMarcadorItemInfo; ipPixels: Integer): Integer;
    function fpvConverterQuantCharacteresToPixels(
      ipMarcador: TRVMarcadorItemInfo; ipQuantCaracteres: Integer): Integer;

  public
    property Rich: TCustomRichViewEdit read GetRich;

    constructor Create(ipRich: TRichViewEdit); overload;
    constructor Create(ipRich: TDBRichViewEdit); overload;
    destructor Destroy; override;

    procedure ppuRegistrarComponente(ipTipo: TTipoComponenteMarcador; ipComponente: TcxCustomEdit);
    function fpuAdicionarMarcador(ipIdentificador, ipTextoMarcador: String; ipFormat: Boolean = false): TRVMarcadorItemInfo;
    procedure ppuReiniciarMarcadores;

    procedure ppuSalvarMarcadoresRTF;
    procedure ppuCarregarMarcadoresRTF;
    procedure ppuReiniciar;

    procedure ppuOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ppuOnKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ppuOnChangeRich(Sender: TObject);
    procedure ppuOnEditValueChanged(Sender: TObject);
 // procedure ppuOnJump(Sender: TObject; id: Integer);
    procedure ppuOnMouseDown(Sender: TCustomRichView; Button: TMouseButton;
      Shift: TShiftState; ItemNo, X, Y: Integer);
// procedure ppuOnWriteHyperlink(Sender: TCustomRichView; id: Integer; RVData: TCustomRVData; ItemNo: Integer; SaveFormat: TRVSaveFormat; var Target, Extras: string);
// procedure ppuOnReadHyperLink(Sender: TCustomRichView; const Target, Extras: string; DocFormat: TRVLoadFormat; var StyleNo: Integer; var ItemTag: TRVTag; var ItemName: TRVRawByteString);

  const
    coMarcador = 'Marcador';
    coMarcadorSelecionado = 'MarcadorSelecionado';

    coSeparador = '§';
    coText = 'Texto=';
    coIdentificador = 'Identificador=';
    coLargura = 'Largura=';
    coAlinhamento = 'Alinhamento=';
    coPosicaoIdentificador = 0;
    coPosicaoTexto = 1;
    coPosicaoLargura = 2;
    coPosicaoAlinhamento = 3;
    coPosicaoQuantidadeCaracteres = 4;

    coRegexMarcador = '(?<=\{)[^§]+§[^§]+(§\d+){3,3}(?=\})';

    coBackColorMarcadorSelecionado = $00158DFB;
  end;

  TRichUtils = class
  public
    class procedure ppuProcurarSubstituirMarcador(ipRichView: TCustomRichViewEdit; ipSearch, ipReplace: String; ipAjustarTamanhoValor: Boolean = true; ipAjustarPelaQtdeCaracteres: Boolean = false; ipSuportarRTF: Boolean = true); overload;
    // mudei a ordem dos parametros para conseguir utilizar o overload
    class procedure ppuProcurarSubstituirMarcador(ipIdentificador, ipValor: String; ipRichView: TCustomRichViewEdit; ipSuportarRTF: Boolean = true); overload;
  end;

implementation

uses
  System.StrUtils;

class procedure TRichUtils.ppuProcurarSubstituirMarcador(ipRichView: TCustomRichViewEdit; ipSearch, ipReplace: String; ipAjustarTamanhoValor: Boolean = true; ipAjustarPelaQtdeCaracteres: Boolean = false; ipSuportarRTF: Boolean = true);
var
  vaRectMarcador, vaRectTexto: TRect;
  vaMaxTentativas: Integer;
  vaIdentificador: String;
begin
  vaIdentificador := ipSearch;
  ipSearch := '[' + ipSearch;
    // posicionando no inicio do texto
  ipRichView.SetSelectionBounds(0, 0, 0, 0);
    // vamos ver se achamos o marcador
  if ipRichView.SearchText(ipSearch, [rvseoDown, rvseoMultiItem]) then
    begin
      vaMaxTentativas := 1;
      ipRichView.SetSelectionBounds(0, 0, 0, 0);
      ipSearch := ipSearch + ']';
        // vamos ir add espaco ate encontrar o final do marcador
      while (vaMaxTentativas < 500) and (not ipRichView.SearchText(ipSearch, [rvseoDown, rvseoMultiItem])) do
        begin
          inc(vaMaxTentativas);
          ipSearch := StringReplace(ipSearch, ']', ' ', [rfIgnoreCase]) + ']';
        end;
        // uso essa variavel para evitar de loop infinito no caso de configuracao errada do formulario
      if vaMaxTentativas = 500 then
        Exit;

// vamos ver qual a area que o marcador ocupa
      vaRectMarcador := ipRichView.GetSelectionRect;
 // substitui o marcador pelo texto
      ipRichView.InsertText(IfThen(ipAjustarPelaQtdeCaracteres, Copy(ipReplace, 1, Length(ipSearch)), ipReplace), true);
      if (ipAjustarTamanhoValor) and (not ipAjustarPelaQtdeCaracteres) and ipRichView.SearchText(ipReplace, [rvseoDown, rvseoWholeWord, rvseoMultiItem]) then
        begin
 // vamos ver qual a area que o texto ocupa
          vaRectTexto := ipRichView.GetSelectionRect;
          if vaRectMarcador.Width > vaRectTexto.Width then
            begin
     // marcador maior, vamos adicionar espacos no texto para ficar igual
              while vaRectMarcador.Width > vaRectTexto.Width do
                begin
                  ipReplace := ipReplace + ' ';
                  ipRichView.InsertText(ipReplace, true);

                  ipRichView.SearchText(ipReplace, [rvseoDown, rvseoWholeWord, rvseoMultiItem]);
                  vaRectTexto := ipRichView.GetSelectionRect;
                end;
            end
          else if vaRectMarcador.Width < vaRectTexto.Width then
            begin
     // marcador menor, vamos remover pedaços do texto para ficar do mesmo tamanho
              while (vaRectMarcador.Width < vaRectTexto.Width) and (ipReplace.Length > 1) do
                begin
                  ipReplace := Copy(ipReplace, 1, Length(ipReplace) - 1);

                  ipRichView.InsertText(ipReplace, true);

                  ipRichView.SearchText(ipReplace, [rvseoDown, rvseoWholeWord, rvseoMultiItem]);
                  vaRectTexto := ipRichView.GetSelectionRect;
                end;
            end;
        end;
    end;

    // futuramente essa parte de cima dessa funcao ira sumir e ficara apenas os novos marcadores, mas por enquanto ambos devem funcionar juntos
  TRichUtils.ppuProcurarSubstituirMarcador(vaIdentificador, ipReplace, ipRichView, ipSuportarRTF);

end;

class procedure TRichUtils.ppuProcurarSubstituirMarcador(ipIdentificador, ipValor: String; ipRichView: TCustomRichViewEdit; ipSuportarRTF: Boolean);
var
  I, vaQuant: Integer;
  vaHookMarcador, vaMarcador: TRVMarcadorItemInfo;
  vaWidth, vaWidthHook, vaWidthEspaco, vaMinWidth: Integer;
  vaAddEspacoEsquerda: Boolean;
  vaBackupTexto: String;
  vaTextStyle: TFontInfo;
begin
  vaAddEspacoEsquerda := true;
     // vamos procurar pelos novos marcadores agora

  for I := 0 to ipRichView.ItemCount - 1 do
    begin
      if ipRichView.GetItem(I) is TRVMarcadorItemInfo then
        begin
          vaMarcador := ipRichView.GetItem(I) as TRVMarcadorItemInfo;
          if vaMarcador.Identificador = ipIdentificador then
            begin
              vaMinWidth := vaMarcador.MinWidth;

              vaMarcador.RemoveInternalLeading := true;
              vaMarcador.Spacing := 0;
              vaMarcador.BorderWidth := 0;
              vaMarcador.Text := ipValor;

              if (vaMinWidth > 0) then
                begin
                  while (Length(vaMarcador.Text) > 0) and (vaMarcador.GetWidth(ipRichView.Style) > vaMinWidth) do
                    vaMarcador.Text := Copy(vaMarcador.Text, 1, Length(vaMarcador.Text) - 1);
                end;

                // POR CAUSA DO RTF vou adicionar espacos para que quando houver a conversao o texto fique igual
              if ipSuportarRTF then
                begin
                  // Se nao zerar o minWidth o Width nunca sera menor do que ele
                  vaMarcador.MinWidth := 0;

                  vaBackupTexto := vaMarcador.Text;
                  vaMarcador.Text := ' ';
                  vaWidthEspaco := vaMarcador.GetWidth(ipRichView.Style);
                  vaMarcador.Text := vaBackupTexto;

                  vaWidth := vaMarcador.GetWidth(ipRichView.Style);
                  // ja vamos fazer o calculo para nao ter q ficar fazendo loop muito tempo
                  vaQuant := ((vaMinWidth - vaWidth) div vaWidthEspaco) - 1;
                  if vaQuant > 0 then
                    begin
                      case vaMarcador.Alignment of
                        taLeftJustify:
                          vaMarcador.Text := vaMarcador.Text + StringOfChar(' ', vaQuant);
                        taRightJustify:
                          vaMarcador.Text := StringOfChar(' ', vaQuant) + vaMarcador.Text;
                        taCenter:
                          begin
                            vaMarcador.Text := vaMarcador.Text + StringOfChar(' ', vaQuant div 2);
                            vaMarcador.Text := StringOfChar(' ', vaQuant div 2) + vaMarcador.Text;
                          end;
                      end;
                    end;

                  vaWidth := vaMarcador.GetWidth(ipRichView.Style);
                  while (vaWidth < vaMinWidth) do
                    begin
                      vaBackupTexto := vaMarcador.Text;
                      case vaMarcador.Alignment of
                        taLeftJustify:
                          vaMarcador.Text := vaMarcador.Text + ' ';
                        taRightJustify:
                          vaMarcador.Text := ' ' + vaMarcador.Text;
                        taCenter:
                          begin
                            if vaAddEspacoEsquerda then
                              vaMarcador.Text := vaMarcador.Text + ' '
                            else
                              vaMarcador.Text := ' ' + vaMarcador.Text;

                            vaAddEspacoEsquerda := not vaAddEspacoEsquerda;
                          end;
                      end;
                      vaWidth := vaMarcador.GetWidth(ipRichView.Style);
                      { ********************* O CODIGO ABAIXO FUNCIONA DENTRO DO RICH, POREM AO CARREGAR NO COMPONENTE DO REPORT DESALINHA *******************
                      //se estiver maior significa q nao tem como ficar alinhado usando essa fonte, portanto preciso mudar a fonte
                      if vaWidth > vaMinWidth then
                        begin
                          vaMarcador.Text := vaBackupTexto;
                          vaWidth := vaMarcador.GetWidth(ipRichView.Style);

                          ipRichView.SetSelectionBounds(I, ipRichView.GetOffsAfterItem(I), I, ipRichView.GetOffsAfterItem(I));
                          vaTextStyle := ipRichView.Style.TextStyles.Add;
                          vaTextStyle.Assign(ipRichView.Style.TextStyles[vaMarcador.TextStyleNo]);
                          vaTextStyle.BackColor := clNone;
                          vaTextStyle.SizeDouble := Round(((vaTextStyle.SizeDouble / 2) - 1) * 2);

                          vaHookMarcador := TRVMarcadorItemInfo.CreateEx(ipRichView.RVData, vaTextStyle.Index, 'HOOK', ' ');
                          ipRichView.InsertItem('', vaHookMarcador);
                          vaWidthHook :=  vaHookMarcador.GetWidth(ipRichView.Style);
                          while (vaTextStyle.SizeDouble > 2) and (vaWidth +vaWidthHook > vaMinWidth) do
                            begin
                              vaTextStyle.SizeDouble := Round(((vaTextStyle.SizeDouble / 2) - 1) * 2);

                              ipRichView.SetSelectionBounds(ipRichView.ItemCount-1,0,ipRichView.ItemCount-1,ipRichView.GetOffsAfterItem(ipRichView.ItemCount-1));
                              vaHookMarcador := TRVMarcadorItemInfo.CreateEx(ipRichView.RVData, vaTextStyle.Index, 'HOOK', ' ');
                              ipRichView.InsertItem('', vaHookMarcador);

                              vaWidthHook :=  vaHookMarcador.GetWidth(ipRichView.Style);
                            end;
                            vaWidth := vaWidth+vaWidthHook;
                        end;
 }

                    end;

                end;

// vamos remover a cor de fundo do marcador
              ipRichView.Style.TextStyles[vaMarcador.TextStyleNo].BackColor := clNone;
            end;
        end;
    end;

end;

{ TRVMarcadorItemInfo }

constructor TRVMarcadorItemInfo.Create(RVData: TPersistent);
begin
  inherited Create(RVData);
  StyleNo := rvsIdentificadorTypeMarcador;
end;

constructor TRVMarcadorItemInfo.CreateEx(RVData: TPersistent;
  TextStyleNo: Integer; const ipIdentificador, Text: String);
begin
  inherited CreateEx(RVData, TextStyleNo, Text);
  FIdentificador := ipIdentificador;
  StyleNo := rvsIdentificadorTypeMarcador;
end;

function TRVMarcadorItemInfo.GetRVFExtraPropertyCount: Integer;
begin
  Result := inherited;
  if FIdentificador <> '' then
    inc(Result);
  if FQuantidadeCaracteres > 0 then
    inc(Result);

end;

procedure TRVMarcadorItemInfo.SaveRVFExtraProperties(Stream: TStream);
begin
  inherited;
  if FIdentificador <> '' then
    RVFWriteLine(Stream, 'Identificador=' + FIdentificador);

  if FQuantidadeCaracteres > 0 then
    RVFWriteLine(Stream, 'QuantidadeCaracteres=' + IntToStr(FQuantidadeCaracteres));
end;

function TRVMarcadorItemInfo.SetExtraCustomProperty(
  const PropName: TRVAnsiString; const Value: String): Boolean;
var
  vaTextStyleNo: Integer;
begin
  if PropName = 'Identificador' then
    begin
      Result := true;
      FIdentificador := Value;
    end
  else if PropName = 'QuantidadeCaracteres' then
    begin
      Result := true;
      FQuantidadeCaracteres := StrToIntDef(Value, 0);
    end
  else
    Result := inherited SetExtraCustomProperty(PropName, Value);
end;

{ TWrapperMarcador }

constructor TWrapperMarcador.Create(ipRich: TRichViewEdit);
begin
  FRich := ipRich;
  ppvInicializarWrapper;
end;

constructor TWrapperMarcador.Create(ipRich: TDBRichViewEdit);
begin
  FDBRich := ipRich;
  ppvInicializarWrapper;
end;

procedure TWrapperMarcador.ppvConfigurarStyleMarcador(ipStyle: TFontInfo);
begin
  ipStyle.Jump := true;
  ipStyle.JumpCursor := crHandPoint;
  ipStyle.HoverColor := clWhite;
  ipStyle.HoverBackColor := $00158DFB;
  ipStyle.BackColor := clSilver;
end;

procedure TWrapperMarcador.ppvBuscarCriarStylesMarcador;
var
  I: Integer;

  procedure plConfigurarStyleMarcadorSelecionado(ipStyle: TFontInfo);
  begin
    ipStyle.Jump := true;
    ipStyle.JumpCursor := crHandPoint;
    ipStyle.HoverColor := clWhite;
    ipStyle.HoverBackColor := $00158DFB;
    ipStyle.BackColor := coBackColorMarcadorSelecionado;
  end;

begin
  FIndexStyleNormal := -1;
  FIndexStyleMarcador := -1;
  FIndexStyleMarcadorSelecionado := -1;

  for I := 0 to Rich.Style.TextStyles.Count - 1 do
    begin
      if Rich.Style.TextStyles[I].Jump then
        begin
          if (Rich.Style.TextStyles[I].HoverBackColor = $00158DFB) and (Rich.Style.TextStyles[I].BackColor = clSilver) then
            begin
          // vamos garantir que esteja configurado corretamente
              FIndexStyleMarcador := I;
              ppvConfigurarStyleMarcador(Rich.Style.TextStyles[I]);
            end
          else if (Rich.Style.TextStyles[I].HoverBackColor = $00158DFB) and (Rich.Style.TextStyles[I].BackColor = $00158DFB) then
            begin
              FIndexStyleMarcadorSelecionado := I;
              plConfigurarStyleMarcadorSelecionado(Rich.Style.TextStyles[I]);
            end;
        end
      else if FIndexStyleNormal = -1 then
        FIndexStyleNormal := I;
    end;
  // vamos ver se achou
  if FIndexStyleMarcador = -1 then
    begin
       // nao achou, entao vamos criar um
      ppvConfigurarStyleMarcador(Rich.Style.TextStyles.Add);
      FIndexStyleMarcador := Rich.Style.TextStyles.Count - 1;
    end;
  if FIndexStyleMarcadorSelecionado = -1 then
    begin
       // nao achou, entao vamos criar um
      plConfigurarStyleMarcadorSelecionado(Rich.Style.TextStyles.Add);
      FIndexStyleMarcadorSelecionado := Rich.Style.TextStyles.Count - 1;
    end;
end;

procedure TWrapperMarcador.ppvInicializarWrapper;
begin
  if Assigned(FRich) then
    begin
      FRich.OnRVMouseDown := ppuOnMouseDown;
      // nao estou usando o OnJump pq precisa presionar control pra funcionar.
     // FRich.OnJump := ppuOnJump;
      if not Assigned(FRich.OnChange) then
        FRich.OnChange := ppuOnChangeRich;

// if not Assigned(FRich.OnKeyDown) then
// FRich.OnKeyDown := ppuOnKeyDown;
//
// if not Assigned(FRich.OnKeyUp) then
// FRich.OnKeyUp := ppuOnKeyUp;

// if not Assigned(FRich.OnWriteHyperlink) then
// FRich.OnWriteHyperlink := ppuOnWriteHyperlink;
//
// if not Assigned(FRich.OnReadHyperlink) then
// FRich.OnReadHyperlink := ppuOnReadHyperLink;
    end
  else if Assigned(FDBRich) then
    begin
      FDBRich.OnRVMouseDown := ppuOnMouseDown;
// FDBRich.OnJump := ppuOnJump;
      if not Assigned(FDBRich.OnChange) then
        FDBRich.OnChange := ppuOnChangeRich;




// if not Assigned(FDBRich.OnKeyDown) then
// FDBRich.OnKeyDown := ppuOnKeyDown;
//
// if not Assigned(FDBRich.OnKeyUp) then
// FDBRich.OnKeyUp := ppuOnKeyUp;

// if not Assigned(FDBRich.OnWriteHyperlink) then
// FDBRich.OnWriteHyperlink := ppuOnWriteHyperlink;
//
// if not Assigned(FDBRich.OnReadHyperlink) then
// FDBRich.OnReadHyperlink := ppuOnReadHyperLink;

    end;

// vamos percorrer os textStyles para procuar pelos styles do marcador, caso nao encontre vamos cria-los
  ppvBuscarCriarStylesMarcador;

  FComponentes := TDictionary<TTipoComponenteMarcador, TcxCustomEdit>.Create;
end;

destructor TWrapperMarcador.Destroy;
begin
  FComponentes.Free;
  inherited;
end;

function TWrapperMarcador.GetRich: TCustomRichViewEdit;
begin
  if Assigned(FRich) then
    Result := FRich
  else
    Result := FDBRich;
end;

function TWrapperMarcador.fpuAdicionarMarcador(ipIdentificador, ipTextoMarcador: String; ipFormat: Boolean = false): TRVMarcadorItemInfo;
var
  vaReadOnly: Boolean;
  vaTextStyle: TFontInfo;
  vaTextStyleNo: Integer;
begin
  // se houver um texto selecionado vou pegar a formatacao desse texto
  if (Rich.GetSelText <> '') and (Rich.CurTextStyleNo <> FIndexStyleMarcador) then
    begin
      vaTextStyle := TFontInfo.Create(nil);
      vaTextStyle.Assign(Rich.Style.TextStyles[Rich.CurTextStyleNo]);
      // vamos garantir que as configuracoes basicas do marcador existem
      ppvConfigurarStyleMarcador(vaTextStyle);
      // agora vamos ver se ja nao existe um style com essas configuracoes, caso nao exista a funcao ja insere tbm
      vaTextStyleNo := Rich.Style.FindTextStyle(vaTextStyle);

      Result := TRVMarcadorItemInfo.CreateEx(Rich.RVData, vaTextStyleNo, ipIdentificador, ipTextoMarcador);
    end
  else
    Result := TRVMarcadorItemInfo.CreateEx(Rich.RVData, FIndexStyleMarcador, ipIdentificador, ipTextoMarcador);

  vaReadOnly := Rich.ReadOnly;
  if Rich.ReadOnly then
    Rich.ReadOnly := false;
  try
    Rich.InsertItem(ipIdentificador, Result);
  finally
    if Rich.ReadOnly <> vaReadOnly then
      Rich.ReadOnly := vaReadOnly;
  end;

  if ipFormat then
    ppvAtualizarRich;
end;

procedure TWrapperMarcador.ppuCarregarMarcadoresRTF;
var
  I: Integer;
  vaMarcador: TRVMarcadorItemInfo;
  vaInfos: TArray<String>;
  vaTexto: String;
  vaMarcadorEncontrado, vaExisteMarcadores: Boolean;
  vaMatch: TMatch;
begin
  vaExisteMarcadores := false;
  repeat
    vaMarcadorEncontrado := false;
    for I := 0 to Rich.ItemCount - 1 do
      begin
        vaTexto := Rich.GetItemTextA(I);
      // if Rich.Style.TextStyles[vaItem.StyleNo].Jump then
        Rich.SetSelectionBounds(0, 0, 0, 0);
    // vamos ver se achamos o marcador
        vaMatch := TRegex.Match(vaTexto, coRegexMarcador, []);
        if vaMatch.Success then
          begin
            if Assigned(FDBRich) then
              begin
                if not(FDBRich.DataSource.DataSet.State in [dsEdit, dsINsert]) then
                  FDBRich.DataSource.DataSet.Edit;
              end;

            vaInfos := TRegex.split(vaMatch.Value, coSeparador, []);
            if Length(vaInfos) = 5 then
              begin
                vaMarcadorEncontrado := true;
                vaExisteMarcadores := true;
            // vamos selecionar o item e inserir o marcador
            // Rich.SetSelectionBounds(I, 0, I, Rich.GetOffsAfterItem(I));

            // vamos buscar esse texto para que ele ja fique selecionado. Isso foi necessario por causa do SMS onde existe apenas um unico item e quando realiza o replace tudo é trocado
                if Rich.SearchText('{' + vaMatch.Value + '}', [rvseoDown, rvseoMultiItem]) then
                  begin
                  // vamos criar o marcador
                    vaMarcador := fpuAdicionarMarcador(vaInfos[coPosicaoIdentificador], vaInfos[coPosicaoTexto]);
                    vaMarcador.MinWidth := StrToIntDef(vaInfos[coPosicaoLargura], 0);
                    vaMarcador.Alignment := TAlignment(StrToIntDef(vaInfos[coPosicaoAlinhamento], 0));
                    vaMarcador.QuantidadeCaracteres := StrToIntDef(vaInfos[coPosicaoQuantidadeCaracteres], 0);
                  end;
              end;
          end;
      end;
  until (not vaMarcadorEncontrado);

  if vaExisteMarcadores then
    ppvAtualizarRich();
end;

procedure TWrapperMarcador.ppuReiniciar;
begin
  FMarcadorSelecionado := nil;

  ppvPreencherEdit(tcmIdentificador, '');
  ppvPreencherEdit(tcmDescricao, '');
  ppvPreencherEdit(tcmLargura, 0);
  ppvPreencherEdit(tcmAlinhamento, 0);

  ppvBuscarCriarStylesMarcador;
end;

procedure TWrapperMarcador.ppuSalvarMarcadoresRTF;
var
  I: Integer;
  vaMarcador: TRVMarcadorItemInfo;
  vaInfos: String;
begin

  for I := 0 to Rich.ItemCount - 1 do
    begin
      if Rich.GetItem(I) is TRVMarcadorItemInfo then
        begin
            // vamos ver se ja nao esta no formato correto
          vaMarcador := Rich.GetItem(I) as TRVMarcadorItemInfo;
          if not TRegex.IsMatch(vaMarcador.Text, coRegexMarcador, []) then
            begin
          // vamos salvar tudo no Text do marcador pois quando é rtf é a unica coisa q é salva
              vaInfos := vaMarcador.Identificador;
              vaInfos := vaInfos + coSeparador + vaMarcador.Text;
              vaInfos := vaInfos + coSeparador + IntToStr(vaMarcador.MinWidth);
              vaInfos := vaInfos + coSeparador + IntToStr(Ord(vaMarcador.Alignment));
              vaInfos := vaInfos + coSeparador + IntToStr(vaMarcador.QuantidadeCaracteres);

              vaMarcador.Text := '{' + vaInfos + '}';
            end;
        end;
    end;

  ppvAtualizarRich();
end;

procedure TWrapperMarcador.ppuOnChangeRich(Sender: TObject);
begin
  // nao quero deixar adicionar nada utilizando um style que seja hiperlink
  if Rich.Style.TextStyles[Rich.CurTextStyleNo].Jump then
    Rich.CurTextStyleNo := FIndexStyleNormal;
end;

procedure TWrapperMarcador.ppvPreencherEdit(ipTipo: TTipoComponenteMarcador; ipValor: Variant);
var
  vaEdit: TcxCustomEdit;
begin
  if FComponentes.TryGetValue(ipTipo, vaEdit) then
    begin
      vaEdit.LockChangeEvents(true);
      try
        vaEdit.EditValue := ipValor;
        vaEdit.PostEditValue;
      finally
        vaEdit.LockChangeEvents(false, false);
      end;
    end;
end;

// procedure TWrapperMarcador.ppuOnJump(Sender: TObject; id: Integer);
// var
// I, j: Integer;
// vaRVData: TCustomRVFormattedData;
// vaItem: TCustomRVItemInfo;
// vaTextStyle: TFontInfo;
// begin
// inherited;
//
// for I := 0 to Rich.ItemCount - 1 do
// begin
// vaItem := Rich.GetItem(I);
// if vaItem is TRVMarcadorItemInfo then
// begin
// if id = vaItem.JumpID then
// begin
// if Assigned(FMarcadorSelecionado) then
// begin
// Rich.Style.TextStyles[FMarcadorSelecionado.TextStyleNo].BackColor := clSilver;
// end;
//
// FMarcadorSelecionado := vaItem as TRVMarcadorItemInfo;
//
// // vamos descobrir se esse style é usado por mais algum outro marcador, pois se for tenho que criar outro pq senao todos ficarao com o style de selecionado
// vaTextStyle := nil;
// for j := 0 to Rich.ItemCount - 1 do
// begin
// vaItem := Rich.GetItem(j);
// if (I <> j) and (vaItem is TRVMarcadorItemInfo) and (TRVMarcadorItemInfo(vaItem).TextStyleNo = FMarcadorSelecionado.TextStyleNo) then
// begin
// vaTextStyle := Rich.Style.TextStyles.Add;
// vaTextStyle.Assign(Rich.Style.TextStyles[FMarcadorSelecionado.TextStyleNo]);
// vaTextStyle.BackColor := coBackColorMarcadorSelecionado;
// break;
// end;
// end;
// if Assigned(vaTextStyle) then
// FMarcadorSelecionado.TextStyleNo := vaTextStyle.Index
// else
// Rich.Style.TextStyles[FMarcadorSelecionado.TextStyleNo].BackColor := coBackColorMarcadorSelecionado;
//
// ppvPreencherEdit(tcmAlinhamento, FMarcadorSelecionado.Alignment);
// ppvPreencherEdit(tcmLargura, FMarcadorSelecionado.MinWidth);
// ppvPreencherEdit(tcmCaracteres, FMarcadorSelecionado.QuantidadeCaracteres);
// ppvPreencherEdit(tcmDescricao, FMarcadorSelecionado.Text);
// ppvPreencherEdit(tcmIdentificador, FMarcadorSelecionado.Identificador);
//
// break;
// end;
// end;
// end;
//
// ppvAtualizarRich();
// end;

procedure TWrapperMarcador.ppuOnMouseDown(Sender: TCustomRichView; Button: TMouseButton; Shift: TShiftState; ItemNo, X, Y: Integer);
var
  j: Integer;
  vaItem: TCustomRVItemInfo;
  vaTextStyle: TFontInfo;
begin
  inherited;
  if ItemNo >= 0 then
    begin
      vaItem := Rich.GetItem(ItemNo);
      if Assigned(vaItem) and (vaItem is TRVMarcadorItemInfo) then
        begin
          if Assigned(FMarcadorSelecionado) then
            begin
              Rich.Style.TextStyles[FMarcadorSelecionado.TextStyleNo].BackColor := clSilver;
            end;

          FMarcadorSelecionado := vaItem as TRVMarcadorItemInfo;

              // vamos descobrir se esse style é usado por mais algum outro marcador, pois se for tenho que criar outro pq senao todos ficarao com o style de selecionado
          vaTextStyle := nil;
          for j := 0 to Rich.ItemCount - 1 do
            begin
              vaItem := Rich.GetItem(j);
              if (vaItem.JumpID <> FMarcadorSelecionado.JumpID) and (vaItem is TRVMarcadorItemInfo) and (TRVMarcadorItemInfo(vaItem).TextStyleNo = FMarcadorSelecionado.TextStyleNo) then
                begin
                  vaTextStyle := Rich.Style.TextStyles.Add;
                  vaTextStyle.Assign(Rich.Style.TextStyles[FMarcadorSelecionado.TextStyleNo]);
                  vaTextStyle.BackColor := coBackColorMarcadorSelecionado;
                  break;
                end;
            end;
          if Assigned(vaTextStyle) then
            FMarcadorSelecionado.TextStyleNo := vaTextStyle.Index
          else
            Rich.Style.TextStyles[FMarcadorSelecionado.TextStyleNo].BackColor := coBackColorMarcadorSelecionado;

          ppvPreencherEdit(tcmAlinhamento, FMarcadorSelecionado.Alignment);
          ppvPreencherEdit(tcmLargura, FMarcadorSelecionado.MinWidth);
          ppvPreencherEdit(tcmCaracteres, FMarcadorSelecionado.QuantidadeCaracteres);
          ppvPreencherEdit(tcmDescricao, FMarcadorSelecionado.Text);
          ppvPreencherEdit(tcmIdentificador, FMarcadorSelecionado.Identificador);

          ppvAtualizarRich();
        end;
    end;
end;

procedure TWrapperMarcador.ppuOnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if Rich.ReadOnly then
// Rich.ReadOnly := false;
end;

procedure TWrapperMarcador.ppuOnKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// if not Rich.ReadOnly then
// Rich.ReadOnly := true;
end;

// procedure TWrapperMarcador.ppuOnReadHyperLink(Sender: TCustomRichView;
// const Target, Extras: string; DocFormat: TRVLoadFormat; var StyleNo: Integer;
// var ItemTag: TRVTag; var ItemName: TRVRawByteString);
// var
// vaItem: TRVMarcadorItemInfo;
// begin
// if DocFormat = rvlfRTF then
// begin
// // ItemTag := Extras;
// vaItem := TRVMarcadorItemInfo.CreateEx(Sender.RVData, FIndexStyleMarcador, 'chave', 'valor');
// TCustomRichViewEdit(Rich).InsertItem('teste', vaItem);
// end;
//
// end;

// procedure TWrapperMarcador.ppuOnWriteHyperlink(Sender: TCustomRichView;
// id: Integer; RVData: TCustomRVData; ItemNo: Integer;
// SaveFormat: TRVSaveFormat; var Target, Extras: string);
// var
// vaItem: TCustomRVItemInfo;
// vaRVData: TCustomRVData;
// begin
// vaItem := Sender.GetItem(ItemNo);
// if vaItem is TRVMarcadorItemInfo then
// begin
// Target := '#target'; // sei la porque se nao tiver o # no inicio nao salva as informacoes extras
// Extras := TRVMarcadorItemInfo(vaItem).Identificador + coSeparador +
// IntToStr(TRVMarcadorItemInfo(vaItem).MinWidth) + coSeparador +
// IntToStr(Ord(TRVMarcadorItemInfo(vaItem).Alignment));
// end;
// end;

function TWrapperMarcador.fpvConverterPixelToQuantCharacteres(ipMarcador: TRVMarcadorItemInfo; ipPixels: Integer): Integer;
var
  vaWidthCharPixel, vaBackupMinWidth: Integer;
  vaBackup: String;
begin
   // vamos pegar quantos pixels um caracter ocupa
  vaBackup := ipMarcador.Text;
  vaBackupMinWidth := ipMarcador.MinWidth;
  try
    ipMarcador.Text := ' ';
    ipMarcador.MinWidth := 0;

    vaWidthCharPixel := ipMarcador.GetWidth(Rich.Style);
    Result := Trunc(ipPixels / vaWidthCharPixel);
  finally
    ipMarcador.MinWidth := vaBackupMinWidth;
    ipMarcador.Text := vaBackup;
  end;

end;

function TWrapperMarcador.fpvConverterQuantCharacteresToPixels(ipMarcador: TRVMarcadorItemInfo; ipQuantCaracteres: Integer): Integer;
var
  vaWidthCharPixel, vaBackupMinWidth: Integer;
  vaBackup: String;
begin
   // vamos pegar quantos pixels um caracter ocupa
  vaBackup := ipMarcador.Text;
  try
    ipMarcador.MinWidth := 0;
    ipMarcador.Text := ' ';
    vaWidthCharPixel := ipMarcador.GetWidth(Rich.Style);
    Result := vaWidthCharPixel * ipQuantCaracteres;
  finally
    ipMarcador.MinWidth := vaBackupMinWidth;
    ipMarcador.Text := vaBackup;
  end;

end;

procedure TWrapperMarcador.ppuOnEditValueChanged(Sender: TObject);
var
  vaEdit: TcxCustomEdit;
begin
  if Assigned(FMarcadorSelecionado) then
    begin
      if Sender is TcxCustomEdit then
        begin
          vaEdit := TcxCustomEdit(Sender);
          case TTipoComponenteMarcador(vaEdit.Tag) of
            tcmAlinhamento:
              FMarcadorSelecionado.Alignment := vaEdit.EditValue;
            tcmLargura:
              FMarcadorSelecionado.MinWidth := vaEdit.EditValue;
            tcmCaracteres:
              FMarcadorSelecionado.QuantidadeCaracteres := vaEdit.EditValue;
            tcmIdentificador:
              begin
                if FMarcadorSelecionado.Text = FMarcadorSelecionado.Identificador then
                  begin
                    FMarcadorSelecionado.Text := vaEdit.EditValue;
                    ppvPreencherEdit(tcmDescricao, vaEdit.EditValue);
                  end;

                FMarcadorSelecionado.Identificador := vaEdit.EditValue;
              end;
            tcmDescricao:
              FMarcadorSelecionado.Text := vaEdit.EditValue;
          end;

          ppvAtualizarRich();
        end;

    end;
end;

procedure TWrapperMarcador.ppvAtualizarRich();
begin
  Rich.Change;
  Rich.Format;

// if Assigned(FDBRich) and ipUpdateDB then
// begin
    // precisei fazer isso pq foi o unico jeito que consegui de notificar o DataSet que houve mudancas, porque senao ele nao salva no CDS
  // SendMessage(FDBRich.Handle, CM_EXIT, 0, 0); // o DBRich possui uma funcao que escuta essa mensagem e nessa funcao ele acessa o DataLink e atualiza os dados
// end;
end;

procedure TWrapperMarcador.ppuRegistrarComponente(ipTipo: TTipoComponenteMarcador; ipComponente: TcxCustomEdit);
begin
  if Assigned(ipComponente) then
    begin
      FComponentes.Add(ipTipo, ipComponente);
      ipComponente.Tag := Ord(ipTipo);
      // mesmo nao sendo um spin nao tem problema desde que contenha a propriedade
      TcxSpinEdit(ipComponente).Properties.OnEditValueChanged := ppuOnEditValueChanged;
    end;
end;

procedure TWrapperMarcador.ppuReiniciarMarcadores;
var
  I: Integer;
  vaItem: TCustomRVItemInfo;
begin
  for I := 0 to Rich.ItemCount - 1 do
    begin
      vaItem := Rich.GetItem(I);
      if vaItem is TRVMarcadorItemInfo then
        begin
          Rich.Style.TextStyles[TRVMarcadorItemInfo(vaItem).TextStyleNo].BackColor := clSilver;
        end;
    end;

  ppvAtualizarRich;
end;

initialization

RegisterRichViewItemClass(rvsIdentificadorTypeMarcador, TRVMarcadorItemInfo);

end.
