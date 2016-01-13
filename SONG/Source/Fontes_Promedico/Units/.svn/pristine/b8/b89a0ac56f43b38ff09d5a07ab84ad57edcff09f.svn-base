unit pClassListaForms;

interface

Uses
  Dialogs, Windows, StdCtrls, Classes, cxGridDBTableView, SysUtils, Forms, Menus,
  DB, CxPc, Controls, Graphics, jpeg, ActnList;

Type
  TAbrirForm = procedure (Sender : TObject) of Object; //fora da classe pois as 2 classes irão usar
  THackedWinControl = class(TWinControl);//foi necessario herdar para que possa utilizar o onKeyPress, pois no wincontrol é protected
  THackedForm = class(TForm);

Type
  TClassForms = Class  //class para guardar o form e seu atributos
    private
      function RezizeImg(ipImg : TBitmap): TBitmap;
      procedure pvKeyPress(Sender: TObject; var Key: Char);
    public
      Formulario  : TForm;  //formulario
      PodeFechar: Boolean; // variavel que marca se pode ou não fechar;
      Posicao,Codigo : Integer; //posicao do form no pagecontrol, codigo é o codigo do form na tabela onde as imagens sao salvas
      DataSources : TList; //lista de datasources do form
      AbrirForm : TAction; //procedure que irá abrir o form
      function PegarImgForm : TMemoryStream;
      constructor Create(ipForm : TForm; ipPosicao : Integer; ipActionAbrirForm : TAction); overload; //Criando
      destructor Destroy ; overload;//ao fechar o form
  End;

Type
  TClassFormsAbertos = class  //classe onde contem todos os forms do projeto, é nessa classa que o programa ira interagir, abrir forms, fechar forms, etc
    private
      Type
       TAfterFormCreate = procedure(var ipForm) of Object;
    public
     Formularios : TList;//lista de formularios, vamos adicionar a classe TForms nessa variavel
     PageControlPrincipal : TcxPageControl; //pageControlPrincipal
     FormPrincipal : TForm; //form principal da aplicacao
     AfterFormCreate : TAfterFormCreate;//procedure que deverá ser executada depois de criar os forms
     constructor Create(ipMainPageControl : TcxPageControl; ipForm : TForm;ipAfterCreate :TAfterFormCreate ); overload;
     destructor Destroy ; overload;//ao destruir, usar ao fechar o programa
     function LocalizarForm(ipClass : TFormClass) : TClassForms; overload; //localiza um form, usando o classname como parametro
     function LocalizarForm(IpNome : string): TClassForms; overload;
     procedure AbrirForm(ipClass : TFormClass; var ipForm; ipImg : Integer; ipActionAbrirForm :TAction);//abrir um novo form
     procedure RemoverForm(Sender: TObject;  var ACanClose: Boolean);
     function RemoverTodosForm: Boolean;
  end;

implementation

{ TClassForms }

constructor TClassForms.Create(ipForm : TForm; ipPosicao : Integer; ipActionAbrirForm : TAction);
var
  Cont : Integer;
begin
  Formulario:= ipForm;
  PodeFechar := True;
  Posicao := ipPosicao;
  if Assigned(ipActionAbrirForm) then
    AbrirForm := ipActionAbrirForm;
  DataSources := TList.Create;
  for Cont := 0 to Formulario.ComponentCount -1 do
    Begin
      if (Formulario.Components[cont] is TWinControl) then
        if not Assigned(THackedWinControl(Formulario.Components[cont]).OnKeyPress) then
          THackedWinControl(Formulario.Components[cont]).OnKeyPress := pvKeyPress;

      if Formulario.Components[cont].ClassType=TDataSource then
        DataSources.Add(Formulario.Components[Cont]);
    End;
end;

destructor TClassForms.Destroy;
begin
  Formulario.Close;
  Formulario.Free;
  FreeAndNil(DataSources);
end;

procedure TClassForms.pvKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0;
      THackedForm(Formulario).SelectNext(Screen.ActiveControl as TWinControl, True, True); // Forward
    end;
end;

function TClassForms.PegarImgForm: TMemoryStream;
var
  vaStream : TMemoryStream;
  vaimgBmp : TBitmap;
  vaimgJPeg : TJPEGImage;
  thumbRect : TRect;
begin
  try
    vaStream := TMemoryStream.Create;
    vaimgBmp :=  Formulario.GetFormImage;
    vaimgBmp.PixelFormat:=pf32bit;
    vaimgBmp:=RezizeImg(vaImgBmp);
    vaimgJPeg := TJPEGImage.Create;
    vaimgJPeg.Assign(vaimgBmp);
    vaimgJPeg.SaveToStream(vaStream);
    Result:=vaStream;
  finally
       //nao pode dar free no stream se nao o parametro é perdido;
    vaImgJpeg.Free;
    vaimgBmp.Free;
  end;
end;

function TClassForms.RezizeImg(ipImg: TBitmap): TBitmap;
var
   thumbnail : TBitmap;
   thumbRect : TRect;
   maxWidth : Integer;
   maxHeight : Integer;
 begin
   thumbnail := ipImg;
   maxWidth:=Trunc(thumbnail.Width/2);
   if maxWidth<800 then
    maxWidth:=800; //nao deixar menor que 800
   maxHeight:=Trunc(thumbnail.Height/2);
   if maxHeight<600 then
    maxHeight:=600;//nao deixarmenor que 600
   try
     thumbRect.Left := 0;
     thumbRect.Top := 0;

     //resize proporcional
     if thumbnail.Width > thumbnail.Height then
     begin
       thumbRect.Right := maxWidth;
       thumbRect.Bottom := (maxWidth * thumbnail.Height) div thumbnail.Width;
     end
     else
     begin
       thumbRect.Bottom := maxHeight;
       thumbRect.Right := (maxHeight * thumbnail.Width) div thumbnail.Height;
     end;

     thumbnail.Canvas.StretchDraw(thumbRect, thumbnail) ;

    //resize image
     thumbnail.Width := thumbRect.Right;
     thumbnail.Height := thumbRect.Bottom;

     //display in a TImage control
   finally
     Result:=thumbnail;
   end;
end;

{ TClassFormsAbertos }

constructor TClassFormsAbertos.Create(ipMainPageControl : TcxPageControl; ipForm : TForm; ipAfterCreate :TAfterFormCreate);
begin
  PageControlPrincipal:=ipMainPageControl;
  PageControlPrincipal.OnCanClose:=RemoverForm;
  FormPrincipal := ipForm;
  Formularios := TList.Create;
  AfterFormCreate := ipAfterCreate;
end;

destructor TClassFormsAbertos.Destroy;
begin
  FreeAndNil(Formularios);
end;


function TClassFormsAbertos.LocalizarForm(IpNome: string): TClassForms;
var
  Cont : Integer;
begin
  Result := nil;
  for Cont := 0 to Formularios.Count -1 do //percorrer a lista atraz do form
    Begin
     if TClassForms(Formularios.Items[Cont]).Formulario.Name=IpNome then
      Begin
        Result:=TClassForms(Formularios.Items[Cont]);
        Break;
      End;
    End;

end;

function TClassFormsAbertos.LocalizarForm(ipClass: TFormClass): TClassForms;
var
  Cont : Integer;
begin
  Result := nil;
  for Cont := 0 to Formularios.Count -1 do //percorrer a lista atraz do form
    Begin
     if TClassForms(Formularios.Items[Cont]).Formulario.ClassName=ipClass.ClassName then
      Begin
        Result:=TClassForms(Formularios.Items[Cont]);
        Break;
      End;
    End;
end;

procedure TClassFormsAbertos.RemoverForm(Sender: TObject;  var ACanClose: Boolean);
var
  vaIndex,cont : Integer;
begin
  if (Sender = PageControlPrincipal) then
    Begin
      if PageControlPrincipal.ActivePageIndex=0 then
        ACanClose:=False
      else
        Begin
          vaIndex:=TcxPageControl(Sender).ActivePage.Tag;
          if TClassForms(Formularios.Items[vaIndex]).PodeFechar then
            begin
              TClassForms(Formularios.Items[vaIndex]).Destroy;
              Formularios.Delete(vaIndex);
              ACanClose:=True;
              for cont := 0 to PageControlPrincipal.PageCount-1 do //atualizando os tags
                if PageControlPrincipal.Pages[cont].Tag>vaIndex then
                  PageControlPrincipal.Pages[cont].Tag:=PageControlPrincipal.Pages[cont].Tag-1;
            end
          else
            begin
              ACanClose := False;
              ShowMessage('Aba de ' + TcxPageControl(Sender).ActivePage.Caption + ' esta em Edição e não pode ser Fechado!');
            end;
        End;
    End;
end;

function TClassFormsAbertos.RemoverTodosForm: Boolean;
var
  I: Integer;
  vaPosicao, cont: Integer;
  vaFechar: Boolean;
begin
  Result := True;
  for Cont:=Formularios.Count -1 downto 0  do //percorrer a lista atraz do form
    Begin
      vaPosicao := TClassForms(Formularios.Items[cont]).Posicao;
      PageControlPrincipal.ActivePageIndex := vaPosicao;
      RemoverForm(PageControlPrincipal, vaFechar);
      if vaFechar then
        PageControlPrincipal.Pages[vaPosicao].Free
      else
        Result := False;
    End;
end;

procedure TClassFormsAbertos.AbrirForm(ipClass: TFormClass; var ipForm;  ipImg: Integer; ipActionAbrirForm :TAction);
var
  vaForm : TClassForms;
  vaTabSheet: TcxTabSheet;
begin
  vaForm:=LocalizarForm(ipClass);
  if Assigned(vaForm) then //tem form
    PageControlPrincipal.ActivePageIndex:=vaForm.Posicao
  else
    Begin
      vaTabSheet := TcxTabSheet.Create(FormPrincipal);
      vaTabSheet.PageControl:=PageControlPrincipal;
      Application.CreateForm(ipClass,ipForm);
      vaForm := TClassForms.Create(TForm(ipForm),PageControlPrincipal.PageCount-1,ipActionAbrirForm);
      Formularios.Add(vaForm);
      vaTabSheet.Name:='tab'+TForm(ipForm).Name;
      vaTabSheet.Tag:=Formularios.Count-1;//para poder localizar o form pelo tabsheet
      if Assigned(AfterFormCreate) then
        AfterFormCreate(ipForm);
      with TForm(ipForm) do
      begin
        Align       := alClient;
        BorderStyle := bsNone;
        Parent      := vaTabSheet;
      end;
      with vaTabSheet do
      begin
        Caption     := ipActionAbrirForm.Caption;
        ImageIndex  := ipActionAbrirForm.ImageIndex;
      end;
      TForm(ipForm).Show;
      PageControlPrincipal.ActivePage:=vaTabSheet;
    End;
end;

End.
