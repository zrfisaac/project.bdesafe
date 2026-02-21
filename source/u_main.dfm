object frmMain: TfrmMain
  Left = 200
  Top = 120
  Width = 600
  Height = 410
  Caption = 'frmMain'
  Color = clBtnFace
  Constraints.MinHeight = 410
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = miMenu
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sbStatus: TStatusBar
    Left = 0
    Top = 332
    Width = 584
    Height = 19
    Panels = <
      item
        Width = 80
      end
      item
        Alignment = taRightJustify
        Width = 50
      end>
  end
  object pnBack: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 332
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
  end
  object miMenu: TMainMenu
    Left = 8
    Top = 8
    object miHelp: TMenuItem
      Caption = 'Help'
      object miAbout: TMenuItem
        Caption = 'About'
      end
      object miConfiguration: TMenuItem
        Caption = 'Configuration'
      end
      object miZrfisaac: TMenuItem
        Caption = 'ZRFISAAC'
      end
    end
  end
  object acAction: TActionList
    Left = 8
    Top = 40
  end
end
