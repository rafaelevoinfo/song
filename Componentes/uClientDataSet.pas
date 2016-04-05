unit uClientDataSet;

interface

uses
  Datasnap.DBClient, Classes, System.SysUtils, Data.DB,
  System.Generics.Collections, System.Variants;

type
  TParametros = class
  public const
    coTodos: string = 'TODOS';
    coID: string = 'ID';
    coNome: string = 'NOME';
    coData: string = 'DATA';
    coActive: string = 'ACTIVE';
    coLogin: string = 'LOGIN';
    coAtivo: string = 'ATIVO';
    coStatus: string = 'STATUS';
    coStatusDiferente = 'STATUS_DIFERENTE';
    coProjeto: string = 'PROJETO';
    coNomeCientifico = 'NOME_CIENTIFICO';
    coFamiliaBotanica = 'FAMILIA_BOTANICA';
    coNomeFantasia = 'NOME_FANTASIA';
    coRazaoSocial = 'RAZAO_SOCIAL';
    coCpfCnpj = 'CPF_CNPJ';
    coEspecie = 'ESPECIE';
    coDescricao = 'DESCRICAO';
    coFornecedor = 'FORNECEDOR';
    coRubrica = 'RUBRICA';
    coPlanoConta = 'PLANO_CONTA';
    coClienteFinanciador = 'CLIENTE_FINANCIADOR';

    coTipo = 'TIPO';

    coIdentificadorPlanoContasRubrica = 'IDENTIFICADOR_PLANO_CONTAS_RUBRICA';

    coDelimitador = '�';
  end;

  TRFClientDataSet = class(TClientDataSet)
  private
    FParametros: TList<String>;
    FValores: TList<Variant>;

    FRFApplyAutomatico: Boolean;
    procedure SetRFApplyAutomatico(const Value: Boolean);
  protected
    procedure InternalDelete; override;
  public
    property Parametros: TList<string> read FParametros;
    property ValoresParametros: TList<Variant> read FValores;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Post; override;

    procedure ppuDataRequest(const ipParametros: Array of string; ipValores: Array of Variant; ipOperador: string; ipLimparParametros: Boolean); overload;
    procedure ppuDataRequest(const ipParametros: Array of string; ipValores: Array of Variant; ipOperador: string); overload;
    procedure ppuDataRequest(const ipParametros: Array of string; ipValores: Array of Variant); overload;
    procedure ppuDataRequest(); overload;

    procedure ppuAddParametro(ipParametro: string; ipValor: Variant; ipOperador: String = ' AND '; ipLimparParametros: Boolean = false);
    procedure ppuAddParametros(const ipParametros: Array of string; ipValores: Array of Variant; ipOperador: String = ' AND ';
      ipLimparParametros: Boolean = false);
    procedure ppuLimparParametros;

    procedure ppuCopiarRegistro(ipCds: TClientDataSet);

  published
    property RFApplyAutomatico: Boolean read FRFApplyAutomatico write SetRFApplyAutomatico default true;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('RafaelComponentes', [TRFClientDataSet]);
end;

{ TRFClientDataSet }

constructor TRFClientDataSet.Create(AOwner: TComponent);
begin
  inherited;
  FRFApplyAutomatico := true;
  FParametros := TList<String>.Create;
  FValores := TList<Variant>.Create;
end;

destructor TRFClientDataSet.Destroy;
begin
  FreeAndNil(FParametros);
  FreeAndNil(FValores);
  inherited;
end;

procedure TRFClientDataSet.InternalDelete;
begin
  inherited;
  if FRFApplyAutomatico and (ChangeCount > 0) then
    ApplyUpdates(0);
end;

procedure TRFClientDataSet.Post;
begin
  inherited;
  if FRFApplyAutomatico and (ChangeCount > 0) then
    ApplyUpdates(0);
end;

procedure TRFClientDataSet.ppuAddParametro(ipParametro: string; ipValor: Variant; ipOperador: String; ipLimparParametros: Boolean);
begin
  if ipLimparParametros then
    ppuLimparParametros;

  if (Trim(ipParametro) <> '') AND (NOT VarIsNull(ipValor)) then
    begin
      FParametros.Add(ipParametro);
      FValores.Add(VarToStr(ipValor) + TParametros.coDelimitador + ipOperador);
    end
  else
    raise Exception.Create('Valores inv�lidos para o parametro ou para o valor.');
end;

procedure TRFClientDataSet.ppuAddParametros(const ipParametros: array of string; ipValores: array of Variant; ipOperador: String;
  ipLimparParametros: Boolean);
var
  i: Integer;
begin
  if ipLimparParametros then
    ppuLimparParametros;

  if High(ipParametros) = High(ipValores) then
    begin
      // percorre todo o array add cada elemento no list
      for i := Low(ipParametros) to High(ipParametros) do
        begin
          ppuAddParametro(ipParametros[i], ipValores[i], ipOperador);
        end;
    end
  else
    raise Exception.Create('Os arrays devem possuir o mesmo tamanho.');
end;

procedure TRFClientDataSet.ppuCopiarRegistro(ipCds: TClientDataSet);
var
  i: Integer;
  vaField: TField;
begin

  if not(State in [dsInsert, dsEdit]) then
    Insert;

  for i := 0 to FieldCount - 1 do // copiando os fields
    begin
      // em caso de campos calculados, caso primeiro seja copiado de um cds q tem campo calculado para um cds qualquer o campo calculado nao vai,
      // ent�o se tentar retornar os valores deste segundo cds para o primeiro ir� ocorrer index out of bounds. por isto foi
      // adicinado esta condi��o (Ocorreu isto na prescri��o m�dica)
      if i < ipCds.FieldCount then
        begin
          if ((not Fields[i].ReadOnly) and (Fields[i].FieldKind = fkData)) then
            begin
              vaField := ipCds.FindField(Fields[i].FieldName);
              if Assigned(vaField) then
                Fields[i].Assign(vaField);
            end;
        end
      else
        break;
    end;

end;

procedure TRFClientDataSet.ppuDataRequest(const ipParametros: array of string; ipValores: array of Variant);
begin
  ppuDataRequest(ipParametros, ipValores, ' AND ');
end;

procedure TRFClientDataSet.ppuDataRequest;
var
  i: Integer;
  vaParams: TParams;
begin
  vaParams := TParams.Create();
  try
    // percorre todo o TList criando os parametros
    for i := 0 to FParametros.Count - 1 do
      begin
        // parametros sem valores nao serao considerados
        if VarToStrDef(FValores.Items[i], '').Trim <> '' then
          vaParams.CreateParam(ftString, FParametros.Items[i], ptInput).AsString := FValores.Items[i];
      end;
    // se nenhum parametro foi passado entao passo o parametro active para evitar de carregar toda a tabela
    if vaParams.Count = 0 then
      vaParams.CreateParam(ftString, TParametros.coActive, ptInput).AsString := 'NAO_IMPORTA';
    // fecho o cds
    Close;
    // faz a requisi��o para o server
    try
      DataRequest(PackageParams(vaParams));
      // faz a requisi��o empacotando os par�metros para OLE
      Open;
    finally
      // limpo os TList
      // FParametros.Clear;
      // FValores.Clear;
    end;
  finally
    vaParams.Free;
  end;
end;

procedure TRFClientDataSet.ppuDataRequest(const ipParametros: array of string;
  ipValores: array of Variant; ipOperador: string; ipLimparParametros: Boolean);
begin
  ppuAddParametros(ipParametros, ipValores, ipOperador, ipLimparParametros);
  ppuDataRequest();
end;

procedure TRFClientDataSet.ppuDataRequest(const ipParametros: array of string;
  ipValores: array of Variant; ipOperador: string);
begin
  ppuDataRequest(ipParametros, ipValores, ipOperador, false);
end;

procedure TRFClientDataSet.ppuLimparParametros;
begin
  FParametros.Clear;
  FValores.Clear;
end;

procedure TRFClientDataSet.SetRFApplyAutomatico(const Value: Boolean);
begin
  FRFApplyAutomatico := Value;
end;

end.
