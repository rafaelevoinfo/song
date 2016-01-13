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
  //Armazendo alguns dados em vari�veis globais para utilizar em outros procedimentos
  pv_codigo_banco := codigo_banco;

  //Configurando alguns dados de acordo com o banco
  case pv_codigo_banco of
    104: //CAIXA ECON�MICA FEDERAL
      begin
        if remessa_teste = False then
          literal_remessa := 'REMESSA'
        else
          literal_remessa := 'REM.TST';

        //Identifica��o da empresa no banco
        pv_identificacao_empresa_banco := Preenchimento(IntToStr(agencia), '0', 4, False) + //C�digo da Ag�ncia CAIXA que o cliente opera
                                          Preenchimento(IntToStr(operacao), '0', 3, False) + //Opera��o
                                          Preenchimento(IntToStr(conta_corrente), '0', 8, False) + //N�mero da Conta
                                          Preenchimento(IntToStr(digito_verificador), '0', 1, False); //D�gito Verificador
      end;
  end;

  //Este procedimento monta o cabe�alho do arquivo Febraban/CNAB400
  writeln(F, '0' + //C�digo Identificador do tipo de Registro no Arquivo
             '1' + //C�digo Identificador do tr�mite do Meio Magn�tico - Remessa para a CAIXA
             Preenchimento(literal_remessa, ' ', 7, True) + //Literal correspondente ao c�digo da Remessa
             '01' + //C�digo Identificador do Tipo de Servi�o
             Preenchimento('COBRANCA', ' ', 15, True) + //Literal correspondente ao c�digo de Servi�o
             Preenchimento(SoNumeros(pv_identificacao_empresa_banco), '0', 16, False) + //C�digo Identificador da Empresa no banco
             Preenchimento('', ' ', 4, True) + //Complementa��o do Registro
             Preenchimento(nome_empresa, ' ', 30, True) + //Nome por extenso da Empresa respons�vel pela gera��o e envio do arquivo cobran�a
             Preenchimento(IntToStr(pv_codigo_banco), '0', 3, False) + //C�digo de Compensa��o do banco
             Preenchimento(nome_banco, ' ', 15, True) + //Nome do Banco Destinat�rio

             //(DDMMAA) Data em que foi gerado o Arquivo na Empresa
             Copy(DateToStr(date), 1, 2) + //Dia
             Copy(DateToStr(date), 4, 2) + //M�s
             Copy(DateToStr(date), 9, 2) + //Ano

             Preenchimento('', ' ', 289, True) + //Complementa��o do Registro
             Preenchimento(IntToStr(numero_seq_arquivo), '0', 5, False) + //N�mero sequencial do Arquivo de Remessa
             Preenchimento(IntToStr(pv_numero_seq_registro), '0', 6, False)); //N�mero sequencial do Registro no Arquivo
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
  //Incrementando o n�mero sequencial do registro do arquivo
  pv_numero_seq_registro := pv_numero_seq_registro + 1;

  //Armazendo alguns dados em vari�veis globais para utilizar em outros procedimentos
  pv_tipo_insc_empresa := tipo_insc_empresa;
  pv_num_insc_empresa := SoNumeros(num_insc_empresa);
  pv_nosso_numero := nosso_numero;
  pv_codigo_carteira := codigo_carteira;
  pv_codigo_ocorrencia := codigo_ocorrencia;

  //Este procedimento monta os registros dos t�tulos do arquivo Febraban/CNAB400
  Writeln(F, '1' + //C�digo Identificador do tipo de Registro no Arquivo
             Preenchimento(IntToStr(pv_tipo_insc_empresa), '0', 2, False) + //Identificador do tipo de inscri��o da Empresa utilizado
             Preenchimento(pv_num_insc_empresa, '0', 14, False) + //N�mero de inscri��o da Empresa
             Preenchimento(SoNumeros(pv_identificacao_empresa_banco), '0', 16, False) + //Identifica��o da Empresa no banco
             Preenchimento('', ' ', 2, True) + //Campo em branco
             Preenchimento('', '0', 2, False) + //Comiss�o de perman�ncia
             Preenchimento(identificacao_titulo_empresa, ' ', 25, True) + //Identifica��o do t�tulo na Empresa (Uso da empresa)
             Preenchimento(IntToStr(pv_nosso_numero), '0', 11, False) + //Identifica��o do t�tulo no Banco
             Preenchimento('', ' ', 3, True) + //Campo em branco
             Preenchimento(mensagem_bloqueto, ' ', 30, True) + //Mensagem a ser impressa no bloqueto
             Preenchimento(IntToStr(pv_codigo_carteira), '0', 2, False) + //C�digo da Carteira
             Preenchimento(IntToStr(pv_codigo_ocorrencia), '0', 2, False) + //C�digo da Carteira
             Preenchimento(num_documento_cobranca, ' ', 10, True) + //N�mero documento de Cobran�a
             Preenchimento(SoNumeros(data_vencimento), '0', 6, False) + //Data de vencimento do T�tulo
             Preenchimento(IntToStr(valor_titulo), '0', 13, False) + //Valor nominal do T�tulo
             Preenchimento(IntToStr(pv_codigo_banco), '0', 3, False) + //C�digo de compensa��o da CAIXA
             Preenchimento('', '0', 5, False) + //Ag�ncia encarregada da Cobran�a
             Preenchimento(IntToStr(especie_titulo), '0', 2, False) + //Esp�cie do T�tulo
             Preenchimento(aceite, ' ', 1 ,True) + //Identifica��o do T�tulo aceito ou n�o aceito
             Preenchimento(SoNumeros(data_emissao_titulo), '0', 6, False) + //Data de emiss�o do T�tulo
             Preenchimento(IntToStr(primeira_instrucao_cobranca), '0', 2, False) + //Primeira instru��o de Cobran�a
             Preenchimento('', '0', 2, False) + //Segunda instru��o de Cobran�a
             Preenchimento(IntToStr(valor_juros_dia_atraso), '0', 13, False) + //Valor de mora por dia de atraso (comiss�o)
             Preenchimento(SoNumeros(data_limite_desconto), '0', 6, False) + //Data limite para concess�o do desconto
             Preenchimento(IntToStr(valor_desconto), '0', 13, False) + //Valor do Desconto a ser concedido
             Preenchimento(IntToStr(valor_IOF), '0', 13, False) + //Valor do I.O.F. a ser recolhido pela CAIXA em caso de nota de seguro
             Preenchimento(IntToStr(valor_abatimento), '0', 13, False) + //Valor do abatimento a ser concedido
             Preenchimento(IntToStr(tipo_insc_sacado), '0', 2, False) + //Identificador do tipo de inscri��o do Sacado
             Preenchimento(SoNumeros(num_insc_sacado), '0', 14, False) + //N�mero de Inscri��o do sacado
             Preenchimento(nome_sacado, ' ', 40, True) + //Nome do Sacado
             Preenchimento(endereco, ' ', 40, True) + //Rua, n�mero e complemento do Sacado
             Preenchimento(bairro, ' ', 12, True) + //Bairro do Sacado
             Preenchimento(SoNumeros(cep_sacado), '0', 8, False) + //C�digo de endere�amento Postal do Sacado
             Preenchimento(cidade_sacado, ' ', 15, True) + //Cidade do Sacado
             Preenchimento(estado_sacado, ' ', 2, True) + //Estado do Sacado
             Preenchimento(SoNumeros(data_pagamento_multa), '0', 6, False) + //Defini��o da data para pagamento de multa
             Preenchimento(IntToStr(valor_multa), '0', 10, False) + //Valor nominal da multa
             Preenchimento(nome_avalista, ' ', 22, True) + //Nome do Sacador Avalista
             Preenchimento('', '0', 2, False) + //Terceira instru��o de Cobran�a
             Preenchimento(IntToStr(inicio_instrucao_cobranca), '0', 2, False) + //Quantidade de dias para in�cio da a��o de protesto ou devolu��o do T�tulo
             '1' + //C�digo da Moeda
             Preenchimento(IntToStr(pv_numero_seq_registro), '0', 6, False)); //N�mero sequencial do Registro no Arquivo
end;

procedure TfrmBoletos_Remessa.CNAB400_MENSAGENS(mensagem_1, mensagem_2,
  mensagem_3, mensagem_4, mensagem_5, mensagem_6: String);
begin
  //Incrementando o n�mero sequencial do registro do arquivo
  pv_numero_seq_registro := pv_numero_seq_registro + 1;

  //Este procedimento monta as mensagens que ser�o impressas nos t�tulos
  Writeln(F, '2' + //C�digo Identificador do tipo de Registro no Arquivo
             Preenchimento(IntToStr(pv_tipo_insc_empresa), '0', 2, False) + //Identificador do tipo de inscri��o da Empresa utilizado
             Preenchimento(pv_num_insc_empresa, '0', 14, False) + //N�mero de inscri��o da Empresa Cedente - Banco Correspondente
             Preenchimento(SoNumeros(pv_identificacao_empresa_banco), '0', 16, False) + //Identifica��o da Empresa no banco
             Preenchimento('', ' ', 29, True) + //Campo em branco
             Preenchimento(IntToStr(pv_nosso_numero), '0', 11, False) + //Identifica��o do t�tulo no Banco
             Preenchimento('', ' ', 33, True) + //Campo em branco
             Preenchimento(IntToStr(pv_codigo_carteira), '0', 2, False) + //C�digo da Carteira
             Preenchimento(IntToStr(pv_codigo_ocorrencia), '0', 2, False) + //C�digo da Carteira
             Preenchimento('', ' ', 29, True) + //Campo em branco
             Preenchimento(IntToStr(pv_codigo_banco), '0', 3, False) + //C�digo de Compensa��o do banco
             Preenchimento(mensagem_1, ' ', 40, True) + //Mensagem 1 a ser impressa no Bloqueto
             Preenchimento(mensagem_2, ' ', 40, True) + //Mensagem 2 a ser impressa no Bloqueto
             Preenchimento(mensagem_3, ' ', 40, True) + //Mensagem 3 a ser impressa no Bloqueto
             Preenchimento(mensagem_4, ' ', 40, True) + //Mensagem 4 a ser impressa no Bloqueto
             Preenchimento(mensagem_5, ' ', 40, True) + //Mensagem 5 a ser impressa no Bloqueto
             Preenchimento(mensagem_6, ' ', 40, True) + //Mensagem 6 a ser impressa no Bloqueto
             Preenchimento('', ' ', 12, True) + //Campo em branco
             Preenchimento(IntToStr(pv_numero_seq_registro), '0', 6, False)); //N�mero sequencial do Registro no Arquivo
end;

procedure TfrmBoletos_Remessa.CNAB400_FECHAMENTO_ARQUIVO;
begin
  //Incrementando o n�mero sequencial do registro do arquivo
  pv_numero_seq_registro := pv_numero_seq_registro + 1;

  //Este procedimento monta o final do arquivo e fecha-o
  Writeln(F, '9' + //C�digo Identifcador do Tipo de Registro no Arquivo
             Preenchimento('', ' ', 393, True) + //Complementa��o do Registro
             Preenchimento(IntToStr(pv_numero_seq_registro), '0', 6, False)); //N�mero Sequencial do Registro no Arquivo

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
      ShowMessage('� necess�rio informar o endere�o do arquivo.');
      EditEndereco_Arquivo.SetFocus;
      Exit;
    end;

  if not DirectoryExists(EditEndereco_Arquivo.Text) then
    begin
      ShowMessage('O endere�o informado n�o foi encontrado.');
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
      ShowMessage('N�o foi poss�vel acessar o arquivo.' + #13 +
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
