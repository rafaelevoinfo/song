unit pLaudos;

interface

uses SysUtils, Contnrs, Generics.Collections, pAtributos, aduna_ds_list;

type
  TTipoCategoria = (CONSULTA, EXAME, EXAME_LABORATORIO);
  TTipoMedico = (EXAMINADOR, SOLICITANTE);

  TLaudoCods = record
  strict private
    FCodEmpresa: Integer;
    FCategoria: Integer;
    FCodExame: Integer;
    FNrFicha: Integer;
    FSenha: String;
    FCodigo: String;
    procedure SetCategoria(const Value: Integer);
    procedure SetCodEmpresa(const Value: Integer);
    procedure SetCodExame(const Value: Integer);
    procedure SetNrFicha(const Value: Integer);
    procedure SetCodFinal(const Value: String);
    procedure SetCodInicial(const Value: String);
  public
    property Codigo: String read FCodigo write SetCodInicial;
    property Senha: String read FSenha write SetCodFinal;

    property NrFicha: Integer read FNrFicha write SetNrFicha;
    property CodEmpresa: Integer read FCodEmpresa write SetCodEmpresa;
    property CodExame: Integer read FCodExame write SetCodExame;
    property Categoria: Integer read FCategoria write SetCategoria;

    class function fpuGerarCodLaudoOnline(ipNFicha, ipCodExame, ipCodEmpresa, ipCategoria: Integer): TLaudoCods; static;
    class function fpuValidarCodLaudoOnline(ipCodInicial, ipCodFinal: String): Boolean; static;
    class function fpuExtrairDadosCodigos(ipCodInicial, ipCodFinal: String): TLaudoCods; static;

  end;

  TMedico = class
  strict private
    FCodigo: Integer;
    FNome: String;
    FCpf: String;
    FConselhoSigla: String;
    FConselhoNumero: String;
    FTipoMedico: TTipoMedico;
  public
    [TColumn]
    property Codigo: Integer read FCodigo write FCodigo;
    [TColumn]
    property Nome: String read FNome write FNome;
    [TColumn]
    property CPF: String read FCpf write FCpf;
    [TColumn('SIGLA_CONSELHO')]
    property ConselhoSigla: String read FConselhoSigla write FConselhoSigla;
    [TColumn('NUM_CONSELHO')]
    property ConselhoNumero: String read FConselhoNumero write FConselhoNumero;
    property TipoMedico: TTipoMedico read FTipoMedico write FTipoMedico;

  end;

  TPaciente = class
  strict private
    FCodigo: Integer;
    FNome: String;
    // FCpf: String;
    FNomeMae: String;
    FDataNascimento: TDate;
    FEmail: String;
  public
    [TColumn('NROFICHA')]
    property Codigo: Integer read FCodigo write FCodigo;
    [TColumn('NOMEPACIENTE')]
    property Nome: String read FNome write FNome;
    [TColumn('NOMEMAE')]
    property NomeMae: String read FNomeMae write FNomeMae;
    [TColumn('DTNASCIMENTO')]
    property DataNascimento: TDate read FDataNascimento write FDataNascimento;
    [TColumn('EMAIL')]
    property Email: String read FEmail write FEmail;
  end;

  TEmpresa = class
  strict private
    FProteq: String;
  public
    property proteq: String read FProteq write FProteq;
  end;

  TConvenio = class
  strict private
    FRegistroAns: String;
    FCodigo: Integer;
    FNome: String;
    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetRegistroAns(const Value: String);
  public
    [TColumn('CODIGO_CONVENIO')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [TColumn('NOME_CONVENIO')]
    property Nome: String read FNome write SetNome;
    [TColumn('REGISTRO_ANS_CONVENIO')]
    property RegistroAns: String read FRegistroAns write SetRegistroAns;
  end;

  TLaudo = class
  strict private
    FCodigo: Integer;
    FCodExame: Integer;
    FCodExameProcedimento: Integer;
    FPaciente: TPaciente;
    FEmpresa: TEmpresa;
    FMedicoExaminador: TadsObjectlist<TMedico>;
    FMedicoSolicitante: TadsObjectlist<TMedico>;

    // FNumeroExame: Integer;
    FDataExame: TDate;
    FLaudo: OleVariant;
    // FLaudoProtocolo: String;
    // FLaudoSenha: String;
    FTipoCategoria: TTipoCategoria; // 1-Exames;2-Laboratorio
    FCategoria: String;
    FNomeProcedimento: String;
    FConvenio: TConvenio;
    procedure SetConvenio(const Value: TConvenio);
  public
    destructor Destroy; override;
    property Codigo: Integer read FCodigo write FCodigo;

    [TColumn('Codigo_exame_procedimento')]
{$REGION 'Pode guardar o número da tabela exame_procedimento ou no caso de exames...'}
    /// <summary>Pode guardar o número da tabela exame_procedimento ou no
    /// caso de exames de laboratório o número da tabela Exame.</summary>
{$ENDREGION}
    property CodExameProcedimento: Integer read FCodExameProcedimento write FCodExameProcedimento;
    [TColumn('CODIGO_EXAME')]
    property CodExame: Integer read FCodExame write FCodExame;
    [TColumn]
    property Paciente: TPaciente read FPaciente write FPaciente;

    property Empresa: TEmpresa read FEmpresa write FEmpresa;
    [TColumn('NAO_IMPORTA','EXAMINADOR_')]
    property medicoExaminador: TadsObjectlist<TMedico> read FMedicoExaminador write FMedicoExaminador;
    [TColumn('NAO_IMPORTA','SOLICITANTE_')]
    property MedicoSolicitante: TadsObjectlist<TMedico> read FMedicoSolicitante write FMedicoSolicitante;
    [TColumn('DATA_EXAME')]
    property DataExame: TDate read FDataExame write FDataExame;

    property laudo: OleVariant read FLaudo write FLaudo;
    // property laudoProtocolo: String read FLaudoProtocolo write FLaudoProtocolo;
    // property laudoSenha: String read FLaudoSenha write FLaudoSenha;
    property CategoriaDicom: String read FCategoria write FCategoria;
    [TColumn('TIPO_CATEGORIA')]
    property TipoCategoria: TTipoCategoria read FTipoCategoria write FTipoCategoria;
    [TColumn('NOMEPROC')]
    property NomeProcedimento: String read FNomeProcedimento write FNomeProcedimento;
    [TColumn]
    property Convenio: TConvenio read FConvenio write SetConvenio;
  end;

implementation

{ TLaudo }

destructor TLaudo.Destroy;
begin
  FreeAndNil(FPaciente);
  FreeAndNil(FEmpresa);
  FreeAndNil(FMedicoExaminador);
  FreeAndNil(FMedicoSolicitante);
  if Assigned(FConvenio) then
    FreeAndNil(FConvenio);
  inherited;
end;

{ TEnviaLaudo }

procedure TLaudo.SetConvenio(const Value: TConvenio);
begin
  FConvenio := Value;
end;

{ TLaudoCods }

procedure TLaudoCods.SetCategoria(const Value: Integer);
begin
  FCategoria := Value;
end;

procedure TLaudoCods.SetCodEmpresa(const Value: Integer);
begin
  FCodEmpresa := Value;
end;

procedure TLaudoCods.SetCodExame(const Value: Integer);
begin
  FCodExame := Value;
end;

procedure TLaudoCods.SetCodFinal(const Value: String);
begin
  FSenha := Value;
end;

procedure TLaudoCods.SetCodInicial(const Value: String);
begin
  FCodigo := Value;
end;

procedure TLaudoCods.SetNrFicha(const Value: Integer);
begin
  FNrFicha := Value;
end;

class function TLaudoCods.fpuExtrairDadosCodigos(ipCodInicial, ipCodFinal: String): TLaudoCods;
var
  vaPosCat: Integer;
  vaCodExameParte1, vaCodExameParte2, vaCodExameCat: string;
begin
  // extraindo o nrFicha e Cod da Empresa  NrFicha = 8 digitos e CodEmpresa = 4 digitos
  Result.NrFicha := StrToIntDef(Copy(ipCodInicial, 1, 8), 0);
  Result.CodEmpresa := StrToIntDef(Copy(ipCodInicial, 9, 4), 0);
        // pegando a posicao da categoria
  vaPosCat := StrToIntDef(Copy(ipCodFinal, 2, 1), 0);
        // extraindo o codexame juntamente com a categoria
  vaCodExameCat := Copy(ipCodFinal, 3, Length(ipCodFinal) - 2);
        // extraindo a categoria
  Result.Categoria := StrToIntDef(Copy(vaCodExameCat, vaPosCat, 1), -1);
        // extraindo a primeira parte do codexame
  vaCodExameParte1 := Copy(vaCodExameCat, 1, vaPosCat - 1);
  vaCodExameParte2 := Copy(vaCodExameCat, vaPosCat + 1, Length(vaCodExameCat) - (vaPosCat - 1));
  Result.CodExame := StrToIntDef(vaCodExameParte1 + vaCodExameParte2, 0);
end;

class function TLaudoCods.fpuGerarCodLaudoOnline(ipNFicha, ipCodExame, ipCodEmpresa, ipCategoria: Integer): TLaudoCods;
var
  vaPosCat, vaNrValidacao: Integer;
  vaCodExame, vaCodExameParte1, vaCodExameParte2: string;
begin
  Result.Codigo := Format('%.8d', [ipNFicha]) + Format('%.4d', [ipCodEmpresa]);
  // pega os dois ultimos digitos do codExame
  vaPosCat := StrToInt(Copy(IntToStr(ipCodExame), Length(IntToStr(ipCodExame)) - 1, 2));
  vaPosCat := vaPosCat div 10;
  if vaPosCat = 0 then
    vaPosCat := 1;
  // pega os dois ultimos digitos do ipNFicha
  vaNrValidacao := StrToInt(Copy(IntToStr(ipNFicha), Length(IntToStr(ipNFicha)) - 1, 2));
  vaNrValidacao := vaNrValidacao div 10;

  vaCodExame := Format('%.9d', [ipCodExame]);
  vaCodExameParte1 := Copy(vaCodExame, 1, vaPosCat - 1);
  vaCodExameParte2 := Copy(vaCodExame, vaPosCat, Length(vaCodExame) - (vaPosCat - 1));

  Result.Senha := Format('%d%d%s%d%s', [vaNrValidacao, vaPosCat, vaCodExameParte1, ipCategoria, vaCodExameParte2]);
end;

class function TLaudoCods.fpuValidarCodLaudoOnline(ipCodInicial, ipCodFinal: String): Boolean;
var
  vaFicha, vaNrValidacao: Integer;
begin
  Result := True;
  // validando o tamanho
  if (Length(ipCodInicial) <> 12) or (Length(ipCodFinal) <> 12) then
    Result := False;
  // verificado o NValidacao
  // extraindo os dois ultimos numero da ficha
  vaFicha := StrToInt(Copy(ipCodInicial, 7, 2));
  vaNrValidacao := vaFicha div 10;
  // extraindo o nrValidacao do codfinal
  if vaNrValidacao <> StrToInt(Copy(ipCodFinal, 1, 1)) then
    Result := False;
end;

{ TConvenio }

procedure TConvenio.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TConvenio.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TConvenio.SetRegistroAns(const Value: String);
begin
  FRegistroAns := Value;
end;

end.
