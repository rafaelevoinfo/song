unit pResultadosSantaInes;

interface

uses
  System.Generics.Collections, Xml.XMLDoc, Xml.XMLIntf, Datasnap.DBClient;

type
  TResultados = class;

  TPaciente = class
  private
    FCodigo: string;
    FNome: string;
    Fcodigo_lis: string;
    Fcodigo_aol: string;
    Fdatanasc: TDate;
    Fsexo: string;
    procedure SetCodigo(const Value: string);
    procedure SetNome(const Value: string);
    procedure Setcodigo_lis(const Value: string);
    procedure Setcodigo_aol(const Value: string);
    procedure Setdatanasc(const Value: TDate);
    procedure Setsexo(const Value: string);
  public
    property Codigo: string read FCodigo write SetCodigo;
    property codigo_lis: string read Fcodigo_lis write Setcodigo_lis;
    property codigo_aol: string read Fcodigo_aol write Setcodigo_aol;
    property datanasc: TDate read Fdatanasc write Setdatanasc;
    property Nome: string read FNome write SetNome;
    property sexo: string read Fsexo write Setsexo;
  end;

  TMaterial = class
  private
    FDescricao: string;
    FCodigo: string;
    procedure SetCodigo(const Value: string);
    procedure SetDescricao(const Value: string);
  public
    property Codigo: string read FCodigo write SetCodigo;
    property Descricao: string read FDescricao write SetDescricao;
  end;

  TLinha = class
  private
    FDescricao: string;
    FCodigo: string;
    FUnidade: string;
    procedure SetCodigo(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetUnidade(const Value: string);
  public
    property Codigo: string read FCodigo write SetCodigo;
    property Descricao: string read FDescricao write SetDescricao;
    property Unidade: string read FUnidade write SetUnidade;
  end;

  TCampoComplementar = class
  private
    FListalaudo: string;
    FCodigo: string;
    FLlabel: string;
    FResultado: string;
    procedure SetCodigo(const Value: string);
    procedure SetListalaudo(const Value: string);
    procedure SetLlabel(const Value: string);
    procedure SetResultado(const Value: string);
  public
    property Codigo: string read FCodigo write SetCodigo;
    property Llabel: string read FLlabel write SetLlabel;
    property Listalaudo: string read FListalaudo write SetListalaudo;
    property Resultado: string read FResultado write SetResultado;
  end;

  TResultado = class
  private
    Fid_lis: string;
    Famostra: string;
    Flinharesultado: string;
    FResultado: string;
    Fantibiotico: string;
    Fhalo: Integer;
    Fresistencia: string;
    FCamposComplementares: TObjectList<TCampoComplementar>;
    FDescricao: string;
    procedure Setamostra(const Value: string);
    procedure Setid_lis(const Value: string);
    procedure Setlinharesultado(const Value: string);
    procedure SetResultado(const Value: string);
    procedure Setantibiotico(const Value: string);
    procedure Sethalo(const Value: Integer);
    procedure Setresistencia(const Value: string);
    procedure SetCamposComplementares(const Value: TObjectList<TCampoComplementar>);
    procedure SetDescricao(const Value: string);
  public
    property amostra: string read Famostra write Setamostra;
    property linharesultado: string read Flinharesultado write Setlinharesultado;
    // Somente pra setar a descricao e nao o codigo do linharesultado
    property Descricao: string read FDescricao write SetDescricao;
    property Resultado: string read FResultado write SetResultado;
    property id_lis: string read Fid_lis write Setid_lis;
    property antibiotico: string read Fantibiotico write Setantibiotico;
    property halo: Integer read Fhalo write Sethalo;
    property resistencia: string read Fresistencia write Setresistencia;
    property CamposComplementares: TObjectList<TCampoComplementar> read FCamposComplementares write SetCamposComplementares;
    procedure CarregaCamposComplementares(ipNodeResultado: IXMLNode);
    constructor Create;
    destructor Destroy; override;
  end;

  TAntibiograma = class
  private
    FResultados: TObjectList<TResultado>;
    Fid_lis: string;
    procedure SetResultados(const Value: TObjectList<TResultado>);
    procedure Setid_lis(const Value: string);
  public
    property id_lis: string read Fid_lis write Setid_lis;
    property Resultados: TObjectList<TResultado> read FResultados write SetResultados;
    constructor Create;
    destructor Destroy; override;
  end;

  TCurva = class
  private
    Fid: Integer;
    Fpontos: string;
    procedure Setid(const Value: Integer);
    procedure Setpontos(const Value: string);
  public
    property id: Integer read Fid write Setid;
    property pontos: string read Fpontos write Setpontos;
  end;

  TExame = class
  private
    FCodigo: string;
    FDescricao: string;
    FDataalteracao: TDateTime;
    FValorreferencia: string;
    FCamposComplementares: TObjectList<TCampoComplementar>;
    FDataResultado: TDateTime;
    FMetodo: string;
    FObservacao: string;
    FNormal: string;
    FResultados: TObjectList<TResultado>;
    FAntibiograma: TObjectList<TAntibiograma>;
    FCurvas: TObjectList<TCurva>;
    FLinhasresultado: TObjectList<TLinha>;
    procedure SetCodigo(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetDataalteracao(const Value: TDateTime);
    procedure SetValorreferencia(const Value: string);
    procedure SetCamposComplementares(const Value: TObjectList<TCampoComplementar>);
    procedure SetDataResultado(const Value: TDateTime);
    procedure SetMetodo(const Value: string);
    procedure SetObservacao(const Value: string);
    procedure SetNormal(const Value: string);
    procedure SetResultados(const Value: TObjectList<TResultado>);
    procedure SetAntibiograma(const Value: TObjectList<TAntibiograma>);
    procedure SetCurvas(const Value: TObjectList<TCurva>);
    procedure SetLinhasresultado(const Value: TObjectList<TLinha>);
  public
    property Codigo: string read FCodigo write SetCodigo;
    property Descricao: string read FDescricao write SetDescricao;
    property Metodo: string read FMetodo write SetMetodo;
    property Observacao: string read FObservacao write SetObservacao;
    property Normal: string read FNormal write SetNormal;
    property Dataalteracao: TDateTime read FDataalteracao write SetDataalteracao;
    property DataResultado: TDateTime read FDataResultado write SetDataResultado;
    property Linhasresultado: TObjectList<TLinha> read FLinhasresultado write SetLinhasresultado;
    property Valorreferencia: string read FValorreferencia write SetValorreferencia;
    property CamposComplementares: TObjectList<TCampoComplementar> read FCamposComplementares write SetCamposComplementares;
    property Resultados: TObjectList<TResultado> read FResultados write SetResultados;
    property Antibiogramas: TObjectList<TAntibiograma> read FAntibiograma write SetAntibiograma;
    property Curvas: TObjectList<TCurva> read FCurvas write SetCurvas;
    constructor Create;
    destructor Destroy; override;
  end;

  TAmostra = class
  private
    FMaterial: string;
    FDescricao: string;
    FCodigo: string;
    FIdentificacao: string;
    procedure SetCodigo(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetIdentificacao(const Value: string);
    procedure SetMaterial(const Value: string);
  public
    property Codigo: string read FCodigo write SetCodigo;
    property Identificacao: string read FIdentificacao write SetIdentificacao;
    property Descricao: string read FDescricao write SetDescricao;
    property Material: string read FMaterial write SetMaterial;
  end;

  TAmostras = class
  private
    FAmostras: TObjectList<TAmostra>;
    procedure SetAmostras(const Value: TObjectList<TAmostra>);
  public
    property amostra: TObjectList<TAmostra> read FAmostras write SetAmostras;
    constructor Create;
    destructor Destroy; override;
  end;

  TCadastro = class
  private
    FPacientes: TObjectList<TPaciente>;
    FMateriais: TObjectList<TMaterial>;
    FExames: TObjectList<TExame>;
    procedure SetPacientes(const Value: TObjectList<TPaciente>);
    procedure SetMateriais(const Value: TObjectList<TMaterial>);
    procedure SetExames(const Value: TObjectList<TExame>);
    procedure CarregaPacientes(ipNode: IXMLNode);
    procedure CarregaMateriais(ipNode: IXMLNode);
    procedure CarregaExames(ipNode: IXMLNode);
  public
    property Pacientes: TObjectList<TPaciente> read FPacientes write SetPacientes;
    property Materiais: TObjectList<TMaterial> read FMateriais write SetMateriais;
    property Exames: TObjectList<TExame> read FExames write SetExames;
    constructor Create;
    destructor Destroy; override;
  end;

  TSolicitacao = class
  private
    FPaciente: string;
    FCodigo: string;
    Fcodigo_aol: string;
    Fcodigo_lis: string;
    FAmostras: TAmostras;
    FExames: TObjectList<TExame>;
    FOwner: TResultados;
    procedure SetCodigo(const Value: string);
    procedure Setcodigo_aol(const Value: string);
    procedure Setcodigo_lis(const Value: string);
    procedure SetPaciente(const Value: string);
    procedure SetAmostras(const Value: TAmostras);
    procedure SetExames(const Value: TObjectList<TExame>);
    procedure CarregaSolicitacoes(ipNode: IXMLNode);
  public
    property Codigo: string read FCodigo write SetCodigo;
    property codigo_aol: string read Fcodigo_aol write Setcodigo_aol;
    property codigo_lis: string read Fcodigo_lis write Setcodigo_lis;
    property Paciente: string read FPaciente write SetPaciente;
    property Amostras: TAmostras read FAmostras write SetAmostras;
    property Exames: TObjectList<TExame> read FExames write SetExames;

    function CarregaDescricaoLinhaResultado(ipLinhaResultado: string): string;
    function CarregaCurvas(ipNodeCurva: IXMLNode): TObjectList<TCurva>;
    function CarregaAntibiograma(ipNodeAntibiograma: IXMLNode): TObjectList<TAntibiograma>;
    constructor Create(ipOwner: TResultados);
    destructor Destroy; override;
  end;

  TResultados = class
  private
    FCadastros: TCadastro;
    FSolicitacoes: TObjectList<TSolicitacao>;
    FResultados: TObjectList<TResultado>;
    procedure SetCadastros(const Value: TCadastro);
    procedure SetSolicitacoes(const Value: TObjectList<TSolicitacao>);
    procedure SetResultados(const Value: TObjectList<TResultado>);
  public
    property Cadastros: TCadastro read FCadastros write SetCadastros;
    property Solicitacoes: TObjectList<TSolicitacao> read FSolicitacoes write SetSolicitacoes;
    property Resultados: TObjectList<TResultado> read FResultados write SetResultados;

    procedure AdicionarCadastro(ipNode: IXMLNode);
    procedure AdicionarSolicitacoes(ipNode: IXMLNode);
    procedure CarregarXml(ipPath: string);
    procedure RetornaResultados(ipCDSInterf_Status_Resultados, ipCDSStatus_Exames: TClientDataSet);
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.Variants;

{ TPaciente }
procedure TPaciente.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TPaciente.Setcodigo_aol(const Value: string);
begin
  Fcodigo_aol := Value;
end;

procedure TPaciente.Setcodigo_lis(const Value: string);
begin
  Fcodigo_lis := Value;
end;

procedure TPaciente.Setdatanasc(const Value: TDate);
begin
  Fdatanasc := Value;
end;

procedure TPaciente.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TPaciente.Setsexo(const Value: string);
begin
  Fsexo := Value;
end;

{ TCadastro }
procedure TCadastro.CarregaExames(ipNode: IXMLNode);
Var
  vaExames: TExame;
  vaLinha: TLinha;
  vaCampoComplementar: TCampoComplementar;

  vaNodeTemp: IXMLNode;
  I: Integer;
  vastring: string;
begin
  ipNode.ChildNodes.First;
  repeat
    vaExames := TExame.Create;
    vaExames.Codigo := ipNode.Attributes['codigo'];
    vaExames.Descricao := ipNode.Attributes['descricao'];
    vaExames.Dataalteracao := VarToDateTime(ipNode.Attributes['dataalteracao']);

    // Pesquisar as linhasresultado, valorreferencia e  camposcomplementares dentro de Exame
    vaNodeTemp := ipNode.ChildNodes.FindNode('linhasresultado');
    if (vaNodeTemp <> nil) then
      for I := 0 to vaNodeTemp.ChildNodes.Count - 1 do
        begin
          vaLinha := TLinha.Create;
          vaLinha.Codigo := vaNodeTemp.ChildNodes[I].Attributes['codigo'];
          vaLinha.Descricao := vaNodeTemp.ChildNodes[I].Attributes['descricao'];
          vaLinha.Unidade := vaNodeTemp.ChildNodes[I].Attributes['unidade'];
          vaExames.Linhasresultado.Add(vaLinha);
        end;

    vaNodeTemp := ipNode.ChildNodes.FindNode('valorreferencia');
    vaExames.Valorreferencia := vaNodeTemp.Text;

    vaNodeTemp := ipNode.ChildNodes.FindNode('camposcomplementares');
    if (vaNodeTemp <> nil) then
      for I := 0 to vaNodeTemp.ChildNodes.Count - 1 do
        begin
          vaCampoComplementar := TCampoComplementar.Create;
          vaCampoComplementar.Codigo := vaNodeTemp.ChildNodes[I].Attributes['codigo'];
          vaCampoComplementar.Llabel := vaNodeTemp.ChildNodes[I].Attributes['label'];
          vaCampoComplementar.Listalaudo := vaNodeTemp.ChildNodes[I].Attributes['listalaudo'];
          vaExames.CamposComplementares.Insert(I, vaCampoComplementar);
        end;

    Exames.Add(vaExames);

    // vai para o proximo exame
    ipNode := ipNode.NextSibling;
  until ipNode = nil;
end;

procedure TCadastro.CarregaMateriais(ipNode: IXMLNode);
Var
  vaMaterial: TMaterial;
  I: Integer;
begin
  for I := 0 to ipNode.ChildNodes.Count - 1 do
    begin
      vaMaterial := TMaterial.Create;
      vaMaterial.Codigo := ipNode.ChildNodes[I].GetAttributeNS('codigo', '');
      vaMaterial.Descricao := ipNode.ChildNodes[I].GetAttributeNS('descricao', '');
      Materiais.Add(vaMaterial);
    end;
end;

procedure TCadastro.CarregaPacientes(ipNode: IXMLNode);
Var
  vaPaciente: TPaciente;
  I: Integer;
begin
  for I := 0 to ipNode.ChildNodes.Count - 1 do
    begin
      vaPaciente := TPaciente.Create;
      vaPaciente.Codigo := ipNode.ChildNodes[I].GetAttributeNS('codigo', '');
      vaPaciente.codigo_lis := ipNode.ChildNodes[I].GetAttributeNS('codigo_lis', '');
      vaPaciente.codigo_aol := ipNode.ChildNodes[I].GetAttributeNS('codigo_aol', '');
      vaPaciente.datanasc := VarToDateTime(ipNode.ChildNodes[I].GetAttributeNS('datanasc', ''));
      vaPaciente.Nome := ipNode.ChildNodes[I].GetAttributeNS('nome', '');
      vaPaciente.sexo := ipNode.ChildNodes[I].GetAttributeNS('sexo', '');
      Pacientes.Add(vaPaciente);
    end;
end;

constructor TCadastro.Create;
begin
  Pacientes := TObjectList<TPaciente>.Create;
  Materiais := TObjectList<TMaterial>.Create;
  Exames := TObjectList<TExame>.Create;
end;

destructor TCadastro.Destroy;
begin
  Pacientes.Free;
  Materiais.Free;
  Exames.Free;
  inherited;
end;

procedure TCadastro.SetExames(const Value: TObjectList<TExame>);
begin
  FExames := Value;
end;

procedure TCadastro.SetMateriais(const Value: TObjectList<TMaterial>);
begin
  FMateriais := Value;
end;

procedure TCadastro.SetPacientes(const Value: TObjectList<TPaciente>);
begin
  FPacientes := Value;
end;

{ TMaterial }
procedure TMaterial.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TMaterial.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

{ TExame }
constructor TExame.Create;
begin
  Linhasresultado := TObjectList<TLinha>.Create;
  CamposComplementares := TObjectList<TCampoComplementar>.Create;
  Resultados := TObjectList<TResultado>.Create;
  Antibiogramas := TObjectList<TAntibiograma>.Create;
  Curvas := TObjectList<TCurva>.Create;
end;

destructor TExame.Destroy;
begin
  Linhasresultado.Free;
  CamposComplementares.Free;
  Resultados.Free;
  Antibiogramas.Free;
  Curvas.Free;
  inherited;
end;

procedure TExame.SetAntibiograma(const Value: TObjectList<TAntibiograma>);
begin
  FAntibiograma := Value;
end;

procedure TExame.SetCamposComplementares(
  const Value: TObjectList<TCampoComplementar>);
begin
  FCamposComplementares := Value;
end;

procedure TExame.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TExame.SetCurvas(const Value: TObjectList<TCurva>);
begin
  FCurvas := Value;
end;

procedure TExame.SetDataalteracao(const Value: TDateTime);
begin
  FDataalteracao := Value;
end;

procedure TExame.SetDataResultado(const Value: TDateTime);
begin
  FDataResultado := Value;
end;

procedure TExame.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TExame.SetLinhasresultado(const Value: TObjectList<TLinha>);
begin
  FLinhasresultado := Value;
end;

procedure TExame.SetMetodo(const Value: string);
begin
  FMetodo := Value;
end;

procedure TExame.SetNormal(const Value: string);
begin
  FNormal := Value;
end;

procedure TExame.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TExame.SetResultados(const Value: TObjectList<TResultado>);
begin
  FResultados := Value;
end;

procedure TExame.SetValorreferencia(const Value: string);
begin
  FValorreferencia := Value;
end;

{ TLinha }
procedure TLinha.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TLinha.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TLinha.SetUnidade(const Value: string);
begin
  FUnidade := Value;
end;

{ TTCampoComplementar }
procedure TCampoComplementar.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TCampoComplementar.SetListalaudo(const Value: string);
begin
  FListalaudo := Value;
end;

procedure TCampoComplementar.SetLlabel(const Value: string);
begin
  FLlabel := Value;
end;

procedure TCampoComplementar.SetResultado(const Value: string);
begin
  FResultado := Value;
end;

{ TSolicitacao }
function TSolicitacao.CarregaAntibiograma(ipNodeAntibiograma: IXMLNode): TObjectList<TAntibiograma>;
var
  vaAntibiogramaList: TObjectList<TAntibiograma>;
  vaAntibiograma: TAntibiograma;
  vaResultado: TResultado;
  K: Integer;
begin
  if (ipNodeAntibiograma <> nil) then
    begin
      vaAntibiogramaList := TObjectList<TAntibiograma>.Create;
      vaAntibiograma := TAntibiograma.Create;
      vaAntibiograma.id_lis := ipNodeAntibiograma.Attributes['id_lis'];
      for K := 0 to ipNodeAntibiograma.ChildNodes.Count - 1 do
        begin
          vaResultado := TResultado.Create;
          vaResultado.antibiotico := ipNodeAntibiograma.ChildNodes[K].Attributes['antibiotico'];
          vaResultado.halo := ipNodeAntibiograma.ChildNodes[K].Attributes['halo'];
          vaResultado.resistencia := ipNodeAntibiograma.ChildNodes[K].Attributes['resistencia'];
          vaAntibiograma.Resultados.Add(vaResultado);
        end;
      vaAntibiogramaList.Add(vaAntibiograma);
      Result := vaAntibiogramaList;
    end;
end;

function TSolicitacao.CarregaCurvas(ipNodeCurva: IXMLNode): TObjectList<TCurva>;
var
  K: Integer;
  vaCurvaList: TObjectList<TCurva>;
  vaCurva: TCurva;
begin
  if (ipNodeCurva <> nil) then
    begin
      vaCurvaList := TObjectList<TCurva>.Create;
      for K := 0 to ipNodeCurva.ChildNodes.Count - 1 do
        begin
          vaCurva := TCurva.Create;
          vaCurva.id := ipNodeCurva.ChildNodes[K].Attributes['id'];
          vaCurva.pontos := ipNodeCurva.ChildNodes[K].Attributes['pontos'];
          vaCurvaList.Add(vaCurva)
        end;
      Result := vaCurvaList;
    end;
end;

function TSolicitacao.CarregaDescricaoLinhaResultado(ipLinhaResultado: string): string;
var
  I, J: Integer;
begin
  Result := '';
  for I := 0 to FOwner.Cadastros.Exames.Count - 1 do
    begin
      for J := 0 to FOwner.Cadastros.Exames[I].Linhasresultado.Count - 1 do
        begin
          if FOwner.Cadastros.Exames[I].Linhasresultado[J].Codigo = ipLinhaResultado then
            Exit(FOwner.Cadastros.Exames[I].Linhasresultado[J].Descricao);
        end;
    end;
end;

procedure TSolicitacao.CarregaSolicitacoes(ipNode: IXMLNode);
Var
  vaAmostra: TAmostra;
  vaExame: TExame;
  vaResultado: TResultado;
  vaCamposComplementares: TCampoComplementar;
  vaAntibiograma: TAntibiograma;
  vaCurva: TCurva;
  vaNodeAmostra, vaNodeExame, vaNodeResultado, vaNodeCamposComplementares, vaNodeAntibiograma, vaNodeCurva: IXMLNode;
  I, J, H, K: Integer;
begin
  for I := 0 to ipNode.ChildNodes.Count - 1 do
    begin
      // Pesquisar as amostras: Dentro de Amostras : <amostras>
      if (ipNode.ChildNodes[I].NodeName = 'amostras') then
        begin
          vaNodeAmostra := ipNode.ChildNodes.FindNode('amostras');
          if (vaNodeAmostra <> nil) then
            for J := 0 to vaNodeAmostra.ChildNodes.Count - 1 do // Qtd de nos dentro de <amostras>
              begin
                vaAmostra := TAmostra.Create;
                vaAmostra.Codigo := vaNodeAmostra.ChildNodes[J].Attributes['codigo'];
                vaAmostra.Identificacao := vaNodeAmostra.ChildNodes[J].Attributes['identificacao'];
                vaAmostra.Descricao := vaNodeAmostra.ChildNodes[J].Attributes['descricao'];
                vaAmostra.Material := vaNodeAmostra.ChildNodes[J].Attributes['material'];
                Amostras.amostra.Add(vaAmostra);
              end;
        end
      else if (ipNode.ChildNodes[I].NodeName = 'exame') then
        begin
          // Pesquisar Exame : Dentro de Exame: <resultado> / <antibiograma> / <Curvas>
          vaNodeExame := ipNode.ChildNodes[I];
          if (vaNodeExame <> nil) then
            begin
              vaExame := TExame.Create;
              vaExame.Codigo := ipNode.ChildNodes[I].Attributes['codigo'];
              vaExame.DataResultado := VarToDateTime(ipNode.ChildNodes[I].Attributes['dataresultado']);
              vaExame.Metodo := ipNode.ChildNodes[I].Attributes['metodo'];
              vaExame.Observacao := ipNode.ChildNodes[I].Attributes['observacao'];
              vaExame.Normal := ipNode.ChildNodes[I].Attributes['normal'];

              // Pesquisar Exame e Antibiograma : Dentro de Resultado:  <camposcomplementares> /
              for J := 0 to vaNodeExame.ChildNodes.Count - 1 do // Qtd de nos dentro de <exame>
                begin
                // Percorrer Resultado, Antibiograma e Curvas
                  if vaNodeExame.ChildNodes[J].NodeName = 'resultado' then // RESULTADOS
                    begin
                      // Resultado
                      vaResultado := TResultado.Create;
                      vaResultado.amostra := vaNodeExame.ChildNodes[J].Attributes['amostra'];

                      vaResultado.linharesultado := vaNodeExame.ChildNodes[J].Attributes['linharesultado'];
                      vaResultado.Descricao := CarregaDescricaoLinhaResultado(vaNodeExame.ChildNodes[J].Attributes['linharesultado']);

                      vaResultado.Resultado := vaNodeExame.ChildNodes[J].Attributes['resultado'];
                      vaResultado.id_lis := vaNodeExame.ChildNodes[J].Attributes['id_lis'];

                      // Pegando o no resultado pra poder encontrar os CamposComplementares
                      vaNodeResultado := vaNodeExame.ChildNodes[J];
                      vaResultado.CarregaCamposComplementares(vaNodeResultado);

                      vaExame.Resultados.Add(vaResultado);
                    end
                  else if vaNodeExame.ChildNodes[J].NodeName = 'antibiograma' then // ANTIBIOGRAMA
                    begin
                      // Antibiograma
                      vaExame.Antibiogramas := CarregaAntibiograma(vaNodeExame.ChildNodes[J]);
                    end
                  else if vaNodeExame.ChildNodes[J].NodeName = 'curvas' then // CURVAS
                    begin
                      // Curvas
                      vaExame.Curvas := CarregaCurvas(vaNodeExame.ChildNodes[J]);
                    end;
                end;
              Exames.Add(vaExame);
            end;
        end;
    end;
end;

constructor TSolicitacao.Create(ipOwner: TResultados);
begin
  FOwner := ipOwner;

  Amostras := TAmostras.Create;
  Exames := TObjectList<TExame>.Create;
end;

destructor TSolicitacao.Destroy;
begin
  Amostras.Free;
  Exames.Free;
  inherited;
end;

procedure TSolicitacao.SetAmostras(const Value: TAmostras);
begin
  FAmostras := Value;
end;

procedure TSolicitacao.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TSolicitacao.Setcodigo_aol(const Value: string);
begin
  Fcodigo_aol := Value;
end;

procedure TSolicitacao.Setcodigo_lis(const Value: string);
begin
  Fcodigo_lis := Value;
end;

procedure TSolicitacao.SetExames(const Value: TObjectList<TExame>);
begin
  FExames := Value;
end;

procedure TSolicitacao.SetPaciente(const Value: string);
begin
  FPaciente := Value;
end;

{ TAmostra }
procedure TAmostra.SetCodigo(const Value: string);
begin
  FCodigo := Value;
end;

procedure TAmostra.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TAmostra.SetIdentificacao(const Value: string);
begin
  FIdentificacao := Value;
end;

procedure TAmostra.SetMaterial(const Value: string);
begin
  FMaterial := Value;
end;

{ TAmostras }
constructor TAmostras.Create;
begin
  amostra := TObjectList<TAmostra>.Create;
end;

destructor TAmostras.Destroy;
begin
  amostra.Free;
  inherited;
end;

procedure TAmostras.SetAmostras(const Value: TObjectList<TAmostra>);
begin
  FAmostras := Value;
end;

{ TResultado }
procedure TResultado.CarregaCamposComplementares(ipNodeResultado: IXMLNode);
var
  vaNodeCamposComplementares: IXMLNode;
  vaCampoComplementar: TCampoComplementar;
  K: Integer;
begin
  // CamposComplementares
  vaNodeCamposComplementares := ipNodeResultado.ChildNodes.FindNode('camposcomplementares');
  if (vaNodeCamposComplementares <> nil) then
    begin
      for K := 0 to vaNodeCamposComplementares.ChildNodes.Count - 1 do // Qtd de nos dentro de <camposcomplementares>
        begin
          vaCampoComplementar := TCampoComplementar.Create;
          vaCampoComplementar.Codigo := vaNodeCamposComplementares.ChildNodes[K].Attributes['codigo'];
          vaCampoComplementar.Resultado := vaNodeCamposComplementares.ChildNodes[K].Attributes['resultado'];
          CamposComplementares.Add(vaCampoComplementar);
        end;
    end;
end;

constructor TResultado.Create;
begin
  CamposComplementares := TObjectList<TCampoComplementar>.Create;
end;

destructor TResultado.Destroy;
begin
  CamposComplementares.Free;
  inherited;
end;

procedure TResultado.Setamostra(const Value: string);
begin
  Famostra := Value;
end;

procedure TResultado.Setantibiotico(const Value: string);
begin
  Fantibiotico := Value;
end;

procedure TResultado.SetCamposComplementares(const Value: TObjectList<TCampoComplementar>);
begin
  FCamposComplementares := Value;
end;

procedure TResultado.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TResultado.Sethalo(const Value: Integer);
begin
  Fhalo := Value;
end;

procedure TResultado.Setid_lis(const Value: string);
begin
  Fid_lis := Value;
end;

procedure TResultado.Setlinharesultado(const Value: string);
begin
  Flinharesultado := Value;
end;

procedure TResultado.Setresistencia(const Value: string);
begin
  Fresistencia := Value;
end;

procedure TResultado.SetResultado(const Value: string);
begin
  FResultado := Value;
end;

{ TAntibiograma }
constructor TAntibiograma.Create;
begin
  Resultados := TObjectList<TResultado>.Create;
end;

destructor TAntibiograma.Destroy;
begin
  Resultados.Free;
  inherited;
end;

procedure TAntibiograma.Setid_lis(const Value: string);
begin
  Fid_lis := Value;
end;

procedure TAntibiograma.SetResultados(const Value: TObjectList<TResultado>);
begin
  FResultados := Value;
end;

{ TCurva }
procedure TCurva.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TCurva.Setpontos(const Value: string);
begin
  Fpontos := Value;
end;

{ TResultados }
procedure TResultados.AdicionarCadastro(ipNode: IXMLNode);
var
  vaPacientes, vaMateriais, vaExames: IXMLNode;
begin
    // Carrega Pacientes
  vaPacientes := ipNode.ChildNodes.FindNode('pacientes');
  Cadastros.CarregaPacientes(vaPacientes);

  // Carrega Materiais
  vaMateriais := ipNode.ChildNodes.FindNode('materiais');
  Cadastros.CarregaMateriais(vaMateriais);

  // Carrega Exames
  vaExames := ipNode.ChildNodes.FindNode('exame');
  Cadastros.CarregaExames(vaExames);
end;

procedure TResultados.AdicionarSolicitacoes(ipNode: IXMLNode);
var
  vaSolicitacao: TSolicitacao;
begin
  vaSolicitacao := TSolicitacao.Create(Self);
  vaSolicitacao.Codigo := ipNode.Attributes['codigo'];
  vaSolicitacao.codigo_aol := ipNode.Attributes['codigo_aol'];
  vaSolicitacao.codigo_lis := ipNode.Attributes['codigo_lis'];
  vaSolicitacao.Paciente := ipNode.Attributes['paciente'];
  vaSolicitacao.CarregaSolicitacoes(ipNode);
  Solicitacoes.Add(vaSolicitacao);
end;

procedure TResultados.RetornaResultados(ipCDSInterf_Status_Resultados, ipCDSStatus_Exames: TClientDataSet);
var
  vaResultado: TResultado;
  vaNodeExame: IXMLNode;
  S, E: Integer;
  R: Integer;
begin
  for S := 0 to Solicitacoes.Count - 1 do
    for E := 0 to Solicitacoes[S].Exames.Count - 1 do
      for R := 0 to Solicitacoes[S].Exames[E].Resultados.Count - 1 do
        begin
          if Solicitacoes[S].Exames[E].Resultados[R].id_lis <> '' then
            begin
              ipCDSInterf_Status_Resultados.Append;
              ipCDSInterf_Status_Resultados.FieldByName('COD_EXAME_PROCEDIMENTO').AsString := Solicitacoes[S].Exames[E].Resultados[R].id_lis;
              ipCDSInterf_Status_Resultados.FieldByName('IDENTIFICADOR_FIELDNAME').AsString := Solicitacoes[S].Exames[E].Resultados[R].Descricao;
              ipCDSInterf_Status_Resultados.FieldByName('IDENTIFICADOR_VALOR').AsString := Solicitacoes[S].Exames[E].Resultados[R].Resultado;
              if (ipCDSStatus_Exames.Locate('CODIGO_EXAME_PROCEDIMENTO', Solicitacoes[S].Exames[E].Resultados[R].id_lis, [])) then
                begin
                  ipCDSInterf_Status_Resultados.FieldByName('EXAME').AsString := ipCDSStatus_Exames.FieldByName('NOMEPROC').AsString;
                  ipCDSInterf_Status_Resultados.FieldByName('CODIGO_INTERFACEMANTO_LAB_CODIG').AsInteger := ipCDSStatus_Exames.FieldByName('COD_INTERF_LAB').AsInteger;
                  ipCDSInterf_Status_Resultados.FieldByName('CODIGO_MODELO').AsInteger := ipCDSStatus_Exames.FieldByName('CODIGO_MODELO_LAB').AsInteger;
                  ipCDSInterf_Status_Resultados.FieldByName('NOME_MODELO').AsString := ipCDSStatus_Exames.FieldByName('NOME_MODELO_LAB').AsString;
                end;

              ipCDSInterf_Status_Resultados.Post;
            end;
        end;

// Solicitacoes[?].Exames[?].Antibiogramas[?].id_lis
// Solicitacoes[?].Exames[?].Curvas[?].id

end;

procedure TResultados.CarregarXml(ipPath: string);
var
  vaDocumento: IXMLDocument;
  vaResultados, vaSolicitacoes: IXMLNode;
  vaExamesList: IXMLNodeList;
  vaCont: Integer;
begin
  vaDocumento := TXMLDocument.Create(nil);
  vaDocumento.LoadFromFile(ipPath);

  // 0 - Busco o n� principal do xml <resultados>
  vaResultados := vaDocumento.DocumentElement;
 /// percorrendo os nodes do tresultado,
 /// caso seja cadastro vamos chamar a funcao adicionarcadastro, caso seja solicitacao, adicionarsoliticaao
  for vaCont := 0 to vaResultados.ChildNodes.Count - 1 do
    begin
      if (vaResultados.ChildNodes[vaCont].NodeName = 'cadastros') then
        AdicionarCadastro(vaResultados.ChildNodes[vaCont]);

      if (vaResultados.ChildNodes[vaCont].NodeName = 'solicitacao') then
        AdicionarSolicitacoes(vaResultados.ChildNodes[vaCont]);
    end;
end;

constructor TResultados.Create;
begin
  Cadastros := TCadastro.Create;
  Solicitacoes := TObjectList<TSolicitacao>.Create;
  Resultados := TObjectList<TResultado>.Create;
end;

destructor TResultados.Destroy;
begin
  Cadastros.Free;
  Solicitacoes.Free;
  Resultados.Free;
  inherited;
end;

procedure TResultados.SetCadastros(const Value: TCadastro);
begin
  FCadastros := Value;
end;

procedure TResultados.SetResultados(const Value: TObjectList<TResultado>);
begin
  FResultados := Value;
end;

procedure TResultados.SetSolicitacoes(const Value: TObjectList<TSolicitacao>);
begin
  FSolicitacoes := Value;
end;

end.
