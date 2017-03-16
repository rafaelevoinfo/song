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
  System.Actions, FMX.ActnList, fConfiguracoes, aduna_ds_list, uConstantes;

type
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
    procedure btnSincronizarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
  private
    procedure ppvSincronizarEspecies(ipDataUltimoSincronismo: TDateTime);
    procedure ppvSincronizarMatrizes(ipDataUltimoSincronismo: TDateTime);
    procedure ppvSincronizarLotes(ipDataUltimoSincronismo: TDateTime);
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

  try
    dmPrincipal.ppuAbrirConfig;
    if dmPrincipal.qConfigID_APARELHO.IsNull then
      raise Exception.Create('É necessário registrar o aparelho antes de qualquer sincronização.');

    dmPrincipal.ppuConectarServidor;

    ppvSincronizarEspecies(dmPrincipal.qConfigDATA_ULTIMA_SYNC.AsDateTime);
    lbiEspecies.ItemData.Accessory := TListBoxItemData.TAccessory.aCheckmark;
    lbiEspecies.Repaint;

    ppvSincronizarMatrizes(dmPrincipal.qConfigDATA_ULTIMA_SYNC.AsDateTime);
    lbiMatrizes.ItemData.Accessory := TListBoxItemData.TAccessory.aCheckmark;
    lbiMatrizes.Repaint;

    ppvSincronizarLotes(dmPrincipal.qConfigDATA_ULTIMA_SYNC.AsDateTime);
    lbiLotes.ItemData.Accessory := TListBoxItemData.TAccessory.aCheckmark;

    if dmPrincipal.qConfig.Eof then
      dmPrincipal.qConfig.Append
    else
      dmPrincipal.qConfig.Edit;

    dmPrincipal.qConfigDATA_ULTIMA_SYNC.AsDateTime := now;
    dmPrincipal.qConfig.Post;

    ShowMessage('Sincronização realizada com sucesso.');
  except
    on e: Exception do
      ShowMessage(e.Message);
  end;

end;

procedure TfrmSincronizacao.ppvSincronizarEspecies(ipDataUltimoSincronismo: TDateTime);
var
  vaEspecies: TadsObjectlist<TEspecie>;
  vaEspecie: TEspecie;
  vaResult, vaCodigos: String;
begin
  if ipDataUltimoSincronismo = 0 then
    vaResult := dmPrincipal.FuncoesViveiro.fpuSincronizarEspecies('')
  else
    vaResult := dmPrincipal.FuncoesViveiro.fpuSincronizarEspecies(DateToStr(ipDataUltimoSincronismo));
  if vaResult <> '' then
    begin
      vaEspecies := TJson.JsonToObject < TadsObjectlist < TEspecie >> (vaResult);
      qEspecie.Close;
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
begin
  qLote.Open();
  qLote_Matriz.Open();
  vaLotes := TadsObjectlist<TLote>.Create;
  try
    while not qLote.Eof do
      begin
        vaLote := TLote.Create;
        vaLote.IdColeta := dmPrincipal.qConfigID_APARELHO.AsString + '_' + qLoteID.AsString;
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
        dmPrincipal.FuncoesViveiro.ppuSincronizarLotes(DateTimeToStr(ipDataUltimoSincronismo), vaLotes);
        dmPrincipal.Connection.ExecSQL('delete from lote');
        // vamos deletar todos os lotes caso a sincronização tenha dado certo
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
  vaMatrizes: TadsObjectlist<TMatriz>;
  vaMatriz: TMatriz;
  vaEspecie: TEspecie;
  vaStream: TStream;
begin
  qMatrizSincronizacao.DisableControls;
  try
    try
      qMatrizSincronizacao.Close;
      qMatrizSincronizacao.Open();

      qMatrizSincronizacao.First;
      if not qMatrizSincronizacao.Eof then
        begin
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

          dmPrincipal.ppuAbrirConfig;
          vaMatrizes := dmPrincipal.FuncoesViveiro.fpuSincronizarMatrizes(DateTimeToStr(ipDataUltimoSincronismo),
            vaMatrizes);
          // VAMOS ATUALIZAR OS REGISTROS RETORNADOS
          if Assigned(vaMatrizes) then
            begin
              for vaMatriz in vaMatrizes do
                begin
                  // se achar pelo ID significa que é o registro que acabou de ser enviado, entao preciso atualizar o ID_SERVER
                  if qMatrizSincronizacao.Locate(qMatrizSincronizacaoID.FieldName, vaMatriz.Id, []) then
                    qMatrizSincronizacao.Edit
                  else if qMatrizSincronizacao.Locate(qMatrizSincronizacaoID_SERVER.FieldName, vaMatriz.IdServer, [])
                  then
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
            end;

        end;

      if qMatrizSincronizacao.ChangeCount > 0 then
        begin
          qMatrizSincronizacao.ApplyUpdates(0);
          qMatrizSincronizacao.CommitUpdates;
        end;
    except
      on e: Exception do
        raise Exception.Create('Houve um erro ao sincronizar as matrizes. Detalhes: ' + e.Message);
    end;
  finally
    qMatrizSincronizacao.EnableControls;
  end;

end;

end.
