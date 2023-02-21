object topicformm: Ttopicformm
  Left = 396
  Top = 160
  Width = 403
  Height = 379
  Caption = 'topicformm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBLookupListBox1: TDBLookupListBox
    Left = 80
    Top = 24
    Width = 201
    Height = 292
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    KeyField = 'Id'
    ListField = 'Name'
    ListSource = DataModule2.dstop
    ParentFont = False
    TabOrder = 0
  end
end
