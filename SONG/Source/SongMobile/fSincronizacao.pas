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
  System.Actions, FMX.ActnList, fConfiguracoes, aduna_ds_list;

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
    qMatrizSincronizacaoFOTO: TBlobField;
    qEspecie: TRFQuery;
    qEspecieNOME: TStringField;
    EncodeBase64: TIdEncoderMIME;
    btnConfiguracoes: TButton;
    ActionList1: TActionList;
    Ac_Configuracoes: TAction;
    btnRetornar: TButton;
    qEspecieID: TFDAutoIncField;
    procedure btnSincronizarClick(Sender: TObject);
    procedure btnRetornarClick(Sender: TObject);
    procedure Ac_ConfiguracoesExecute(Sender: TObject);
  private
    procedure ppvSincronizarEspecies(ipDataUltimoSincronismo: TDateTime);
    procedure ppvSincronizarMatrizes(ipDataUltimoSincronismo: TDateTime);
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

procedure TfrmSincronizacao.Ac_ConfiguracoesExecute(Sender: TObject);
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
var
  vaCodigos: String;
begin
  inherited;
  dmPrincipal.ppuAbrirConfig;
  dmPrincipal.ppuConectarServidor;

  ppvSincronizarEspecies(dmPrincipal.qConfigDATA_ULTIMA_SYNC.AsDateTime);
  // ppvSincronizarMatrizes(dmPrincipal.qConfig.FieldByName('DATA_ULTIMA_SYNC').AsDateTime);

  if dmPrincipal.qConfig.Eof then
    dmPrincipal.qConfig.Append
  else
    dmPrincipal.qConfig.Edit;

  dmPrincipal.qConfigDATA_ULTIMA_SYNC.AsDateTime := now;
  dmPrincipal.qConfig.Post;

end;

procedure TfrmSincronizacao.ppvSincronizarEspecies(ipDataUltimoSincronismo: TDateTime);
var
  vaEspecies: TadsObjectlist<TEspecie>;
  vaEspecie: TEspecie;
  vaResult, vaCodigos: String;
begin
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
              if vaEspecie.StatusRegistro <> Ord(srExcluido) then
                begin
                  if qEspecie.Locate('ID', vaEspecie.Id, []) then
                    qEspecie.Edit
                  else
                    qEspecie.Append;

                  qEspecieNOME.AsString := vaEspecie.Nome;
                  qEspecie.Post;
                end
              else
                begin
                  if qEspecie.Locate('ID', vaEspecie.Id, []) then
                    qEspecie.Delete;
                end;
            end;

          // dmPrincipal.Connection.ExecSQL('delete from especie where especie.id not in ('+vaCodigos+')')

        end;
    end;
end;

procedure TfrmSincronizacao.ppvSincronizarMatrizes(ipDataUltimoSincronismo: TDateTime);
var
  vaMatrizes: TList<TMatriz>;
  vaMatriz: TMatriz;
  vaEspecie: TEspecie;
  vaStream: TStream;
  vaJsonMatrizes: String;
begin
  qMatrizSincronizacao.DisableControls;
  try
    qMatrizSincronizacao.Close;
    qMatrizSincronizacao.MacroByName('WHERE').AsRaw := 'where Matriz.SYNC = 0 ';
    qMatrizSincronizacao.Open();

    qMatrizSincronizacao.First;
    if not qMatrizSincronizacao.Eof then
      begin
        vaMatrizes := TList<TMatriz>.Create;
        try
          while not qMatrizSincronizacao.Eof do
            begin
              vaMatriz := TMatriz.Create;
              vaMatriz.Id := qMatrizSincronizacaoID.AsInteger;

              vaEspecie := TEspecie.Create;
              vaEspecie.Id := qMatrizSincronizacaoID_ESPECIE.AsInteger;
              vaMatriz.Especie := vaEspecie;

              vaMatriz.Nome := qMatrizSincronizacaoNOME.AsString;
              vaMatriz.Endereco := qMatrizSincronizacaoENDERECO.AsString;
              vaMatriz.Latitude := qMatrizSincronizacaoLATITUDE.AsFloat;
              vaMatriz.Longitude := qMatrizSincronizacaoID.AsFloat;
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
              qMatrizSincronizacao.Next;
            end;

          vaJsonMatrizes := TJson.ObjectToJsonString(vaMatrizes);
          dmPrincipal.FuncoesViveiro.fpuSincronizarMatrizes(vaJsonMatrizes);

        finally
          for vaMatriz in vaMatrizes do
            begin
              vaMatriz.Free;
            end;
          vaMatrizes.Clear;
          vaMatrizes.Free;
        end;
      end;
  finally
    qMatrizSincronizacao.Filtered := false;
    qMatrizSincronizacao.EnableControls;
  end;

end;

end.
