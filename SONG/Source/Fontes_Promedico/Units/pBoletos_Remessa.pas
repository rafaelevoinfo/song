unit pBoletos_Remessa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FileCtrl, ExtCtrls, StdCtrls, Buttons;

type
  TfrmBoletos_Remessa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    EditEndereco_Arquivo: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure CNAB400_CABECALHO_ARQUIVO(remessa_teste: Boolean;
      numero_seq_arquivo, agencia, operacao, conta_corrente, digito_verificador,
      codigo_banco: Integer; nome_banco, nome_empresa: String);
    procedure CNAB400_TITULOS(tipo_insc_empresa, nosso_numero, codigo_carteira,
      codigo_ocorrencia, valor_titulo, especie_titulo, valor_juros_dia_atraso,
      valor_desconto, valor_IOF, valor_abatimento, valor_multa,
      primeira_instrucao_cobranca, inicio_instrucao_cobranca,
      tipo_insc_sacado: Integer; num_insc_empresa, num_insc_sacado,
      identificacao_titulo_empresa, mensagem_bloqueto, num_documento_cobranca,
      aceite, nome_sacado, endereco, bairro, cidade_sacado, estado_sacado,
      cep_sacado, nome_avalista, data_vencimento, data_emissao_titulo,
      data_limite_desconto, data_pagamento_multa: String);
    procedure CNAB400_MENSAGENS(mensagem_1, mensagem_2, mensagem_3, mensagem_4,
      mensagem_5, mensagem_6: String);
    procedure CNAB400_FECHAMENTO_ARQUIVO;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    F: TextFile;
    pv_numero_seq_registro, pv_codigo_banco, pv_tipo_insc_empresa,
    pv_nosso_numero, pv_codigo_carteira,
    pv_codigo_ocorrencia: Integer;
    pv_num_insc_empresa, pv_identificacao_empresa_banco: String;
  public
    { Public declarations }
    pu_nome_arquivo: String;
  end;

var
  frmBoletos_Remessa: TfrmBoletos_Remessa;

implementation

uses Unit_Method;

{$R *.DFM}

procedure TfrmBoletos_Remessa.CNAB400_CABECALHO_ARQUIVO(remessa_teste: Boolean;
  numero_seq_arquivo, agencia, operacao, conta_corrente, digito_verificador,
  codigo_banco: Integer; nome_banco, nome_empresa: String);
var
  literal_remessa: String;
begin
  //Armazendo alguns dados em variáveis globais para utilizar em outros procedimentos
  pv_codigo_banco := codigo_banco;

  //Configurando alguns dados de acordo com o banco
  case pv_codigo_banco of
    104: //CAIXA ECONÔMICA FEDERAL
      begin
        if remessa_teste = False then
          literal_remessa := 'REMESSA'
        else
          literal_remessa := 'REM.TST';

        //Identificação da empresa no banco
        pv_identificacao_empresa_banco := Preenchimento(IntToStr(agencia), '0', 4, False) + //Código da Agência CAIXA que o cliente opera
                                          Preenchimento(IntToStr(operacao), '0', 3, False) + //Operação
                                          Preenchimento(IntToStr(conta_corrente), '0', 8, False) + //Número da Conta
                                          Preenchimento(IntToStr(digito_verificador), '0', 1, False); //Dígito Verificador
      end;
  end;

  //Este procedimento monta o cabeçalho do arquivo Febraban/CNAB400
  writeln(F, '0' + //Código Identificador do tipo de Registro no Arquivo
             '1' + //Código Identificador do trâmite do Meio Magnético - Remessa para a CAIXA
             Preenchimento(literal_remessa, ' ', 7, True) + //Literal correspondente ao código da Remessa
             '01' + //Código Identificador do Tipo de Serviço
             Preenchimento('COBRANCA', ' ', 15, True) + //Literal correspondente ao código de Serviço
             Preenchimento(SoNumeros(pv_identificacao_empresa_banco), '0', 16, False) + //Código Identificador da Empresa no banco
             Preenchimento('', ' ', 4, True) + //Complementação do Registro
             Preenchimento(nome_empresa, ' ', 30, True) + //Nome por extenso da Empresa responsável pela geração e envio do arquivo cobrança
             Preenchimento(IntToStr(pv_codigo_banco), '0', 3, False) + //Código de Compensação do banco
             Preenchimento(nome_banco, ' ', 15, True) + //Nome do Banco Destinatário

             //(DDMMAA) Data em que foi gerado o Arquivo na Empresa
             Copy(DateToStr(date), 1, 2) + //Dia
             Copy(DateToStr(date), 4, 2) + //Mês
             Copy(DateToStr(date), 9, 2) + //Ano

             Preenchimento('', ' ', 289, True) + //Complementação do Registro
             Preenchimento(IntToStr(numero_seq_arquivo), '0', 5, False) + //Número sequencial do Arquivo de Remessa
             Preenchimento(IntToStr(pv_numero_seq_registro), '0', 6, False)); //Número sequencial do Registro no Arquivo
end;

procedure TfrmBoletos_Remessa.CNAB400_TITULOS(tipo_insc_empresa, nosso_numero,
  codigo_carteira, codigo_ocorrencia, valor_titulo, especie_titulo,
  valor_juros_dia_atraso, valor_desconto, valor_IOF, valor_abatimento,
  valor_multa, primeira_instrucao_cobranca, inicio_instrucao_cobranca,
  tipo_insc_sacado: Integer; num_insc_empresa, num_insc_sacado,
  identificacao_titulo_empresa, mensagem_bloqueto, num_documento_cobranca,
  aceite, nome_sacado, endereco, bairro, cidade_sacado, estado_sacado,
  cep_sacado, nome_avalista, data_vencimento, data_emissao_titulo,
  data_limite_desconto, data_pagamento_multa: String);
begin
  //Incrementando o número sequencial do registro do arquivo
  pv_numero_seq_registro := pv_numero_seq_registro + 1;

  //Armazendo alguns dados em variáveis globais para utilizar em outros procedimentos
  pv_tipo_insc_empresa := tipo_insc_empresa;
  pv_num_insc_empresa := SoNumeros(num_insc_empresa);
  pv_nosso_numero := nosso_numero;
  pv_codigo_carteira := codigo_carteira;
  pv_codigo_ocorrencia := codigo_ocorrencia;

  //Este procedimento monta os registros dos títulos do arquivo Febraban/CNAB400
  Writeln(F, '1' + //Código Identificador do tipo de Registro no Arquivo
             Preenchimento(IntToStr(pv_tipo_insc_empresa), '0', 2, False) + //Identificador do tipo de inscrição da Empresa utilizado
             Preenchimento(pv_num_insc_empresa, '0', 14, False) + //Número de inscrição da Empresa
             Preenchimento(SoNumeros(pv_identificacao_empresa_banco), '0', 16, False) + //Identificação da Empresa no banco
             Preenchimento('', ' ', 2, True) + //Campo em branco
             Preenchimento('', '0', 2, False) + //Comissão de permanência
             Preenchimento(identificacao_titulo_empresa, ' ', 25, True) + //Identificação do título na Empresa (Uso da empresa)
             Preenchimento(IntToStr(pv_nosso_numero), '0', 11, False) + //Identificação do título no Banco
             Preenchimento('', ' ', 3, True) + //Campo em branco
             Preenchimento(mensagem_bloqueto, ' ', 30, True) + //Mensagem a ser impressa no bloqueto
             Preenchimento(IntToStr(pv_codigo_carteira), '0', 2, False) + //Código da Carteira
             Preenchimento(IntToStr(pv_codigo_ocorrencia), '0', 2, False) + //Código da Carteira
             Preenchimento(num_documento_cobranca, ' ', 10, True) + //Número documento de Cobrança
             Preenchimento(SoNumeros(data_vencimento), '0', 6, False) + //Data de vencimento do Título
             Preenchimento(IntToStr(valor_titulo), '0', 13, False) + //Valor nominal do Título
             Preenchimento(IntToStr(pv_codigo_banco), '0', 3, False) + //Código de compensação da CAIXA
             Preenchimento('', '0', 5, False) + //Agência encarregada da Cobrança
             Preenchimento(IntToStr(especie_titulo), '0', 2, False) + //Espécie do Título
             Preenchimento(aceite, ' ', 1 ,True) + //Identificação do Título aceito ou não aceito
             Preenchimento(SoNumeros(data_emissao_titulo), '0', 6, False) + //Data de emissão do Título
             Preenchimento(IntToStr(primeira_instrucao_cobranca), '0', 2, False) + //Primeira instrução de Cobrança
             Preenchimento('', '0', 2, False) + //Segunda instrução de Cobrança
             Preenchimento(IntToStr(valor_juros_dia_atraso), '0', 13, False) + //Valor de mora por dia de atraso (comissão)
             Preenchimento(SoNumeros(data_limite_desconto), '0', 6, False) + //Data limite para concessão do desconto
             Preenchimento(IntToStr(valor_desconto), '0', 13, False) + //Valor do Desconto a ser concedido
             Preenchimento(IntToStr(valor_IOF), '0', 13, False) + //Valor do I.O.F. a ser recolhido pela CAIXA em caso de nota de seguro
             Preenchimento(IntToStr(valor_abatimento), '0', 13, False) + //Valor do abatimento a ser concedido
             Preenchimento(IntToStr(tipo_insc_sacado), '0', 2, False) + //Identificador do tipo de inscrição do Sacado
             Preenchimento(SoNumeros(num_insc_sacado), '0', 14, False) + //Número de Inscrição do sacado
             Preenchimento(nome_sacado, ' ', 40, True) + //Nome do Sacado
             Preenchimento(endereco, ' ', 40, True) + //Rua, número e complemento do Sacado
             Preenchimento(bairro, ' ', 12, True) + //Bairro do Sacado
             Preenchimento(SoNumeros(cep_sacado), '0', 8, False) + //Código de endereçamento Postal do Sacado
             Preenchimento(cidade_sacado, ' ', 15, True) + //Cidade do Sacado
             Preenchimento(estado_sacado, ' ', 2, True) + //Estado do Sacado
             Preenchimento(SoNumeros(data_pagamento_multa), '0', 6, False) + //Definição da data para pagamento de multa
             Preenchimento(IntToStr(valor_multa), '0', 10, False) + //Valor nominal da multa
             Preenchimento(nome_avalista, ' ', 22, True) + //Nome do Sacador Avalista
             Preenchimento('', '0', 2, False) + //Terceira instrução de Cobrança
             Preenchimento(IntToStr(inicio_instrucao_cobranca), '0', 2, False) + //Quantidade de dias para início da ação de protesto ou devolução do Título
             '1' + //Código da Moeda
             Preenchimento(IntToStr(pv_numero_seq_registro), '0', 6, False)); //Número sequencial do Registro no Arquivo
end;

procedure TfrmBoletos_Remessa.CNAB400_MENSAGENS(mensagem_1, mensagem_2,
  mensagem_3, mensagem_4, mensagem_5, mensagem_6: String);
begin
  //Incrementando o número sequencial do registro do arquivo
  pv_numero_seq_registro := pv_numero_seq_registro + 1;

  //Este procedimento monta as mensagens que serão impressas nos títulos
  Writeln(F, '2' + //Código Identificador do tipo de Registro no Arquivo
             Preenchimento(IntToStr(pv_tipo_insc_empresa), '0', 2, False) + //Identificador do tipo de inscrição da Empresa utilizado
             Preenchimento(pv_num_insc_empresa, '0', 14, False) + //Número de inscrição da Empresa Cedente - Banco Correspondente
             Preenchimento(SoNumeros(pv_identificacao_empresa_banco), '0', 16, False) + //Identificação da Empresa no banco
             Preenchimento('', ' ', 29, True) + //Campo em branco
             Preenchimento(IntToStr(pv_nosso_numero), '0', 11, False) + //Identificação do título no Banco
             Preenchimento('', ' ', 33, True) + //Campo em branco
             Preenchimento(IntToStr(pv_codigo_carteira), '0', 2, False) + //Código da Carteira
             Preenchimento(IntToStr(pv_codigo_ocorrencia), '0', 2, False) + //Código da Carteira
             Preenchimento('', ' ', 29, True) + //Campo em branco
             Preenchimento(IntToStr(pv_codigo_banco), '0', 3, False) + //Código de Compensação do banco
             Preenchimento(mensagem_1, ' ', 40, True) + //Mensagem 1 a ser impressa no Bloqueto
             Preenchimento(mensagem_2, ' ', 40, True) + //Mensagem 2 a ser impressa no Bloqueto
             Preenchimento(mensagem_3, ' ', 40, True) + //Mensagem 3 a ser impressa no Bloqueto
             Preenchimento(mensagem_4, ' ', 40, True) + //Mensagem 4 a ser impressa no Bloqueto
             Preenchimento(mensagem_5, ' ', 40, True) + //Mensagem 5 a ser impressa no Bloqueto
             Preenchimento(mensagem_6, ' ', 40, True) + //Mensagem 6 a ser impressa no Bloqueto
             Preenchimento('', ' ', 12, True) + //Campo em branco
             Preenchimento(IntToStr(pv_numero_seq_registro), '0', 6, False)); //Número sequencial do Registro no Arquivo
end;

procedure TfrmBoletos_Remessa.CNAB400_FECHAMENTO_ARQUIVO;
begin
  //Incrementando o número sequencial do registro do arquivo
  pv_numero_seq_registro := pv_numero_seq_registro + 1;

  //Este procedimento monta o final do arquivo e fecha-o
  Writeln(F, '9' + //Código Identifcador do Tipo de Registro no Arquivo
             Preenchimento('', ' ', 393, True) + //Complementação do Registro
             Preenchimento(IntToStr(pv_numero_seq_registro), '0', 6, False)); //Número Sequencial do Registro no Arquivo

  //Fechando o arquivo
  CloseFile(F);           
end;

procedure TfrmBoletos_Remessa.BitBtn1Click(Sender: TObject);
begin
  if Trim(EditEndereco_Arquivo.Text) <> '' then
    OpenDialog1.InitialDir := EditEndereco_Arquivo.Text;

  if OpenDialog1.Execute then
    EditEndereco_Arquivo.Text := ExtractFilePath(OpenDialog1.FileName);
end;

procedure TfrmBoletos_Remessa.BitBtn3Click(Sender: TObject);
begin
  Tag := 0;
  Close;
end;

procedure TfrmBoletos_Remessa.BitBtn2Click(Sender: TObject);
begin
  //Verificando a integridade dos dados
  if Trim(EditEndereco_Arquivo.Text) = '' then
    begin
      ShowMessage('É necessário informar o endereço do arquivo.');
      EditEndereco_Arquivo.SetFocus;
      Exit;
    end;

  if not DirectoryExists(EditEndereco_Arquivo.Text) then
    begin
      ShowMessage('O endereço informado não foi encontrado.');
      EditEndereco_Arquivo.SetFocus;
      Exit;
    end;

  if Copy(EditEndereco_Arquivo.Text, Length(EditEndereco_Arquivo.Text), 1) <> '\' then
    EditEndereco_Arquivo.Text := EditEndereco_Arquivo.Text + '\';

  //Criando o arquivo
  AssignFile(F, EditEndereco_Arquivo.Text + pu_nome_arquivo + '.txt');
  Rewrite(F);

  if IOResult <> 0 then
    begin
      ShowMessage('Não foi possível acessar o arquivo.' + #13 +
                  'ERRO ' + IntToStr(IOResult));
      Exit;
    end;

  //Fechando a tela
  Tag := 1;
  Close;
end;

procedure TfrmBoletos_Remessa.FormCreate(Sender: TObject);
begin
  pv_numero_seq_registro := 1;
end;

end.
