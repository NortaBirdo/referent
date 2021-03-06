object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Referent'
  ClientHeight = 650
  ClientWidth = 1016
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
  object DBCheckBox1: TDBCheckBox
    Left = 664
    Top = 8
    Width = 97
    Height = 17
    Color = clHighlightText
    DataField = 'status'
    DataSource = DBModel.DataSourceActualList
    ParentColor = False
    TabOrder = 0
    ValueChecked = ''
    ValueUnchecked = ''
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 31
    Width = 1001
    Height = 610
    DataSource = DBModel.DataSourceActualList
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
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
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_add'
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'caption'
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 236
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
        Width = 184
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
        Width = 152
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 808
    Top = 8
    object N1: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = N1Click
    end
    object N5: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1086#1088
      object N6: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1073#1099#1090#1080#1077
        OnClick = N6Click
      end
      object N7: TMenuItem
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1086#1073#1099#1090#1080#1077
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1086#1073#1099#1090#1080#1077
        OnClick = N8Click
      end
    end
    object N13: TMenuItem
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1089#1086#1073#1099#1090#1080#1081
      OnClick = N13Click
    end
    object N9: TMenuItem
      Caption = #1043#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1089#1089#1099#1083#1082#1091
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnClick = N10Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = '*.docx|MS Word 07-2010|*.doc|MS Word 97-2003'
    Left = 520
    Top = 8
  end
end
