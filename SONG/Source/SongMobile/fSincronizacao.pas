unit fSincronizacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  fBasico, FMX.Controls.Presentation, FMX.ListBox, FMX.Layouts, dmuPrincipal,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uQuery, uTypes, System.Generics.Collections,
  System.JSON, REST.JSON, IdBaseComponent, IdCoder, IdCoder3to4, IdCoderMIME,
  System.Actions, FMX.ActnList, fConfiguracoes, aduna_ds_list, uConstantes,
  Android.JNI.Toast, uConnection, uFuncoes, FMX.Objects, uConexao,
  Data.SqlExpr, Androidapi.Helpers;

type
  TSincronizacaoAtual = (saEspecie, saMatriz, saLote, saFim);

  TfrmSincronizacao = class(TfrmBasico)
    tbPrincipal: TToolBar;
    btnSincronizar: TButton;
    lstAcoes: TListBox;
    ListBoxGroupHeader1: TListBoxGroupHeader;
    lbiEspecies: TListBoxItem;
    lbiMatrizes: TListBoxItem;
    lbiLotes: TListBoxItem;
    qMatrizSincronizacao: TRFQuery;
    qMatrizSincronizacaoID: TFDAutoIncField;
    qMatrizSincronizacaoID_ESPECIE: TIntegerField;
    qMatrizSincronizacaoNOME: TStringField;
    qMatrizSincronizacaoENDERECO: TStringField;
    qMatrizSincronizacaoLATITUDE: TFMTBCDField;
    qMatrizSincronizacaoLONGITUDE: TFMTBCDField;
    qEspecie: TRFQuery;
    qEspecieNOME: TStringField;
    EncodeBase64: TIdEncoderMIME;
    btnConfiguracoes: TButton;
    btnRetornar: TButton;
    qEspecieID: TFDAutoIncField;
    qMatrizSincronizacaoSYNC: TIntegerField;
    qMatrizSincronizacaoID_SERVER: TIntegerField;
    DecoderBase64: TIdDecoderMIME;
    qMatrizSincronizacaoFOTO: TBlobField;
    qLote: TRFQuery;
    qLote_Matriz: TRFQuery;
    qLote_MatrizID: TFDAutoIncField;
    qLote_MatrizID_LOTE: TIntegerField;
    qLote_MatrizID_MATRIZ: TIntegerField;
    qLoteID_ESPECIE: TIntegerField;
    qLoteDATA: TDateTimeField;
    qLoteNOME: TStringField;
    qLoteQTDE: TBCDField;
    qLoteID: TFDAutoIncField;
    qLote_MatrizID_SERVER: TIntegerField;
    recFade: TRectangle;
    recModal: TRectangle;
    LoadLocalizacao: TAniIndicator;
    lbStatus: TLabel;
    procedure btnSincronizarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FGerenciadorConexao: TGerenciadorConexao;
    FConnServidor: TSQLConnection;
    FConnBancoDados: TFDConnection;

    procedure ppvSincronizarEspecies(ipDataUltimoSincronismo: TDateTime);
    procedure ppvSincronizarMatrizes(ipDataUltimoSincronismo: TDateTime);
    procedure ppvSincronizarLotes(ipDataUltimoSincronismo: TDateTime);
    procedure ppvExibirEsconderFade(ipExibir: Boolean);
    procedure ppvSincronizar;
    procedure ppvFinalizarSincronismo(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSincronizacao: TfrmSincronizacao;

implementation

uses
  fPrincipal;

{$R *.fmx}

procedure TfrmSincronizacao.btnConfiguracoesClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmConfiguracoes, frmConfiguracoes);

  dmPrincipal.ppuAbrirConfig;
  if dmPrincipal.qConfig.Eof then
    frmConfiguracoes.ppuIncluir
  else
    frmConfiguracoes.ppuAlterar(dmPrincipal.qConfigID.AsInteger);
  frmConfiguracoes.Show;
end;

procedure TfrmSincronizacao.btnRetornarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmSincronizacao.btnSincronizarClick(Sender: TObject);
begin
  inherited;
  lbiEspecies.ItemData.Accessory := TListBoxItemData.TAccessory.aNone;
  lbiMatrizes.ItemData.Accessory := TListBoxItemData.TAccessory.aNone;
  lbiLotes.ItemData.Accessory := TListBoxItemData.TAccessory.aNone;

  lbiEspecies.Repaint;
  lbiMatrizes.Repaint;
  lbiLotes.Repaint;

  dmPrincipal.ppuAbrirConfig;
  if dmPrincipal.qConfigID_APARELHO.IsNull then
    raise Exception.Create('É necessário registrar o aparelho antes de qualquer sincronização.');

  if (dmPrincipal.qConfigHOST_SERVIDOR_INTERNO.AsString = '') and
    (dmPrincipal.qConfigHOST_SERVIDOR_EXTERNO.AsString = '') then
    raise Exception.Create('Informe pelo menos um dos endereço de acesso do servidor.');

  lbStatus.Text := 'Conectando...';
  ppvExibirEsconderFade(true);

  if not Assigned(FGerenciadorConexao) then
    FGerenciadorConexao := TGerenciadorConexao.Create;

  FGerenciadorConexao.ppuConectarServidor(
    procedure(ipConexao: TSQLConnection)
    begin
      if Assigned(ipConexao) then
        begin
          lbStatus.Text := 'Sincronizando...';
          lbStatus.Repaint;

          FConnServidor := ipConexao;
          FConnBancoDados := dmPrincipal.Connection.CloneConnection as TFDConnection;

          ppvSincronizar;
        end
      else
        ppvExibirEsconderFade(false);
    end);

end;

procedure TfrmSincronizacao.ppvSincronizar;
var
  vaThread: TThread;
  vaDataUltimaSync: TDateTime;
begin
  vaDataUltimaSync := dmPrincipal.qConfigDATA_ULTIMA_SYNC.AsDateTime;
  vaThread := TThread.CreateAnonymousThread(
    procedure
    begin
      ppvSincronizarEspecies(vaDataUltimaSync);
      TThread.Synchronize(nil,
        procedure
        begin
          lbiEspecies.ItemData.Accessory := TListBoxItemData.TAccessory.aCheckmark;
          lbiEspecies.Repaint;
        end);

      ppvSincronizarMatrizes(vaDataUltimaSync);
      TThread.Synchronize(nil,
        procedure
        begin
          lbiMatrizes.ItemData.Accessory := TListBoxItemData.TAccessory.aCheckmark;
          lbiMatrizes.Repaint;
        end);

      ppvSincronizarLotes(vaDataUltimaSync);
      TThread.Synchronize(nil,
        procedure
        begin
          lbiLotes.ItemData.Accessory := TListBoxItemData.TAccessory.aCheckmark;
          lbiLotes.Repaint;
        end);
    end);
  vaThread.FreeOnTerminate := true;
  vaThread.OnTerminate := ppvFinalizarSincronismo;
  vaThread.Start;

end;

procedure TfrmSincronizacao.ppvFinalizarSincronismo(Sender: TObject);
begin
  try
    ppvExibirEsconderFade(false);
    if Assigned(Sender) and Assigned(TThread(Sender).FatalException) then
      begin
        showMessage(Exception(TThread(Sender).FatalException).message);
      end
    else
      begin
        dmPrincipal.ppuAbrirConfig; // aparentemente o config é fechado sozinho
        dmPrincipal.qConfig.Edit;
        dmPrincipal.qConfigDATA_ULTIMA_SYNC.AsDateTime := now;
        dmPrincipal.qConfig.Post;

        Toast('Sincronização realizada com sucesso.');
      end;
  finally
    FConnServidor.Close;
    FreeAndNil(FConnServidor);
    FConnBancoDados.Close;
    FreeAndNil(FConnBancoDados);
  end;
end;

procedure TfrmSincronizacao.ppvExibirEsconderFade(ipExibir: Boolean);
begin
  recFade.Visible := ipExibir;
  recModal.Visible := ipExibir;

  if ipExibir then
    begin
      recFade.BringToFront;
      recModal.BringToFront;
    end;
end;

procedure TfrmSincronizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmPrincipal.ppuDesconectarServidor;
end;

procedure TfrmSincronizacao.FormCreate(Sender: TObject);
begin
  inherited;
  ppvExibirEsconderFade(false);
end;

procedure TfrmSincronizacao.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FGerenciadorConexao) then
    FreeAndNil(FGerenciadorConexao);
end;

procedure TfrmSincronizacao.ppvSincronizarEspecies(ipDataUltimoSincronismo: TDateTime);
var
  vaEspecies: TadsObjectlist<TEspecie>;
  vaEspecie: TEspecie;
  vaResult, vaCodigos: String;
  vaFuncoesViveiro: TsmFuncoesViveiroClient;
begin
  qEspecie.Close;
  qEspecie.Connection := FConnBancoDados;

  vaFuncoesViveiro := TsmFuncoesViveiroClient.Create(FConnServidor.DBXConnection);
  try
    if ipDataUltimoSincronismo = 0 then
      vaResult := vaFuncoesViveiro.fpuSincronizarEspecies('')
    else
      vaResult := vaFuncoesViveiro.fpuSincronizarEspecies(DateToStr(ipDataUltimoSincronismo));
  finally
    vaFuncoesViveiro.Free;
  end;

  if vaResult <> '' then
    begin
      vaEspecies := TJson.JsonToObject < TadsObjectlist < TEspecie >> (vaResult);

      if Assigned(vaEspecies) and (vaEspecies.Count > 0) then
        begin
          for vaEspecie in vaEspecies do
            begin
              if vaCodigos = '' then
                vaCodigos := vaEspecie.Id.ToString
              else
                vaCodigos := vaCodigos + ',' + vaEspecie.Id.ToString;
            end;
          qEspecie.MacroByName('WHERE').AsRaw := ' where especie.id in (' + vaCodigos + ')';
          qEspecie.Open;

          for vaEspecie in vaEspecies do
            begin
              if vaEspecie.StatusRegistro <> Ord(ukDelete) then
                begin
                  if qEspecie.Locate('ID', vaEspecie.Id, []) then
                    qEspecie.Edit
                  else
                    qEspecie.Append;

                  qEspecieID.AsInteger := vaEspecie.Id;
                  qEspecieNOME.AsString := vaEspecie.Nome;
                  qEspecie.Post;
                end
              else
                begin
                  if qEspecie.Locate('ID', vaEspecie.Id, []) then
                    qEspecie.Delete;
                end;
            end;

          if (qEspecie.ChangeCount > 0) then
            begin
              qEspecie.ApplyUpdates(0);
              qEspecie.CommitUpdates;
            end;

        end;
    end;

end;

procedure TfrmSincronizacao.ppvSincronizarLotes(ipDataUltimoSincronismo: TDateTime);
var
  vaLotes: TadsObjectlist<TLote>;
  vaLote: TLote;
  vaMatriz: TMatriz;
  vaFuncoesViveiro: TsmFuncoesViveiroClient;
  vaIdAparelho: Integer;
  vaDataSet: TRFQuery;
begin

  qLote.Connection := FConnBancoDados;
  qLote_Matriz.Connection := FConnBancoDados;

  qLote.Open();
  qLote_Matriz.Open();

  vaLotes := TadsObjectlist<TLote>.Create;

  try
    vaDataSet := TRFQuery.Create(nil);
    try
      vaDataSet.Connection := FConnBancoDados;
      vaDataSet.SQL.Text := 'Select config.id_aparelho from config';
      vaDataSet.Open;

      vaIdAparelho := vaDataSet.FieldByName('ID_APARELHO').AsInteger;
      if vaIdAparelho = 0 then
        raise Exception.Create('O aparelho ainda não foi registrado.');
    finally
      vaDataSet.Close;
      FreeAndNil(vaDataSet);
    end;

    while not qLote.Eof do
      begin
        vaLote := TLote.Create;
        vaLote.IdColeta := vaIdAparelho.ToString + '_' + qLoteID.AsString;
        vaLote.Nome := qLoteNOME.AsString;
        vaLote.Data := qLoteDATA.AsDateTime;
        vaLote.IdEspecie := qLoteID_ESPECIE.AsInteger;
        vaLote.Qtde := qLoteQTDE.AsFloat;

        qLote_Matriz.Filter := qLote_MatrizID_LOTE.FieldName + ' = ' + qLoteID.AsString;
        qLote_Matriz.Filtered := true;

        if not qLote_Matriz.Eof then
          begin
            vaLote.Matrizes := TadsObjectlist<TMatriz>.Create;
            while not qLote_Matriz.Eof do
              begin
                vaMatriz := TMatriz.Create;
                vaMatriz.IdServer := qLote_MatrizID_SERVER.AsInteger;

                vaLote.Matrizes.Add(vaMatriz);

                qLote_Matriz.Next;
              end;
          end;

        vaLotes.Add(vaLote);

        qLote.Next;
      end;

    if vaLotes.Count > 0 then
      begin
        vaFuncoesViveiro := TsmFuncoesViveiroClient.Create(FConnServidor.DBXConnection);
        try
          vaFuncoesViveiro.ppuSincronizarLotes(DateTimeToStr(ipDataUltimoSincronismo), vaLotes);
        finally
          vaFuncoesViveiro.Free;
        end;
        // vamos deletar todos os lotes caso a sincronização tenha dado certo
        FConnBancoDados.ExecSQL('delete from lote');

      end
    else
      vaLotes.Free;
  finally
    qLote.Close;
    qLote_Matriz.Close;
  end;

end;

procedure TfrmSincronizacao.ppvSincronizarMatrizes(ipDataUltimoSincronismo: TDateTime);
var
  vaMatrizes, vaMatrizesRetornadas: TadsObjectlist<TMatriz>;
  vaMatriz: TMatriz;
  vaEspecie: TEspecie;
  vaStream: TStream;
  vaFuncoesViveiro: TsmFuncoesViveiroClient;
  vaRetorno: String;
begin
  qMatrizSincronizacao.Close;
  qMatrizSincronizacao.Connection := FConnBancoDados;

  vaMatrizesRetornadas := nil;
  qMatrizSincronizacao.DisableControls;
  try
    try
      qMatrizSincronizacao.Open();
      qMatrizSincronizacao.First;

      vaMatrizes := TadsObjectlist<TMatriz>.Create;
      while not qMatrizSincronizacao.Eof do
        begin
          if qMatrizSincronizacaoSYNC.AsInteger = 0 then
            begin
              qMatrizSincronizacao.Edit;
              qMatrizSincronizacaoSYNC.AsInteger := coSincronizado;
              qMatrizSincronizacao.Post;

              vaMatriz := TMatriz.Create;
              vaMatriz.Id := qMatrizSincronizacaoID.AsInteger;
              vaMatriz.IdServer := qMatrizSincronizacaoID_SERVER.AsInteger;
              if vaMatriz.IdServer = 0 then
                vaMatriz.StatusRegistro := Ord(ukInsert)
              else
                vaMatriz.StatusRegistro := Ord(ukModify);

              vaEspecie := TEspecie.Create;
              vaEspecie.Id := qMatrizSincronizacaoID_ESPECIE.AsInteger;
              vaMatriz.Especie := vaEspecie;

              vaMatriz.Nome := qMatrizSincronizacaoNOME.AsString;
              vaMatriz.Endereco := qMatrizSincronizacaoENDERECO.AsString;
              vaMatriz.Latitude := qMatrizSincronizacaoLATITUDE.AsFloat;
              vaMatriz.Longitude := qMatrizSincronizacaoLONGITUDE.AsFloat;
              if not qMatrizSincronizacaoFOTO.IsNull then
                begin
                  vaStream := TBytesStream.Create;
                  try
                    qMatrizSincronizacaoFOTO.SaveToStream(vaStream);
                    vaStream.Position := 0;

                    vaMatriz.Foto := EncodeBase64.EncodeStream(vaStream);
                  finally
                    vaStream.Free;
                  end;
                end;
              vaMatrizes.Add(vaMatriz);
            end;

          qMatrizSincronizacao.Next;
        end;

      vaFuncoesViveiro := TsmFuncoesViveiroClient.Create(FConnServidor.DBXConnection);
      try
        vaRetorno := vaFuncoesViveiro.fpuSincronizarMatrizes(DateTimeToStr(ipDataUltimoSincronismo), vaMatrizes);
      finally
        vaFuncoesViveiro.Free;
      end;

      // VAMOS ATUALIZAR OS REGISTROS RETORNADOS
      if vaRetorno <> '' then
        begin
          vaMatrizesRetornadas := TJson.JsonToObject < TadsObjectlist < TMatriz >> (vaRetorno);
          try
            for vaMatriz in vaMatrizesRetornadas do
              begin
                // se achar pelo ID significa que é o registro que acabou de ser enviado, entao preciso atualizar o ID_SERVER
                if qMatrizSincronizacao.Locate(qMatrizSincronizacaoID.FieldName, vaMatriz.Id, []) then
                  qMatrizSincronizacao.Edit
                else if qMatrizSincronizacao.Locate(qMatrizSincronizacaoID_SERVER.FieldName, vaMatriz.IdServer, []) then
                  begin
                    if vaMatriz.StatusRegistro = Ord(ukModify) then
                      qMatrizSincronizacao.Edit
                    else if vaMatriz.StatusRegistro = Ord(ukDelete) then
                      qMatrizSincronizacao.Delete;
                  end
                else if vaMatriz.StatusRegistro <> Ord(ukDelete) then
                  qMatrizSincronizacao.Append;

                if qMatrizSincronizacao.State in [dsEdit, dsInsert] then
                  begin
                    qMatrizSincronizacaoID_SERVER.AsInteger := vaMatriz.IdServer;
                    qMatrizSincronizacaoSYNC.AsInteger := coSincronizado;
                    // se diferente de zero significa que é um dos registro que acabaram de ser enviados, entao, preciso atualizar somente o ID_SERVER
                    if vaMatriz.Id = 0 then
                      begin
                        qMatrizSincronizacaoNOME.AsString := vaMatriz.Nome;
                        qMatrizSincronizacaoENDERECO.AsString := vaMatriz.Endereco;
                        qMatrizSincronizacaoLATITUDE.AsFloat := vaMatriz.Latitude;
                        qMatrizSincronizacaoLONGITUDE.AsFloat := vaMatriz.Longitude;
                        qMatrizSincronizacaoID_ESPECIE.AsInteger := vaMatriz.Especie.Id;
                        if vaMatriz.Foto <> '' then
                          begin
                            vaStream := TBytesStream.Create;
                            try
                              DecoderBase64.DecodeStream(vaMatriz.Foto, vaStream);
                              vaStream.Position := 0;

                              qMatrizSincronizacaoFOTO.LoadFromStream(vaStream);
                            finally
                              vaStream.Free;
                            end;
                          end
                        else
                          qMatrizSincronizacaoFOTO.Clear;
                      end;

                    qMatrizSincronizacao.Post;
                  end;
              end;
          finally
            FreeAndNil(vaMatrizesRetornadas);
          end;
        end;

      if qMatrizSincronizacao.ChangeCount > 0 then
        begin
          qMatrizSincronizacao.ApplyUpdates(0);
          qMatrizSincronizacao.CommitUpdates;
        end;
    except
      on e: Exception do
        raise Exception.Create('Houve um erro ao sincronizar as matrizes. Detalhes: ' + e.message);
    end;
  finally
    qMatrizSincronizacao.EnableControls;

  end;
end;

end.
