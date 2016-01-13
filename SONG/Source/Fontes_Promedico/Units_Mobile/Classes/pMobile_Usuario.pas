unit pMobile_Usuario;

interface

Uses System.Classes, System.Generics.Collections, pAtributos;

Type
  TMedico = class
  private
    FCodigo: Integer;
    FNome: String;
    FDataHoraUltimaAlteracao: String;
    FExcluido: Boolean;
    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetDataHoraUltimaAlteracao(const Value: String);
    procedure SetExcluido(const Value: Boolean);
  public
    constructor Create;overload;
    constructor Create(ipCodigo: Integer; ipNome: String);overload;
    [TJson,TColumn('CODIGO|CODIGO_MEDICO')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [TJson,TColumn]
    property Nome: String read FNome write SetNome;
    [TJson,TColumn('usuariodh')]
    property DataHoraUltimaAlteracao:String read FDataHoraUltimaAlteracao write SetDataHoraUltimaAlteracao;
    [TJson]
    property Excluido:Boolean read FExcluido write SetExcluido;

  end;

  Tmobile_Usuario = class
  private
    FInicial: string;
    FTrocar_Hora_Consulta: Integer;
    FFuncao: string;
    FUsar_PLaudo: Boolean;
    FDias_Retroativos: Integer;
    FNome_Unidade: string;
    FPorta_PLaudo: Integer;
    FPode_Editar_Valores: Integer;
    FEndereco_PLaudo: string;
    FNome_Usuario: string;
    FChamada_Secretaria: Boolean;
    FUsar_Dicom: Boolean;
    FCodigo_Medico: Integer;
    FPorta_Dicom: Integer;
    FEndereco_Dicom: String;
    FCodigo_Unidade: Integer;
    FPercentual_Desconto: Double;
    FCodigo_Usuario: Integer;
    FPermitir_Bloquear_Acrescimo: Integer;
    FStatus: string;
    FNome_Empresa: string;
    FMedicosComAcesso: TObjectList<TMedico>;
    FCpf: string;
    procedure SetChamada_Secretaria(const Value: Boolean);
    procedure SetCodigo_Medico(const Value: Integer);
    procedure SetCodigo_Usuario(const Value: Integer);
    procedure SetDias_Retroativos(const Value: Integer);
    procedure SetEndereco_Dicom(const Value: String);
    procedure SetEndereco_PLaudo(const Value: string);
    procedure SetFuncao(const Value: string);
    procedure SetInicial(const Value: string);
    procedure SetNome_Unidade(const Value: string);
    procedure SetNome_Usuario(const Value: string);
    procedure SetPercentual_Desconto(const Value: Double);
    procedure SetPermitir_Bloquear_Acrescimo(const Value: Integer);
    procedure SetPode_Editar_Valores(const Value: Integer);
    procedure SetPorta_Dicom(const Value: Integer);
    procedure SetPorta_PLaudo(const Value: Integer);
    procedure SetTrocar_Hora_Consulta(const Value: Integer);
    procedure SetCodigo_Unidade(const Value: Integer);
    procedure SetUsar_Dicom(const Value: Boolean);
    procedure SetUsar_PLaudo(const Value: Boolean);
    procedure SetStatus(const Value: string);
    procedure SetNome_Empresa(const Value: string);
    procedure SetCpf(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
    [TJson]
    property CodigoUsuario: Integer read FCodigo_Usuario write SetCodigo_Usuario;
    [TJson]
    property DiasRetroativos: Integer read FDias_Retroativos write SetDias_Retroativos;
    [TJson]
    property PermitirBloquearAcrescimo: Integer read FPermitir_Bloquear_Acrescimo write SetPermitir_Bloquear_Acrescimo;
    [TJson]
    property ChamadaSecretaria: Boolean read FChamada_Secretaria write SetChamada_Secretaria;
    [TJson]
    property CodigoUnidade: Integer read FCodigo_Unidade write SetCodigo_Unidade;
    [TJson]
    property TrocarHoraConsulta: Integer read FTrocar_Hora_Consulta write SetTrocar_Hora_Consulta;
    property PodeEditarValores: Integer read FPode_Editar_Valores write SetPode_Editar_Valores;
    [TJson]
    property CodigoMedico: Integer read FCodigo_Medico write SetCodigo_Medico;
    property PortaDicom: Integer read FPorta_Dicom write SetPorta_Dicom;
    property PortaPLaudo: Integer read FPorta_PLaudo write SetPorta_PLaudo;
    property UsarDicom: Boolean read FUsar_Dicom write SetUsar_Dicom;
    property UsarPLaudo: Boolean read FUsar_PLaudo write SetUsar_PLaudo;
    [TJson]
    property NomeUsuario: string read FNome_Usuario write SetNome_Usuario;
    [TJson]
    property NomeEmpresa: string read FNome_Empresa write SetNome_Empresa;
    [TJson]
    property Funcao: string read FFuncao write SetFuncao;
    [TJson]
    property NomeUnidade: string read FNome_Unidade write SetNome_Unidade;
    [TJson]
    property Inicial: string read FInicial write SetInicial;
    property EnderecoDicom: String read FEndereco_Dicom write SetEndereco_Dicom;
    property EnderecoPLaudo: string read FEndereco_PLaudo write SetEndereco_PLaudo;
    [TJson]
    property Status: string read FStatus write SetStatus;
    [TJson]
    property PercentualDesconto: Double read FPercentual_Desconto write SetPercentual_Desconto;
    [TJson]
    property Cpf: string read FCpf write SetCpf;
    [TJson]
    property Medicos: TObjectList<TMedico> read FMedicosComAcesso;

    procedure ppuAdicionarMedicosComAcesso(ipMedico: TMedico);
  end;

implementation


{ Tmobile_Usuario }

constructor Tmobile_Usuario.Create;
begin
  FMedicosComAcesso := TObjectList<TMedico>.Create;
end;

destructor Tmobile_Usuario.Destroy;
begin
  FMedicosComAcesso.Free;
  inherited;
end;

procedure Tmobile_Usuario.ppuAdicionarMedicosComAcesso(ipMedico: TMedico);
begin
  FMedicosComAcesso.Add(ipMedico);
  FMedicosComAcesso.Capacity := FMedicosComAcesso.Count;
end;

procedure Tmobile_Usuario.SetChamada_Secretaria(const Value: Boolean);
begin
  FChamada_Secretaria := Value;
end;

procedure Tmobile_Usuario.SetCodigo_Medico(const Value: Integer);
begin
  FCodigo_Medico := Value;
end;

procedure Tmobile_Usuario.SetCodigo_Usuario(const Value: Integer);
begin
  FCodigo_Usuario := Value;
end;

procedure Tmobile_Usuario.SetCpf(const Value: string);
begin
  FCpf := Value;
end;

procedure Tmobile_Usuario.SetDias_Retroativos(const Value: Integer);
begin
  FDias_Retroativos := Value;
end;

procedure Tmobile_Usuario.SetEndereco_Dicom(const Value: String);
begin
  FEndereco_Dicom := Value;
end;

procedure Tmobile_Usuario.SetEndereco_PLaudo(const Value: string);
begin
  FEndereco_PLaudo := Value;
end;

procedure Tmobile_Usuario.SetFuncao(const Value: string);
begin
  FFuncao := Value;
end;

procedure Tmobile_Usuario.SetInicial(const Value: string);
begin
  FInicial := Value;
end;

procedure Tmobile_Usuario.SetNome_Empresa(const Value: string);
begin
  FNome_Empresa := Value;
end;

procedure Tmobile_Usuario.SetNome_Unidade(const Value: string);
begin
  FNome_Unidade := Value;
end;

procedure Tmobile_Usuario.SetNome_Usuario(const Value: string);
begin
  FNome_Usuario := Value;
end;

procedure Tmobile_Usuario.SetPercentual_Desconto(const Value: Double);
begin
  FPercentual_Desconto := Value;
end;

procedure Tmobile_Usuario.SetPermitir_Bloquear_Acrescimo(const Value: Integer);
begin
  FPermitir_Bloquear_Acrescimo := Value;
end;

procedure Tmobile_Usuario.SetPode_Editar_Valores(const Value: Integer);
begin
  FPode_Editar_Valores := Value;
end;

procedure Tmobile_Usuario.SetPorta_Dicom(const Value: Integer);
begin
  FPorta_Dicom := Value;
end;

procedure Tmobile_Usuario.SetPorta_PLaudo(const Value: Integer);
begin
  FPorta_PLaudo := Value;
end;

procedure Tmobile_Usuario.SetStatus(const Value: string);
begin
  FStatus := Value;
end;

procedure Tmobile_Usuario.SetTrocar_Hora_Consulta(const Value: Integer);
begin
  FTrocar_Hora_Consulta := Value;
end;

procedure Tmobile_Usuario.SetCodigo_Unidade(const Value: Integer);
begin
  FCodigo_Unidade := Value;
end;

procedure Tmobile_Usuario.SetUsar_Dicom(const Value: Boolean);
begin
  FUsar_Dicom := Value;
end;

procedure Tmobile_Usuario.SetUsar_PLaudo(const Value: Boolean);
begin
  FUsar_PLaudo := Value;
end;

{ TMedico }

constructor TMedico.Create(ipCodigo: Integer; ipNome: String);
begin
  Self.Codigo := ipCodigo;
  Self.Nome := ipNome;
end;

constructor TMedico.Create;
begin

end;

procedure TMedico.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TMedico.SetDataHoraUltimaAlteracao(const Value: String);
begin
  FDataHoraUltimaAlteracao := Value;
end;

procedure TMedico.SetExcluido(const Value: Boolean);
begin
  FExcluido := Value;
end;

procedure TMedico.SetNome(const Value: String);
begin
  FNome := Value;
end;

end.
