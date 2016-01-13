unit pCertificadoEncode;

interface

uses
  SBTypes, SBX509Ext, System.Classes, SBRDN, pCertificadoUtils;

// Encode
function AddSt(St, AddSt, Separator: string): string;
function GetRDNValue(Value: TElRelativeDistinguishedName): string;
function CertObterGeneralName(TargetSL: TStringList; Name: TElGeneralName; StartTag: string = ''): string;
function CertObterGeneralNames(Names: TElGeneralNames; StartTag: string = ''): string;
function CertObterInformacaoAcessoAutoridade(ipExt: TElAuthorityInformationAccessExtension): string;
function CertObterAuthorityKeyIdentifierValue(Ext: TElAuthorityKeyIdentifierExtension): string;
function CertObterBasicConstraintValue(Ext: TElBasicConstraintsExtension): string;
function CertObterCertificatePoliciesValue(Ext: TElCertificatePoliciesExtension): string;
function CertObterDistributionPointValue(Ext: TElCRLDistributionPointsExtension): string;
function CertObterExtendedKeyUsageValue(Ext: TElExtendedKeyUsageExtension): string;
function CertObterIssuerAlternativeNameValue(Ext: TElAlternativeNameExtension): string;
function CertObterNameConstraints(Ext: TElNameConstraintsExtension): string;
function CertObterNameConstraint(C: TElNameConstraint; StartTag: string = ''): string;
function CertObterKeyUsageValue(Ext: TElKeyUsageExtension): string;
function CertObterPolicyConstraintsValue(Ext: TElPolicyConstraintsExtension): string;
function CertObterPoliciesMappingValue(Ext: TElPolicyMappingsExtension): string;
function CertObterUsagePeriodValue(Ext: TElPrivateKeyUsagePeriodExtension): string;
function CertObterSubjectAltNameValue(Ext : TElAlternativeNameExtension) : string;

implementation

uses
  System.SysUtils, SBConstants, SBUtils, SBStrUtils;
{$REGION 'ENCODE'}
function CertObterSubjectAltNameValue(Ext : TElAlternativeNameExtension) : string;
begin
  Result:=CertObterGeneralNames(Ext.Content,'');
end;
function CertObterUsagePeriodValue(Ext: TElPrivateKeyUsagePeriodExtension): string;
begin
  Result := 'Não depois=' + DateTimeToStr(Ext.NotAfter) + #13#10 +
    'Não antes=' + DateTimeToStr(Ext.NotBefore);
end;

function CertObterPoliciesMappingValue(Ext: TElPolicyMappingsExtension): string;
var
  i: integer;
  IssuerPolicy, SubjectPolicy: string;
begin
  IssuerPolicy := '';
  SubjectPolicy := '';
  for i := 0 to Ext.Count - 1 do
    begin
      AddSt(IssuerPolicy, CertByteArrayParaStringHex(Ext.Policies[i].IssuerDomainPolicy), ', ');
      AddSt(SubjectPolicy, CertByteArrayParaStringHex(Ext.Policies[i].SubjectDomainPolicy), ', ');
    end;
  Result := 'Issuer Domain Policy=' + IssuerPolicy + #13#10 +
    'Subject Domain Policy=' + SubjectPolicy;
end;

function CertObterPolicyConstraintsValue(Ext: TElPolicyConstraintsExtension): string;
begin
  Result := 'Require Explicit Policy=' + IntToStr(Ext.RequireExplicitPolicy) + #13#10 +
    'Inhibit Policy Mapping=' + IntToStr(Ext.InhibitPolicyMapping);
end;

function CertObterKeyUsageValue(Ext: TElKeyUsageExtension): string;
begin
  Result := '';
  if Ext.DigitalSignature then
    Result := AddSt(Result, 'Assinatura Digital', ', ');
  if Ext.NonRepudiation then
    Result := AddSt(Result, 'Non-repudation', ', ');
  if Ext.KeyEncipherment then
    Result := AddSt(Result, 'Key encipherment', ', ');
  if Ext.DataEncipherment then
    Result := AddSt(Result, 'Data encipherment', ', ');
  if Ext.KeyAgreement then
    Result := AddSt(Result, 'Key agreement', ', ');
  if Ext.KeyCertSign then
    Result := AddSt(Result, 'Certificate signing', ', ');
  if Ext.CRLSign then
    Result := AddSt(Result, 'CRL signing', ', ');
  if Ext.EncipherOnly then
    Result := AddSt(Result, 'Encipher only', ', ');
  if Ext.DecipherOnly then
    Result := AddSt(Result, 'Decipher only', ', ');
end;

function CertObterNameConstraint(C: TElNameConstraint; StartTag: string = ''): string;
var
  St: string;
begin
  St := CertObterGeneralName(nil, C.Base, StartTag);
  St := AddSt(St, 'Minimum=' + IntToStr(C.Minimum), #13#10);
  St := AddSt(St, 'Maximum=' + IntToStr(C.Maximum), #13#10);
  Result := St;
end;

function CertObterNameConstraints(Ext: TElNameConstraintsExtension): string;
var
  St: string;
  i: integer;
begin
  St := '';
  if Ext.ExcludedCount > 0 then
    begin
      St := AddSt(St, 'Excluded : ', #13#10);
      for i := 0 to Ext.ExcludedCount - 1 do
        St := AddSt(St, CertObterNameConstraint(Ext.ExcludedSubtrees[i]), #13#10);
    end;
  if Ext.PermittedCount > 0 then
    begin
      St := AddSt(St, 'Permitted : ', #13#10);
      for i := 0 to Ext.PermittedCount - 1 do
        St := AddSt(St, CertObterNameConstraint(Ext.PermittedSubtrees[i]), #13#10);
    end;
  Result := St;
end;

function CertObterIssuerAlternativeNameValue(Ext: TElAlternativeNameExtension): string;
begin
  Result := CertObterGeneralNames(Ext.Content);
end;

function CertObterExtendedKeyUsageValue(Ext: TElExtendedKeyUsageExtension): string;
var
  i: integer;
begin
  Result := '';
  if Ext.ServerAuthentication then
    Result := AddSt(Result, 'Server authentication', ', ');
  if Ext.ClientAuthentication then
    Result := AddSt(Result, 'Client authentication', ', ');
  if Ext.CodeSigning then
    Result := AddSt(Result, 'Code signing', ', ');
  if Ext.EmailProtection then
    Result := AddSt(Result, 'E-mail protection', ', ');
  if Ext.TimeStamping then
    Result := AddSt(Result, 'Time stamping', ', ');
  Result := AddSt(Result, 'Custom Usage : ' + IntToStr(Ext.CustomUsageCount), ', ');
  For i := 0 to Ext.CustomUsageCount - 1 do
    Result := AddSt(Result, CertByteArrayParaStringHex(Ext.CustomUsages[i]), ', ');
end;

function CertObterDistributionPointValue(Ext: TElCRLDistributionPointsExtension): string;
var
  i: integer;
  ReasonSt, St: string;
  DP: TElDistributionPoint;
begin
  St := '';
  for i := 0 to Ext.Count - 1 do
    begin
      DP := Ext.DistributionPoints[i];
      St := AddSt(St,
        CertObterGeneralNames(DP.CRLIssuer, 'CRL Issuer.'), '');
      St := AddSt(St,
        CertObterGeneralNames(DP.Name, 'Name.'), '');
      ReasonSt := '';
      if (rfUnspecified in DP.ReasonFlags) then
        ReasonSt := AddSt(ReasonSt, 'Unspecified', ', ');
      if (rfKeyCompromise in DP.ReasonFlags) then
        ReasonSt := AddSt(ReasonSt, 'Key Compromise', ', ');
      if (rfCACompromise in DP.ReasonFlags) then
        ReasonSt := AddSt(ReasonSt, 'CA Compromise', ', ');
      if (rfAffiliationChanged in DP.ReasonFlags) then
        ReasonSt := AddSt(ReasonSt, 'Affiliation Changed', ', ');
      if (rfSuperseded in DP.ReasonFlags) then
        ReasonSt := AddSt(ReasonSt, 'Superseded', ', ');
      if (rfCessationOfOperation in DP.ReasonFlags) then
        ReasonSt := AddSt(ReasonSt, 'Cessation Of Operation', ', ');
      if (rfCertificateHold in DP.ReasonFlags) then
        ReasonSt := AddSt(ReasonSt, 'Certificate Hold', ', ');
      if (rfObsolete1 in DP.ReasonFlags) then
        ReasonSt := AddSt(ReasonSt, 'Obsolete1', ', ');
      if (rfRemoveFromCRL in DP.ReasonFlags) then
        ReasonSt := AddSt(ReasonSt, 'Remove From CRL', ', ');
      if (rfPrivilegeWithdrawn in DP.ReasonFlags) then
        ReasonSt := AddSt(ReasonSt, 'Privilege Withdrawn', ', ');
      if (rfAACompromise in DP.ReasonFlags) then
        ReasonSt := AddSt(ReasonSt, 'AA Compromise', ', ');
      if ReasonSt <> '' then
        St := AddSt(St, 'Reason=' + ReasonSt, #13#10);
    end;
  Result := St;
end;

function CertObterCertificatePoliciesValue(Ext: TElCertificatePoliciesExtension): string;
var
  i, j, k: integer;
  NumberSt, St: string;
begin
  St := '';
  for i := 0 to Ext.Count - 1 do
    for k := 0 to Ext.PolicyInformation[i].QualifierCount - 1 do
      with Ext.PolicyInformation[i].Qualifiers[k].UserNotice do
        begin
          if (Ext.PolicyInformation[i].Qualifiers[k].CPSURI <> '') then
            St := AddSt(St, 'CPS URI=' + Ext.PolicyInformation[i].Qualifiers[k].CPSURI, #13#10);
          St := AddSt(St, 'Policy Identifier=' +
            CertByteArrayParaStringHex(Ext.PolicyInformation[i].PolicyIdentifier), #13#10);
          If Organization <> '' then
            St := AddSt(St, 'Organization=' + Organization, #13#10);
          NumberSt := '';

          for j := 0 to NoticeNumbersCount - 1 do
            NumberSt := AddSt(NumberSt, Format('%x', [NoticeNumbers[j]]), ' ');
          if NumberSt <> '' then
            St := AddSt(St, 'Notice Numbers=' + NumberSt, #13#10);
          St := AddSt(St, 'Explicit Text=' + ExplicitText, #13#10);
        end;
  Result := St;
end;

function CertObterBasicConstraintValue(Ext: TElBasicConstraintsExtension): string;
begin
  if Ext.CA then
    Result := 'Subject Type=CA, Path length constraint=' + IntToStr(Ext.PathLenConstraint)
  else
    Result := '';
end;

function CertObterGeneralNames(Names: TElGeneralNames; StartTag: string = ''): string;
var
  SL: TStringList;
  St: string;
  i: integer;
begin
  SL := TStringList.Create;
  SL.Sorted := False;
  for i := 0 to Names.Count - 1 do
    begin
      St := CertObterGeneralName(SL, Names.Names[i], StartTag);
      SL.Clear;
      SL.Add(St);
    end;
  i := SL.Count - 1;
  while (i >= 0) and (i >= SL.Count - 1) do
    begin
      if (SL[i] = '') or (SL[i] = #13#10) then
        SL.Delete(i);
      dec(i);
    end;
  SL.Sorted := True;
  Result := SL.Text;
  SL.Free;
end;

function CertObterAuthorityKeyIdentifierValue(Ext: TElAuthorityKeyIdentifierExtension): string;
begin
  Result := '';
  if Length(Ext.AuthorityCertSerial) > 0 then
    Result := AddSt(Result, 'Authority Cert Serial=' + CertByteArrayParaStringHex(Ext.AuthorityCertSerial), #13#10);
  if Length(Ext.KeyIdentifier) > 0 then
    Result := AddSt(Result, 'Key Identifier=' + CertByteArrayParaStringHex(Ext.KeyIdentifier), #13#10);
  Result := AddSt(Result, CertObterGeneralNames(Ext.AuthorityCertIssuer, 'Authority Cert Issuer.'), #13#10);
end;

function GetRDNValue(Value: TElRelativeDistinguishedName): string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to Value.Count - 1 do
    AddSt(Result, OIDToStr(Value.OIDs[i]) + '=' + CertByteArrayParaStringHex(Value.Values[i]), ', ');
end;

function AddSt(St, AddSt, Separator: string): string;
begin
  If St <> '' then
    Result := St + Separator + AddSt
  else
    Result := AddSt;
  if AddSt = '' then
    Result := St;
  Result := StringReplace(Result, #13#10#13#10, #13#10, [rfReplaceAll]);
end;

function CertObterGeneralName(TargetSL: TStringList; Name: TElGeneralName; StartTag: string = ''): string;
var
  SL: TStringList;
  procedure AddValue(Key, Value: string);
  var
    ListTag: string;
  begin
    if Value = '' then
      exit;
    ListTag := StartTag + Key;
    SL.Values[ListTag] := AddSt(SL.Values[ListTag], Value, ', ');
  end;

begin
  SL := TStringList.Create;
  If Assigned(TargetSL) then
    If TargetSL.Count > 0 then
      SL.Add(TargetSL.Text);
  SL.Sorted := False;
  with Name do
    case NameType of
      gnRFC822Name:
        AddValue('RFC822 Name', RFC822Name);
      gnDNSName:
        AddValue('DNS Name', DNSName);
      gnDirectoryName:
        AddValue('Directory Name', GetRDNValue(DirectoryName));
      gnEdiPartyName:
        begin
          AddValue('Edi Party Name.Name Assigner', EdiPartyName.NameAssigner);
          AddValue('Edi Party Name.Party Name', EdiPartyName.PartyName);
        end;
      gnUniformResourceIdentifier:
        AddValue('URI', UniformResourceIdentifier);
      gnIPAddress:
        AddValue('IP Address', IPAddress);
      gnRegisteredID:
        AddValue('Registered ID', CertByteArrayParaStringHex(RegisteredID));
      gnOtherName:
        AddValue('Other Name', OIDToStr(OtherName.OID) + '=' + CertByteArrayParaStringHex(OtherName.Value));
      gnUnknown:
        AddValue('Unknown', 'Unknown');
    end;
  SL.Sorted := True;
  Result := SL.Text;
  SL.Free;
end;

function CertObterInformacaoAcessoAutoridade(ipExt: TElAuthorityInformationAccessExtension): string;
var
  vaCont: integer;
  vaAccessMethod: string;
  vaStringList: TStringList;
  vaString: string;
begin
  vaAccessMethod := '';
  vaStringList := TStringList.Create;
  vaStringList.Sorted := False;
  for vaCont := 0 to ipExt.Count - 1 do
    begin
      vaString := CertObterGeneralName(vaStringList, ipExt.AccessDescriptions[vaCont].AccessLocation, 'Access Location.');
      vaStringList.Clear;
      vaStringList.Add(vaString);
      vaAccessMethod := AddSt(vaAccessMethod, OIDToStr(ipExt.AccessDescriptions[vaCont].AccessMethod), ', ');
    end;
  If vaAccessMethod <> '' then
    vaStringList.Insert(0, 'Access Method=' + vaAccessMethod);
  // vaStringList.Sorted:=True;
  Result := vaStringList.Text;

end;

{$ENDREGION}


end.
