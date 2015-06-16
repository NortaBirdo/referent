object DBModel: TDBModel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 333
  Width = 444
  object ADConnection1: TADConnection
    Params.Strings = (
      'Database=D:\Delphi Projects\Referent\Win32\Debug\article.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 48
    Top = 32
  end
  object ADQuerySQL: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'select * from symptoms'
      'where parent = -1')
    Left = 312
    Top = 128
  end
  object ADPhysSQLiteDriverLink1: TADPhysSQLiteDriverLink
    Left = 320
    Top = 32
  end
  object ADGUIxWaitCursor1: TADGUIxWaitCursor
    Left = 208
    Top = 32
  end
  object ADQueryHist: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'select * from article_tab'
      
        'where (date_event_start < date('#39'now'#39')) AND (date_event_end < dat' +
        'e('#39'now'#39'))')
    Left = 48
    Top = 200
  end
  object DataSourceHist: TDataSource
    DataSet = ADQueryHist
    Left = 160
    Top = 200
  end
  object ADQueryActualList: TADQuery
    Connection = ADConnection1
    SQL.Strings = (
      'select * from article_tab'
      
        'where (date_event_start >= date('#39'now'#39')) OR (date_event_end >= da' +
        'te('#39'now'#39'))'
      'order by date_event_start')
    Left = 48
    Top = 128
    object ADQueryActualListid: TADAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADQueryActualListdate_event_start: TDateField
      FieldName = 'date_event_start'
      EditMask = '!99/99/0000;1;_'
    end
    object ADQueryActualListdate_event_end: TDateField
      FieldName = 'date_event_end'
      EditMask = '!99/99/0000;1;_'
    end
    object ADQueryActualListdate_add: TDateField
      FieldName = 'date_add'
      EditMask = '!99/99/0000;1;_'
    end
    object ADQueryActualListcaption: TStringField
      FieldName = 'caption'
      Size = 500
    end
    object ADQueryActualListdescription: TMemoField
      FieldName = 'description'
      BlobType = ftMemo
    end
    object ADQueryActualListlocal: TMemoField
      FieldName = 'local'
      BlobType = ftMemo
    end
    object ADQueryActualListcontact: TStringField
      FieldName = 'contact'
      Size = 100
    end
    object ADQueryActualListregistration: TStringField
      FieldName = 'registration'
      Size = 200
    end
    object ADQueryActualListlink_to_site: TStringField
      FieldName = 'link_to_site'
      Size = 500
    end
    object ADQueryActualListlang: TStringField
      FieldName = 'lang'
      Size = 100
    end
    object ADQueryActualListpublication: TStringField
      FieldName = 'publication'
      Size = 500
    end
    object ADQueryActualListorganizator: TStringField
      FieldName = 'organizator'
      Size = 100
    end
    object ADQueryActualListstatus: TBooleanField
      FieldName = 'status'
    end
    object ADQueryActualListtype_event_id: TStringField
      FieldName = 'type_event_id'
      Size = 50
    end
    object ADQueryActualListtime_event_start: TStringField
      FieldName = 'time_event_start'
      Origin = 'time_event_start'
      EditMask = '!90:00;1;_'
      Size = 5
    end
    object ADQueryActualListtime_event_end: TStringField
      FieldName = 'time_event_end'
      Origin = 'time_event_end'
      EditMask = '!90:00;1;_'
      Size = 5
    end
  end
  object DataSourceActualList: TDataSource
    DataSet = ADQueryActualList
    Left = 168
    Top = 128
  end
  object ADQueryReport: TADQuery
    Connection = ADConnection1
    Left = 48
    Top = 264
  end
end
