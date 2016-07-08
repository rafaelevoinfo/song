unit dmuBasico;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmBasico = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    function fprTratarErroRede(ipException: Exception): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBasico: TdmBasico;

implementation

uses
  uClientDataSet, fReconexao, dmuPrincipal;

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}


function TdmBasico.fprTratarErroRede(ipException: Exception): Boolean;
begin
  Result := false;
  if TfrmReconexao.fpuDetectarPerdaConexao(ipException) then
    begin
      Result := true;
      TfrmReconexao.ppuIniciarReconexao();
    end;
end;

procedure TdmBasico.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    begin
      if Components[I] is TRFClientDataSet then
        if not Assigned(TRFClientDataSet(Components[I]).OnTratarErroRede) then
          TRFClientDataSet(Components[I]).OnTratarErroRede := fprTratarErroRede;

    end;
end;

end.
