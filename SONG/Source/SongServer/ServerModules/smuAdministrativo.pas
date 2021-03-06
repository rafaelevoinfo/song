unit smuAdministrativo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, smuBasico, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmuPrincipal, uTypes,
  uSQLGenerator, uQuery, Datasnap.Provider, uClientDataSet, uUtils,
  System.RegularExpressions, Datasnap.DBClient;

type
  TsmAdministrativo = class(TsmBasico)
    qPessoa: TRfQuery;
    qPerfil: TRfQuery;
    qPerfilNOME: TStringField;
    qPessoaNOME: TStringField;
    qPessoaRG: TStringField;
    qPessoaCPF: TStringField;
    qPessoaENDERECO: TStringField;
    qPessoaLOGIN: TStringField;
    qPessoaSENHA: TStringField;
    qPerfil_Permissao: TRfQuery;
    qPerfil_PermissaoPERMISSAO: TStringField;
    qPerfil_PermissaoVISUALIZAR: TSmallintField;
    qPerfil_PermissaoINCLUIR: TSmallintField;
    qPerfil_PermissaoALTERAR: TSmallintField;
    qPerfil_PermissaoEXCLUIR: TSmallintField;
    qPessoaID: TIntegerField;
    qPessoaBAIRRO: TStringField;
    qPessoaCOMPLEMENTO: TStringField;
    qPerfilID: TIntegerField;
    qPerfil_PermissaoID: TIntegerField;
    qPerfil_PermissaoID_PERFIL: TIntegerField;
    qPessoa_Perfil: TRfQuery;
    qPessoa_PerfilID: TIntegerField;
    qPessoa_PerfilID_PESSOA: TIntegerField;
    qPessoa_PerfilID_PERFIL: TIntegerField;
    qPessoaEMAIL: TStringField;
    qPessoaCELULAR: TStringField;
    qPessoaTELEFONE: TStringField;
    qPessoaATIVO: TSmallintField;
    qOrganizacao: TRfQuery;
    qOrganizacao_Pessoa: TRfQuery;
    qOrganizacaoID: TIntegerField;
    qOrganizacaoNOME: TStringField;
    qOrganizacaoCNPJ: TStringField;
    qOrganizacaoINSCRICAO_ESTADUAL: TStringField;
    qOrganizacaoENDERECO: TStringField;
    qOrganizacaoBAIRRO: TStringField;
    qOrganizacaoCOMPLEMENTO: TStringField;
    qOrganizacaoTELEFONE: TStringField;
    qOrganizacao_PessoaID: TIntegerField;
    qOrganizacao_PessoaID_PESSOA: TIntegerField;
    qOrganizacao_PessoaID_ORGANIZACAO: TIntegerField;
    qOrganizacao_PessoaFUNCAO: TStringField;
    qProjeto: TRfQuery;
    qProjetoID: TIntegerField;
    qProjetoNOME: TStringField;
    qProjetoDATA_INICIO: TDateField;
    qProjetoDATA_TERMINO: TDateField;
    qPerfilTIPO: TSmallintField;
    qProjetoORCAMENTO: TBCDField;
    qProjeto_Organizacao: TRfQuery;
    qProjeto_Financiador: TRfQuery;
    qProjeto_FinanciadorID: TIntegerField;
    qProjeto_FinanciadorID_PROJETO: TIntegerField;
    qProjeto_FinanciadorID_FINANCIADOR: TIntegerField;
    qProjeto_OrganizacaoID: TIntegerField;
    qProjeto_OrganizacaoID_PROJETO: TIntegerField;
    qProjeto_OrganizacaoID_ORGANIZACAO: TIntegerField;
    qProjeto_Documento: TRfQuery;
    qProjeto_DocumentoID: TIntegerField;
    qProjeto_DocumentoID_PROJETO: TIntegerField;
    qProjeto_DocumentoNOME: TStringField;
    qProjeto_DocumentoDATA_UPLOAD: TSQLTimeStampField;
    qProjeto_DocumentoDOCUMENTO: TBlobField;
    qProjeto_Pessoa: TRfQuery;
    qProjeto_PessoaID: TIntegerField;
    qProjeto_PessoaID_PROJETO: TIntegerField;
    qProjeto_PessoaID_PESSOA: TIntegerField;
    qProjeto_PessoaFUNCAO: TStringField;
    qProjetoID_BANCO_CONTA_CORRENTE: TIntegerField;
    qProjeto_Financiador_Pagto: TRfQuery;
    qProjeto_Financiador_PagtoID: TIntegerField;
    qProjeto_Financiador_PagtoID_PROJETO_FINANCIADOR: TIntegerField;
    qProjeto_Financiador_PagtoVALOR: TBCDField;
    qProjeto_Financiador_PagtoDATA: TDateField;
    qProjeto_DocumentoNOME_ORIGINAL: TStringField;
    qPessoaTIPO: TSmallintField;
    qAtividade: TRfQuery;
    qAtividadeID: TIntegerField;
    qAtividadeNOME: TStringField;
    qAtividadeID_SOLICITANTE: TIntegerField;
    qAtividadeID_RESPONSAVEL: TIntegerField;
    qAtividadeSTATUS: TSmallintField;
    qAtividadeDATA_INICIAL: TSQLTimeStampField;
    qAtividadeDATA_FINAL: TSQLTimeStampField;
    qAtividade_Pessoa: TRfQuery;
    qAtividade_Projeto: TRfQuery;
    qAtividade_ProjetoID: TIntegerField;
    qAtividade_ProjetoID_ATIVIDADE: TIntegerField;
    qAtividade_ProjetoID_PROJETO: TIntegerField;
    qAtividade_PessoaID: TIntegerField;
    qAtividade_PessoaID_ATIVIDADE: TIntegerField;
    qAtividade_PessoaID_PESSOA: TIntegerField;
    qAtividade_PessoaFUNCAO: TStringField;
    qAtividade_Arquivo: TRfQuery;
    qAtividade_ArquivoID: TIntegerField;
    qAtividade_ArquivoID_ATIVIDADE: TIntegerField;
    qAtividade_ArquivoNOME: TStringField;
    qAtividade_ArquivoNOME_ORIGINAL: TStringField;
    qAtividade_Vinculo: TRfQuery;
    qAtividade_VinculoID: TIntegerField;
    qAtividade_VinculoTIPO_VINCULO: TSmallintField;
    qAtividade_Comentario: TRfQuery;
    qAtividade_ComentarioID: TIntegerField;
    qAtividade_ComentarioID_ATIVIDADE: TIntegerField;
    qAtividade_ComentarioID_PESSOA: TIntegerField;
    qAtividade_ComentarioDATA_HORA: TSQLTimeStampField;
    qAtividade_ArquivoARQUIVO: TBlobField;
    qAtividade_VinculoID_ATIVIDADE_ORIGEM: TIntegerField;
    qAtividadeID_PROJETO: TIntegerField;
    qAtividade_ArquivoDATA_UPLOAD: TSQLTimeStampField;
    qAtividade_ProjetoNOME_PROJETO: TStringField;
    qAtividade_VinculoNOME_ATIVIDADE_ORIGEM: TStringField;
    qAtividade_VinculoID_ATIVIDADE_VINCULO: TIntegerField;
    qAtividade_VinculoNOME_ATIVIDADE_VINCULO: TStringField;
    qProjetoSTATUS: TSmallintField;
    qAtividadeNOME_PROJETO: TStringField;
    qPessoaID_CIDADE: TIntegerField;
    qPessoaCIDADE: TStringField;
    qOrganizacaoID_CIDADE: TIntegerField;
    qOrganizacaoCIDADE: TStringField;
    qPessoaDATA_NASCIMENTO: TDateField;
    qPessoaOBSERVACAO: TStringField;
    qAtividadeDESCRICAO: TStringField;
    qAtividade_ArquivoDESCRICAO: TStringField;
    qAtividade_ComentarioCOMENTARIO: TStringField;
    qAtividade_ProjetoOBSERVACAO: TStringField;
    qAtividade_VinculoOBSERVACAO: TStringField;
    qOrganizacao_PessoaOBSERVACAO: TStringField;
    qPerfilDESCRICAO: TStringField;
    qProjetoDESCRICAO: TStringField;
    qProjeto_FinanciadorOBSERVACAO: TStringField;
    qAtividade_PessoaNOME_PESSOA: TStringField;
    qAtividade_PessoaNOME_ATIVIDADE: TStringField;
    qProjeto_Rubrica: TRfQuery;
    qProjeto_Area: TRfQuery;
    qProjeto_AreaID: TIntegerField;
    qProjeto_AreaID_PROJETO: TIntegerField;
    qProjeto_Financiador_PagtoPERCENTUAL: TBCDField;
    qOrganizacaoLOGO: TBlobField;
    qFundo: TRfQuery;
    qFundoID: TIntegerField;
    qFundoID_ORGANIZACAO: TIntegerField;
    qFundoNOME: TStringField;
    qFundoSALDO: TBCDField;
    qFundoDESCRICAO: TStringField;
    qProjeto_FinanciadorVALOR_FINANCIADO: TBCDField;
    qProjeto_Financiador_PagtoID_PROJETO_ORGANIZACAO: TIntegerField;
    qProjeto_Financiador_PagtoNOME_ORGANIZACAO: TStringField;
    qProjeto_Financiador_PagtoFORMA_PAGTO: TSmallintField;
    qPessoaCEP: TStringField;
    qFundoREQUER_AUTORIZACAO: TSmallintField;
    qAtividadeDATA_CADASTRO: TSQLTimeStampField;
    qAtividadeDATA_ALTERACAO: TSQLTimeStampField;
    qProjeto_RubricaCALC_VALOR_GASTO: TBCDField;
    qProjeto_RubricaCALC_VALOR_RECEBIDO: TBCDField;
    qOrganizacaoSITE: TStringField;
    qOrganizacaoEMAIL: TStringField;
    qAtividadeDATA_FINALIZACAO: TSQLTimeStampField;
    dspqAtividade: TDataSetProvider;
    qProjeto_AreaID_AREA_ATUACAO: TIntegerField;
    qArea_Atuacao: TRFQuery;
    qArea_Execucao: TRFQuery;
    qArea_ExecucaoID: TIntegerField;
    qArea_ExecucaoID_AREA_ATUACAO: TIntegerField;
    qArea_ExecucaoNOME: TStringField;
    qProjeto_AreaNOME: TStringField;
    qAtividadeID_AREA_ATUACAO: TIntegerField;
    qAtividadeID_AREA_EXECUCAO: TIntegerField;
    qAtividadeAREA_ATUACAO: TStringField;
    qAtividadeAREA_EXECUCAO: TStringField;
    qOrganizacaoLOGO_SECUNDARIA: TBlobField;
    qAtividadeNOME_SOLICITANTE: TStringField;
    qAtividadeNOME_RESPONSAVEL: TStringField;
    qProjeto_Finan_Pagto_Rubrica: TRFQuery;
    qProjeto_Finan_Pagto_RubricaID: TIntegerField;
    qProjeto_Finan_Pagto_RubricaID_PROJETO_RUBRICA: TIntegerField;
    qProjeto_Finan_Pagto_RubricaRUBRICA: TStringField;
    qProjeto_Finan_Pagto_RubricaID_PROJETO_FINANCIADOR_PAGTO: TIntegerField;
    qProjeto_Finan_Pagto_RubricaVALOR: TBCDField;
    qProjeto_RubricaID: TIntegerField;
    qProjeto_RubricaID_PROJETO: TIntegerField;
    qProjeto_RubricaID_RUBRICA: TIntegerField;
    qProjeto_RubricaORCAMENTO: TBCDField;
    qProjeto_RubricaGASTO: TBCDField;
    qProjeto_RubricaGASTO_TRANSFERENCIA: TBCDField;
    qProjeto_RubricaRECEBIDO: TBCDField;
    qProjeto_RubricaRECEBIDO_TRANSFERENCIA: TBCDField;
    qProjeto_RubricaAPROVISIONADO: TBCDField;
    qProjeto_RubricaSALDO_REAL: TBCDField;
    qProjeto_RubricaSALDO_PREVISTO: TBCDField;
    qProjeto_RubricaNOME_RUBRICA: TStringField;
    procedure qProjeto_RubricaCalcFields(DataSet: TDataSet);
    procedure dspqAtividadeAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
  private
    { Private declarations }
  protected
    function fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string; override;
  public
    { Public declarations }
  end;

var
  smAdministrativo: TsmAdministrativo;

implementation

{$R *.dfm}
{ TsmAdministrativo }

procedure TsmAdministrativo.dspqAtividadeAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
var
  vaStatus: integer;
begin
  inherited;
  if UpdateKind in [ukInsert, ukModify] then
    begin
      if (not VarIsNull(DeltaDS.FieldByName('STATUS').NewValue)) then
        begin
          if TryStrToInt(VarToStrDef(DeltaDS.FieldByName('STATUS').NewValue, ''), vaStatus) then
            begin
              if vaStatus in [Ord(saFinalizada), Ord(saCancelada)] then
                begin
                  if DeltaDS.FieldByName('DATA_FINALIZACAO').IsNull then
                    begin
                      Connection.ExecSQL('update atividade set atividade.data_finalizacao = current_timestamp where atividade.id = :ID',
                        [DeltaDS.FieldByName(TBancoDados.coId).OldValue]);
                      Connection.Commit;

                    end;
                end
              else
                begin
                  Connection.ExecSQL('update atividade set atividade.data_finalizacao = null where atividade.id = :ID',
                    [DeltaDS.FieldByName(TBancoDados.coId).OldValue]);
                  Connection.Commit;
                end;
            end;
        end;
    end;
end;

function TsmAdministrativo.fprMontarWhere(ipTabela, ipWhere: string; ipParam: TParam): string;
var
  vaValor, vaOperador: string;
  vaCodigos: TArray<integer>;
begin
  Result := inherited;

  TUtils.ppuExtrairValorOperadorParametro(ipParam.Text, vaValor, vaOperador, TParametros.coDelimitador);
  if ipTabela = 'PESSOA' then
    begin
      if ipParam.Name = TParametros.coLogin then
        Result := TSQLGenerator.fpuFilterString(Result, ipTabela, 'login', vaValor, vaOperador)
      else if ipParam.Name = TParametros.coTipo then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'tipo', TUtils.fpuConverterStringToArrayInteger(vaValor), vaOperador)
    end
  else if ipTabela = 'PROJETO' then
    begin
      if ipParam.Name = TParametros.coStatus then
        Result := TSQLGenerator.fpuFilterInteger(Result, ipTabela, 'STATUS', vaValor.ToInteger(), vaOperador)
    end
  else if ipTabela = 'ATIVIDADE' then
    begin
      if ipParam.Name = TParametros.coData then
        begin
          Result := Result + ' ((ATIVIDADE.DATA_INICIAL between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 0))) + ' AND ' +
            QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 1))) + ') or ' +
            '(ATIVIDADE.DATA_FINAL between ' + QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 0))) + ' AND ' +
            QuotedStr(FormatDateTime('dd.mm.yyyy', TUtils.fpuExtrairData(vaValor, 1))) + ')) ' + vaOperador;
        end
      else if ipParam.Name = TParametros.coProjeto then
        begin
          vaCodigos := TUtils.fpuConverterStringToArrayInteger(vaValor);
          Result := TSQLGenerator.fpuFilterInteger(Result, ['ATIVIDADE', 'ATIVIDADE_PROJETO'],
            ['ID_PROJETO', 'ID_PROJETO'], [vaCodigos, vaCodigos], TOperadores.coOR, vaOperador);
        end;
    end;
end;

procedure TsmAdministrativo.qProjeto_RubricaCalcFields(DataSet: TDataSet);
begin
  inherited;
  qProjeto_RubricaCALC_VALOR_GASTO.AsFloat := qProjeto_RubricaGASTO.AsFloat;
  qProjeto_RubricaCALC_VALOR_RECEBIDO.AsFloat := qProjeto_RubricaRECEBIDO.AsFloat;

  if qProjeto_RubricaGASTO_TRANSFERENCIA.AsFloat > qProjeto_RubricaRECEBIDO_TRANSFERENCIA.AsFloat then
    qProjeto_RubricaCALC_VALOR_GASTO.AsFloat := qProjeto_RubricaCALC_VALOR_GASTO.AsFloat +
      (qProjeto_RubricaGASTO_TRANSFERENCIA.AsFloat - qProjeto_RubricaRECEBIDO_TRANSFERENCIA.AsFloat)
  else if qProjeto_RubricaGASTO_TRANSFERENCIA.AsFloat < qProjeto_RubricaRECEBIDO_TRANSFERENCIA.AsFloat then
    qProjeto_RubricaCALC_VALOR_RECEBIDO.AsFloat := qProjeto_RubricaCALC_VALOR_RECEBIDO.AsFloat +
      (qProjeto_RubricaRECEBIDO_TRANSFERENCIA.AsFloat - qProjeto_RubricaGASTO_TRANSFERENCIA.AsFloat);
end;

end.
