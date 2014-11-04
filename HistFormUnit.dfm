object HistForm: THistForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1089#1086#1073#1099#1090#1080#1081
  ClientHeight = 526
  ClientWidth = 1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 8
    Top = 321
    Width = 49
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
  end
  object Label7: TLabel
    Left = 683
    Top = 343
    Width = 95
    Height = 13
    Caption = #1052#1077#1089#1090#1086' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103
  end
  object Label9: TLabel
    Left = 688
    Top = 411
    Width = 51
    Height = 13
    Caption = #1050#1086#1085#1090#1072#1082#1090#1099
  end
  object Label10: TLabel
    Left = 688
    Top = 438
    Width = 64
    Height = 13
    Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
  end
  object Label11: TLabel
    Left = 688
    Top = 465
    Width = 61
    Height = 13
    Caption = #1055#1091#1073#1083#1080#1082#1072#1094#1080#1103
  end
  object Label12: TLabel
    Left = 688
    Top = 492
    Width = 79
    Height = 13
    Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' '#1089#1072#1081#1090
  end
  object DBEdit7: TDBEdit
    Left = 784
    Top = 435
    Width = 297
    Height = 21
    Color = clScrollBar
    DataField = 'registration'
    DataSource = DBModel.DataSourceActualList
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit8: TDBEdit
    Left = 784
    Top = 408
    Width = 297
    Height = 21
    Color = clScrollBar
    DataField = 'contact'
    DataSource = DBModel.DataSourceActualList
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit11: TDBEdit
    Left = 784
    Top = 489
    Width = 297
    Height = 21
    Color = clScrollBar
    DataField = 'link_to_site'
    DataSource = DBModel.DataSourceActualList
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit12: TDBEdit
    Left = 784
    Top = 462
    Width = 297
    Height = 21
    Color = clScrollBar
    DataField = 'publication'
    DataSource = DBModel.DataSourceActualList
    ReadOnly = True
    TabOrder = 3
  end
  object DBRichEdit1: TDBRichEdit
    Left = 8
    Top = 340
    Width = 657
    Height = 170
    Color = clScrollBar
    DataField = 'description'
    DataSource = DBModel.DataSourceActualList
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ReadOnly = True
    TabOrder = 4
  end
  object DBRichEdit2: TDBRichEdit
    Left = 784
    Top = 340
    Width = 297
    Height = 62
    Color = clScrollBar
    DataField = 'local'
    DataSource = DBModel.DataSourceActualList
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ReadOnly = True
    TabOrder = 5
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 1073
    Height = 300
    DataSource = DBModel.DataSourceHist
    ReadOnly = True
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'date_event_start'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_event_end'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_add'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'caption'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 271
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'description'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'local'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'contact'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'registration'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'link_to_site'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'lang'
        Title.Alignment = taCenter
        Title.Caption = #1071#1079#1099#1082#1080
        Width = 165
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'publication'
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'organizator'
        Title.Alignment = taCenter
        Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1090#1086#1088
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'type_event_id'
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Width = -1
        Visible = False
      end>
  end
end
