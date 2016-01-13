unit Unit_SNGPC;

interface

uses
  FileCtrl, Sysutils;

function Cabecalho(ipCnpj_Empresa, ipCpf_Famaceutico, ipData_Inicio, ipData_Fim : String) : WideString;
function NotaFiscalEntradaMedicamento(ipNumeroNotaFiscal, ipTipoOperacaoNotaFiscal : Integer; ipDataNotaFiscal, ipCnpjOrigem, ipCnpjDestino : String) : WideString;
function MedicamentoEntrada(ipQuantidadeMedicamento : Integer; ipNumeroLoteMedicamento, ipRegistroMSMedicamento : String) : WideString;
function DataRecebimentoMedicamento(ipData : String) : WideString;
function EntradaMedicamentos(ipNumeroNotaFiscal, ipTipoOperacaoNotaFiscal, ipQuantidadeMedicamento : Integer;
                             ipDataNotaFiscal, ipCnpjOrigem, ipCnpjDestino, ipData, ipNumeroLoteMedicamento, ipRegistroMSMedicamento : String) : WideString;
function TipoReceituarioMedicamento(ipTipo_Receita : Integer) : WideString;
function NumeroNotificacaoMedicamento(ipNumero_Notificacao : Integer) : WideString;
function DataPrescricaoMedicamento(ipData_Prescricao : String) : WideString;
function PrescritorMedicamento(ipNomePrescritor, ipNumeroRegistroProfissional, ipConselhoProfissional, ipUFConselho : String) : WideString;
function UsoMedicamento(ipUso_Medicamento : Integer) : WideString;
function CompradorMedicamento(ipNome_Comprador, ipNumeroDocumento, ipOrgaoExpedidor, ipUFEmissaoDocumento :String; ipTipoDocumento : Integer) : WideString;
function MedicamentoVenda(ipQuantidadeMedicamento : Integer; ipNumeroLoteMedicamento, ipRegistroMSMedicamento : String) : WideString;
function DataVendaMedicamento(ipData : String) : WideString;
function SaidaMedicamentoVendaAoConsumidor(ipTipo_Receita, ipNumero_Notificacao, ipUso_Medicamento, ipTipoDocumento, ipQuantidadeMedicamento : Integer;
                                           ipData_Prescricao, ipNomePrescritor, ipNumeroRegistroProfissional, ipConselhoProfissional, ipUFConselho, ipNome_Comprador, ipNumeroDocumento, ipOrgaoExpedidor, ipUFEmissaoDocumento, ipData, ipNumeroLoteMedicamento, ipRegistroMSMedicamento: String) : WideString;
function MotivoPerdaMedicamento(ipMotivo : Integer) : WideString;
function MedicamentoPerda(ipQuantidadeMedicamento : Integer; ipNumeroLoteMedicamento, ipRegistroMSMedicamento : String) : WideString;
function DataPerdaMedicamento(ipData_Perda : String) : WideString;
function SaidaMedicamentoPerda(ipMotivo, ipQuantidadeMedicamento : Integer;
                               ipData_Perda, ipNumeroLoteMedicamento, ipRegistroMSMedicamento : String) : WideString;

const
  coQuebra : String = #13#10;

implementation

function Cabecalho(ipCnpj_Empresa, ipCpf_Famaceutico, ipData_Inicio, ipData_Fim : String) : WideString;
begin
  Result := '  <cabecalho>' + coQuebra +
            '    <cnpjEmissor>' + ipCnpj_Empresa + '</cnpjEmissor>' + coQuebra +
            '    <cpfTransmissor>' + ipCpf_Famaceutico + '</cpfTransmissor>' + coQuebra +
            '    <dataInicio>' + Copy(ipData_Inicio,7,4) + '-' + Copy(ipData_Inicio,4,2) + '-' + Copy(ipData_Inicio,1,2) + '</dataInicio>' + coQuebra +
            '    <dataFim>' + Copy(ipData_Fim,7,4) + '-' + Copy(ipData_Fim,4,2) + '-' + Copy(ipData_Fim,1,2) + '</dataFim>' + coQuebra +
            '  </cabecalho>';            
end;

function NotaFiscalEntradaMedicamento(ipNumeroNotaFiscal, ipTipoOperacaoNotaFiscal : Integer; ipDataNotaFiscal, ipCnpjOrigem, ipCnpjDestino : String) : WideString;
begin
  Result := '        <notaFiscalEntradaMedicamento>' + coQuebra +
            '          <numeroNotaFiscal>' + IntToStr(ipNumeroNotaFiscal) + '</numeroNotaFiscal>' + coQuebra +
            '          <tipoOperacaoNotaFiscal>' + IntToStr(ipTipoOperacaoNotaFiscal) + '</tipoOperacaoNotaFiscal>' + coQuebra +
            '          <dataNotaFiscal>' + Copy(ipDataNotaFiscal,7,4) + '-' + Copy(ipDataNotaFiscal,4,2) + '-' + Copy(ipDataNotaFiscal,1,2) + '</dataNotaFiscal>' + coQuebra +
            '          <cnpjOrigem>' + ipCnpjOrigem + '</cnpjOrigem>' + coQuebra +
            '          <cnpjDestino>' + ipCnpjDestino + '</cnpjDestino>' + coQuebra +
            '        </notaFiscalEntradaMedicamento>';
end;

function MedicamentoEntrada(ipQuantidadeMedicamento : Integer; ipNumeroLoteMedicamento, ipRegistroMSMedicamento : String) : WideString;
begin
  Result := '        <medicamentoEntrada>' + coQuebra +
            '          <registroMSMedicamento>' + ipRegistroMSMedicamento + '</registroMSMedicamento>' + coQuebra +
            '          <numeroLoteMedicamento>' + ipNumeroLoteMedicamento + '</numeroLoteMedicamento>' + coQuebra +
            '          <quantidadeMedicamento>' + IntToStr(ipQuantidadeMedicamento) + '</quantidadeMedicamento>' + coQuebra +
            '        </medicamentoEntrada>';
end;

function DataRecebimentoMedicamento(ipData : String) : WideString;
begin
  Result := '        <dataRecebimentoMedicamento>' + Copy(ipData,7,4) + '-' + Copy(ipData,4,2) + '-' + Copy(ipData,1,2) + '</dataRecebimentoMedicamento>';
end;

function EntradaMedicamentos(ipNumeroNotaFiscal, ipTipoOperacaoNotaFiscal, ipQuantidadeMedicamento : Integer;
                             ipDataNotaFiscal, ipCnpjOrigem, ipCnpjDestino, ipData, ipNumeroLoteMedicamento, ipRegistroMSMedicamento : String) : WideString;
begin
  Result := '      <entradaMedicamentos>' + coQuebra +
            NotaFiscalEntradaMedicamento(ipNumeroNotaFiscal, ipTipoOperacaoNotaFiscal, ipDataNotaFiscal, ipCnpjOrigem, ipCnpjDestino) + coQuebra +
            MedicamentoEntrada(ipQuantidadeMedicamento, ipNumeroLoteMedicamento, ipRegistroMSMedicamento) + coQuebra +
            DataRecebimentoMedicamento(ipData) + coQuebra +
            '      </entradaMedicamentos>';

end;

function TipoReceituarioMedicamento(ipTipo_Receita : Integer) : WideString;
begin
  Result := '        <tipoReceituarioMedicamento>' + IntToStr(ipTipo_Receita) + '</tipoReceituarioMedicamento>';
end;

function NumeroNotificacaoMedicamento(ipNumero_Notificacao : Integer) : WideString;
begin
  Result := '        <numeroNotificacaoMedicamento>' + IntToStr(ipNumero_Notificacao) + '</numeroNotificacaoMedicamento>';
end;

function DataPrescricaoMedicamento(ipData_Prescricao : String) : WideString;
begin
  Result := '        <dataPrescricaoMedicamento>' + Copy(ipData_Prescricao,7,4) + '-' + Copy(ipData_Prescricao,4,2) + '-' + Copy(ipData_Prescricao,1,2) + '</dataPrescricaoMedicamento>';
end;

function PrescritorMedicamento(ipNomePrescritor, ipNumeroRegistroProfissional, ipConselhoProfissional, ipUFConselho : String) : WideString;
begin
  Result := '        <prescritorMedicamento>' + coQuebra +
            '          <nomePrescritor>' + ipNomePrescritor + '</nomePrescritor>' + coQuebra +
            '          <numeroRegistroProfissional>' + ipNumeroRegistroProfissional + '</numeroRegistroProfissional>' + coQuebra +
            '          <conselhoProfissional>' + ipConselhoProfissional + '</conselhoProfissional>' + coQuebra +
            '          <UFConselho>' + ipUFConselho + '</UFConselho>' + coQuebra +
            '        </prescritorMedicamento>';
end;

function UsoMedicamento(ipUso_Medicamento : Integer) : WideString;
begin
  Result := '        <usoMedicamento>' + IntToStr(ipUso_Medicamento) + '</usoMedicamento>';
end;

function CompradorMedicamento(ipNome_Comprador, ipNumeroDocumento, ipOrgaoExpedidor, ipUFEmissaoDocumento :String; ipTipoDocumento : Integer) : WideString;
begin
  Result := '        <compradorMedicamento>' + coQuebra +
            '          <nomeComprador>' + ipNome_Comprador + '</nomeComprador>' + coQuebra +
            '          <tipoDocumento>' + IntToStr(ipTipoDocumento) + '</tipoDocumento>' + coQuebra +
            '          <numeroDocumento>' + ipNumeroDocumento + '</numeroDocumento>' + coQuebra +
            '          <orgaoExpedidor>' + ipOrgaoExpedidor + '</orgaoExpedidor>' + coQuebra +
            '          <UFEmissaoDocumento>' + ipUFEmissaoDocumento + '</UFEmissaoDocumento>' + coQuebra +
            '        </compradorMedicamento>';
end;

function MedicamentoVenda(ipQuantidadeMedicamento : Integer; ipNumeroLoteMedicamento, ipRegistroMSMedicamento : String) : WideString;
begin
  Result := '        <medicamentoVenda>' + coQuebra +
            '          <registroMSMedicamento>' + ipRegistroMSMedicamento + '</registroMSMedicamento>' + coQuebra +
            '          <numeroLoteMedicamento>' + ipNumeroLoteMedicamento + '</numeroLoteMedicamento>' + coQuebra +
            '          <quantidadeMedicamento>' + IntToStr(ipQuantidadeMedicamento) + '</quantidadeMedicamento>' + coQuebra +
            '        </medicamentoVenda>';
end;

function DataVendaMedicamento(ipData : String) : WideString;
begin
  Result := '        <dataVendaMedicamento>' + Copy(ipData,7,4) + '-' + Copy(ipData,4,2) + '-' + Copy(ipData,1,2) + '</dataVendaMedicamento>';
end;

function SaidaMedicamentoVendaAoConsumidor(ipTipo_Receita, ipNumero_Notificacao, ipUso_Medicamento, ipTipoDocumento, ipQuantidadeMedicamento : Integer;
                                           ipData_Prescricao, ipNomePrescritor, ipNumeroRegistroProfissional, ipConselhoProfissional, ipUFConselho, ipNome_Comprador, ipNumeroDocumento, ipOrgaoExpedidor, ipUFEmissaoDocumento, ipData, ipNumeroLoteMedicamento, ipRegistroMSMedicamento : String) : WideString;
begin
  Result := '      <saidaMedicamentoVendaAoConsumidor>' + coQuebra +
            TipoReceituarioMedicamento(ipTipo_Receita) + coQuebra +
            NumeroNotificacaoMedicamento(ipNumero_Notificacao) + coQuebra +
            DataPrescricaoMedicamento(ipData_Prescricao) + coQuebra +
            PrescritorMedicamento(ipNomePrescritor, ipNumeroRegistroProfissional, ipConselhoProfissional, ipUFConselho) + coQuebra +
            UsoMedicamento(ipUso_Medicamento) + coQuebra +
            CompradorMedicamento(ipNome_Comprador, ipNumeroDocumento, ipOrgaoExpedidor, ipUFEmissaoDocumento, ipTipoDocumento) + coQuebra +
            MedicamentoVenda(ipQuantidadeMedicamento, ipNumeroLoteMedicamento, ipRegistroMSMedicamento) + coQuebra +
            DataVendaMedicamento(ipData) + coQuebra +
            '      </saidaMedicamentoVendaAoConsumidor>';
end;

function MotivoPerdaMedicamento(ipMotivo : Integer) : WideString;
begin
  Result := '        <motivoPerdaMedicamento>' + IntToStr(ipMotivo) + '</motivoPerdaMedicamento>';
end;

function MedicamentoPerda(ipQuantidadeMedicamento : Integer; ipNumeroLoteMedicamento, ipRegistroMSMedicamento : String) : WideString;
begin
  Result := '        <medicamentoPerda>' + coQuebra +
            '          <registroMSMedicamento>' + ipRegistroMSMedicamento + '</registroMSMedicamento>' + coQuebra +
            '          <numeroLoteMedicamento>' + ipNumeroLoteMedicamento + '</numeroLoteMedicamento>' + coQuebra +
            '          <quantidadeMedicamento>' + IntToStr(ipQuantidadeMedicamento) + '</quantidadeMedicamento>' + coQuebra +
            '        </medicamentoPerda>';
end;

function DataPerdaMedicamento(ipData_Perda : String) : WideString;
begin
  Result := '        <dataPerdaMedicamento>' + Copy(ipData_Perda,7,4) + '-' + Copy(ipData_Perda,4,2) + '-' + Copy(ipData_Perda,1,2) + '</dataPerdaMedicamento>';
end;

function SaidaMedicamentoPerda(ipMotivo, ipQuantidadeMedicamento : Integer;
                               ipData_Perda, ipNumeroLoteMedicamento, ipRegistroMSMedicamento : String) : WideString;
begin
  Result := '      <saidaMedicamentoPerda>' + coQuebra +
            MotivoPerdaMedicamento(ipMotivo) + coQuebra +
            MedicamentoPerda(ipQuantidadeMedicamento, ipNumeroLoteMedicamento, ipRegistroMSMedicamento) + coQuebra +
            DataPerdaMedicamento(ipData_Perda) + coQuebra +
            '      </saidaMedicamentoPerda>';
end;                               

end.
