object MainForm: TMainForm
  Left = 1026
  Top = 268
  Width = 478
  Height = 463
  Caption = #1044#1077#1088#1077#1074#1100#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbLevel: TLabel
    Left = 24
    Top = 160
    Width = 44
    Height = 13
    Caption = #1059#1088#1086#1074#1077#1085#1100
  end
  object Label1: TLabel
    Left = 24
    Top = 272
    Width = 60
    Height = 13
    Caption = #1048#1090#1077#1088#1072#1090#1080#1074#1085#1086
  end
  object Label2: TLabel
    Left = 24
    Top = 208
    Width = 79
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1079#1074#1077#1085#1100#1077#1074
  end
  object Label3: TLabel
    Left = 24
    Top = 232
    Width = 60
    Height = 13
    Caption = #1056#1077#1082#1091#1088#1089#1080#1074#1085#1086
  end
  object myTree: TTreeView
    Left = 144
    Top = 0
    Width = 281
    Height = 393
    Indent = 19
    TabOrder = 0
  end
  object edLevel: TEdit
    Left = 24
    Top = 176
    Width = 89
    Height = 21
    TabOrder = 1
  end
  object btnClear: TButton
    Left = 8
    Top = 352
    Width = 129
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 2
    OnClick = btnClearClick
  end
  object btnRand: TButton
    Left = 8
    Top = 120
    Width = 129
    Height = 25
    Caption = #1057#1083#1091#1095#1072#1081#1085#1086#1077' '#1076#1077#1088#1077#1074#1086
    TabOrder = 3
    OnClick = btnRandClick
  end
  object btnTask: TButton
    Left = 8
    Top = 320
    Width = 129
    Height = 25
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072
    TabOrder = 4
    OnClick = btnTaskClick
  end
  object lCnt: TLabeledEdit
    Left = 24
    Top = 88
    Width = 89
    Height = 21
    EditLabel.Width = 92
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1083'-'#1074#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
    TabOrder = 5
  end
  object edIter: TEdit
    Left = 24
    Top = 288
    Width = 89
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object edRek: TEdit
    Left = 24
    Top = 248
    Width = 89
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
end
