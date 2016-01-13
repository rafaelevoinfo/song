unit pDMChat;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, dxGDIPlusClasses, cxClasses,
  cxGraphics, Vcl.ImgList, cxEditRepositoryItems, cxEdit, cxDBEditRepository,
  Vcl.Dialogs, Vcl.Graphics, RVStyle, System.Actions, Vcl.ActnList, Data.DB,
  Datasnap.DBClient, pmClientDataSet, RichViewActions, Vcl.ExtCtrls,
  System.ImageList, System.RegularExpressions, Vcl.Menus;

type
  TDMChat = class(TDataModule)
    cdsHospitais: TpmClientDataSet;
    cdsHospitaisCODIGO: TIntegerField;
    cdsHospitaisNOME_FANTASIA: TStringField;
    cdsHospitaisRAZAO_SOCIAL: TStringField;
    dsHospitais: TDataSource;
    cdsGrupos: TpmClientDataSet;
    cdsGruposCODIGO: TIntegerField;
    cdsGruposCODIGO_HOSPITAL: TIntegerField;
    cdsGruposNOME: TStringField;
    dsGrupos: TDataSource;
    cdsUsuarios: TpmClientDataSet;
    cdsUsuariosCODIGO: TIntegerField;
    cdsUsuariosCODIGO_HOSPITAL: TIntegerField;
    cdsUsuariosEMAIL: TStringField;
    cdsUsuariosNOME: TStringField;
    cdsUsuariosFUNCAO: TStringField;
    cdsUsuariosPROMEDICO: TIntegerField;
    cdsUsuariosUSUARIO_GRUPO: TIntegerField;
    cdsUsuariosFOTO: TBlobField;
    cdsUsuariosFOTO_AJUSTAR: TIntegerField;
    cdsUsuariosFOTO_THUMBNAIL: TBlobField;
    cdsUsuariosFOTO_THUMBNAIL_AJUSTAR: TIntegerField;
    cdsUsuariosSTATUS: TSmallintField;
    dsUsuarios: TDataSource;
    cdsMensagem: TpmClientDataSet;
    cdsMensagemCODIGO: TIntegerField;
    cdsMensagem_Anexo: TpmClientDataSet;
    RVStyle1: TRVStyle;
    OpenDialog1: TOpenDialog;
    cxEditRepository1: TcxEditRepository;
    EditRepLkCbGrupos: TcxEditRepositoryLookupComboBoxItem;
    EditRepLkCbHospitais: TcxEditRepositoryLookupComboBoxItem;
    EditRepCbStatus: TcxEditRepositoryImageComboBoxItem;
    ImgListStatus16x16: TcxImageList;
    ImgCollection: TcxImageCollection;
    ImgCollectionItemArquivoAudio: TcxImageCollectionItem;
    ImgCollectionItemArquivoConfiguracao: TcxImageCollectionItem;
    ImgCollectionItemArquivoDesconhecido: TcxImageCollectionItem;
    ImgCollectionItemArquivoExcel: TcxImageCollectionItem;
    ImgCollectionItemArquivoImagem: TcxImageCollectionItem;
    ImgCollectionItemArquivoPDF: TcxImageCollectionItem;
    ImgCollectionItemArquivoPowerPoint: TcxImageCollectionItem;
    ImgCollectionItemArquivoRar: TcxImageCollectionItem;
    ImgCollectionItemArquivoTexto: TcxImageCollectionItem;
    ImgCollectionItemArquivoVideo: TcxImageCollectionItem;
    ImgCollectionItemArquivoWord: TcxImageCollectionItem;
    ImgCollectionItemArquivoXML: TcxImageCollectionItem;
    ImgCollectionItemArquivoZip: TcxImageCollectionItem;
    ImgCollectionItemGrupo: TcxImageCollectionItem;
    ImgCollectionItemUsuario: TcxImageCollectionItem;
    ImgCollectionItemUsuarioPerfil: TcxImageCollectionItem;
    ActionList_Img24x24: TActionList;
    Ac_Enviar: TAction;
    Ac_Anexar: TAction;
    Ac_Smiles: TAction;
    Ac_Configuracao: TAction;
    ActionList_Img32x32: TActionList;
    Ac_ConfigGravar: TAction;
    Ac_ConfigRestaurar: TAction;
    ImgListBotoes32x32: TcxImageList;
    ImgCollectionSmileys: TcxImageCollection;
    People_AngryFace: TcxImageCollectionItem;
    People_AnguishedFace: TcxImageCollectionItem;
    People_AstonishedFace: TcxImageCollectionItem;
    People_ConfoundedFace: TcxImageCollectionItem;
    ImgCollectionItemStatusMensagemRecebida: TcxImageCollectionItem;
    ImgCollectionItemStatusMensagemLida: TcxImageCollectionItem;
    People_ConfusedFace: TcxImageCollectionItem;
    cdsUsuariosATIVO_INATIVO: TIntegerField;
    ImgCollectionItemIconeProMedico72x72: TcxImageCollectionItem;
    ImgCollectionItemIconeProMedico32x32: TcxImageCollectionItem;
    ImgListBotoes24x24: TcxImageList;
    People_CryingFace: TcxImageCollectionItem;
    People_DisappointedButRelievedFace: TcxImageCollectionItem;
    People_DisappointedFace: TcxImageCollectionItem;
    People_DizzyFace: TcxImageCollectionItem;
    People_ExpressionlessFace: TcxImageCollectionItem;
    People_FaceSavouringDeliciousFood: TcxImageCollectionItem;
    People_FaceScreamingInFear: TcxImageCollectionItem;
    People_FaceThrowingAKiss: TcxImageCollectionItem;
    People_FaceWithColdSweat: TcxImageCollectionItem;
    People_FaceWithLookOfTriumph: TcxImageCollectionItem;
    People_FaceWithMedicalMask: TcxImageCollectionItem;
    People_FaceWithOpenMouth: TcxImageCollectionItem;
    People_FaceWithOpenMouthAndColdSweat: TcxImageCollectionItem;
    People_FaceWithStuckOutTongue: TcxImageCollectionItem;
    People_FaceWithStuckOutTongueAndTightlyClosedEyes: TcxImageCollectionItem;
    People_FaceWithStuckOutTongueAndWinkingEye: TcxImageCollectionItem;
    People_FaceWithTearsOfJoy: TcxImageCollectionItem;
    People_FaceWithoutMouth: TcxImageCollectionItem;
    People_FearfulFace: TcxImageCollectionItem;
    People_FlushedFace: TcxImageCollectionItem;
    People_FrowningFaceWithOpenMouth: TcxImageCollectionItem;
    People_GrimacingFace: TcxImageCollectionItem;
    People_GrinningFace: TcxImageCollectionItem;
    People_Imp: TcxImageCollectionItem;
    People_KissingFace: TcxImageCollectionItem;
    People_KissingFaceWithClosedEyes: TcxImageCollectionItem;
    People_LoudlyCryingFace: TcxImageCollectionItem;
    People_NeutralFace: TcxImageCollectionItem;
    People_PensiveFace: TcxImageCollectionItem;
    People_PoutingFace: TcxImageCollectionItem;
    People_RelievedFace: TcxImageCollectionItem;
    People_SleepingFace: TcxImageCollectionItem;
    People_SleepyFace: TcxImageCollectionItem;
    People_SmilingFaceWithHalo: TcxImageCollectionItem;
    People_SmilingFaceWithHeartShapedEyes: TcxImageCollectionItem;
    People_SmilingFaceWithHorns: TcxImageCollectionItem;
    People_SmilingFaceWithOpenMouthAndColdSweat: TcxImageCollectionItem;
    People_SmilingFaceWithSunglasses: TcxImageCollectionItem;
    People_SmirkingFace: TcxImageCollectionItem;
    People_TiredFace: TcxImageCollectionItem;
    People_WearyFace: TcxImageCollectionItem;
    People_WinkingFace: TcxImageCollectionItem;
    People_WorriedFace: TcxImageCollectionItem;
    People_Baby: TcxImageCollectionItem;
    People_BabyAngel: TcxImageCollectionItem;
    People_Boy: TcxImageCollectionItem;
    People_Girl: TcxImageCollectionItem;
    People_Man: TcxImageCollectionItem;
    People_BrideWithVeil: TcxImageCollectionItem;
    People_OlderMan: TcxImageCollectionItem;
    People_OlderWoman: TcxImageCollectionItem;
    People_Woman: TcxImageCollectionItem;
    People_Princess: TcxImageCollectionItem;
    People_ManAndWomanHoldingHands: TcxImageCollectionItem;
    People_CoupleWithHeart: TcxImageCollectionItem;
    People_Family: TcxImageCollectionItem;
    People_FatherChristmas: TcxImageCollectionItem;
    People_ConstructionWorker: TcxImageCollectionItem;
    People_PoliceOfficer: TcxImageCollectionItem;
    People_Skull: TcxImageCollectionItem;
    People_Ghost: TcxImageCollectionItem;
    Celebration_HeavyBlackHeart: TcxImageCollectionItem;
    Celebration_BrokenHeart: TcxImageCollectionItem;
    People_Footprints: TcxImageCollectionItem;
    People_ClappingHandsSign: TcxImageCollectionItem;
    People_PersonWithFoldedHands: TcxImageCollectionItem;
    People_NailPolish: TcxImageCollectionItem;
    People_RaisedHand: TcxImageCollectionItem;
    People_ThumbsUpSign: TcxImageCollectionItem;
    People_ThumbsDownSign: TcxImageCollectionItem;
    People_OkHandSign: TcxImageCollectionItem;
    People_WavingHandSign: TcxImageCollectionItem;
    People_KissMark: TcxImageCollectionItem;
    FoodDrink_HotBeverage: TcxImageCollectionItem;
    FoodDrink_BeerMug: TcxImageCollectionItem;
    FoodDrink_ClinkingBeerMugs: TcxImageCollectionItem;
    FoodDrink_WineGlass: TcxImageCollectionItem;
    People_VictoryHand: TcxImageCollectionItem;
    FoodDrink_TropicalDrink: TcxImageCollectionItem;
    FoodDrink_CocktailGlass: TcxImageCollectionItem;
    Nature_Fire: TcxImageCollectionItem;
    Nature_UmbrellaWithRainDrops: TcxImageCollectionItem;
    Nature_SunBehindCloud: TcxImageCollectionItem;
    Nature_Cloud: TcxImageCollectionItem;
    Nature_Cactus: TcxImageCollectionItem;
    Nature_PalmTree: TcxImageCollectionItem;
    Nature_EvergreenTree: TcxImageCollectionItem;
    Nature_DeciduousTree: TcxImageCollectionItem;
    Nature_CherryBlossom: TcxImageCollectionItem;
    Nature_Rose: TcxImageCollectionItem;
    Nature_Sunflower: TcxImageCollectionItem;
    Nature_Tulip: TcxImageCollectionItem;
    ImgListBotoes16x16: TcxImageList;
    Ac_ConfigCapturarImagem: TAction;
    Ac_ConfigPegarArquivoImagem: TAction;
    cdsMensagemCODIGO_SENHAUS_REMETENTE: TIntegerField;
    cdsMensagemCODIGO_SENHA_DESTINATARIO: TIntegerField;
    cdsMensagemTEXTO: TStringField;
    cdsMensagemMENSAGEM_LIDA: TIntegerField;
    cdsMensagemCODIGO_MENSAGEM_ANEXO: TIntegerField;
    cdsMensagemENDERECO_ANEXO: TStringField;
    cdsMensagemEXTENSAO: TStringField;
    cdsMensagemTHUMBNAIL: TBlobField;
    cdsMensagemNOME_REMETENTE: TStringField;
    cdsMensagemNOME_ARQUIVO: TStringField;
    cdsMensagem_AnexoCODIGO: TIntegerField;
    cdsMensagem_AnexoCODIGO_MENSAGEM: TIntegerField;
    cdsMensagem_AnexoENDERECO_ANEXO: TStringField;
    cdsMensagem_AnexoEXTENSAO: TStringField;
    cdsMensagem_AnexoTHUMBNAIL: TBlobField;
    cdsMensagem_AnexoNOME_REMETENTE: TStringField;
    cdsMensagem_AnexoNOME_ARQUIVO: TStringField;
    cdsMensagemNOME_DESTINATARIO: TStringField;
    cdsMensagemUSUARIO_GRUPO_DESTINATARIO: TIntegerField;
    cdsMensagem_Aux: TpmClientDataSet;
    cdsMensagem_Anexo_Aux: TpmClientDataSet;
    cdsMensagem_AuxCODIGO: TIntegerField;
    cdsMensagem_AuxCODIGO_SENHAUS_REMETENTE: TIntegerField;
    cdsMensagem_AuxCODIGO_SENHA_DESTINATARIO: TIntegerField;
    cdsMensagem_AuxTEXTO: TStringField;
    cdsMensagem_AuxMENSAGEM_LIDA: TIntegerField;
    cdsMensagem_AuxCODIGO_MENSAGEM_ANEXO: TIntegerField;
    cdsMensagem_AuxENDERECO_ANEXO: TStringField;
    cdsMensagem_AuxEXTENSAO: TStringField;
    cdsMensagem_AuxTHUMBNAIL: TBlobField;
    cdsMensagem_AuxNOME_REMETENTE: TStringField;
    cdsMensagem_AuxNOME_DESTINATARIO: TStringField;
    cdsMensagem_AuxUSUARIO_GRUPO_DESTINATARIO: TIntegerField;
    cdsMensagem_Anexo_AuxCODIGO: TIntegerField;
    cdsMensagem_Anexo_AuxCODIGO_MENSAGEM: TIntegerField;
    cdsMensagem_Anexo_AuxENDERECO_ANEXO: TStringField;
    cdsMensagem_Anexo_AuxEXTENSAO: TStringField;
    cdsMensagem_Anexo_AuxTHUMBNAIL: TBlobField;
    cdsMensagem_Anexo_AuxNOME_REMETENTE: TStringField;
    cdsMensagemDATA_HORA_ENVIO: TSQLTimeStampField;
    cdsMensagem_AnexoDATA_HORA_ENVIO: TSQLTimeStampField;
    cdsMensagemTIPO: TSmallintField;
    cdsMensagem_AuxDATA_HORA_ENVIO: TSQLTimeStampField;
    cdsMensagem_AuxTIPO: TSmallintField;
    cdsMensagem_Anexo_AuxDATA_HORA_ENVIO: TSQLTimeStampField;
    cdsMensagem_AnexoTAMANHO_KB: TIntegerField;
    cdsMensagem_Anexo_AuxTAMANHO_KB: TIntegerField;
    cdsMensagemTAMANHO_KB: TIntegerField;
    cdsMensagem_AuxTAMANHO_KB: TIntegerField;
    Ac_Retornar: TAction;
    cdsMensagemMENSAGEM_LIDA_USUARIO_LOGADO: TIntegerField;
    cdsMensagem_AuxMENSAGEM_LIDA_USUARIO_LOGADO: TIntegerField;
    PopupMenuPesquisa: TPopupMenu;
    ltimasPesquisas1: TMenuItem;
    AcUltimasPesquisas21: TMenuItem;
    AcUltimasPesquisas31: TMenuItem;
    AcUltimasPesquisas41: TMenuItem;
    AcUltimasPesquisas51: TMenuItem;
    AcUltimasPesquisas11: TMenuItem;
    SaveDialog1: TSaveDialog;
    Ac_PesquisarConversa: TAction;
    Ac_UltimasPesquisas1: TAction;
    Ac_UltimasPesquisas2: TAction;
    Ac_UltimasPesquisas3: TAction;
    Ac_UltimasPesquisas4: TAction;
    Ac_UltimasPesquisas5: TAction;
    BalloonHint1: TBalloonHint;
    EditRepCbUsuarioGrupo: TcxEditRepositoryImageComboBoxItem;
    ImgCollectionItemStatusMensagemEnviada: TcxImageCollectionItem;
    cdsFotoUsuarioLogado: TpmClientDataSet;
    dsFotoUsuarioLogado: TDataSource;
    cdsFotoUsuarioLogadoFOTO: TBlobField;
    Ac_VerTodasMensagens: TAction;
    cdsUsuarios_Aux: TpmClientDataSet;
    cdsUsuariosGRUPOS_USUARIO: TStringField;
    cdsGrupos_Aux: TpmClientDataSet;
    cdsGrupos_AuxCODIGO: TIntegerField;
    cdsGrupos_AuxCODIGO_HOSPITAL: TIntegerField;
    cdsGrupos_AuxNOME: TStringField;
    cdsUsuarios_AuxCODIGO: TIntegerField;
    cdsUsuarios_AuxCODIGO_HOSPITAL: TIntegerField;
    cdsUsuarios_AuxEMAIL: TStringField;
    cdsUsuarios_AuxNOME: TStringField;
    cdsUsuarios_AuxFUNCAO: TStringField;
    cdsUsuarios_AuxPROMEDICO: TIntegerField;
    cdsUsuarios_AuxUSUARIO_GRUPO: TIntegerField;
    cdsUsuarios_AuxFOTO: TBlobField;
    cdsUsuarios_AuxFOTO_AJUSTAR: TIntegerField;
    cdsUsuarios_AuxFOTO_THUMBNAIL: TBlobField;
    cdsUsuarios_AuxFOTO_THUMBNAIL_AJUSTAR: TIntegerField;
    cdsUsuarios_AuxSTATUS: TSmallintField;
    cdsUsuarios_AuxATIVO_INATIVO: TIntegerField;
    cdsUsuarios_AuxGRUPOS_USUARIO: TStringField;
    cdsUsuarios_AuxTIPO_PAPEL: TSmallintField;
    cdsUsuariosTIPO_PAPEL: TSmallintField;
    cdsLeitoresMensagem: TpmClientDataSet;
    dsLeitoresMensagem: TDataSource;
    EditRepCbSimNao: TcxEditRepositoryImageComboBoxItem;
    cdsLeitoresMensagemCODIGO_SENHAUS: TIntegerField;
    cdsLeitoresMensagemDATA_HORA: TSQLTimeStampField;
    cdsLeitoresMensagemNOME_PC: TStringField;
    cdsLeitoresMensagemNOME_SENHAUS: TStringField;
    cdsLeitoresMensagemMENSAGEM_LIDA: TIntegerField;
    cdsLeitoresMensagemDESTINATARIO_USUARIO_GRUPO: TIntegerField;
    procedure cdsMensagemCalcFields(DataSet: TDataSet);
    procedure cdsMensagem_AnexoCalcFields(DataSet: TDataSet);
  private
    function fpvNomeArquivo(const ipEnderecoAnexo, ipExtensao: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMChat: TDMChat;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMChat.cdsMensagemCalcFields(DataSet: TDataSet);
begin
  cdsMensagemNOME_ARQUIVO.AsString := fpvNomeArquivo(cdsMensagemENDERECO_ANEXO.AsString, cdsMensagemEXTENSAO.AsString);
end;

procedure TDMChat.cdsMensagem_AnexoCalcFields(DataSet: TDataSet);
begin
  cdsMensagem_AnexoNOME_ARQUIVO.AsString := fpvNomeArquivo(cdsMensagem_AnexoENDERECO_ANEXO.AsString, cdsMensagem_AnexoEXTENSAO.AsString);
end;

function TDMChat.fpvNomeArquivo(const ipEnderecoAnexo,
  ipExtensao: string): string;
var
  vaNomeArquivo: string;
begin
  vaNomeArquivo := ExtractFileName(ipEnderecoAnexo);

  if TRegEx.IsMatch(vaNomeArquivo, TRegEx.Escape(ipExtensao) + '_\d{1,}\.zip$', [roIgnoreCase]) then
    begin
      vaNomeArquivo :=
        TRegEx.Match(vaNomeArquivo, '.*(?=' + TRegEx.Escape(ipExtensao) + '_' +
        TRegEx.Match(vaNomeArquivo, '(?<=_)\d{1,}(?=\.zip)', [roIgnoreCase]).Value + '\.zip$)', [roIgnoreCase]).Value +
        ipExtensao;
    end;

  Result := vaNomeArquivo;
end;

end.
