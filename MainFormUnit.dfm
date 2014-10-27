object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Referent'
  ClientHeight = 650
  ClientWidth = 932
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 92
    Height = 13
    Caption = #1041#1091#1076#1091#1097#1080#1077' '#1089#1086#1073#1099#1090#1080#1103
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 27
    Width = 913
    Height = 614
    DataSource = DBModel.DataSourceArticle
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnColExit = DBGrid1ColExit
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
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
        Width = 250
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
        Title.Caption = #1057#1089#1099#1083#1082#1072' '#1085#1072' '#1089#1072#1081#1090
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'lang'
        Title.Alignment = taCenter
        Visible = False
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
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'status'
        Title.Alignment = taCenter
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Width = 100
        Visible = True
      end>
  end
  object DBCheckBox1: TDBCheckBox
    Left = 480
    Top = 8
    Width = 97
    Height = 17
    Caption = #1042' '#1088#1072#1089#1089#1099#1083#1082#1091
    DataField = 'status'
    DataSource = DBModel.DataSourceArticle
    ParentColor = False
    TabOrder = 1
    ValueChecked = #1042#1082#1083#1102#1095#1077#1085#1086
    ValueUnchecked = #1048#1089#1082#1083#1102#1095#1077#1085#1086
    Visible = False
    OnClick = DBCheckBox1Click
  end
  object MainMenu1: TMainMenu
    Left = 848
    Top = 16
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1048#1084#1087#1086#1088#1090' '#1089#1086#1073#1099#1090#1080#1081
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = N4Click
      end
    end
    object N5: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1086#1088
      object N6: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1073#1099#1090#1080#1077
      end
      object N7: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1086#1073#1099#1090#1080#1077
      end
      object N8: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1086#1073#1099#1090#1080#1077
      end
    end
    object N9: TMenuItem
      Caption = #1043#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1089#1089#1099#1083#1082#1091
    end
    object N10: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N10Click
    end
  end
end
