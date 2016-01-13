unit pUtils;

interface

uses
  Data.DBXJSON, System.JSON, System.Generics.Defaults, System.Classes,
  System.SysUtils, Generics.Collections, System.Rtti, pAtributos,
  System.StrUtils, System.UITypes,
  System.UIConsts, System.RegularExpressions, System.Types, Vcl.Dialogs,
  Winapi.Windows,

  System.TypInfo, Data.DB, pTypes, aduna_ds_list, Data.DBXJSONCommon, Data.DBXJSONReflect; // Não mude a ordem desta duas units

type
  TUtils = class
  public
    class function fpuCapitalize(const ipTexto: string): string;
    class function fpuConverterClassToJson(ipObj: TObject): TJSONObject;
    class function fpuConverterDataSetToClass(ipDataSet: TDataSet; ipClass: TClass): TObject;
    class function fpuConverterDataSetToJson(ipPairName: String; ipDataSet: TDataSet; ipClass: TClass): TJSONObject;
    class function fpuConverterJsonToClass<T: class>(ipJson: TJSONObject): T;
    class function fpuConverterRegistroDataSetToJson(ipDataSet: TDataSet; ipClass: TClass; ipPrefix: string = ''): TJSONObject;
    class function fpuPegarFontesComputador: TStringList;
    class function fpuVerificarSQLInjection(ipSQL: String): Boolean;
    class procedure ppuPreencherDataSetComJson(ipDataSet: TDataSet; ipJson: TJSONObject; ipClass: TClass);
    class function fpuClonarObjeto(ipObj: TObject): TObject;
  end;

implementation

{ TUtils }

class function TUtils.fpuCapitalize(const ipTexto: string): string;
var
  IsStartWord: Boolean;
  i: Integer;
  ch: Char;
begin
  IsStartWord := True;
  Result := '';

  if (Length(ipTexto) > 0) then
    begin
      for i := 1 to Length(ipTexto) do
        begin
          if IsStartWord then
            ch := AnsiUpperCase(ipTexto[i])[1]
          else
            ch := AnsiLowerCase(ipTexto[i])[1];

          IsStartWord := (ch = ' ') and not TRegEx.IsMatch(Copy(ipTexto, i + 1, 4), '^((e|o)[ ])|(d(((a|o)s?)|e|i|u)[ ])', [roIgnoreCase, roSingleLine]);
          Result := Result + ch;
        end;
    end;
end;

class function TUtils.fpuConverterDataSetToClass(ipDataSet: TDataSet; ipClass: TClass): TObject;
var
  vaContext: TRTTIContext;
  vaProperty: TRttiProperty;
  vaAtt: TCustomAttribute;
  vaField: TField;
  vaObj: TObject;
  vaNomes: TArray<String>;
  i: Integer;
begin
  vaField := nil;
  Result := ipClass.NewInstance;

  vaContext := TRTTIContext.Create;
  for vaProperty in vaContext.GetType(Result.ClassINfo).GetProperties do
    begin
      for vaAtt in vaProperty.GetAttributes do
        begin
          if vaAtt is TColumn then
            begin
              if TColumn(vaAtt).Nome <> '' then
                begin
                  vaNomes := TRegEx.Split(TColumn(vaAtt).Nome, TRegEx.Escape(coDelimitadorCampos), [roIgnoreCase]);
                  for i := 0 to High(vaNomes) do
                    begin
                      vaField := ipDataSet.FindField(vaNomes[i].ToLower);
                      if Assigned(vaField) then
                        break;
                    end;
                end
              else
                vaField := ipDataSet.FindField(vaProperty.Name.ToLower);

              if Assigned(vaField) and (not vaField.IsNull) then
                begin
                  case vaField.DataType of
                    ftSmallint, ftInteger, ftWord, ftLargeint, ftLongWord, ftShortint, ftExtended, ftSingle:
                      vaProperty.SetValue(Result, vaField.AsInteger);
                    ftFloat, ftCurrency, ftBCD, ftFMTBcd:
                      vaProperty.SetValue(Result, vaField.AsFloat);
                    ftDateTime, ftDate:
                      vaProperty.SetValue(Result, DateTimeToStr(vaField.AsDateTime));
                    ftTime, ftTimeStamp:
                      vaProperty.SetValue(Result, TimeToStr(vaField.AsDateTime));
                  else
                    vaProperty.SetValue(Result, vaField.AsString);
                  end;
                end;

              break;
            end;
        end;
    end;
end;

class function TUtils.fpuConverterDataSetToJson(ipPairName: String; ipDataSet: TDataSet; ipClass: TClass): TJSONObject;
var
  vaJsonArray: TJSONArray;
  vaJsonObj: TJSONObject;
begin
  Result := nil;
  if not ipDataSet.eof then
    begin
      vaJsonArray := TJSONArray.Create;
      ipDataSet.First;
      while not ipDataSet.eof do
        begin
          vaJsonObj := TUtils.fpuConverterRegistroDataSetToJson(ipDataSet, ipClass);
          if vaJsonObj <> nil then
            vaJsonArray.Add(vaJsonObj);

          ipDataSet.next;
        end;
      Result := TJSONObject.Create;
      Result.AddPair(ipPairName, vaJsonArray);
    end;
end;

class function TUtils.fpuConverterRegistroDataSetToJson(ipDataSet: TDataSet; ipClass: TClass; ipPrefix: string): TJSONObject;
var
  vaContext: TRTTIContext;
  vaProperty: TRttiProperty;
  vaAtt: TCustomAttribute;
  vaField: TField;
  vaNomes: TArray<String>;
  i: Integer;
  vaJsonObj: TJSONObject;
  vaNomeClasse: String;
  vaType: TRttiType;
begin
  vaField := nil;
  Result := nil;
  vaContext := TRTTIContext.Create;

  for vaProperty in vaContext.GetType(ipClass.ClassINfo).GetProperties do
    begin
      for vaAtt in vaProperty.GetAttributes do
        begin
          if vaAtt is TColumn then
            begin
              if vaProperty.PropertyType.TypeKind = tkClass then
                begin
                  if (Pos('TadsObjectlist', vaProperty.PropertyType.QualifiedName) > 0) or (Pos('TObjectList', vaProperty.PropertyType.QualifiedName) > 0) or (Pos('TList', vaProperty.PropertyType.QualifiedName) > 0) then
                    begin
                      // isso aqui nao faz muito sentido pois um DataSet nao tem como ter um array dentro dele, seria necessario um dataset filho, porem
                      // fiz dessa forma para quando a property for uma lista mas existir apenas um registro nessa lista

                      // esse regex vai estrair somente o nome da classe de dentro do <>
                      vaNomeClasse := TRegEx.Match(vaProperty.PropertyType.QualifiedName, '(?<=\<).+(?=\>)').Value;
                      vaType := vaContext.FindType(vaNomeClasse);
                      if Assigned(vaType) then
                        begin
                          vaJsonObj := TUtils.fpuConverterRegistroDataSetToJson(ipDataSet, vaType.AsInstance.MetaclassType, TColumn(vaAtt).Prefix);
                          if Assigned(vaJsonObj) then
                            Result.AddPair(vaProperty.Name, vaJsonObj);
                        end;
                    end
                  else
                    begin
                      vaType := vaContext.FindType(vaProperty.PropertyType.QualifiedName);
                      if Assigned(vaType) then
                        begin
                          vaJsonObj := TUtils.fpuConverterRegistroDataSetToJson(ipDataSet, vaType.AsInstance.MetaclassType);
                          if Assigned(vaJsonObj) then
                            Result.AddPair(vaProperty.Name, vaJsonObj);
                        end;
                    end;
                end
              else
                begin
                  if TColumn(vaAtt).Nome <> '' then
                    begin
                      vaNomes := TRegEx.Split(TColumn(vaAtt).Nome, TRegEx.Escape(coDelimitadorCampos), [roIgnoreCase]);
                      for i := 0 to High(vaNomes) do
                        begin
                          vaField := ipDataSet.FindField(ipPrefix.ToLower + vaNomes[i].ToLower);
                          if Assigned(vaField) then
                            break;
                        end;
                    end
                  else
                    vaField := ipDataSet.FindField(ipPrefix.ToLower + vaProperty.Name.ToLower);

                  if Assigned(vaField) and (not vaField.IsNull) then
                    begin
                      if not Assigned(Result) then
                        Result := TJSONObject.Create;

                      case vaField.DataType of
                        ftDateTime, ftDate:
                          Result.AddPair(vaProperty.Name, DateTimeToStr(vaField.AsDateTime));
                        ftTime, ftTimeStamp:
                          Result.AddPair(vaProperty.Name, TimeToStr(vaField.AsDateTime));
                        ftFloat, ftCurrency, ftBCD:
                          Result.AddPair(vaProperty.Name, FormatFloat(',0.00', vaField.AsFloat));
                      else
                        Result.AddPair(vaProperty.Name, vaField.AsString);
                      end;
                    end;
                end;

              break;
            end;
        end;
    end;
end;

class function TUtils.fpuPegarFontesComputador: TStringList;
  function flcEnumFontsProc(var ipLogFont: TLogFont; var ipTextMetric: TTextMetric; ipFontType: Integer; ipData: Pointer): Integer; stdcall;
  var
    vaStrings: TStrings;
    vaTemp: string;
  begin
    vaStrings := TStrings(ipData);
    vaTemp := ipLogFont.lfFaceName;

    if (vaStrings.Count = 0) or (AnsiCompareText(vaStrings[vaStrings.Count - 1], vaTemp) <> 0) then
      vaStrings.Add(vaTemp);

    Result := 1;
  end;

var
  i: Integer;
  vaHDC: HDC;
  vaLFont: TLogFont;
  vaFontes: TStringList;
begin
  Result := TStringList.Create;
  Result.Clear;
  vaHDC := GetDC(0);
  FillChar(vaLFont, sizeof(vaLFont), 0);
  vaLFont.lfCharset := DEFAULT_CHARSET;
  EnumFontFamiliesEx(vaHDC, vaLFont, @flcEnumFontsProc, Winapi.Windows.LPARAM(Result), 0);
  ReleaseDC(0, vaHDC);
  Result.Sort;
end;

class function TUtils.fpuVerificarSQLInjection(ipSQL: String): Boolean;
const
  coPalavrasSensuradas: array [1 .. 8] of string = ('\*', 'INSERT', 'DROP', 'CREATE', 'INACTIVE', 'UPDATE', 'SET', 'ALTER');
var
  vaMatch: TMatch;
  vaPalavra: string;
begin
  Result := false;
  // caso encontre qualquer palavra sensurada ira retornar false
  for vaPalavra in coPalavrasSensuradas do
    begin
      // o regex tenta encontrar a palavra sensurada precedida de espaco ou inicio da linha e sucedida de espaco, comentario(--), quebra de linha ou final de linha
      vaMatch := TRegEx.Match(ipSQL, '(^|\s)' + vaPalavra + '(\s|--|\n|$)', [roIgnoreCase, roIgnorePatternSpace]);
      if vaMatch.Success then
        begin
          Exit(True);
        end;
    end;

end;

class function TUtils.fpuClonarObjeto(ipObj: TObject): TObject;
var
  MarshalObj: TJSONMarshal;
  UnMarshalObj: TJSONUnMarshal;
  JSONValue: TJSONValue;
begin
  Result := nil;
  MarshalObj := TJSONMarshal.Create;
  UnMarshalObj := TJSONUnMarshal.Create;
  try
    JSONValue := MarshalObj.Marshal(ipObj);
    try
      if Assigned(JSONValue) then
        Result := UnMarshalObj.Unmarshal(JSONValue);
    finally
      JSONValue.Free;
    end;
  finally
    MarshalObj.Free;
    UnMarshalObj.Free;
  end;
end;

class function TUtils.fpuConverterClassToJson(ipObj: TObject):
  TJSONObject;
var
  vaContext: TRTTIContext;
  vaProperty: TRttiProperty;
  vaAttr: TCustomAttribute;
  vaValue: TValue;
  vaJsonArray: TJSONArray;
  vaJsonItem: TJSONObject;
  i: Integer;
  vaNome, vaClassName: String;
begin
  Result := nil;
  if not Assigned(ipObj) then
    Exit;

  Result := TJSONObject.Create;

  vaContext := TRTTIContext.Create;
  for vaProperty in vaContext.GetType(ipObj.ClassINfo).GetProperties do
    begin
      for vaAttr in vaProperty.GetAttributes do
        begin
          if vaAttr is TJson then
            begin
              vaValue := vaProperty.GetValue(ipObj);
              if not vaValue.IsEmpty then
                begin
                  if TJson(vaAttr).Nome <> '' then
                    vaNome := TJson(vaAttr).Nome
                  else
                    vaNome := vaProperty.Name;

                  case vaProperty.PropertyType.TypeKind of
                    tkInteger, tkInt64:
                      Result.AddPair(vaNome, IntToStr(vaValue.AsInteger));
                    tkFloat:
                      begin
                        if Pos('TDateTime', vaProperty.PropertyType.Name) > 0 then
                          Result.AddPair(vaNome, DateTimeToStr(vaValue.AsExtended))
                        else
                          Result.AddPair(vaNome, FloatToStr(vaValue.AsExtended));
                      end;
                    tkEnumeration: // pode ser um enum ou um boolean
                      begin
                        try
                          Result.AddPair(vaNome, BoolToStr(vaValue.AsBoolean, True));
                        except // é um enum
                          Result.AddPair(vaNome, IntToStr(vaValue.AsOrdinal));
                        end;
                      end;
                    tkClass:
                      begin
                        vaClassName := vaValue.AsObject.ClassName;
                        if (Pos('TadsObjectlist', vaClassName) > 0) or (Pos('TObjectList', vaClassName) > 0) or (Pos('TList', vaClassName) > 0) then
                          begin
                            vaJsonArray := TJSONArray.Create;
                            if (Pos('TadsObjectlist', vaValue.AsObject.ClassName) > 0) then
                              begin
                                for i := 0 to TadsObjectlist<TObject>(vaValue.AsObject).Count - 1 do
                                  begin
                                    vaJsonItem := fpuConverterClassToJson(TadsObjectlist<TObject>(vaValue.AsObject).Items[i]);
                                    if vaJsonItem <> nil then
                                      vaJsonArray.AddElement(vaJsonItem);
                                  end;
                              end
                            else if (Pos('TObjectList', vaClassName) > 0) then
                              begin
                                for i := 0 to TObjectlist<TObject>(vaValue.AsObject).Count - 1 do
                                  begin
                                    vaJsonItem := fpuConverterClassToJson(TObjectlist<TObject>(vaValue.AsObject).Items[i]);
                                    if vaJsonItem <> nil then
                                      vaJsonArray.AddElement(vaJsonItem);
                                  end;
                              end
                            else
                              begin
                                for i := 0 to TList(vaValue.AsObject).Count - 1 do
                                  begin
                                    vaJsonItem := fpuConverterClassToJson(TList(vaValue.AsObject).Items[i]);
                                    if vaJsonItem <> nil then
                                      vaJsonArray.AddElement(vaJsonItem);
                                  end;
                              end;

                            Result.AddPair(vaNome, vaJsonArray);
                          end
                        else
                          begin
                            vaJsonItem := fpuConverterClassToJson(vaValue.AsObject);
                            if vaJsonItem <> nil then
                              Result.AddPair(vaNome, vaJsonItem);
                          end;
                      end;
                  else
                    Result.AddPair(vaNome, vaValue.AsString);
                  end;
                end;

              break;
            end;
        end;
    end;
end;

class function TUtils.fpuConverterJsonToClass<T>(ipJson: TJSONObject): T;
var
  vaContext: TRTTIContext;
  vaProperty: TRttiProperty;
  vaAttr: TCustomAttribute;
  i: Integer;
  vaValor: TJSONValue;
  vaObj: TObject;
  vaData: TDatetime;
  vaFormatDate: TFormatSettings;
  vaValue: TValue;
begin
  Result := nil;

  vaObj := TClass(T).NewInstance;

  vaContext := TRTTIContext.Create;

  for vaProperty in vaContext.GetType(vaObj.ClassINfo).GetProperties do
    begin
      for vaAttr in vaProperty.GetAttributes do
        begin
          if vaAttr is TJson then
            begin
              if TJson(vaAttr).Nome <> '' then
                vaValor := ipJson.GetValue(TJson(vaAttr).Nome)
              else
                vaValor := ipJson.GetValue(vaProperty.Name);

              if Assigned(vaValor) then
                begin
                  case vaProperty.PropertyType.TypeKind of
                    tkInteger, tkInt64:
                      vaProperty.SetValue(vaObj, StrToInt(vaValor.Value));
                    tkFloat:
                      begin
                        // vamos diferenciar de datetime
                        if Pos('TDateTime', vaProperty.PropertyType.Name) > 0 then
                          begin
                            vaFormatDate := TFormatSettings.Create;
                            vaFormatDate.DateSeparator := '-';
                            if not TryStrToDateTime(vaValor.Value, vaData, vaFormatDate) then
                              begin
                                vaData := StrToDateTimeDef(vaValor.Value, 0);
                              end;

                            vaProperty.SetValue(vaObj, vaData);
                          end
                        else
                          vaProperty.SetValue(vaObj, StrToFloat(vaValor.Value));
                      end;
                    tkEnumeration: // boolean ou enum
                      begin
                        if (vaValor.Value = BoolToStr(True, True)) or (vaValor.Value = BoolToStr(false, True)) then
                          vaProperty.SetValue(vaObj, StrToBool(vaValor.Value))
                        else
                          begin
                            vaValue := vaProperty.GetValue(vaObj);
                            vaProperty.SetValue(vaObj, TValue.FromOrdinal(vaValue.TypeInfo, StrToInt(vaValor.Value)));
                          end;
                      end;
                    tkClass, tkClassRef:
                      begin
                        // TODO: Implementar funcao recursiva
                      end;
                  else
                    vaProperty.SetValue(vaObj, vaValor.Value);
                  end;
                end;

              break;
            end;
        end;
    end;

  Result := T(vaObj);
end;

class procedure TUtils.ppuPreencherDataSetComJson(ipDataSet: TDataSet; ipJson: TJSONObject; ipClass: TClass);
var
  vaContext: TRTTIContext;
  vaProperty: TRttiProperty;
  vaAtt: TCustomAttribute;
  vaField: TField;
  vaValue: TJSONValue;
  vaNomes: TArray<string>;
  i: Integer;
begin
  vaField := nil;
  if not(ipDataSet.State in [dsEdit, dsInsert]) then
    ipDataSet.Append;

  vaContext := TRTTIContext.Create;
  for vaProperty in vaContext.GetType(ipClass.ClassINfo).GetProperties do
    begin
      for vaAtt in vaProperty.GetAttributes do
        begin
          if vaAtt is TColumn then
            begin
              if TColumn(vaAtt).Nome <> '' then
                begin
                  vaNomes := TRegEx.Split(TColumn(vaAtt).Nome, TRegEx.Escape(coDelimitadorCampos), [roIgnoreCase]);
                  for i := 0 to High(vaNomes) do
                    begin
                      vaField := ipDataSet.FindField(vaNomes[i].ToLower);
                      if Assigned(vaField) then
                        break;
                    end;
                end
              else
                vaField := ipDataSet.FindField(vaProperty.Name.ToLower);

              vaValue := ipJson.GetValue(vaProperty.Name);

              if Assigned(vaField) and Assigned(vaValue) then
                begin
                  case vaField.DataType of
                    ftDateTime, ftDate, ftTime, ftTimeStamp:
                      vaField.AsDateTime := StrToDateTimeDef(vaValue.Value, 0);
                    ftInteger, ftSmallint, ftWord:
                      vaField.AsInteger := StrToIntDef(vaValue.Value, 0);
                    ftFloat, ftCurrency, ftBCD:
                      vaField.AsFloat := StrToFloatDef(vaValue.Value, 0);
                  else
                    vaField.AsString := vaValue.Value;
                  end;
                end;

              break;
            end;
        end;
    end;

end;

end.
