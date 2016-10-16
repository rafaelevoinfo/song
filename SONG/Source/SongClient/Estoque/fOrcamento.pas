unit fOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fBasicoCrud, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxButtonEdit, Vcl.Menus, Vcl.ExtDlgs,
  System.Actions, Vcl.ActnList, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxGroupBox, cxRadioGroup, Vcl.StdCtrls, cxDropDownEdit, cxImageComboBox,
  cxTextEdit, cxMaskEdit, cxCalendar, Vcl.ExtCtrls, cxPC, dmuEstoque, uTypes,
  System.TypInfo, uControleAcesso, dmuLookup, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, uClientDataSet, dmuPrincipal, cxDBEdit, fCliente,
  cxScrollBox, fmEditor, uMensagem, System.RegularExpressions;

type
  TfrmOrcamento = class(TfrmBasicoCrud)
    dsOrcamento_Orcamento: TDataSource;
    viewRegistrosID: TcxGridDBColumn;
    viewRegistrosID_MODELO_ORCAMENTO: TcxGridDBColumn;
    viewRegistrosNOME: TcxGridDBColumn;
    viewRegistrosID_RESPONSAVEL: TcxGridDBColumn;
    viewRegistrosRESPONSAVEL: TcxGridDBColumn;
    viewRegistrosID_CLIENTE: TcxGridDBColumn;
    viewRegistrosCLIENTE: TcxGridDBColumn;
    viewRegistrosDATA: TcxGridDBColumn;
    cbPesquisaCliente: TcxLookupComboBox;
    cbPesquisaVendedor: TcxLookupComboBox;
    lbl5: TLabel;
    cbCliente: TcxDBLookupComboBox;
    btnAdicionarCliente: TButton;
    cbVendedor: TcxDBLookupComboBox;
    lbl1: TLabel;
    lbl2: TLabel;
    EditDataOrcamento: TcxDBDateEdit;
    Ac_Adicionar_Cliente: TAction;
    cbModelo: TcxDBLookupComboBox;
    Label3: TLabel;
    pnEditsCadastroTop: TPanel;
    frameEditor: TframeEditor;
    ScrollCampos: TcxScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure cbClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ac_Adicionar_ClienteExecute(Sender: TObject);
    procedure tabCadastroShow(Sender: TObject);
    procedure cbModeloPropertiesEditValueChanged(Sender: TObject);
  private
    dmEstoque: TdmEstoque;
    dmLookup: TdmLookup;
    procedure ppvCarregarClientes;
    procedure ppvAdicionarCliente;
    procedure ppvAbrirCdsFilhos;
    procedure ppvCarregarModelo(ipIdModelo: Integer);
    procedure ppvLimparOrcamento;
    procedure ppvLimparMarcadores;
    procedure ppvCarregarMarcadoresModelo;
    procedure ppvAdicionarMarcador(ipLinha: Integer; ipDescricao: String; ipValor: String = '');
    procedure ppvCarregarMarcadoresCds;
  protected
    function fprGetPermissao: String; override;
    function fprConfigurarControlesPesquisa: TWinControl; override;
    procedure pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet); override;

    procedure pprBeforeSalvar; override;
    procedure pprAfterSalvar(ipAcaoExecutada: TDataSetState); override;
  public
    procedure ppuIncluir; override;
    procedure ppuAlterar(ipId: Integer); override;
    procedure ppuRetornar; override;
    { Public declarations }
  end;

var
  frmOrcamento: TfrmOrcamento;

const
  coPesquisaCliente = 5;
  coPesquisaVendedor = 6;

implementation

{$R *.dfm}


procedure TfrmOrcamento.Ac_Adicionar_ClienteExecute(Sender: TObject);
begin
  inherited;
  ppvAdicionarCliente;
end;

procedure TfrmOrcamento.cbClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    ppvAdicionarCliente;
end;

procedure TfrmOrcamento.ppvCarregarModelo(ipIdModelo: Integer);
begin
  if dmLookup.cdslkModelo_Orcamento.Locate(TBancoDados.coId, ipIdModelo, []) then
    begin
      dmLookup.cdslkModelo_Orcamento_Orcamento.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
      dmLookup.ppuAbrirCache(dmLookup.cdslkModelo_Orcamento_Orcamento);
      // se o recordcount for zero significa que o cache q tinha nao era referente a este modelo
      if dmLookup.cdslkModelo_Orcamento_Orcamento.RecordCount = 0 then
        begin
          dmLookup.cdslkModelo_Orcamento_Orcamento.ppuDataRequest();
          if dmLookup.cdslkModelo_Orcamento_Orcamento.RecordCount > 0 then
            dmLookup.ppuSalvarCache(dmLookup.cdslkModelo_Orcamento_Orcamento);
        end;

      dmEstoque.cdsOrcamento_Orcamento.Edit;
      dmEstoque.cdsOrcamento_OrcamentoORCAMENTO.Assign(dmLookup.cdslkModelo_Orcamento_OrcamentoMODELO);
      dmEstoque.cdsOrcamento_Orcamento.Post;

      ppvCarregarMarcadoresModelo;
    end;
end;

procedure TfrmOrcamento.ppvCarregarMarcadoresModelo;
var
  I: Integer;
  vaMarcadores: TMatchCollection;
  vaMarcador: TMatch;
  vaLinhaUltimaEspecie, vaLinha: Integer;
begin
  ppvLimparMarcadores;

  vaLinhaUltimaEspecie := -1;
  vaLinha := 1;
  for I := 0 to frameEditor.Rich.Lines.Count - 1 do
    begin
      vaMarcadores := TRegEx.Matches(frameEditor.Rich.Lines[I], '(?<=' + TRegEx.Escape(coInicioMarcador) + ').+?(?=' + TRegEx.Escape(coFimMarcador) + ')', []);
      for vaMarcador in vaMarcadores do
        begin
          if vaMarcador.Value = MarcadorOrcamento[moEspecie] then
            begin
              vaLinhaUltimaEspecie := vaLinha;
              ppvAdicionarMarcador(vaLinha, vaMarcador.Value);
              Inc(vaLinha);
            end
          else if (vaMarcador.Value = MarcadorOrcamento[moNomeCientifico]) or
            (vaMarcador.Value = MarcadorOrcamento[moFamiliaBotanica]) or
            (vaMarcador.Value = MarcadorOrcamento[moTamanho]) or
            (vaMarcador.Value = MarcadorOrcamento[moQtdeMuda]) or
            (vaMarcador.Value = MarcadorOrcamento[moValorUnitarioMuda]) or
            (vaMarcador.Value = MarcadorOrcamento[moValorTotalMuda]) then
            begin
              if vaLinhaUltimaEspecie <> -1 then
                ppvAdicionarMarcador(vaLinhaUltimaEspecie, vaMarcador.Value)
              else
                begin
                  ppvAdicionarMarcador(vaLinha, vaMarcador.Value);
                  Inc(vaLinha);
                end;
            end
          else
            begin
              vaLinhaUltimaEspecie := -1;
              ppvAdicionarMarcador(vaLinha, vaMarcador.Value);
              Inc(vaLinha);
            end;
        end;
    end;
end;

procedure TfrmOrcamento.ppvCarregarMarcadoresCds;
var
  vaLinhaUltimaEspecie: Integer;
begin
  ppvLimparMarcadores;

  vaLinhaUltimaEspecie := -1;

  while not dmEstoque.cdsOrcamento_Valor.eof do
    begin
      if dmEstoque.cdsOrcamento_ValorCAMPO.AsString = MarcadorOrcamento[moEspecie] then
        begin
          vaLinhaUltimaEspecie := dmEstoque.cdsOrcamento_Valor.RecNo;
          ppvAdicionarMarcador(dmEstoque.cdsOrcamento_Valor.RecNo, dmEstoque.cdsOrcamento_ValorCAMPO.AsString, dmEstoque.cdsOrcamento_ValorVALOR.AsString);
        end
      else if (dmEstoque.cdsOrcamento_ValorCAMPO.AsString <> MarcadorOrcamento[moCustomizado]) then
        if vaLinhaUltimaEspecie <> -1 then
          ppvAdicionarMarcador(vaLinhaUltimaEspecie, dmEstoque.cdsOrcamento_ValorCAMPO.AsString, dmEstoque.cdsOrcamento_ValorVALOR.AsString)
        else
          ppvAdicionarMarcador(dmEstoque.cdsOrcamento_Valor.RecNo, dmEstoque.cdsOrcamento_ValorCAMPO.AsString, dmEstoque.cdsOrcamento_ValorVALOR.AsString)
      else
        begin
          vaLinhaUltimaEspecie := -1;
          ppvAdicionarMarcador(dmEstoque.cdsOrcamento_Valor.RecNo, dmEstoque.cdsOrcamento_ValorCAMPO.AsString, dmEstoque.cdsOrcamento_ValorVALOR.AsString)
        end;

      dmEstoque.cdsOrcamento_Valor.Next;
    end;
end;

procedure TfrmOrcamento.ppvAdicionarMarcador(ipLinha: Integer; ipDescricao: String; ipValor: String);
var
  I: Integer;
  vaPanel, vaPanelMarcador: TPanel;
  vaLabel: TLabel;
  vaEdit: TcxTextEdit;
begin
  vaPanel := nil;
  for I := 0 to ScrollCampos.ControlCount - 1 do
    begin
      if (ScrollCampos.Controls[I] is TPanel) and (TPanel(ScrollCampos.Controls[I]).Tag = ipLinha) then
        begin
          vaPanel := ScrollCampos.Controls[I] as TPanel;
          break;
        end;
    end;
  if not Assigned(vaPanel) then
    begin
      vaPanel := TPanel.Create(Self);
      vaPanel.Width := 0;
      vaPanel.Caption := '';
      vaPanel.Tag := ipLinha;
      vaPanel.Align := alNone;
      vaPanel.Height := 22;
      vaPanel.Top := vaPanel.Height * (ipLinha - 1);
      vaPanel.Parent := ScrollCampos;
    end;

  vaPanelMarcador := TPanel.Create(Self);
  vaPanelMarcador.Parent := vaPanel;
  vaPanelMarcador.Height := 21;
  vaPanelMarcador.Width := 350;
  vaPanelMarcador.Caption := '';
  vaPanelMarcador.Align := AlLeft;
  vaPanelMarcador.AlignWithMargins := true;
  vaPanelMarcador.Margins.Top := 0;
  vaPanelMarcador.Margins.Left := 0;
  vaPanelMarcador.Margins.Bottom := 0;
  vaPanelMarcador.BevelOuter := bvNone;

  vaPanel.Width := vaPanel.Width + vaPanelMarcador.Width;

  vaLabel := TLabel.Create(Self);
  vaLabel.Caption := ipDescricao;
  vaLabel.Height := 21;
  vaLabel.Align := AlLeft;
  vaLabel.Parent := vaPanelMarcador;

  vaEdit := TcxTextEdit.Create(Self);
  vaEdit.Height := 21;
  vaEdit.Align := alClient;
  vaEdit.Parent := vaPanelMarcador;
  if ipValor <> '' then
    vaEdit.Text := ipValor;
end;

procedure TfrmOrcamento.ppvLimparOrcamento;
begin
  if (pcPrincipal.ActivePage = tabCadastro) then
    begin
      if (dmEstoque.cdsOrcamento_Orcamento.RecordCount > 0) then
        begin
          dmEstoque.cdsOrcamento_Orcamento.Edit;
          dmEstoque.cdsOrcamento_OrcamentoORCAMENTO.Clear;
          dmEstoque.cdsOrcamento_Orcamento.Post;

          dmEstoque.cdsOrcamento_Valor.First;
          while not dmEstoque.cdsOrcamento_Valor.eof do
            dmEstoque.cdsOrcamento_Valor.Delete;
        end;

      ppvLimparMarcadores;
    end;
end;

procedure TfrmOrcamento.ppvLimparMarcadores;
var
  I: Integer;
begin
  ScrollCampos.LockScrollBars;
  try
    for I := ScrollCampos.ControlCount - 1 downto 0 do
      begin
        if ScrollCampos.Controls[I] is TPanel then
          begin
            ScrollCampos.Controls[I].Visible := false;
            ScrollCampos.Controls[I].Parent := Self;
          end;
      end;
  finally
    ScrollCampos.UnlockScrollBars;
  end;

end;

procedure TfrmOrcamento.cbModeloPropertiesEditValueChanged(Sender: TObject);
  procedure plCarregarModelo;
  begin
    if not VarIsNull(cbModelo.EditValue) then
      ppvCarregarModelo(cbModelo.EditValue)
    else
      ppvLimparOrcamento;
  end;

begin
  inherited;
  if (pcPrincipal.ActivePage = tabCadastro) and dmEstoque.cdsOrcamento_Valor.Active then
    begin
      if (dmEstoque.cdsOrcamento_Valor.RecordCount > 0) then
        begin
          if TMensagem.fpuPerguntar('Já existem marcadores configurados para este orçamento.' + slinebreak +
            'Se o modelo for alterado os marcadores serão perdidos.' +
            slinebreak + 'Tem certeza que deseja alterar o modelo?', ppSimNao) = rpSim then
            begin
              plCarregarModelo;
            end
          else
            begin
              cbModelo.LockChangeEvents(true);
              try
                cbModelo.EditValue := dmEstoque.cdsOrcamentoID_MODELO_ORCAMENTO.AsInteger;
                cbModelo.PostEditValue;
              finally
                cbModelo.LockChangeEvents(false, false);
              end;
            end;
        end
      else
        plCarregarModelo;
    end;
end;

procedure TfrmOrcamento.ppvAdicionarCliente;
var
  vaFrmCliente: TfrmCliente;
begin
  vaFrmCliente := TfrmCliente.Create(nil);
  try
    vaFrmCliente.ppuConfigurarModoExecucao(meSomenteCadastro);
    vaFrmCliente.ShowModal;
    if vaFrmCliente.IdEscolhido <> 0 then
      begin
        ppvCarregarClientes;
        if dmLookup.cdslkFin_For_Cli.Locate(TBancoDados.coId, vaFrmCliente.IdEscolhido, []) then
          begin
            cbCliente.EditValue := vaFrmCliente.IdEscolhido;
            cbCliente.PostEditValue;
          end;
      end;
  finally
    vaFrmCliente.Free;
  end;
end;

procedure TfrmOrcamento.FormCreate(Sender: TObject);
begin
  dmEstoque := TdmEstoque.Create(Self);
  dmEstoque.Name := '';

  dmLookup := TdmLookup.Create(Self);
  dmLookup.Name := '';

  inherited;

  PesquisaPadrao := Ord(tppData);

  dmLookup.ppuCarregarPessoas(0, [trpFuncionario, trpEstagiario, trpVoluntario, trpMembroDiretoria]);

  dmLookup.cdslkModelo_Orcamento.ppuAddParametro(TParametros.coTodos, 'NAO_IMPORTA');
  dmLookup.ppuAbrirCache(dmLookup.cdslkModelo_Orcamento);
  ppvCarregarClientes;
end;

procedure TfrmOrcamento.pprAfterSalvar(ipAcaoExecutada: TDataSetState);
var
  vaOrcamento: TBytesStream;
begin
  inherited;
  if ipAcaoExecutada = dsInsert then
    begin
      // se estava incluindo nao posso dar apply pq o codigo estara o mesmo do cds principal o que causaria um key violation
      vaOrcamento := TBytesStream.Create;
      try
        dmEstoque.cdsOrcamento_Orcamento.Edit;
        dmEstoque.cdsOrcamento_OrcamentoID.AsInteger := dmEstoque.cdsOrcamentoID.AsInteger;
        dmEstoque.cdsOrcamento_OrcamentoORCAMENTO.SaveToStream(vaOrcamento);
        dmEstoque.cdsOrcamento_OrcamentoORCAMENTO.Clear;
        dmEstoque.cdsOrcamento_Orcamento.Post;
        dmEstoque.cdsOrcamento_Orcamento.MergeChangeLog;

        dmEstoque.cdsOrcamento_Orcamento.Edit;
        vaOrcamento.Position := 0;
        dmEstoque.cdsOrcamento_OrcamentoORCAMENTO.LoadFromStream(vaOrcamento);
        dmEstoque.cdsOrcamento_Orcamento.Post;
      finally
        vaOrcamento.Free;
      end;
      dmEstoque.cdsOrcamento_Orcamento.Edit;
    end;
  if dmEstoque.cdsOrcamento_Orcamento.ChangeCount > 0 then
    dmEstoque.cdsOrcamento_Orcamento.ApplyUpdates(0);

  if dmEstoque.cdsOrcamento_Valor.ChangeCount > 0 then
    dmEstoque.cdsOrcamento_Valor.ApplyUpdates(0)
end;

procedure TfrmOrcamento.pprBeforeSalvar;
begin
  inherited;

end;

procedure TfrmOrcamento.pprCarregarParametrosPesquisa(ipCds: TRFClientDataSet);
begin
  inherited;
  if cbPesquisarPor.EditValue = coPesquisaCliente then
    ipCds.ppuAddParametro(TParametros.coCliente, cbPesquisaCliente.EditValue)
  else if cbPesquisarPor.EditValue = coPesquisaVendedor then
    ipCds.ppuAddParametro(TParametros.coVendedor, cbPesquisaVendedor.EditValue)
end;

procedure TfrmOrcamento.ppvAbrirCdsFilhos;
begin
  dmEstoque.cdsOrcamento_Orcamento.ParamByName('ID').AsInteger := dmEstoque.cdsOrcamentoID.AsInteger;
  dmEstoque.cdsOrcamento_Orcamento.Open;
  dmEstoque.cdsOrcamento_Valor.Open;
end;

procedure TfrmOrcamento.ppuAlterar(ipId: Integer);
begin
  inherited;
  ppvAbrirCdsFilhos;
  if dmEstoque.cdsOrcamento_Valor.RecordCount > 0 then
    begin
      ppvCarregarMarcadoresCds;

    end;
end;

procedure TfrmOrcamento.ppuIncluir;
begin
  inherited;
  ppvAbrirCdsFilhos;
  dmEstoque.cdsOrcamentoDATA.AsDateTime := now;

  dmEstoque.cdsOrcamento_Orcamento.Append;
  dmEstoque.cdsOrcamento_OrcamentoID.AsInteger := 1; // apenas para conseguir fazer o post
  dmEstoque.cdsOrcamento_OrcamentoORCAMENTO.Clear;
  dmEstoque.cdsOrcamento_Orcamento.Post;
end;

procedure TfrmOrcamento.ppuRetornar;
begin
  dmEstoque.cdsOrcamento_Orcamento.CancelUpdates;
  dmEstoque.cdsOrcamento_Valor.CancelUpdates;

  dmEstoque.cdsOrcamento_Orcamento.Close;
  dmEstoque.cdsOrcamento_Valor.Close;
  inherited;
end;

procedure TfrmOrcamento.ppvCarregarClientes;
begin
  dmLookup.cdslkFin_For_Cli.ppuDataRequest([TParametros.coTipo], [Ord(tfCliente)], TOperadores.coAnd, true);
end;

procedure TfrmOrcamento.tabCadastroShow(Sender: TObject);
begin
  inherited;
  frameEditor.ppuIniciar;
end;

function TfrmOrcamento.fprConfigurarControlesPesquisa: TWinControl;
begin
  Result := inherited;
  cbPesquisaVendedor.Visible := (cbPesquisarPor.EditValue = coPesquisaVendedor);
  cbPesquisaCliente.Visible := cbPesquisarPor.EditValue = coPesquisaCliente;

  EditPesquisa.Visible := EditPesquisa.Visible and (not(cbPesquisaVendedor.Visible or cbPesquisaCliente.Visible));

  if cbPesquisaVendedor.Visible then
    Result := cbPesquisaVendedor
  else if cbPesquisaCliente.Visible then
    Result := cbPesquisaCliente;
end;

function TfrmOrcamento.fprGetPermissao: String;
begin
  Result := GetEnumName(TypeInfo(TPermissaoEstoque), Ord(estOrcamento));
end;

end.
