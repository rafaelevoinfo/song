unit Unit_Method;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Buttons, ExtCtrls, DB, DBTables, Registry, Printers,
  ComCtrls, IniFiles, OleServer, ComObj, FileCtrl,
  URLMon;

function NFECriarEnviar_Cabecalho(ipNaturezaOperacao, ipSerie, ipEmissao, ipSaida, ipTipo, ipEmi_CNPJ, ipEmi_IE, ipEmi_Razao, ipEmi_Fantasia,
                                  ipEmi_Fone, ipEmi_CEP, ipEmi_Logradouro, ipEmi_Numero, ipEmi_Complemento, ipEmi_Bairro, ipEmi_CidadeCod,
                                  ipEmi_Cidade, ipEmi_UF, ipDest_CNPJ, ipDest_IE, ipDest_Razao, ipDest_Fone, ipDest_CEP, ipDest_Logradouro,
                                  ipDest_Numero, ipDest_Complemento, ipDest_Bairro, ipDest_CidadeCod, ipDest_Cidade, ipDest_UF: String;
                                  ipModelo, ipCodigo, ipNumero,ipFormaPag : Integer) : String;

function NFECriarEnviar_Itens(ipCFOP, ipDescricao, ipUnidade, ipQuantidade, ipValorUnitario, ipValorTotal,
                              ipCST, ipValorBase, ipAliquota, ipValor : String;
                              ipSequencia, ipCodigo : Integer) : String;

function NFECriarEnviar_Total(ipBaseICMS, ipValorICMS, ipValorProduto, ipValorNota, ipTransp_FretePorConta,
                              ipTransp_CnpjCpf, ipTransp_NomeRazao, ipTransp_IE, ipTransp_Endereco, ipTransp_Cidade, ipTransp_UF,
                              ipTransp_ValorServico, ipTransp_ValorBase, ipTransp_Aliquota, ipTransp_Valor, ipTransp_CFOP, ipTransp_CidadeCod,
                              ipTransp_Placa, ipTransp_UFPlaca, ipTransp_RNTC, ipVolume_Quantidade, ipVolume_Especie,
                              ipVolume_Marca, ipVolume_Numeracao, ipVolume_PesoLiquido, ipVolume_PesoBruto : String;
                              ipImprime_Transportador : Integer) : String;

function NFECriarEnviar_Total_Duplicata(ipNumero, ipDataVencimento, ipValor: String; ipSequencia : Integer) : String;

function NFECriarEnviar_Total_Adicional(ipComplemento, ipCampo, ipTexto : String) : String;

function NFECancelar(ipChave, ipJustificativa : String) : String;
function NFEImprime_Danfe(ipEndereco_Arquivo, ipChave : String) : String;

function Prox_Data_Base(ipData : TDate; ipDia_Base : Integer) : TDate;
function SalvarExcel(ipForm : TForm; ipTable : TIBDataSet; ipEmpresa, ipSoftware, ipTitulo, ipFile : String; ipCabecalho : Boolean) : String;
function MaskCpf_Cnpj(Texto : String) : String;//by Eliomar funÁ„o para colocar os pontos do cpf ou cnpj;
function DownloadFile(Source, Dest: string): Boolean;//Esta funÁ„o baixa o arquivo da net e salva na pasta no computador.
function FazDigito(Codigo : String) : Integer;
function VerDigito(Codigo : String) : Boolean;
function MaskCodigo(Codigo: String) : String;
function Testa_Codigo_Barra(Codigo : String) : Boolean;
function WordPreenchimento(ipEndOrigem: OleVariant; ipDataSet: TIBDataSet) : Boolean;
function CriptoDecripto(ipForm : TForm; ipCripDecrip : Integer; ipKey, ipTexto : String) : String;
procedure Desligar_Windows(acao: Cardinal);
procedure SetFocus_Campo(ipFormFocus : TForm; ipCampo : String);
function Campos_Requeridos(ipForm : TForm; ipDataSet : TIBDataSet) : String;
function SerialHD(Drive:String) : String;
function Nome_Computador: String;
function Tamanho_Arquivo(const Nome_Arquivo: string): integer;
function Dia_Final_Mes(ip_Data : TDate) : TDate;
function Retorna_Data_Valida(ip_data : String) : TDate;
function DiaSemana(Data: TDateTime): String;
function Verifica_Email(email: string): boolean;
procedure Definir_Impressora_Padrao(Impressora: string);
function Calcula_Depreciacao(vTaxa_Anual, vValor_Bem: Double; vData_Aquisicao, vData_Atual: TDate): Double;
function MessageTela(ipGravarLog, ipTipo_Confirmacao : Boolean; ipMensagem : String; ipTempo : Integer(* tempo em segundos*)) : Boolean;
procedure LigaCapsLock;
function Testa_Mes_Ano(ip_mes_ano_anterior, ip_mes_ano_novo : String) : Boolean;
function PegaNomeArquivo(IP_Endereco : String) : String;
function PegaDiretorioArquivo(IP_Endereco : String) : String;
procedure CriptografaArquivo(InFName, OutFName: String; Chave: Word); //by SÈrgio V. Maia, procedimento para criptografar qualquer tipo de arquivo
function CriptografaArquivoToStream(Arquivo: TMemoryStream; Chave: Word): TMemoryStream; //by SÈrgio V. Maia
function FormaPadraoData(Formato : String) : Boolean;
procedure Atualiza_Data_Hora_Computador(ip_Data, ip_Hora: TDateTime);
function PesquisarTexto (TextoCompleto, TextoPesquisa : String) : Integer;
function LerIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini : String) : String;
procedure GravarINI(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini, valor_ini : String);
function ImpressoraPadrao : String;//by Eliomar Retorna o nome da impressora padr„o do Windows
function Pega_Impressora(ipCopias : Integer; var opImpressora : String; var opCopias : Integer) : Boolean;//by Eliomar funÁ„o pegas as impressoras cadastradas e o usuario seleciona a impressora e a quantidade;
function Tirar_Espacos (Texto : String) : String;
function ObterData(Titulo : String; Data_Inicial : String; Data_Maior_Atual : Integer; var Data: String): Boolean;//by Eliomar funÁ„o cria um formul·rio e retorna a data digitada.
function CopiarArquivos(Nome_Arquivo, End_Origem, End_Destino : String) : Boolean;//by Eliomar copiar todos os arquivos (desconsiderando a extens„o) de da origem para destino;
function SubtraiMes(Data_Final, Data_Inicial : TDateTime) : String;//by Eliomar subtrai um mes do outro e retorna a diferenÁa em string;
function AlterarEspeciais(Str:String): String;//by eliomar funÁ„o que substitui os caracteres especiais por caracteres v·lidos
function StrToChar(MyString : String) : CHAR;
function RemoveAcento(Str:String): String;
function ExtractValFromStr(stValue: String): String;
function Ponto(Cap : String; Tipo : Boolean) : String;
function Preenchimento(Texto : String; Text : Char; Tamanho : Integer; Adireita : Boolean) : String;
function BooleanToInt(Valor : Boolean) : Integer;//by Eliomar funÁ„o que testa se o boolean È true e retorna 1 sen„o retorna 0
function SoNumeros(Texto : String) : String;//by Eliomar funÁ„o para pegar a string e deixar somente numeros e retorna tb numeros;
function FatMult(PercInicial: Double; Qtde: Integer): Double;
function ConsisteInscricaoEstadual(Insc, UF: string): Integer; stdcall; external('DllInscE32.dll');
function TemDiscoNoDrive(const drive : char): boolean;
function GetTextValue(gtValue: String): Double; //funcao para pegar o valor de uma string, desconsiderando os pontos da formataÁ„o
function SecurityKey(skChave: String): Boolean; {Verifica se a cÛpia n„o È pirata, baseado no registro do windows}
function SenhaDiaria: String; //Retorna a senha di·ria
function ExecAndWait(const FileName, Params: string; const WindowState: Word): Boolean;
function DataExtenso(Cidade_Estado : String; Data:TDateTime): String;{Retorna uma data por extenso}
function ArrastaMouseToControl(const Control: TControl; Jump, JumpTime: Word): boolean;
function Bissexto(AYear: Integer): Boolean;
function DiasDoMes(AYear, AMonth: Integer): Integer;
function DataMaisDiasUteis(DataIni : TDateTime; Dias_Uteis : Integer) : TDateTime;
function DataBarraStringPonto(Data : TDateTime) : String;
function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
procedure GetFontNames(FontName: TComboBox);
function  CurrText(Editor: TRichEdit): TTextAttributes;
procedure MoveMouse(Controle : TControl);
procedure Espera_Tempo(Quanto_Tempo: TDateTime);
procedure Tab_To_Enter(Sender: TForm; var Key: char);
procedure Virgula_To_Ponto(var Key: char);
function  IntToStrZero(Valor, Tamanho: Integer): String;
function  DouToStrZero(Valor, Tamanho: Double): String;
function ValiData(Teste_Data, Base_Data, Teto_Data: TDateTime): Boolean;
function RoundTo(ValorBase: Double; Casas:Integer): Double;
function TruncDec(Valor : Double; Casas : Integer) : Double;
function VirgulaToPonto(Valor : Double) : String;
function ValidaCPF ( str: String ): Boolean;
function ValidaCGC ( str: String ): Boolean;
function SomaHoras(hora_1, hora_2: String): String;
function SubtraiHoras(hora_1, hora_2: String): String;
function MultiplicaHoras(hora: String; multiplicador: Integer): String;
function Substituir_Texto(Texto, StrOld, StrNew: String): String;   

const
  msg1 = 'Caractere(s) inv·lido(s) no inÌcio do e-mail.';
  msg2 = 'SÌmbolo @ n„o foi encontrado.';
  msg3 = 'Excesso do sÌmbolo @.';
  msg4 = 'Caractere(s) inv·lido(s) antes do sÌmbolo @.';
  msg5 = 'Caractere(s) inv·lido(s) depois do sÌmbolo @.';
  msg6 = 'Agrupamento de caractere(s) inv·lido(s) a esqueda do @.';
  msg7 = 'N„o existe ponto(s) digitado(s).';
  msg8 = 'Ponto encontrado no final do e-mail.';
  msg9 = 'AusÍncia de caractere(s) apÛs o ˙ltimo ponto.';
  msg10 = 'Excesso de ponto(s) a direita do @.';
  msg11 = 'Ponto(s) disposto(s) de forma errada apÛs o @.';
  msg12 = 'Caractere(s) inv·lido(s) antes do ponto.';
  msg13 = 'Caractere(s) inv·lido(s) depois do ponto.';

  vet_valido: array [0..35] of string = ('0','1','2','3','4','5','6','7', '8',
                                         '9','a','b','c','d','e','f', 'g','h',
                                         'i','j','k','l','m','n', 'o','p','q',
                                         'r','s','t','u','v', 'w','x','y','z');
  coQuebra : String = #13#10;

implementation

uses Cripto;

function NFECriarEnviar_Cabecalho(ipNaturezaOperacao, ipSerie, ipEmissao, ipSaida, ipTipo, ipEmi_CNPJ, ipEmi_IE, ipEmi_Razao, ipEmi_Fantasia,
                                  ipEmi_Fone, ipEmi_CEP, ipEmi_Logradouro, ipEmi_Numero, ipEmi_Complemento, ipEmi_Bairro, ipEmi_CidadeCod,
                                  ipEmi_Cidade, ipEmi_UF, ipDest_CNPJ, ipDest_IE, ipDest_Razao, ipDest_Fone, ipDest_CEP, ipDest_Logradouro,
                                  ipDest_Numero, ipDest_Complemento, ipDest_Bairro, ipDest_CidadeCod, ipDest_Cidade, ipDest_UF: String;
                                  ipModelo, ipCodigo, ipNumero,ipFormaPag : Integer) : String;
begin
  Result := 'NFe.CriarEnviarNFe("[Identificacao]' + coQuebra +
            'NaturezaOperacao=' + ipNaturezaOperacao + coQuebra + 
            'Modelo=' + IntToStr(ipModelo) + coQuebra +
            'Serie=' + ipSerie + coQuebra +
            'Codigo=' + IntToStr(ipCodigo) + coQuebra +
            'Numero=' + IntToStr(ipNumero) + coQuebra +
            'Serie=' + ipSerie + coQuebra +
            'Emissao=' + ipEmissao + coQuebra +
            'Saida=' + ipSaida + coQuebra +
            'Tipo=' + ipTipo + coQuebra +
            'FormaPag=' + IntToStr(ipFormaPag) + coQuebra +
            '[Emitente]' + coQuebra +
            'CNPJ=' + ipEmi_CNPJ + coQuebra +
            'IE=' + ipEmi_IE + coQuebra +
            'Razao=' + ipEmi_Razao + coQuebra +
            'Fantasia=' + ipEmi_Fantasia + coQuebra +
            'Fone=' + ipEmi_Fone + coQuebra +
            'CEP=' + ipEmi_CEP + coQuebra +
            'Logradouro=' + ipEmi_Logradouro + coQuebra +
            'Numero=' + ipEmi_Numero + coQuebra +
            'Complemento=' + ipEmi_Complemento + coQuebra +
            'Bairro=' + ipEmi_Bairro + coQuebra +
            'CidadeCod=' + ipEmi_CidadeCod + coQuebra +
            'Cidade=' + ipEmi_Cidade + coQuebra +
            'UF=' + ipEmi_UF + coQuebra +
            '[Destinatario]' + coQuebra +
            'CNPJ=' + ipDest_CNPJ + coQuebra +
            'IE=' + ipDest_IE + coQuebra +
            'ISUF=' + coQuebra +
            'NomeRazao=' + ipDest_Razao + coQuebra +
            'Fone=' + ipDest_Fone + coQuebra +
            'CEP=' + ipDest_CEP + coQuebra +
            'Logradouro=' + ipDest_Logradouro + coQuebra +
            'Numero=' + ipDest_Numero + coQuebra +
            'Complemento=' + ipDest_Complemento + coQuebra +
            'Bairro=' + ipDest_Bairro + coQuebra +
            'CidadeCod=' + ipDest_CidadeCod + coQuebra +
            'Cidade=' + ipDest_Cidade + coQuebra +
            'UF=' + ipDest_UF + coQuebra;
end;

function NFECriarEnviar_Itens(ipCFOP, ipDescricao, ipUnidade, ipQuantidade, ipValorUnitario, ipValorTotal,
                              ipCST, ipValorBase, ipAliquota, ipValor : String;
                              ipSequencia, ipCodigo : Integer) : String;
begin
  Result := '[Produto' + FormatFloat('000', ipSequencia) + ']' + coQuebra +
            'CFOP=' + ipCFOP + coQuebra +
            'Codigo=' + IntToStr(ipCodigo) + coQuebra +
            'Descricao=' + ipDescricao + coQuebra +
            'Unidade=' + ipUnidade + coQuebra +
            'Quantidade=' + ipQuantidade + coQuebra +
            'ValorUnitario=' + ipValorUnitario + coQuebra +
            'ValorTotal=' + ipValorTotal + coQuebra +
            '[ICMS' + FormatFloat('000', ipSequencia) + ']' + coQuebra +
            'CST=' + ipCST + coQuebra +
            'ValorBase=' + ipValorBase + coQuebra +
            'Aliquota=' + ipAliquota + coQuebra +
            'Valor=' + ipValor + coQuebra;

end;

function NFECriarEnviar_Total(ipBaseICMS, ipValorICMS, ipValorProduto, ipValorNota, ipTransp_FretePorConta,
                              ipTransp_CnpjCpf, ipTransp_NomeRazao, ipTransp_IE, ipTransp_Endereco, ipTransp_Cidade, ipTransp_UF,
                              ipTransp_ValorServico, ipTransp_ValorBase, ipTransp_Aliquota, ipTransp_Valor, ipTransp_CFOP, ipTransp_CidadeCod,
                              ipTransp_Placa, ipTransp_UFPlaca, ipTransp_RNTC, ipVolume_Quantidade, ipVolume_Especie,
                              ipVolume_Marca, ipVolume_Numeracao, ipVolume_PesoLiquido, ipVolume_PesoBruto : String;
                              ipImprime_Transportador : Integer) : String;
begin
  Result := '[Total]' + coQuebra +
            'BaseICMS=' + ipBaseICMS + coQuebra +
            'ValorICMS=' + ipValorICMS + coQuebra +
            'ValorProduto=' + ipValorProduto + coQuebra +
            'ValorNota=' + ipValorNota + coQuebra;

  if ipImprime_Transportador = 0 then
    begin
      Result := Result +
            '[Transportador]' + coQuebra +
            'FretePorConta=' + ipTransp_FretePorConta + coQuebra +
            'CnpjCpf=' + ipTransp_CnpjCpf + coQuebra +
            'NomeRazao=' + ipTransp_NomeRazao + coQuebra +
            'IE=' + ipTransp_IE + coQuebra +
            'Endereco=' + ipTransp_Endereco + coQuebra +
            'Cidade=' + ipTransp_Cidade + coQuebra +
            'UF=' + ipTransp_UF + coQuebra +
            'ValorServico=' + ipTransp_ValorServico + coQuebra +
            'ValorBase=' + ipTransp_ValorBase + coQuebra +
            'Aliquota=' + ipTransp_Aliquota + coQuebra +
            'Valor=' + ipTransp_Valor + coQuebra +
            'CFOP=' + ipTransp_CFOP + coQuebra +
            'CidadeCod=' + ipTransp_CidadeCod + coQuebra +
            'Placa=' + ipTransp_Placa + coQuebra +  //formato XXX0000
            'UFPlaca=' + ipTransp_UFPlaca + coQuebra +
            'RNTC=' + ipTransp_RNTC + coQuebra +
            '[Volume001]' + coQuebra +
            'Quantidade=' + ipVolume_Quantidade + coQuebra +
            'Especie=' + ipVolume_Especie + coQuebra +
            'Marca=' + ipVolume_Marca + coQuebra +
            'Numeracao=' + ipVolume_Numeracao + coQuebra +
            'PesoLiquido=' + ipVolume_PesoLiquido + coQuebra +
            'PesoBruto=' + ipVolume_PesoBruto + coQuebra;
    end;
end;

function NFECriarEnviar_Total_Duplicata(ipNumero, ipDataVencimento, ipValor: String; ipSequencia : Integer) : String;
begin
  Result := '[Duplicata'+ FormatFloat('000', ipSequencia) + ']' + coQuebra +
            'Numero=' + ipNumero + coQuebra +
            'DataVencimento=' + ipDataVencimento + coQuebra +
            'Valor=' + ipValor + coQuebra; 
end;

function NFECriarEnviar_Total_Adicional(ipComplemento, ipCampo, ipTexto : String) : String;
begin
  Result := '[DadosAdicionais]' + coQuebra +
            'Complemento=' + ipComplemento + coQuebra +
            '[InfAdic001]' + coQuebra +
            'Campo=' + ipCampo + coQuebra +
            'Texto=' + ipTexto + '"' + coQuebra +
            ',2,0)';
end;




function NFECancelar(ipChave, ipJustificativa : String) : String;
begin
  Result := 'NFE.CANCELARNFE("' + ipChave + '","' + ipJustificativa + '")';
end;

function NFEImprime_Danfe(ipEndereco_Arquivo, ipChave : String) : String;
begin
  Result := 'NFE.IMPRIMIRDANFE("' + ipEndereco_Arquivo + ipChave + '-nfe.xml")'
end;




//funÁ„o que recebe a data e procura qual a proxima data com o dia base;
function Prox_Data_Base(ipData : TDate; ipDia_Base : Integer) : TDate;
var
  DP_J, DP_Mes, DP_Ano : Integer;
begin
  if Copy(DateToStr(ipData),4,2) <> '12' then
    begin
      DP_Mes := StrToInt(Copy(DateToStr(ipData),4,2)) + 1;
      DP_Ano := StrToInt(Copy(DateToStr(ipData),7,4));
    end
  else
    begin
      DP_Mes := 1;
      DP_Ano := StrToInt(Copy(DateToStr(ipData),7,4)) + 1;
    end;

  DP_J := 0;
  while true do
    begin
      try
        Result := StrToDate(FormatFloat('00', ipDia_Base - DP_J) + '/' + FormatFloat('00',DP_Mes) + '/' + IntToStr(DP_Ano));
        Break;
      except
        DP_J := DP_J + 1;
      end;
    end;
end;

function SalvarExcel(ipForm : TForm; ipTable : TIBDataSet; ipEmpresa, ipSoftware, ipTitulo, ipFile : String; ipCabecalho : Boolean) : String;
var
  F            : TextFile;
  I            : Integer;
  mySaveDialog : TSaveDialog;
begin
  Result := '';
  if not(ipTable.Active) then
    MessageTela(True, False, 'Method.' + ipForm.Name + ' - Tabela esta fechada.',0)
  else
    begin
      try
        if not(FileExists(ipFile)) then
          begin
            mySaveDialog := TSaveDialog.Create(ipForm);
            mySaveDialog.Filter := '*.xls|*.xls';
            if mySaveDialog.Execute then
              begin
                if Pos('.XLS', UpperCase(Trim(mySaveDialog.Files.Text))) <= 0 then
                  ipFile := Trim(mySaveDialog.Files.Text) + '.xls';
              end;
            mySaveDialog.Free;
          end;

        AssignFile(F, ipFile);

        if ipCabecalho then
          begin//ser· criado um arquivo novo
            Rewrite(F);
            Writeln(F, ipEmpresa);
            Writeln(F, ipSoftware + #9#9#9#9 + 'Data Emiss„o:' + #9 + DateToStr(Date));
            Writeln(F, ipTitulo + #9#9#9#9 + 'Hora:' + #9 + TimeToStr(Time));
          end
        else
          begin //ser· acrescentado informaÁıes ao arquivo existente
            Append(F);
            Writeln(F, '');
            Writeln(F, '');
          end;

        //sera criado as colunas dos campos
        Write(F, ipTable.Fields[0].DisplayLabel);
        for I := 1 to ipTable.Fields.Count - 1 do
          begin
            if i <> (ipTable.Fields.Count - 1) then
              Write(F, #9 + ipTable.Fields[I].DisplayLabel)
            else
              Writeln(F, #9 + ipTable.Fields[I].DisplayLabel);
            ipTable.Next;
          end;

        //sera passado as informaÁıes
        ipTable.First;
        while not(ipTable.Eof) do
          begin
            Write(F, ipTable.Fields[0].AsString);
            for I := 1 to ipTable.Fields.Count - 1 do
              begin
                if i <> (ipTable.Fields.Count - 1) then
                  Write(F, #9 + ipTable.Fields[I].AsString)
                else
                  Writeln(F, #9 + ipTable.Fields[I].AsString)
              end;
            ipTable.Next;
          end;
        CloseFile(F);
      except
        on E: Exception do
          begin
            CloseFile(F);
            MessageTela(True, False, 'Method.' + ipForm.Name + ' - Problemas para gerar o arquivo do EXCEL.'+#13#10+E.Message,0);
            Exit;
          end;
      end;
    end;
  Result := ipFile;
end;

function MaskCpf_Cnpj(Texto : String) : String;//By eliomar funÁ„o para colocar os pontos do cpf ou do cnpj
begin
  Texto := SoNumeros(Texto);
  if Texto <> '' then
    begin
      if Length(Texto) <= 11 then
        Texto := Copy(Texto,1,3) + '.' + Copy(Texto,4,3) + '.' + Copy(Texto,7,3) + '-' + Copy(Texto,10,2)
      else
        Texto := Copy(Texto,1,2) + '.' + Copy(Texto,3,3) + '.' + Copy(Texto,6,3) + '/' + Copy(Texto,9,4) + '-' + Copy(Texto,13,2);
    end;
  Result := Texto;
end;


function DownloadFile(Source, Dest: string): Boolean;//Esta funÁ„o baixa o arquivo da net e salva na pasta no computador
begin
  try
    Result := UrlDownloadToFile(nil, PChar(source), PChar(Dest), 0, nil) = 0;
  except
    Result := False;
  end;
end;

function MaskCodigo(Codigo: String) :String;
Var
  CodigoGeral : String;
begin
  try
    CodigoGeral := '000.000/00-0';
    while Length(Codigo) < 12 do
      Codigo := '0' + Codigo;
    CodigoGeral[12] := Codigo[12];

    CodigoGeral[10] := Codigo[11];
    CodigoGeral[9] := Codigo[10];

    CodigoGeral[7] := Codigo[9];
    CodigoGeral[6] := Codigo[8];
    CodigoGeral[5] := Codigo[7];

    CodigoGeral[3] := Codigo[6];
    CodigoGeral[2] := Codigo[5];
    CodigoGeral[1] := Codigo[4];
    MaskCodigo := CodigoGeral;
  except
    on E: Exception do
      ShowMessage('N„o foi possÌvel montar M·scara do CÛdigo Item'+#13+'Verifique o CÛdigo Digitado');
  end;
end;

function FazDigito(Codigo : String) : Integer;
var
  Digito : Integer;
  CodNumeros : String;
begin
  Digito := 1;
  CodNumeros := '';
  while (Digito < Length(Codigo)) do
    begin
      if (Copy(Codigo,Digito,1) = '0') or
         (Copy(Codigo,Digito,1) = '1') or
         (Copy(Codigo,Digito,1) = '2') or
         (Copy(Codigo,Digito,1) = '3') or
         (Copy(Codigo,Digito,1) = '4') or
         (Copy(Codigo,Digito,1) = '5') or
         (Copy(Codigo,Digito,1) = '6') or
         (Copy(Codigo,Digito,1) = '7') or
         (Copy(Codigo,Digito,1) = '8') or
         (Copy(Codigo,Digito,1) = '9') then
        CodNumeros := CodNumeros + Copy(Codigo,Digito,1);
      Digito := Digito + 1;
    end;
  try
    Digito := ( ( (StrToInt(Copy(CodNumeros,2,1))) +
                  (StrToInt(Copy(CodNumeros,4,1))) +
                  (StrToInt(Copy(CodNumeros,6,1))) +
                  (StrToInt(Copy(CodNumeros,8,1))) ) * 3 ) +

              ( (StrToInt(Copy(CodNumeros,1,1))) +
                (StrToInt(Copy(CodNumeros,3,1))) +
                (StrToInt(Copy(CodNumeros,5,1))) +
                (StrToInt(Copy(CodNumeros,7,1))) );
    Digito := 10 - (StrToInt(Copy(IntToStr(Digito),(Length(IntToStr(Digito))),1)));
    if Digito = 10 then
      Digito := 0;
  except
    on Exception do
      ShowMessage('DigitaÁ„o Incorreta do CÛdigo');
  end;
  FazDigito := Digito;
end;

function VerDigito(Codigo : String) : Boolean;
var
  Digito : Integer;
  CodNumeros : String;
begin
  VerDigito := False;
  Digito := 1;
  CodNumeros := '';
  while (Digito < Length(Codigo)) do
    begin
      if (Copy(Codigo,Digito,1) = '0') or
         (Copy(Codigo,Digito,1) = '1') or
         (Copy(Codigo,Digito,1) = '2') or
         (Copy(Codigo,Digito,1) = '3') or
         (Copy(Codigo,Digito,1) = '4') or
         (Copy(Codigo,Digito,1) = '5') or
         (Copy(Codigo,Digito,1) = '6') or
         (Copy(Codigo,Digito,1) = '7') or
         (Copy(Codigo,Digito,1) = '8') or
         (Copy(Codigo,Digito,1) = '9') then
        CodNumeros := CodNumeros + Copy(Codigo,Digito,1);
      Digito := Digito + 1;
    end;
  try
    Digito := ( ( (StrToInt(Copy(CodNumeros,2,1))) +
                  (StrToInt(Copy(CodNumeros,4,1))) +
                  (StrToInt(Copy(CodNumeros,6,1))) +
                  (StrToInt(Copy(CodNumeros,8,1))) ) * 3 ) +

              ( (StrToInt(Copy(CodNumeros,1,1))) +
                (StrToInt(Copy(CodNumeros,3,1))) +
                (StrToInt(Copy(CodNumeros,5,1))) +
                (StrToInt(Copy(CodNumeros,7,1))) );
    Digito := 10 - (StrToInt(Copy(IntToStr(Digito),(Length(IntToStr(Digito))),1)));
    if Digito = 10 then
      Digito := 0;
    if Digito = StrToInt(Copy(Codigo,(Length(Codigo)),1)) then
      VerDigito := True;
  except
    on Exception do
      ShowMessage('DigitaÁ„o Incorreta do CÛdigo');
  end;
end;

function Testa_Codigo_Barra(Codigo : String) : Boolean;
var
  Digito : Integer;
  CodNumeros : String;
begin
  Testa_Codigo_Barra := False;
  if Codigo = '0000000000000' then
    Exit;
  Digito := 1;
  CodNumeros := '';
  while (Digito < Length(Codigo)) do
    begin
      if (Copy(Codigo,Digito,1) = '0') or
         (Copy(Codigo,Digito,1) = '1') or
         (Copy(Codigo,Digito,1) = '2') or
         (Copy(Codigo,Digito,1) = '3') or
         (Copy(Codigo,Digito,1) = '4') or
         (Copy(Codigo,Digito,1) = '5') or
         (Copy(Codigo,Digito,1) = '6') or
         (Copy(Codigo,Digito,1) = '7') or
         (Copy(Codigo,Digito,1) = '8') or
         (Copy(Codigo,Digito,1) = '9') then
        CodNumeros := CodNumeros + Copy(Codigo,Digito,1);
      Digito := Digito + 1;
    end;
  try
    Digito := ( ( (StrToInt(Copy(CodNumeros, 2,1))) +
                  (StrToInt(Copy(CodNumeros, 4,1))) +
                  (StrToInt(Copy(CodNumeros, 6,1))) +
                  (StrToInt(Copy(CodNumeros, 8,1))) +
                  (StrToInt(Copy(CodNumeros,10,1))) +
                  (StrToInt(Copy(CodNumeros,12,1))) ) * 3 ) +

              ( (StrToInt(Copy(CodNumeros, 1,1))) +
                (StrToInt(Copy(CodNumeros, 3,1))) +
                (StrToInt(Copy(CodNumeros, 5,1))) +
                (StrToInt(Copy(CodNumeros, 7,1))) +
                (StrToInt(Copy(CodNumeros, 9,1))) +
                (StrToInt(Copy(CodNumeros,11,1))) ) ;
    Digito := 10 - (StrToInt(Copy(IntToStr(Digito),(Length(IntToStr(Digito))),1)));
    if Digito = 10 then
      Digito := 0;
    if Digito = StrToInt(Copy(Codigo,(Length(Codigo)),1)) then
      Testa_Codigo_Barra := True;
  except
    on Exception do
      ShowMessage('DigitaÁ„o Incorreta do CÛdigo');
  end;
end;

////////////////////////////////////////////////////////////////////////////////
// Esta funÁ„o ir· abrir um documento do Word no Formato .dot(modelo) e ir·   //
//  substituir as palavras chaves pelos valores dos campos da table           //
////////////////////////////////////////////////////////////////////////////////
function WordPreenchimento(ipEndOrigem: OleVariant; ipDataSet : TIBDataSet) : Boolean;
var
  Word, Docs, Doc: Variant;
  I : Integer;
begin
  try
    Word := CreateOleObject('Word.Application');
    Word.Visible := False;//esta passando false para que n„o veja o Word abrindo.
    Docs := Word.Documents;
    Doc := Docs.Open(ipEndOrigem);
    for i := 0 to ipDataSet.Fields.Count -1 do { localiza e substitui as strings no documento aberto }
      Doc.Content.Find.Execute(FindText := '@SD_' + ipDataSet.Fields[I].DisplayLabel, ReplaceWith := ipDataSet.Fields[I].AsString);
    Doc.PrintOut(False);
    Doc.Close;
    Word.quit;
  except
    on E: Exception do
      begin
        MessageTela(True, False, 'Problemas para fazer impress„o do contrato.',0);
        Result := False;
      end;
  end;

  while FileExists(ipEndOrigem) do
    DeleteFile(ipEndOrigem);

  Result := True;
end;

////////////////////////////////////////////////////////////////////////////////
// Esta funÁ„o ir· receber uma string e ir· criptografar ou descriptografar   //
//  de acordo com a ipKey que for passada.                                    //
////////////////////////////////////////////////////////////////////////////////
function CriptoDecripto(ipForm : TForm; ipCripDecrip : Integer; ipKey, ipTexto : String) : String;
var
  MyCripto : TCriptografa;
begin
  if ipKey = '' then
    begin
      Result := '';
      MessageTela(False, False, 'N„o foi passado a Chave para Criptografar ou Descriptografar.', 0);
      Exit;
    end;
  MyCripto := TCriptografa.Create(ipForm);

(* vamos retirar esse teste aque que mude o padr„o da senha do SAGE 4.0 que utiliza a chave padr„o do compomente;
  if ipKey = MyCripto.Key then
    begin
      MyCripto.Free;
      Result := '';
      MessageTela(False, False, 'Favor informar Chave diferente de Chave padr„o.', 0);
      Exit;
    end;*)

  MyCripto.Key := ipKey;
  case ipCripDecrip of
    0 : Result := MyCripto.TextToCriptoHex(ipTexto);//iremos criptografar a string;
    1 : Result := MyCripto.CriptoHexToText(ipTexto);//iremos descriptografar a string;
  end;
  MyCripto.Free;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Chame o procedimento assim, como nestes exemplos:                          //
//                                                                            //
// Desligar_Windows(EWX_SHUTDOWN); // desligar normal                         //
// Desligar_Windows(EWX_FORCE); //sair forÁado                                //
// Desligar_Windows(EWX_POWEROFF); //para fontes ATX                          //
// Desligar_Windwos(EWX_LOGOFF); //efetua logoff                              //
// Desligar_Windows(EWX_REBOOT); //reinicializa o computador                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure Desligar_Windows(acao: Cardinal);
var
  TokenPriv: TTokenPrivileges;
  H: DWORD;
  HToken: THandle;
begin
  {* para WIN 2000, XP e NT *}
  if Win32Platform = VER_PLATFORM_WIN32_NT then
    begin
      OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES, HToken);
      LookUpPrivilegeValue(nil, 'SeShutdownPrivilege',
      TokenPriv.Privileges[0].Luid);
      TokenPriv.PrivilegeCount := 1;
      TokenPriv.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      H := 0;
      AdjustTokenPrivileges(HToken, False, TokenPriv, 0,PTokenPrivileges(nil)^, H);
      CloseHandle(HToken);
    end;
  ExitWindowsEx(acao, 0);
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Esse procedimento È responsavel em receber um form e testar se tem algum   //
// componente DB com o DataField = ao campo passado se tiver ent„o da o focus //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
procedure SetFocus_Campo(ipFormFocus : TForm; ipCampo : String);
var
  I : Integer;
begin
  for I := 0 to (ipFormFocus.ComponentCount - 1) do
    begin
      if (ipFormFocus.Components[I] is TDBEdit) then
        begin
          if (ipFormFocus.Components[I] as TDBEdit).DataField = ipCampo then
            begin
              (ipFormFocus.Components[I] as TDBEdit).SetFocus;
              Abort;
            end
        end
      else
      if (ipFormFocus.Components[I] is TDBCheckBox) then
        begin
          if (ipFormFocus.Components[I] as TDBCheckBox).DataField = ipCampo then
            begin
              (ipFormFocus.Components[I] as TDBCheckBox).SetFocus;
              Abort;
            end
        end;
    end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
// Essa funnÁ„o recebe uma objeto DataSet e testa se tem algum camo que È     //
// requerido e esta em branco.. se tiver ent„o mostra qual campo È.           //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
function Campos_Requeridos(ipForm : TForm; ipDataSet : TIBDataSet) : String;
var
  I : Integer;
begin
  Result := '';
  for  I := 0 to ipDataSet.FieldCount - 1 do
    begin
      if ((ipDataSet.Fields[i].FieldKind = fkData) and (ipDataSet.Fields[i].Required) and ((ipDataSet.Fields[i].IsNull) or (ipDataSet.Fields[i].AsString = ''))) then
        begin
          Result := ipDataSet.Fields[i].FieldName;
          MessageTela(False, False, 'Campo: ' + ipDataSet.Fields[i].DisplayName + ', n„o foi preenchido.', 0);
          SetFocus_Campo(ipForm, Result);
          Abort;
        end;
    end;
end;

function SerialHD(Drive:String):String;
var
  Serial:DWord;
  DirLen,Flags: DWord;
  DLabel : Array[0..11] of Char;
begin
  GetVolumeInformation(PChar(Drive+':\'),dLabel,12,@Serial,DirLen,Flags,nil,0);
  Result := IntToHex(Serial,8);
end;

//FunÁ„o que ir· retornar o nome do computador
function Nome_Computador: string;
var
  I: DWord;
begin
  I := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Result, I);
  Windows.GetComputerName(PChar(Result), I);
  Result := string(PChar(Result));
end;

function Tamanho_Arquivo(const Nome_Arquivo: string): integer;
var
  SR: TSearchRec;
  I: integer;
begin
  I := FindFirst(Nome_Arquivo, faArchive, SR);
  try
    if I = 0 then
      Result := SR.Size
    else
      Result := -1;
  finally
    FindClose(SR);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
// Esta funÁ„o recebe uma data qualquer e retorna uma data que ser· o ultimo  //
// dia do mes que foi informado                                               //
////////////////////////////////////////////////////////////////////////////////
function Dia_Final_Mes(ip_Data : TDate) : TDate;
begin
  case StrToInt(copy(DateToStr(ip_Data),4,2)) of
    1,3,5,7,8,10,12 : Result := StrToDate('31/' + copy(DateToStr(ip_Data),4,7));
    4,6,9 : Result := StrToDate('30/' + copy(DateToStr(ip_Data),4,7));
    2 :
      begin
        if Bissexto( StrToInt(copy(DateToStr(ip_Data),7,4))) then
          Result := StrToDate('29/' + copy(DateToStr(ip_Data),4,7))
        else
          Result := StrToDate('28/' + copy(DateToStr(ip_Data),4,7));
      end;
  end;
end;

function Retorna_Data_Valida(ip_data : String) : TDate;
var
  I : Integer;
begin
  I := 0;
  while (True) or (I = 35) do
    begin
      try
        Result := StrToDate(IntToStr(StrToInt(Copy(ip_data,1,2)) - I) + '/'+ Copy(ip_data,4,7));
        Break;
      except
        I := I + 1;
      end;
    end;
end;

function DiaSemana(Data: TDateTime): String;
const
  Dias : Array[1..7] of String[07] = ('DOMINGO', 'SEGUNDA', 'TERCA','QUARTA','QUINTA', 'SEXTA','SABADO');
begin
  Result := Dias[DayOfWeek(Data)];
end;

function Verifica_Email(email: string): boolean;
var
  i, j, tam_email, simb_arroba, simb_arroba2, qtd_arroba, qtd_pontos,
  qtd_pontos_esq, qtd_pontos_dir, posicao, posicao2, ponto, ponto2: integer;
  vet_email: array [0..59] of string; //50 posiÁıes, capacidade do Edit
  msg: string;
begin
  {Por Jaci Jr em 12-10-2001 (00:28 ‡s 03:57)
  Contatos por jrcordeiro@eletroacre.com.br ou
  jrcordeiro@bol.com.br
  Nesta funÁ„o (func_VerifEmail) È utilizada a funÁ„o Copy, exemplo:
  Copy(s,i,t) significa trecho de s que comeÁa em i com tamanho t}

  qtd_pontos:= 0;
  qtd_pontos_esq:= 0;
  qtd_pontos_dir:= 0;
  qtd_arroba:= 0;
  posicao:=0;
  posicao2:=0;
  simb_arroba:=0;
  simb_arroba2:=0;
  ponto:= 0;
  ponto2:= 0;
  msg:='';
  Result:= True;

  //Verificando parte inicial do E-mail
  tam_email:= Length(email);
  for i:= 0 to tam_email-1 do
    begin
      vet_email[i]:= Copy(email,i+1,1);
      if vet_email[i] = '@' then
        begin
          Inc(qtd_arroba);
          posicao:= i;
        end;
    end;

  if ((vet_email[0] = '@') or (vet_email[0] = '.') or (vet_email[0] = '-')) then
    begin
      Result:= False;
      msg:= msg1;
    end;

  //Verificando se tem o sÌmbolo @ e quantos tem
  if qtd_arroba < 1 then
    begin
      Result:= False;
      msg:= msg2;
    end
  else
    if qtd_arroba > 1 then
      begin
        Result:= False;
        msg:= msg3 + ' Encontrado(s): '+IntToStr(qtd_arroba)+'.';
      end
    else//Verificando o que vem antes e depois do sÌmbolo @
      begin
        for i:=0 to 35 do
          begin
            if vet_email[posicao-1] <> vet_valido[i] then
              Inc(simb_arroba)
            else
              Dec(simb_arroba);
            if vet_email[posicao+1] <> vet_valido[i] then
              Inc(simb_arroba2)
            else
              Dec(simb_arroba2);
          end;
        if simb_arroba = 36 then
          begin
            //Antes do arroba h· um sÌmbolo desconhecido do vetor v·lido
            Result:= False;
            msg:= msg4;
          end
        else
          if simb_arroba2 = 36 then
            begin
              //Depois do arroba h· um sÌmbolo desconhecido do vetor v·lido
              Result:= False;
              msg:= msg5;
            end
      end;

  //Verificando se h· pontos e quantos, e Verificando parte final do e-mail
  for j:=0 to tam_email-1 do
    if vet_email[j] = '-' then
      if ((vet_email[j-1] = '.') or (vet_email[j-1] = '-')) then
        begin
          Result:= False;
          msg:= msg6;
        end;
  for i:=0 to tam_email-1 do
    if vet_email[i] = '.' then
      begin
        Inc(qtd_pontos);
        posicao2:= i+1;
        if i > posicao then
          Inc(qtd_pontos_dir)
        else
          Inc(qtd_pontos_esq);
        if ((vet_email[i-1] = '.') or (vet_email[i-1] = '-')) then
          begin
            Result:= False;
            msg:= msg6;
          end;
      end;
  if qtd_pontos < 1 then
    begin
      Result:= False;
      msg:= msg7;
    end
  else
    if vet_email[tam_email-1] = '.' then
      begin
        Result:= False;
        msg:= msg8;
      end
    else
      if vet_email[tam_email-2] = '.' then
        begin
          Result:= False;
          msg:= msg9;
        end
      else
        if qtd_pontos_dir > 2 then
          begin
            Result:= False;
            msg:= msg10 + ' Encontrado(s): '+
            IntToStr(qtd_pontos)+#10+'Encontrado(s) a direita do @: '+
            IntToStr(qtd_pontos_dir)+'.';
          end
        else
          if (not ((((tam_email - posicao2) = 3) and (qtd_pontos_dir = 1)) or
             (((tam_email - posicao2) = 2) and (qtd_pontos_dir = 2)) or
             (((tam_email - posicao2) = 2) and (qtd_pontos_dir = 1)))) then
            begin
              Result:= False;
              msg:= msg11 +#10+ 'Encontrado(s) a esquerda do @: '+
              IntToStr(qtd_pontos_esq) +#10+ 'Encontrado(s) a direita do @: '+
              IntToStr(qtd_pontos_dir)+'.';
            end
          else//Verificando o que vem antes e depois do ponto
            begin
              for i:=0 to 35 do
                begin
                  if vet_email[posicao2-2] <> vet_valido[i] then
                    Inc(ponto)
                  else
                    Dec(ponto);
                  if vet_email[posicao2] <> vet_valido[i] then
                    Inc(ponto2)
                  else
                    Dec(ponto2);
                end;
              if ponto = 36 then
                begin //Antes do ponto h· um sÌmbolo desconhecido do vetor v·lido
                  Result:= False;
                  msg:= msg12;
                end
              else
                if ponto2 = 36 then
                  begin //Depois do ponto h· um sÌmbolo desconhecido do vetor v·lido
                    Result:= False;
                    msg:= msg13;
                  end
            end;
  //VerificaÁ„o final
  if not Result then
    begin
      msg:= msg +#10+ 'Formato de E-mail n„o aceit·vel!!';
      Application.MessageBox(Pchar(msg), 'AtenÁ„o', MB_ICONWARNING);
    end;
end;

//Define uma impressora padrao no windows;
procedure Definir_Impressora_Padrao(Impressora: string);
var
  DriverPort : string;
  s : array[0..64] of char;
  WinIni : TIniFile;
  WinIniFileName : array[0..MAX_PATH] of char;
begin
  GetWindowsDirectory(WinIniFileName, SizeOf(WinIniFileName));
  StrCat(WinIniFileName, '\win.ini');
  WinIni := TIniFile.Create(WinIniFileName);
  try
    DriverPort := WinIni.ReadString('devices', Impressora, '');
    WinIni.WriteString('windows','device', Impressora +',' + DriverPort);
  finally
    WinIni.Free;
  end;
  WritePrivateProfileString(NIL, NIL, NIL, WinIniFileName);
  s := 'windows';
  SendMessage(HWND_BROADCAST, WM_WININICHANGE,0,Cardinal(@s));
end;

//calcula o valor que ja foi depreciado
function Calcula_Depreciacao(vTaxa_Anual, vValor_Bem: Double; vData_Aquisicao, vData_Atual: TDate): Double;
var
  vTaxa_Diaria, vTaxa_Total: Double;
  vDias: Integer;
begin
  if vData_Aquisicao > 0 then
    begin
      vDias := Trunc(vData_Atual - vData_Aquisicao); //dias de aquisiÁ„o
      vTaxa_Diaria := vTaxa_Anual / 365; //taxa depreciaÁ„o diaria
      vTaxa_Total := vTaxa_Diaria * vDias; //taxa total depreciada
      if vTaxa_Total > 100 then
        vTaxa_Total := 100; //a taxa total deve ser no m·ximo 100%
      Result := ((vValor_Bem * vTaxa_Total) / 100);
    end
  else
    Result := 0;
end;

function MessageTela(ipGravarLog, ipTipo_Confirmacao : Boolean; ipMensagem : String; ipTempo : Integer{tempo em segundos}) : Boolean;
var
  F : TextFile;
begin
  if ipGravarLog then
    begin
      if not DirectoryExists('C:\Temp') then
        if not CreateDir('C:\Temp') then
          raise Exception.Create('Problemas para criar a pasta C:\Temp');
      if DirectoryExists('C:\Temp') then
        if not(DirectoryExists('C:\Temp\ProMedicoLog')) then
          if not CreateDir('C:\Temp\ProMedicoLog') then
            raise Exception.Create('Problemas para criar a pasta C:\Temp\ProMedicoLog');
      if DirectoryExists('c:\Temp\ProMedicoLog') then
        begin
          try
            AssignFile(F, 'C:\Temp\ProMedicoLog\' + 'Log' + Copy(DateToStr(Date),7,4) + copy(DateToStr(Date),4,2) + copy(DateToStr(Date),1,2) + '.log');
            if not FileExists('C:\Temp\ProMedicoLog\' + 'Log' + Copy(DateToStr(Date),7,4) + copy(DateToStr(Date),4,2) + copy(DateToStr(Date),1,2) + '.log') then
              ReWrite(F)
            else
              Append(F);
            Writeln(F, '==> Hora: ' + TimeToStr(Time) + ' ERRO: ' + ipMensagem);
            Writeln(F, Preenchimento('-', '-', 48, False));
            CloseFile(F);
          except
            on E: Exception do
              begin
                CloseFile(F);
                ShowMessage('Problemas para fazer criaÁ„o do arquivo de log.'+#13+E.Message);
              end;
          end;
        end;
    end;
 
end;

procedure LigaCapsLock;
var
  KeyState : TKeyboardState;
begin
  GetKeyboardState(KeyState);
  KeyState[VK_NUMLOCK] := 1;
  KeyState[VK_CAPITAL] := 1;
  SetKeyboardState(KeyState);
end;

function Testa_Mes_Ano(ip_mes_ano_anterior, ip_mes_ano_novo : String) : Boolean;
begin
  Result := False;
  try
    if StrToInt(Copy(ip_mes_ano_novo,4,2)) < StrToInt(Copy(ip_mes_ano_anterior,4,2)) then
      ShowMessage('Ano de Fechamento esta menor menor que ' + Copy(ip_mes_ano_anterior,4,2))
    else
      if ( (StrToInt(Copy(ip_mes_ano_novo,1,2)) <= StrToInt(Copy(ip_mes_ano_anterior,1,2))) and
           (StrToInt(Copy(ip_mes_ano_novo,4,2)) <=StrToInt(Copy(ip_mes_ano_anterior,4,2))) )then
        ShowMessage('MÍs de Fechamento esta menor ou igual a ' + Copy(ip_mes_ano_anterior,1,2))
      else
        Result := True;
  except
    ShowMessage('MÍs / Ano de Fechamento Inv·lidos.');
  end;
end;

function PegaNomeArquivo(IP_Endereco : String) : String;
var
  I : Integer;
  Nome_Invertido : String;
begin
  Nome_Invertido := '';
  I := Length(IP_Endereco);
  while (Copy(IP_Endereco,I,1) <> '\') and (I > 0) do
    begin
      Nome_Invertido := Nome_Invertido + Copy(IP_Endereco,I,1);
      Dec(I);
    end;
  //Montar o arquivo na posiÁ„o certa;
  Result := '';
  for I := Length(Nome_Invertido) DownTo 1 do
    Result := Result + Copy(Nome_Invertido,I,1);
end;

function PegaDiretorioArquivo(IP_Endereco : String) : String;
var
  I : Integer;
begin
  I := Length(IP_Endereco);
  while (Copy(IP_Endereco,I,1) <> '\') and (I > 0) do
    Dec(I);
  Result := Copy(IP_Endereco, 1, i);
end;

//by SÈrgio V. Maia
//Procedimento que criptografa qualquer tipo de arquivo.
//Par‚metros: LocalizaÁ„o do arquivo original, onde ser· gravado o arquivo
//criptografado e a chave de criptografia e descriptografia.
procedure CriptografaArquivo(InFName, OutFName: String; Chave: Word);
var
  InMS, OutMS: TMemoryStream;
  I: Integer;
  C: byte;
begin
  InMS := TMemoryStream.Create;
  OutMS := TMemoryStream.Create;

  Try
    InMS.LoadFromFile(InFName);
    InMS.Position := 0;

    for I := 0 to InMS.Size - 1 do
      begin
        InMS.Read(C, 1);
        C := (C xor not(ord(chave shr I)));
        OutMS.Write(C, 1);
      end;

    OutMS.SaveToFile(OutFName);
  finally
    InMS.Free;
    OutMS.Free;
  end;
end;

//by SÈrgio V. Maia
//Criptografa qualquer arquivo salvo em um MemoryStream e o devolve
//na funÁ„o
function CriptografaArquivoToStream(Arquivo: TMemoryStream; Chave: Word): TMemoryStream;
var
  InMS, OutMS: TMemoryStream;
  I: Integer;
  C: byte;
begin
  InMS := TMemoryStream.Create;
  OutMS := TMemoryStream.Create;

  Try
    InMS.LoadFromStream(Arquivo);
    InMS.Position := 0;

    for I := 0 to InMS.Size - 1 do
      begin
        InMS.Read(C, 1);
        C := (C xor not(ord(chave shr I)));
        OutMS.Write(C, 1);
      end;

    OutMS.SaveToStream(Result);
  finally
    InMS.Free;
    OutMS.Free;
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//  Se a FunÁ„o testa se o formato da data esta igual ao pedido se n„o tiver  //
//    a funÁ„o ir· corrigir e retornar false se n„o a funÁ„o j· ir· retornar  //
//      True                                                                  //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

function FormaPadraoData(Formato : String) : Boolean;
var
  Reg : TRegistry;
begin
  if ((Pos(Formato,FormatSettings.ShortDateFormat)>0) = False) then
    begin
      Result := False;
      Reg:=Tregistry.Create;
      Reg.RootKey := HKEY_CURRENT_USER;
      try
        Reg.OpenKey('\Control Panel\International',True);
        Reg.WriteString('sShortDate',Formato);
        Reg.CloseKey;
        Reg.Free;
        Application.MessageBox(PChar('FormataÁ„o da Data foi atualizado para ' + Formato + '.' ), 'ConfirmaÁ„o', MB_ICONEXCLAMATION + MB_OK);
      except
        Application.MessageBox('Erro ao Tentar Gravar Formato Padr„o de Data.','Erro', MB_OK + MB_ICONERROR);
      end;
    end
  else
    Result := True;
end;

procedure Atualiza_Data_Hora_Computador(ip_Data, ip_Hora: TDateTime);
var
  SystemTime : TSystemTime;
begin
  With SystemTime do
    begin
      //Definindo o dia do sistema
      wDay   := StrToInt(Copy(DateToStr(ip_Data), 1, 2));
      wMonth := StrToInt(Copy(DateToStr(ip_Data), 4, 2));
      wYear  := StrToInt(Copy(DateToStr(ip_Data), 7, 4));
      //Definindo a hora do sistema
      wHour   := StrToInt(Copy(TimeToStr(ip_Hora), 1, 2));
      wMinute := StrToInt(Copy(TimeToStr(ip_Hora), 4, 2));
      wSecond := StrToInt(Copy(TimeToStr(ip_Hora), 7, 2));
    end;
  SetLocalTime(SystemTime);
end;

function PesquisarTexto (TextoCompleto, TextoPesquisa : String) : Integer;
var
  I : Integer;
begin
  Result := 0;
  for I := 1 to Length(TextoCompleto) do
    if UpperCase(TextoPesquisa) = UpperCase(Copy(TextoCompleto,I,Length(TextoPesquisa))) then//quer dizer que encontrou o texto pesquisado
      begin
        Result := I;
        Break;
      end;
end;

function LerIni(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini : String) : String;
var
  ServerIni : TIniFile;
begin
  ServerIni := TIniFile.Create(arquivo_endereco + arquivo_nome);
  Result := ServerIni.ReadString(tabela_ini, campo_ini, '');
  ServerIni.Free;
end;

procedure GravarINI(arquivo_endereco, arquivo_nome, tabela_ini, campo_ini, valor_ini : String);
var
  ServerINI : TIniFile;
begin
  ServerIni := TIniFile.Create(arquivo_endereco + arquivo_nome);
  ServerIni.WriteString(tabela_ini, campo_ini, valor_ini);
  //ServerIni.UpdateFile;
  ServerIni.Free;
end;

function ImpressoraPadrao : String;//by Eliomar Retorna o nome da impressora padr„o do Windows
begin
  if(Printer.PrinterIndex >= 0)then
    Result := Printer.Printers[Printer.PrinterIndex]
  else
    Result := '';
end;

{ Esta funÁ„o retorna true se for pressionado OK e false em caso contr·rio.
Se for OK, o texto digitado pelo usu·rio ser· copiado para a vari·vel Data}
function Pega_Impressora(ipCopias : Integer; var opImpressora : String; var opCopias : Integer) : Boolean;//by Eliomar funÁ„o pegas as impressoras cadastradas e o usuario seleciona a impressora e a quantidade;
var
  frm_Impressora: TForm; { Vari·vel para o Form }
  EditImpressora: TComboBox; { Vari·vel para o ComboBox - Impressoras }
  EditQuantidade: TEdit; { Vari·vel para o Edit - Quantidade }
  Label1, Label2: TLabel;

  procedure Carrega_Impressoras;
  var
    I : Integer;
  begin
    EditImpressora.Items.Clear;
    for I := 1 to Printer.Printers.Count do
      begin//Esta comentado para pegar todas as impressoras cadastradas n„o somente as da rede.
  //      if Pos('LPT', printer.Printers.Strings[I-1]) > 0 then
    //      EditImpressora.Items.Add('LPT1');
  //      else
    //      if Pos('\\', printer.Printers.Strings[I-1]) > 0 then
            EditImpressora.Items.Add(Copy(printer.Printers.Strings[I-1],
                                     Pos('\\', printer.Printers.Strings[I-1]),
                                     length(printer.Printers.Strings[I-1]) - Pos('\\', printer.Printers.Strings[I-1]) + 1));
    end;
  end;
begin
  Result := False; { Por padr„o retorna False }
  { Cria o form }
  frm_Impressora := TForm.Create(Application);
  try
    { Altera algumas propriedades do Form }
    frm_Impressora.BorderIcons := [];
    frm_Impressora.BorderStyle := bsSingle;
    frm_Impressora.Caption := 'SeleÁ„o de Impressora';
    frm_Impressora.Position := poScreenCenter;
    frm_Impressora.Width := 491;
    frm_Impressora.Height := 108;
    { Cria o Label1 }
    Label1 := TLabel.Create(frm_Impressora);
    with Label1 do
      begin
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Parent := frm_Impressora;
        AutoSize := True;
        Caption := 'Selecione a Impressora';
        Left := 3;
        Top := 2;
      end;
    { Cria o EditImpressora }
    EditImpressora := TComboBox.Create(frm_Impressora);
    with EditImpressora do
      begin
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Parent := frm_Impressora;
        Width := 415;
        Height := 30;
        Style := csDropDownList;
        { Posiciona de acordo com a largura do form }
        Left := 3;
        Top := 18;
      end;

    { Cria o EditQuantidade }
    EditQuantidade := TEdit.Create(frm_Impressora);
    with EditQuantidade do
      begin
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Parent := frm_Impressora;
        Width := 55;
        Height := 30;
        Text := IntToStr(ipCopias);
        { Posiciona de acordo com a largura do form }
        Left := (frm_Impressora.Width - 63);
        Top := 18;
      end;
    { Cria o Label2 }
    Label2 := TLabel.Create(frm_Impressora);
    with Label2 do
      begin
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Parent := frm_Impressora;
        AutoSize := True;
        Caption := 'CÛpias';
        Left := EditQuantidade.Left;
        Top := 2;
      end;
    { Coloca o bot„o OK }
    with TBitBtn.Create(frm_Impressora) do
      begin
        Parent := frm_Impressora;
        Height := 30;
        Width := 90;
        Left := 3;
        Top := 50;
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Kind := bkOK; { Bot„o Ok }
      end;
    { Coloca o bot„o Cancel }
    with TBitBtn.Create(frm_Impressora) do
      begin
        Parent := frm_Impressora;
        Height := 30;
        Width := 90;
        { Posiciona de acordo com a largura do form }
        Left := (frm_Impressora.Width - 98);
        Top := 50;
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Kind := bkCancel; { Bot„o Cancel }
        Caption := 'Parar';
      end;
    //carregar para EditImpressora todas as impressoras cadastradas.
    Carrega_Impressoras;
    //Coloca na Impressa Padr„o.
    EditImpressora.ItemIndex := EditImpressora.Items.IndexOf(ImpressoraPadrao);

    { Exibe o form e aguarda a aÁ„o do usu·rio. Se for OK... }
    if frm_Impressora.ShowModal = mrOK then
      begin
        //Testando a quantidade
        try
          if StrToInt(EditQuantidade.Text) < 1 then
            opCopias := 1
          else
            opCopias := StrToInt(EditQuantidade.Text);
        except
          opCopias := 1;
        end;

        //Testando se selecionou a impressora
        if EditImpressora.Text = '' then
          ShowMessage('Impressora n„o Selecionada.')
        else
          begin
            opImpressora := EditImpressora.Text;
            Result := True;
          end;
      end;
  finally
    frm_Impressora.Free;
  end;
end;

function Tirar_Espacos (texto : string): string;
var
  espaco, i , cont : integer;
  posicao, aux, aux_ant : string;
begin
  Texto := Trim (texto);
  posicao := '';
  repeat
    //Variavel Espaco recebe a posicao em q ele achou um espaco no meio da string
    espaco := pos(' ',texto);
    //Delete tira o espaco encontrado
    delete(texto,espaco,1);
    //Variavel posicao monta uma string com a pociÁ„o em deve ser inserido o espaÁo posteriormente
    if posicao = '' then
      posicao := IntToStr(espaco)
    else
      posicao := posicao + ',' + IntToStr(espaco);
  until espaco = 0;

  aux := '';
  aux_ant := '';
  cont := 0;
  // laco em que se le a string montada com as posicoes em q se devem ser inseridos
  // os espacos e os incliu usando da funÁ„o insert
  for i := 1 to length(posicao) do
    begin
      if posicao[i] <> ',' then
        aux := aux + posicao[i]
      else
        begin
          if aux <> aux_ant then
            begin
              aux_ant := aux;
              insert(' ' , texto, StrToInt(aux) + Cont);
              Inc(Cont);
              aux := '';
            end
          else
            aux := '';
        end;
    end;
  Tirar_Espacos := texto;
end;

{ Esta funÁ„o retorna true se for pressionado OK e false em caso contr·rio.
Se for OK, o texto digitado pelo usu·rio ser· copiado para a vari·vel Data}
function ObterData(Titulo : String; Data_Inicial : String; Data_Maior_Atual : Integer; var Data: String): Boolean;
var
  Form_DataSis: TForm; { Vari·vel para o Form }
  MaskEdit1: TMaskEdit; { Vari·vel para o MaskEdit }
begin
  Result := False; { Por padr„o retorna false }
  { Cria o form }
  Form_DataSis := TForm.Create(Application);
  try
    { Altera algumas propriedades do Form }
    Form_DataSis.BorderIcons := [];
    Form_DataSis.BorderStyle := bsSingle;
    Form_DataSis.Caption := Titulo;
    Form_DataSis.Position := poScreenCenter;
    Form_DataSis.Width := 192;
    Form_DataSis.Height := 98;
    { Coloca o MaskEdit }
    MaskEdit1 := TMaskEdit.Create(Form_DataSis);
    with MaskEdit1 do
      begin
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Parent := Form_DataSis;
        Width := 85;
        Height := 30;
        { Posiciona de acordo com a largura do form }
        Left := Trunc((Form_DataSis.Width - Width) / 2) - 5;
        Top := 10;
        EditMask := '99/99/9999';
        Text := Data_Inicial;
      end;
    { Coloca o bot„o OK }
    with TBitBtn.Create(Form_DataSis) do
      begin
        Parent := Form_DataSis;
        Height := 30;
        Width := 90;
        Left := 3;
        Top := 40;
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Kind := bkOK; { Bot„o Ok }
      end;
    { Coloca o bot„o Cancel }
    with TBitBtn.Create(Form_DataSis) do
      begin
        Parent := Form_DataSis;
        Height := 30;
        Width := 90;
        { Posiciona de acordo com a largura do form }
        Left := (Form_DataSis.Width - 98);
        Top := 40;
        Font.Color := clBlack;
        Font.Height := -13;
        Font.Name := 'MS Sans Serif';
        Font.Style := [fsBold];
        Kind := bkCancel; { Bot„o Cancel }
      end;
    { Exibe o form e aguarda a aÁ„o do usu·rio. Se for OK... }
    if Form_DataSis.ShowModal = mrOK then
      begin
        if Data_Maior_Atual = 0 then
          begin
            try
              Data := DateToStr(StrToDate(MaskEdit1.Text));
              if (StrToDate(Data) > Date) or (StrToDate(Data) < Date-1980) then
                begin
                  ShowMessage('Data ' + MaskEdit1.Text + ' maior que ' + DateToStr(Date));
                  Data := '';
                end;
              Result := True;
            except
              on E: Exception do
                begin
                  ShowMessage('Data Inv·lida');
                  Data := '';
                end;
            end;
          end
        else
          begin
            try
              Data := DateToStr(StrToDate(MaskEdit1.Text));
              if (StrToDate(Data) < Date-1980) then
                begin
                  ShowMessage('Data ' + MaskEdit1.Text + ' inv·lida.');
                  Data := '';
                end;
              Result := True;
            except
              on E: Exception do
                begin
                  ShowMessage('Data Inv·lida');
                  Data := '';
                end;
            end;
          end;
      end;
  finally
    Form_DataSis.Free;
  end;
end;

function CopiarArquivos(Nome_Arquivo, End_Origem, End_Destino : String) : Boolean;//by Eliomar copiar todos os arquivos (desconsiderando a extens„o) de da origem para destino;
var
  I : Integer;
  SR: TSearchRec;
  Origem, Destino : String;
begin
  Result := False;
  //Vamos copiar os arquivos (com mesmo nome) da pasta origem para destino
  I := FindFirst(End_Origem + '\*.*', faAnyFile, SR);
  while I = 0 do
    begin
      if (SR.Attr and faDirectory) <> faDirectory then
        begin
          Origem := End_Origem + '\' + SR.Name;
          Destino := End_Destino + '\' + SR.Name;
          if (UpperCase(Copy(SR.Name,1,Length(Nome_Arquivo))) = UpperCase(Nome_Arquivo)) then
            if not CopyFile(PChar(Origem), PChar(Destino), False) then
              begin
                ShowMessage('Erro ao Atualizar Arquivo de ' + Origem + ' para ' + Destino);
                Exit;
              end;
        end;
      I := FindNext(SR);
    end;
  //Fim de Vamos copiar os arquivos (com mesmo nome) da pasta origem para destino
  Result := True;
end;

function SubtraiMes(Data_Final, Data_Inicial : TDateTime) : String;//by Eliomar subtrai um mes do outro e retorna a diferenÁa em string;
var
  Total_Dias : Integer;
begin
  Total_Dias := Trunc(Data_Final - Data_Inicial);
  Result := IntToStr(Total_Dias div 30);
end;

function AlterarEspeciais(Str:String): String;//by eliomar
Const
  Especiais = 'Äß¶êáÇÖ†é£çìÑ¢É°÷ôè‚µ∂™∫';
  Normal =    '«∫™…ÁÈ‡·√˙ Ù„Û‚ÌÕ’¡‘¡¬ao';
Var
  x : Integer;
begin
  for x := 1 to Length(Str) do
    if Pos(Str[x],Especiais)<>0 then
      Str[x] := Normal[Pos(Str[x],Especiais)];
  Result := Str;
end;

function StrToChar(MyString : String) : CHAR;
var
  i: Integer;
  MyChars: array[ 1..100] of Char;
begin
  for i:=1 to length( MyString) do
    MyChars[ i]:= MyString[ i];
  Result := MyChars[length( MyString)];
end;

function RemoveAcento(Str:String): String;//by eliomar
Const
  ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
Var
  x : Integer;
begin
  for x := 1 to Length(Str) do
    if Pos(Str[x],ComAcento)<>0 then
      Str[x] := SemAcento[Pos(Str[x],ComAcento)];
  Result := Str;
end;

function ExtractValFromStr(stValue: String): String;
var
  NPos, TPos: Integer;
  nwValue: String;
begin
 while Pos('.', stValue) > 0 do
   stValue[Pos('.', stValue)] := ' ';
 NPos := 1;
 TPos := Length(stValue);
 nwValue := '';
 while NPos <= TPos do
   begin
     if Copy(stValue, NPos, 1) <> ' ' then
       nwValue := nwValue + Copy(stValue, NPos, 1);
     Inc(NPos);
   end;
 ExtractValFromStr := nwValue;
end;

/////////////////////////////////////////////////////
// Esta funÁ„o coloca ou tira o ponto no final de  //
// uma string que È o input Cap                    //
/////////////////////////////////////////////////////
function Ponto(Cap : String; Tipo : Boolean) : String;
begin
  if Tipo = False then
    begin
      if copy(Cap,length(Cap),1) = '.' then
        Ponto := copy(Cap,1,length(Cap)-1)
      else
        Ponto := Cap;
    end
  else
    Ponto := Cap + '.';
end;

function Preenchimento(Texto : String; Text : Char; Tamanho : Integer; Adireita : Boolean) : String;
begin//by eliomar
  Texto := Copy(Texto,1,Tamanho);
  if Adireita = True then
    Preenchimento := Texto + StringOfChar(Text, Tamanho - Length(Texto))
  else
    Preenchimento := StringOfChar(Text, Tamanho - Length(Texto)) + Texto;
end;

function  BooleanToInt(Valor : Boolean) : Integer;
begin//by eliomar
  if Valor = False then
    BooleanToInt := 0
  else
    BooleanToInt := 1;
end;

function SoNumeros(Texto : String) : String;//pega uma string e retorna somente os n˙meros contidos na string
var//by eliomar
  I : Integer;
  vaAux : String;
begin
  vaAux := '';
  for I := 1 to Length(Texto) do
    if ((Texto[i] = '0') or
        (Texto[i] = '1') or
        (Texto[i] = '2') or
        (Texto[i] = '3') or
        (Texto[i] = '4') or
        (Texto[i] = '5') or
        (Texto[i] = '6') or
        (Texto[i] = '7') or
        (Texto[i] = '8') or
        (Texto[i] = '9')) then
      vaAux := vaAux + Texto[I];
  SoNumeros := vaAux;
end;

function  DataBarraStringPonto(Data : TDateTime) : String;
var//by eliomar
  Aux : String;
begin
  Aux := DateToStr(Data);
  DataBarraStringPonto := copy(Aux,1,2) + '.' +
                          copy(Aux,4,2) + '.' +
                          copy(Aux,7,4);
end;

function FatMult(PercInicial: Double; Qtde: Integer): Double;
var//by eliomar
  FatorMult : Double;
begin
  FatorMult := 1;
  while Qtde >= 1 do
    begin
      FatorMult := FatorMult * PercInicial;
      Qtde := Qtde - 1;
    end;
  FatMult := FatorMult;
end;

function TemDiscoNoDrive(const drive : char): boolean;//testa se tem disco no drive
var//by eliomar
  DriveNumero : byte;
  EMode : word;
begin
  result := false;
  DriveNumero := ord(Drive);
  if DriveNumero >= ord('a') then
    dec(DriveNumero,$20);
  EMode := SetErrorMode(SEM_FAILCRITICALERRORS);
  try
    if DiskSize(DriveNumero-$40) <> -1 then
      Result := true
    else
      messagebeep(0);
  finally
    SetErrorMode(EMode);
  end;
end;

function GetTextValue(gtValue: String): Double; //funcao para pegar um valor de uma string, desconsiderando os pontos da formataÁ„o
var
  nCaractere: Integer;
  nValue: String;
begin
  nValue := '';
  for nCaractere := 1 to Length(gtValue) do
    begin
      if Pos(Copy(gtValue, nCaractere, 1), ',0123456789') > 0 then
        nValue := nValue + Copy(gtValue, nCaractere, 1);
    end;
  Result := StrToFloat(nValue);
end;

function SecurityKey(skChave: String): Boolean; {Verifica se a cÛpia n„o È pirata, baseado no registro do windows}
var
  MyReg: TRegistry;
  sUsuario: String;
  rKey: Integer;
begin
  Result := False;
  if Length(skChave) <> 20 then
    begin
      ShowMessage('A chave de licenÁa do software deve ser uma string de 20 posiÁıes.');
      Exit;
    end;
  MyReg := TRegistry.Create;
  MyReg.RootKey := HKEY_CLASSES_ROOT; //A chave ser· uma subchave desta
  if MyReg.KeyExists('WinSystemInfo.DllSystemFiles.NetFiles.' + skChave) = False then //a chave n„o foi encontrada
    begin
      if Application.MessageBox('Este software n„o est· licenciado. Deseja licenci·-lo agora?', 'LicenÁa do Software', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = idYES then
        begin
          sUsuario := InputBox('Senha Para LicenÁa do Software', 'Informe a Senha', '');
          if sUsuario = SenhaDiaria then
            begin
              try
                MyReg.CreateKey('WinSystemInfo.DllSystemFiles.NetFiles.' + skChave);
                MyReg.OpenKey('WinSystemInfo.DllSystemFiles.NetFiles.' + skChave, True);
                MyReg.WriteInteger('WinSystemInfo.DllSystemFiles.NetFiles.' + skChave, 72538419);
                MyReg.CloseKey;
                Result := True;
                ShowMessage('A licenÁa do software foi registrada no banco de dados com sucesso.');
              except
                on E: Exception do
                  begin
                    ShowMessage('Problemas na tentativa de registrar a licenÁa do software.' + #13 + E.Message);
                    Result := False;
                  end;
              end;
            end
          else
            ShowMessage('Senha Inv·lida.');
        end;
    end
  else
    begin
      try
        MyReg.OpenKey('WinSystemInfo.DllSystemFiles.NetFiles.' + skChave, True);
        rKey := MyReg.ReadInteger('WinSystemInfo.DllSystemFiles.NetFiles.' + skChave);
        MyReg.CloseKey;
        if rKey = 72538419 then Result := True;
      except
        on E: Exception do
          begin
            ShowMessage('Problemas na tentativa de checar a licenÁa do software.' + #13 + E.Message);
            Result := False;
          end;
      end;
    end;
  MyReg.Free;
end;

function SenhaDiaria: String; //Retorna a senha di·ria
var
  VSenha, Data_Base: String;
  TDia_Semana: Array[1..7,1..7] of Integer;
  VSubtra: Integer;
begin
  TDia_Semana[1,1] := 7;
  TDia_Semana[2,1] := 7;
  TDia_Semana[3,1] := 5;
  TDia_Semana[4,1] := 6;
  TDia_Semana[5,1] := 6;
  TDia_Semana[6,1] := 5;
  TDia_Semana[7,1] := 6;

  TDia_Semana[1,2] := 7;
  TDia_Semana[2,2] := 6;
  TDia_Semana[3,2] := 5;
  TDia_Semana[4,2] := 4;
  TDia_Semana[5,2] := 3;
  TDia_Semana[6,2] := 2;
  TDia_Semana[7,2] := 1;

  VSubtra := TDia_Semana[DayOfWeek(Date),2];

  Data_Base := Copy(DateToStr(Date-VSubtra),4,2)+
               Copy(DateToStr(Date-VSubtra),7,4)+
               Copy(DateToStr(Date-VSubtra),1,2);
  VSenha := IntToStr((StrToInt(Data_Base) * DayOfWeek(Date)) + TDia_Semana[DayOfWeek(Date),1]);

  Result := VSenha;
end;

function ExecAndWait(const FileName, Params: string; const WindowState: Word): Boolean; //esta funÁao serve executa outro software
var                                                                                     //e espera sua finalizaÁ„o para prosseguir com o processamento
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  { Coloca o nome do arquivo entre aspas. Isto È necess·rio devido aos espaÁos contidos em nomes longos }
  CmdLine := '"' + Filename + '"' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
    begin
      cb := SizeOf(SUInfo);
      dwFlags := STARTF_USESHOWWINDOW;
      wShowWindow := WindowState;
    end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, False,
                          CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
                          PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);
  { Aguarda atÈ ser finalizado }
  if Result then
    begin
      WaitForSingleObject(ProcInfo.hProcess, INFINITE);
      { Libera os Handles }
      CloseHandle(ProcInfo.hProcess);
      CloseHandle(ProcInfo.hThread);
    end;
end;

function DataExtenso(Cidade_Estado: String; Data: TDateTime): String;{Retorna uma data por extenso}
var
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Meses do ano }
  Meses [1] := 'Janeiro';
  Meses [2] := 'Fevereiro';
  Meses [3] := 'MarÁo';
  Meses [4] := 'Abril';
  Meses [5] := 'Maio';
  Meses [6] := 'Junho';
  Meses [7] := 'Julho';
  Meses [8] := 'Agosto';
  Meses [9] := 'Setembro';
  Meses [10]:= 'Outubro';
  Meses [11]:= 'Novembro';
  Meses [12]:= 'Dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  if Cidade_Estado <> '' then
    Cidade_Estado := Cidade_Estado + ', ';
  Result := Cidade_Estado + IntToStr(Dia) + ' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano);
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure GetFontNames(FontName: TComboBox);
var
  DC: HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

function CurrText(Editor: TRichEdit): TTextAttributes;
begin
  if Editor.SelLength > 0 then Result := Editor.SelAttributes
  else Result := Editor.DefAttributes;
end;

procedure MoveMouse(Controle : TControl);
var
  IrPara: TPoint;
begin
  IrPara.X := Controle.Left + (Controle.Width div 2);
  IrPara.Y := Controle.Top + (Controle.Height div 2);
  if Controle.Parent <> nil then
    IrPara := Controle.Parent.ClientToScreen(IrPara);
  SetCursorPos(IrPara.X, IrPara.Y);
end;

function ArrastaMouseToControl(const Control: TControl; Jump, JumpTime: Word): boolean;
var
  ToPoint, Pt: TPoint;

  function ExecJump: boolean;
    begin
      if (Pt.x = ToPoint.x) and (Pt.y = ToPoint.y) then
        begin
          Result := false; { Chegou }
          Exit;
        end;
      { Calcula X }
      if Pt.x < ToPoint.x then
        begin
          Inc(Pt.x, Jump);
          if Pt.x > ToPoint.x then { Se passou... }
            Pt.x := ToPoint.x;
        end
      else
        if Pt.x > ToPoint.x then
          begin
            Dec(Pt.x, Jump);
            if Pt.x < ToPoint.x then
              Pt.x := ToPoint.x;
          end;
      { Calcula Y }
      if Pt.y < ToPoint.y then
        begin
          Inc(Pt.y, Jump);
          if Pt.y > ToPoint.y then { Se passou... }
          Pt.y := ToPoint.y;
        end
      else
        if Pt.y > ToPoint.y then
          begin
            Dec(Pt.y, Jump);
            if Pt.y < ToPoint.y then
              Pt.y := ToPoint.y;
          end;
      Result := SetCursorPos(Pt.x, Pt.y);
    end;

begin
  if Jump = 0 then
    Jump := 1;
  SetCursor(Screen.Cursors[Control.Cursor]);
  with Control do
    begin
      ToPoint.x := Width div 2;
      ToPoint.y := Height div 2;
      ToPoint := ClientToScreen(ToPoint);
    end;
  if GetCursorPos(Pt) then
    while ExecJump do
      Sleep(JumpTime);
  Result := GetCursorPos(Pt) and (Pt.x = ToPoint.x) and (Pt.y = ToPoint.y);
end;

function Bissexto(AYear: Integer): Boolean;
begin
  Result := (AYear mod 4 = 0) and ((AYear mod 100 <> 0) or (AYear mod 400 = 0));
end;

function DiasDoMes(AYear, AMonth: Integer): Integer;
const
  DaysInMonth: array[1..12] of Integer = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
begin
  Result := DaysInMonth[AMonth];
  if (AMonth = 2) and Bissexto(AYear) then
    Inc(Result);
end;

function DataMaisDiasUteis(DataIni : TDateTime; Dias_Uteis : integer): TDateTime;
// Retorna uma data acresÁida de mais um certo n˙mero de dias
// uteis descontando os fins de semana
var Dw : integer;
begin
  Dw := DayOfWeek(DataIni)-1;
  result := DataIni + Dias_Uteis + ((Dias_Uteis - 1 + Dw) div 5) * 2;
end;

procedure Espera_Tempo(Quanto_Tempo: TDateTime);
var
  Hora1, Hora2: TDateTime;
begin
  Hora1 := Time;
  Hora2 := Time;
  While (Hora2 - Hora1) < Quanto_Tempo do
    Hora2 := Time;
end;

procedure Tab_To_Enter(Sender: TForm; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0;
      SendMessage(Sender.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure Virgula_To_Ponto(var Key: Char);
begin
  if Key = #46 then
    Key := #44;
end;

function IntToStrZero(Valor, Tamanho: Integer): String;
var
  VFinal: String;
begin
  VFinal := IntToStr(Valor);
  While Length(VFinal) < Tamanho do
    VFinal := '0' + VFinal;
  IntToStrZero := VFinal;
end;

function DouToStrZero(Valor, Tamanho: Double): String;
var
  VFinal: String;
begin
  VFinal := FloatToStr(Valor);
  While Length(VFinal) < Tamanho do
    VFinal := '0' + VFinal;
  DouToStrZero := VFinal;
end;

function ValiData(Teste_Data, Base_Data, Teto_Data: TDateTime): Boolean;
begin
  try
    if (Teste_Data < Base_Data) or (Teste_Data > Teto_Data) then
      ValiData := False
    else
      ValiData := True;
  except
    on E: Exception do
      ValiData := False;
  end;
end;

function RoundTo(ValorBase: Double; Casas:Integer): Double;
var
  ValorST: String;
begin
  if Casas = 1 then
    ValorST := FormatFloat('##############0.0',ValorBase);
  if Casas = 2 then
    ValorST := FormatFloat('##############0.00',ValorBase);
  if Casas = 3 then
    ValorST := FormatFloat('##############0.000',ValorBase);
  if Casas = 4 then
    ValorST := FormatFloat('##############0.0000',ValorBase);
  if (Casas < 1) or (Casas > 4) then
    RoundTo := ValorBase
  else
    RoundTo := StrToFloat(ValorST);
end;

//FunÁ„o para fazer truncamento de um valor com determinada casas decimais;
function TruncDec(Valor : Double; Casas : Integer) : Double;
var
  I, PosVir : Integer;
begin
  PosVir := 0;
//Encontrar Virgula;
  for I := 1 to Length(FloatToStr(Valor)) do
    if Copy(FloatToStr(Valor),I,1) = ',' then
      PosVir := I;
  if PosVir = 0 then
    TruncDec := Valor
  else                    (*Antes da virgula                          /* Depois da virgula com qtde casas*)
    TruncDec := StrToFloat(Copy(FloatToStr(Valor),1,PosVir -1) + ','+ Copy(FloatToStr(Valor),PosVir + 1,Casas));
end;

//FunÁ„o para pegar um valor double e passa para string substituindo a virgula pelo ponto
function VirgulaToPonto(Valor : Double) : String;
var
  ValorTexto : String;
begin
  try
    ValorTexto := FormatFloat('########0.0000', Valor);
    VirgulaToPonto := Copy(ValorTexto,1,Length(ValorTexto) - 5) + '.' + Copy(ValorTexto, Length(ValorTexto) - 3, 4);
  except
    begin
      ShowMessage('Valor Inv·lido.');
      VirgulaToPonto := '';
    end;
  end;
end;

{ chInt - Converte um caracter numÈrico para o valor inteiro correspondente.}
function chInt ( ch: Char ): ShortInt;
begin
  Result := Ord ( ch ) - Ord ( '0' );
end;

{ intCh = Converte um valor inteiro (de 0 a 9) para o caracter numÈrico correspondente. }
function intCh ( int: ShortInt ): Char;
begin
  Result := Chr ( int + Ord ( '0' ) );
end;

{ ValidaCGC - Retorna true se o CGC dado È valido. O CGC deve ser um string de 14 caracteres numÈricos. }
function ValidaCGC ( str: String ): Boolean;
  { DvModulo11 - Retorna 1 dv calculado pelo mÈtodo do modulo 11 padr„o. }
  function DvModulo11 ( str: String ): Char;
  var
    soma, fator, i: Integer;
  begin
    soma := 0;
    fator := 2;
    for i := Length ( str ) downto 1 do
      begin
        soma := soma + chInt ( str[i] ) * fator;
        Inc ( fator );
        if fator = 10 then
          fator := 2;
      end;
    soma := 11 - ( soma mod 11 );
    if soma >= 10 then
      Result := '0'
    else
      Result := intCh ( soma );
  end;
  { DvCGC - Retorna os dois dvs de um CGC, dado o CGC sem os dvs em forma de string (12 caracteres numÈricos). }
  function DvCGC ( str: String ): String;
  var
    dv1: Char;
  begin
    dv1 := DvModulo11 ( str );
    Result := dv1 + DvModulo11 ( str + dv1 );
  end;

begin
  Result := Copy ( str, 13, 2 ) = DvCGC ( Copy ( str, 1, 12 ) );
end;

{ ValidaCPF - Retorna true se o CPF dado È valido. O CPF deve ser um string de 11 caracteres numÈricos. }
function ValidaCPF ( str: String ): Boolean;
  //funÁıes para calculo de CPF
  { dvModulo11ParaCPF - Retorna 1 dv calculado pelo mÈtodo do modulo 11 ligeiramente alterado para o CPF. }
  function dvModulo11ParaCPF ( str: String ): Char;
  var
    soma, fator, i: Integer;
  begin
    soma := 0;
    fator := 2;
    for i := Length ( str ) downto 1 do
      begin
        soma := soma + chInt ( str[i] ) * fator;
        Inc ( fator );
      end;
    soma := 11 - ( soma mod 11 );
    if soma >= 10 then
      Result := '0'
    else
      Result := intCh ( soma );
  end;
  { DvCPF - Retorna os dois dvs de um CPF, dado o CPF sem os dvs em forma de string (9 caracteres numÈricos). }
  function DvCPF ( str: String ): String;
  var
    dv1: Char;
  begin
    dv1 := dvModulo11ParaCPF ( str );
    Result := dv1 + dvModulo11ParaCPF ( str + dv1 );
  end;

begin
  Result := Copy ( str, 10, 2 ) = DvCPF ( Copy ( str, 1, 9 ) );
end;

function SomaHoras(hora_1, hora_2: String): String;
var
  h1, h2, m1, m2, s1, s2, pq: Integer;
  hr, mr, sr: String;
begin
  pq := pos(':', hora_1);
  h1 := StrToInt(Copy(hora_1, 1, pq - 1));
  m1 := StrToInt(Copy(hora_1, pq + 1, 2));
  s1 := StrToInt(Copy(hora_1, pq + 4, 2));

  pq := pos(':', hora_2);
  h2 := StrToInt(Copy(hora_2, 1, pq - 1));
  m2 := StrToInt(Copy(hora_2, pq + 1, 2));
  s2 := StrToInt(Copy(hora_2, pq + 4, 2));

  sr := IntToStr(((s1 + s2) mod 60));
  mr := IntToStr(((m1 + m2) mod 60) + ((s1 + s2) div 60));
  hr := IntToStr(((h1 + h2) + ((m1 + m2) div 60)));

  if Length(hr) < 2 then
    hr := '0' + hr;

  Result := hr + ':' + Preenchimento(mr, '0', 2, False) + ':' + Preenchimento(sr, '0', 2, False);
end;

function SubtraiHoras(hora_1, hora_2: String): String;
var
  h1, h2, m1, m2, s1, s2, pq: Integer;
  hr, mr, sr: String;
begin
  pq := pos(':', hora_1);
  h1 := StrToInt(Copy(hora_1, 1, pq - 1));
  m1 := StrToInt(Copy(hora_1, pq + 1, 2));
  s1 := StrToInt(Copy(hora_1, pq + 4, 2));

  pq := pos(':', hora_2);
  h2 := StrToInt(Copy(hora_2, 1, pq - 1));
  m2 := StrToInt(Copy(hora_2, pq + 1, 2));
  s2 := StrToInt(Copy(hora_2, pq + 4, 2));

  if (s1 < s2) then
    begin
      s1 := s1 + 60;
      m1 := m1 - 1;
    end;

  if ((m1 < m2) or (m1 < 0)) then
    begin
      m1 := m1 + 60;
      h1 := h1 -1;
    end;

  sr := IntToStr(s1 - s2);
  mr := IntToStr(m1 - m2);
  hr := IntToStr(h1 - h2);

  if Length(hr) < 2 then
    hr := '0' + hr;

  Result := hr + ':' + Preenchimento(mr, '0', 2, False) + ':' + Preenchimento(sr, '0', 2, False);
end;

function MultiplicaHoras(hora: String; multiplicador: Integer): String;
var
  h, m, s, pq: Integer;
  hr, mr, sr: String;
begin
  pq := pos(':', hora);
  h := StrToInt(Copy(hora, 1, pq - 1));
  m := StrToInt(Copy(hora, pq + 1, 2));
  s := StrToInt(Copy(hora, pq + 4, 2));

  sr := IntToStr(((s * multiplicador) mod 60));
  mr := IntToStr(((m * multiplicador) mod 60) + ((s * multiplicador) div 60));
  hr := IntToStr(((h * multiplicador) + ((m * multiplicador) div 60)));

  if Length(hr) < 2 then
    hr := '0' + hr;

  Result := hr + ':' + Preenchimento(mr, '0', 2, False) + ':' + Preenchimento(sr, '0', 2, False);
end;

function Substituir_Texto(Texto, StrOld, StrNew: String): String;
var
  vPosicao : Integer;
begin
  Result := Texto;
  repeat
    vPosicao := Pos(StrOld, Result);
    if vPosicao > 0 then
      Result := Copy(Result, 1, vPosicao - 1) + StrNew + Copy(Result, vPosicao + length(StrOld), length(Result))
  until vPosicao = 0;
end;

end.

