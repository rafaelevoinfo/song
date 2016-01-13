unit pGridValues;

interface

uses
  DBXJSONReflect, Rtti, Generics.Collections, sysUtils, ProfGrid, Vcl.Graphics;

type
  TMyGridDefText = record
    Row, Age1, Age2: Integer;
    Tipo_Age, Sexo, Text, Condicao: String;
  end;

  TTipoReferencia = (trEntreValores,trMaiorQue, trMenorQue);

  TMyGridRefValues = record
    Row, Age1, Age2: Integer;
    Text, Tipo_Age, Sexo: String;
    VlMin, VlMax, VlRefMin, VlRefMax, VlAbaixoDe, VlAcimaDe: Double;
    // VlAbaixoDe e VlAcimaDe sao referentes aos valores a serem utilizados para saber se é necessario confirmar o exame ou nao.
    TipoReferencia:TTipoReferencia;
  end;

  TMerge = (SEM_MERGE, INICIA_MERGE, PARTICIPA_MERGE);
  TTipoDado = (TEXTO, VALOR, OBSERVACAO);

  TArrayOfRefValues = Array of TMyGridRefValues;
  TArrayOfDefText = Array of TMyGridDefText;

  TMyGridConf = record
  public
    Codigo, Row, Width, OrigemDado, FontColor, FontSize, FontAlignment, Decimais, CountDefText, CountRefValues, Versao: Integer;
    {O contorno ira funcionar da seguinte maneira
     Para retrocompatibilidade
     0 - Sem Contorno
     1 - Todos os lados

     Para os novos valores
     O numero 10000 sera utilizado para indicar quais lados deverao ser impressos.
     A seguinte ordem sera seguida
     [Igora o primeiro digito][Lado esquerdo][Lado de baixo][Lado direito][Lado de cima]
     1                              0              0              0             0
     Ex.
     10000 - Nenhum
     11000 - Lado esquerdo
     10110 - Abaixo e a direita
     11110 - Esquerda, abaixo e a direita
     11111 - Todos
    }

    Contorno:Integer;
    Merge_Status: TMerge;
    TipoDado: TTipoDado;
    Editavel: Boolean;
    EditavelSemFoco:Boolean;
    Visivel: Integer;
    ExibirApenasHistInterf:Boolean;
    AutoPreencher: Boolean;
    Col, Merge_Col_Ini, Merge_Col_Fim, FontName, FontBold, FontStyle, Unidade, NameCellRef,CellGrafRef, Formula, Condicao, Text, Tag, ReferenciaDescricaoResultado, DescricaoResultado, MascaraTag: String;
    DefText: TArrayOfDefText;
    RefValues: TArrayOfRefValues;
    GraficoReferencia:TGraphic;
    ResultadoSemFormatacao:String;//usado apenas para guardar o valor do resultado da forma como o usuario o digitou
  end;

  TArrayOfTMyGridConf = array of TMyGridConf;
  TArrayOfArrayOfTMyGridConf = Array of TArrayOfTMyGridConf;

implementation


end.
