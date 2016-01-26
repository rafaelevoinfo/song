object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 279
  Width = 458
  object DataSnapConn: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      'Port=3004'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=20.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}'
      'DSAuthenticationUser=admin')
    AfterConnect = DataSnapConnAfterConnect
    AfterDisconnect = DataSnapConnAfterDisconnect
    Left = 64
    Top = 48
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Black'
    Left = 216
    Top = 120
  end
  object ProxyGenerator: TDSProxyGenerator
    MetaDataProvider = DSConnectionMetaDataProvider1
    TargetUnitName = 'uFuncoes'
    Writer = 'Object Pascal DBX'
    Left = 152
    Top = 48
  end
  object DSConnectionMetaDataProvider1: TDSConnectionMetaDataProvider
    SQLConnection = DataSnapConn
    Left = 64
    Top = 120
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 320
    Top = 160
  end
  object imgIcons_32: TcxImageList
    Height = 32
    Width = 32
    FormatVersion = 1
    DesignInfo = 2097512
    ImageInfo = <
      item
        Image.Data = {
          36100000424D3610000000000000360000002800000020000000200000000100
          2000000000000010000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0004000000100000001100000006000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000184A4A
          4982969494C79A9A9ACC5C5C5C94040404250000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000101011B8A8A88B8E7E6
          E5FFA7A6A6FF9F9F9EFFDFDEDDFFAEADADD30505051F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000101011B8B8B8AB9E1E0DFFF5050
          4FFF242424FF242424FF3B3B3BFFDEDDDCFF6261618700000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000101011B8B8B8AB9E1E0DFFF4F4F4FFF2424
          24FF242424FF242424FF242424FF9C9C9BFF9F9E9EBC00000004000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000101011B8B8B8AB9E1E0DFFF4F4F4FFF242424FF2424
          24FF242424FF242424FF242424FFA1A09FFF9B9B99B500000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000101011B8B8B8BB9E1E0E0FF4F4F4FFF242424FF242424FF2424
          24FF242424FF242424FF484847FFE4E3E2FF5656556800000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000010000000200000003000000020000000100000000000000000000
          00000101011B8B8B8BB9E2E1E0FF4F4F4FFF242424FF242424FF252525FF2525
          25FF252525FF484848FFDDDCDBFF989897AA0101010400000000000000000000
          0000000000000000000000000000000000000000000000000003000000150606
          06382F2E2E68494848824A4A4A854444447D2121215A0000002B0000000E0101
          011C8B8B8BB9E2E1E0FF50504FFF252525FF252525FF252525FF262626FF2626
          26FF494949FFDDDCDBFF989897AA030303060000000000000000000000000000
          0000000000000000000000000000000000020000001D40404079A0A09ECEE5E4
          E3FAEFEEEDFFE9E8E7FFE6E5E4FFEBEAE9FFEEEDEDFFD5D4D4F1858383BA9191
          91C4E2E1E0FF505050FF262626FF262626FF262626FF272727FF272727FF4A4A
          4AFFDEDDDCFF999898AA03030306000000000000000000000000000000000000
          00000000000000000000000000061D1D1D4FAEADADD5EDECECFFC7C6C6FF9D9C
          9CFF818181FF787878FF787878FF787878FF888888FFA8A8A7FFD5D5D4FFE2E1
          E1FF515151FF262626FF272727FF272727FF272727FF282828FF4A4A4AFFDEDD
          DCFF999898AA0303030600000000000000000000000000000000000000000000
          000000000000000000073939396DDEDDDDF5D3D2D2FF8B8A8AFF787878FF7878
          78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF6F6F
          6FFF2F2F2FFF282828FF282828FF282828FF282828FF4B4B4BFFDEDDDCFF9998
          98AA030303060000000000000000000000000000000000000000000000000000
          00000000000331303061E6E5E4F9C0BFBEFF797979FF787878FF787878FF7878
          78FF8D8C8CFFA1A1A0FFA4A4A3FF9D9D9CFF848484FF7A7A7AFF7B7B7BFF7B7B
          7BFF747474FF373737FF292929FF292929FF4C4C4CFFDEDDDDFF999898AA0303
          0306000000000000000000000000000000000000000000000000000000000000
          00000F0F0F31D5D4D3EDC4C3C3FF787878FF787878FF787878FF9F9E9EFFDBDA
          D9FFEDECEBFFEFE6DEFFEFE4D8FFEEE9E3FFECEBEAFFCCCBCAFF908F8FFF7E7E
          7EFF7F7F7FFF797979FF353535FF4D4C4CFFDFDEDDFF999998AA030303060000
          0000000000000000000000000000000000000000000000000000000000000000
          0008898888B0DFDEDEFF7D7D7DFF787878FF7A7A7AFFBFBEBEFFEEECE9FFF3CF
          A9FFFAB66EFFFDAF5DFFFDAF5DFFFDB05FFFFABE7EFFF1DBC3FFE9E8E7FFA5A5
          A5FF828282FF838383FF767575FFDDDCDBFFA5A3A3C103030308000000000000
          0000000000000000000000000000000000000000000000000000000000001514
          1434E8E7E7FB9F9E9EFF7A7A7AFF7B7B7BFFB7B7B6FFEEE9E3FFF2B677FFF5A7
          56FFF5A857FFF6A957FFF6A958FFF7A958FFF7AA58FFF8AA59FFF2C99FFFEBEA
          E9FF9D9D9DFF868686FF868686FFC8C8C7FFB2B0B0D20000000D000000000000
          0000000000000000000000000000000000000000000000000000000000016666
          6689E3E2E2FF7D7D7DFF7D7D7DFF929292FFEEEDECFFEDB77EFFEDA04FFFEEA1
          50FFEEA150FFEFA251FFEFA251FFF0A352FFF0A352FFF1A453FFF1A453FFEED0
          AFFFDDDDDCFF8A8A8AFF898989FF9E9E9EFFEDECECFE1C1C1C3B000000000000
          000000000000000000000000000000000000000000000000000000000007A8A8
          A7C6C1C0C0FF7F7F7FFF808080FFC4C3C3FFECD7C2FFE59949FFE69A49FFE69A
          4AFFE79A4AFFE89B4AFFE89B4BFFE99C4BFFE99C4CFFEA9D4CFFEA9D4DFFEBA4
          59FFEDEAE6FFA8A8A8FF8C8C8CFF8D8D8DFFE5E4E4FF5C5C5C7C000000010000
          00000000000000000000000000000000000000000000000000000000000ED2D1
          D1E9ACACACFF828282FF828282FFE4E3E2FFE5B686FFDE9242FFDF9343FFDF93
          43FFE09444FFE09444FFE19545FFE19545FFE29646FFE29646FFE39746FFE397
          47FFEBD4BCFFC5C4C4FF8F8F8FFF909090FFD2D1D1FF868686A4000000020000
          000000000000000000000000000000000000000000000000000000000010E3E2
          E2F4A5A5A5FF858585FF858585FFF0EFEFFFDDA469FFD78B3CFFD88C3DFFD88C
          3DFFD98D3EFFD98D3EFFDA8E3EFFDA8E3FFFDB8F3FFFDB8F40FFDC9040FFDC90
          41FFE6C5A1FFD1D0D0FF929292FF939393FFCDCCCCFF989796B3000000030000
          00000000000000000000000000000000000000000000000000000000000FE3E2
          E2F4A8A7A7FF878787FF888888FFF0EFEFFFD8A065FFD08536FFD08537FFD186
          37FFD18637FFD28738FFD28738FFD38839FFD48839FFD4893AFFD5893AFFD589
          3BFFE4C2A0FFD2D1D1FF959595FF969696FFCECECDFF969494B0000000020000
          000000000000000000000000000000000000000000000000000000000009D0CF
          CFE5B3B2B2FF8A8A8AFF8B8B8BFFE4E3E3FFD9AD7FFFC97E30FFC97E30FFCA7F
          31FFCB8236FFE3BB90FFE8C4A0FFD18D47FFD9A166FFE1B281FFCD8234FFCE83
          34FFE6D0BAFFC9C8C7FF989898FF999999FFD7D6D6FF8584849D000000010000
          000000000000000000000000000000000000000000000000000000000003A4A4
          A4BBC9C9C8FF8D8D8DFF8E8E8EFFC9C8C8FFE6D3C1FFC27729FFC2782AFFC378
          2AFFE1BB94FFFFFFFFFFFFFFFFFFF0DDCAFFEACFB3FFF9F1E9FFC67B2EFFCB87
          41FFEEECEAFFB2B1B1FF9B9B9BFF9C9C9CFFE8E7E7FF5959596E000000000000
          0000000000000000000000000000000000000000000000000000000000006262
          6275E8E7E7FF929292FF919191FFA1A1A1FFF0EFEFFFCE9C6AFFBB7124FFBB71
          24FFE4C6A7FFFFFFFFFFFFFFFFFFF5EBE0FFC0782EFFC37D35FFBF7527FFDFC5
          AAFFE1E0E0FF9D9D9DFF9D9D9DFFB1B1B1FFEDECECFD18181827000000000000
          0000000000000000000000000000000000000000000000000000000000001111
          111DE8E8E8F7B4B4B4FF949494FF959595FFC2C1C1FFF0ECE9FFC59059FFB46B
          1EFFC08241FFF2E6D9FFF7F0E8FFCD9C68FFB76D20FFB86F22FFD7B591FFEDEC
          ECFFAFAFAFFFA0A0A0FFA0A0A0FFD6D5D4FFACACACC000000003000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000181818193E7E6E6FF9C9C9CFF979797FF999999FFC9C9C9FFF1F0EFFFD7B9
          9BFFBB7F41FFAE6519FFAF6519FFB16A20FFC38F59FFE3D1C0FFECEBEBFFB8B8
          B8FFA2A2A2FFA2A2A2FFB7B6B6FFEFEEEDFE3736364500000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000B0B0B12CFCECEDFD6D5D5FF9B9B9BFF9B9B9BFF9C9C9CFFB4B4B4FFE0DF
          DFFFF2F1F1FFEFECE9FFEDE7E2FFF1EFEEFFF0EFEFFFD6D5D5FFADADADFFA4A4
          A4FFA5A5A5FFADADADFFE9E8E8FF8E8E8EA00000000200000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000029282833E4E3E3F2D4D4D4FFA0A0A0FF9F9F9FFFA0A0A0FFA0A0
          A0FFABABABFFB9B9B9FFBCBCBCFFB8B7B7FFA8A8A8FFA5A5A5FFA6A6A6FFA7A7
          A7FFB1B1B1FFE7E6E6FFB8B8B8C80808080D0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000002F2F2F39D9D9D9E8E3E2E2FFB2B2B2FFA3A3A3FFA3A3
          A3FFA4A4A4FFA5A5A5FFA6A6A6FFA6A6A6FFA7A7A7FFA8A8A8FFA9A9A9FFC5C4
          C4FFEDECECFFAEAEAEBE0E0E0E13000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000001515151BA0A0A0AEF2F1F1FFDDDCDCFFC2C2
          C2FFB1B1B1FFA8A8A8FFA8A8A8FFABABABFFB7B6B6FFCBCACAFFE7E6E6FFE8E7
          E7F57171717D0303030600000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000013232323A939393A0DDDC
          DCECF2F1F1FFF2F1F1FFF2F1F1FFF2F1F1FFF2F1F1FFC9C8C8D7787777831717
          171C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          0103202020263B3A3A423D3C3C443636363D1313131800000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
  object imgIcons_16: TcxImageList
    FormatVersion = 1
    DesignInfo = 7864680
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000131312284C4C4C6D1818183000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000002323233CA8A7A6ED646363FFA9A8A7F41A1A1A2A000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00002323233CA6A6A5EE2F2F2FFF242424FF616161FF4F4E4E5E000000000000
          0000000000000000000000000000000000010000000100000000000000002323
          233CA6A6A6EE2F2F2FFF252525FF2D2D2DFFA8A8A6EA1616161B000000000000
          0000000000011010102663636285939393BA979797C07979799D4645456AA7A6
          A6EE303030FF262626FF2F2F2FFFA6A6A5EA2828272E00000000000000000000
          00024D4D4D6EBDBCBCF5959595FF7A7A7AFF787878FF888888FFA8A7A7FF3434
          34FF282828FF313131FFA8A6A6EA2828282E0000000000000000000000004545
          4561B8B7B6FE787878FF9B9A9AFFC3C0BDFFC8C4BFFFAEADADFF818181FF6969
          69FF353535FFA9A8A8EA2828282E0000000000000000000000000505050FBBBA
          BAEA7B7B7BFFB8B6B4FFF2C698FFF9AE5EFFFAAC5BFFF7BB7DFFDBD0C5FF8A8A
          8AFFA8A8A7FF5756566A0000000000000000000000000000000044444356A8A8
          A8FF959595FFEBC59DFFEA9D4DFFEB9E4DFFEC9F4EFFEDA04FFFEDAD6AFFBFBE
          BDFF909090FF939292AD000000000000000000000000000000006D6D6D7F9696
          96FFB7B6B6FFDE9E5BFFDC9040FFDD9141FFDE9242FFDF9343FFE09444FFDACB
          BCFF919191FFAFAFAED5000000010000000000000000000000006D6C6C7C9B9B
          9BFFBAB9B9FFD39453FFCD8234FFD4934DFFD89856FFD99957FFD18637FFD9CB
          BDFF979797FFAFAFAFD3000000010000000000000000000000004242424DB4B4
          B4FFA2A2A2FFDAB591FFBF7527FFF1E0CEFFF9F2EAFFDAAD80FFCC8F50FFC8C7
          C6FFA1A1A1FF929191A40000000000000000000000000000000004040408C0C0
          C0E2979797FFC5C4C3FFD0A980FFC7935DFFC99762FFC58F57FFDAD1C8FFA5A5
          A5FFC7C6C6FF3939394200000000000000000000000000000000000000004140
          4049CACACAFC9E9E9EFFB5B5B5FFD1D0D0FFD5D2D1FFC5C4C4FFA8A8A8FFBBBA
          BAFF8E8E8E9D0000000100000000000000000000000000000000000000000000
          00004747474FCAC9C9EBB9B9B9FFA9A9A9FFA8A8A8FFB4B4B4FFCECECEFD8484
          8490040404050000000000000000000000000000000000000000000000000000
          0000000000000D0D0D0F5C5C5C64908F8F9A969595A07473737C242424280000
          0000000000000000000000000000000000000000000000000000}
      end>
  end
end
