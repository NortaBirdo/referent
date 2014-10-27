object DBModel: TDBModel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 333
  Width = 444
  object ADConnection1: TADConnection
    Params.Strings = (
      'Database=D:\Delphi Projects\Referent\article.db'
      'DriverID=SQLite')
    Connected = True
    Left = 48
    Top = 32
  end
  object ADQuerySQL: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'select * from symptoms'
      'where parent = -1')
    Left = 48
    Top = 248
  end
  object ADPhysSQLiteDriverLink1: TADPhysSQLiteDriverLink
    VendorHome = 'D:\Delphi Projects\Referent\Win32\Debug'
    VendorLib = 'sqlite3.dll'
    Left = 320
    Top = 32
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 208
    Top = 32
  end
  object ADQueryArticle: TADQuery
    Active = True
    Connection = ADConnection1
    SQL.Strings = (
      'select * from article_tab')
    Left = 48
    Top = 120
  end
  object DataSourceArticle: TDataSource
    DataSet = ADQueryArticle
    Left = 160
    Top = 128
  end
end
