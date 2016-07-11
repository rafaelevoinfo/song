unit fReconexao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasico, Vcl.StdCtrls,
  Data.DB, uClientDataSet, uProvider, uConnection, Vcl.ExtCtrls;

type
  TfrmReconexao = class(TfrmBasico)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbQtdeTentativas: TLabel;
    btnFechar: TButton;
    tmrTempo: TTimer;
    lbStatus: TLabel;
    lbTempo: TLabel;
    procedure btnFecharClick(Sender: TObject);
    procedure tmrTempoTimer(Sender: TObject);
  private
    FQuantidadeTentativas: Integer;
    procedure SetQuantidadeTentativas(const Value: Integer);
    procedure ppvReconectar;
    procedure ppvFinalizarSistema;
    { Private declarations }
  public
    property QuantidadeTentativas: Integer read FQuantidadeTentativas write SetQuantidadeTentativas;

    procedure pprAfterShow(var ipMsg: TMessage); override;

    class function fpuDetectarPerdaConexao(e: Exception): Boolean;
    class procedure ppuIniciarReconexao();
  end;

var
  frmReconexao: TfrmReconexao;

implementation

uses
  dmuPrincipal;

{$R *.dfm}

{ TfrmReconexao }

procedure TfrmReconexao.btnFecharClick(Sender: TObject);
begin
  inherited;
  ppvFinalizarSistema;
end;

procedure TfrmReconexao.ppvFinalizarSistema;
begin
  Application.Terminate;
  Abort;
end;

class function TfrmReconexao.fpuDetectarPerdaConexao(e: Exception): Boolean;
begin
  Result := false;
  if (Pos('Unable to complete network', e.Message) > 0) or
    (Pos('Software caused connection abort', e.Message) > 0) or
    (Pos('Connection Closed Gracefully', e.Message) > 0) or
    (Pos('Connection reset by peer', e.Message) > 0) or
    (Pos('Read error', e.Message) > 0) or
    (Pos('request synchronization error', e.Message) > 0) or
    (Pos('invalid transaction handle (expecting explicit transaction start)', e.Message) > 0) then
    begin
      Result := true;
    end;
end;

procedure TfrmReconexao.pprAfterShow(var ipMsg: TMessage);
begin
  Application.ProcessMessages;
  ppvReconectar;
end;

procedure TfrmReconexao.ppvReconectar;
var
  I, j: Integer;
  vaProvider: TRFProviderConnection;
begin
  inherited;
  tmrTempo.Enabled := false;
  lbTempo.Caption := 'Reconectando...';

  Application.ProcessMessages;
  try
    for I := 0 to DMPrincipal.ComponentCount - 1 do
      begin
        if DMPrincipal.Components[I] is TRFProviderConnection then
          begin
            vaProvider := TRFProviderConnection(DMPrincipal.Components[I]);
            for j := 0 to vaProvider.DataSetCount - 1 do
              begin
                if vaProvider.DataSets[j] is TRFClientDataSet then
                  begin
                    TRFClientDataSet(vaProvider.DataSets[j]).PerdeuConexao := true;
                  end;
              end;
          end;
      end;

    try
      DMPrincipal.DataSnapConn.Close;
    except
    end;

    DMPrincipal.DataSnapConn.Open;
    DMPrincipal.FuncoesGeral.fpuTestarConexao;
    Close;

  except
    Inc(FQuantidadeTentativas);
    lbQtdeTentativas.Caption := FQuantidadeTentativas.ToString();
    lbTempo.Caption := '10';
    tmrTempo.Enabled := true;
  end;
end;

class procedure TfrmReconexao.ppuIniciarReconexao();
var
  vaFrmReconexao: TfrmReconexao;
begin
  vaFrmReconexao := TfrmReconexao.Create(nil);
  try
    vaFrmReconexao.ShowModal;
  finally
    vaFrmReconexao.Free;
  end;
end;

procedure TfrmReconexao.SetQuantidadeTentativas(const Value: Integer);
begin
  FQuantidadeTentativas := Value;
end;

procedure TfrmReconexao.tmrTempoTimer(Sender: TObject);
var
  vaTempo: Integer;
begin
  inherited;
  vaTempo := StrToIntDef(lbTempo.Caption, 0);
  if vaTempo = 0 then
    ppvReconectar
  else
    begin
      vaTempo := vaTempo - 1;
      lbTempo.Caption := vaTempo.ToString();
    end;

end;

end.
