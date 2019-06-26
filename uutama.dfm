object f0: Tf0
  Left = 685
  Top = 45
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TRANPAS GUI'
  ClientHeight = 225
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object c14: TMemo
    Left = 271
    Top = 119
    Width = 353
    Height = 81
    Hint = 
      'The translation result will be show here'#13#10'(Doubleclick to change' +
      ' background color)'
    Color = 16769535
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 1
    OnDblClick = c14DblClick
  end
  object c13: TMemo
    Left = 272
    Top = 15
    Width = 353
    Height = 80
    Hint = 
      'Type or paste here text you want to translate'#13#10'(Doubleclick to c' +
      'hange background color)'
    Color = 16777185
    Ctl3D = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Courier New'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 0
    OnDblClick = c13DblClick
    OnExit = c13Exit
  end
  object c5: TGroupBox
    Left = 8
    Top = 8
    Width = 257
    Height = 193
    Caption = 'Configuration'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    object c11: TLabel
      Left = 8
      Top = 32
      Width = 39
      Height = 13
      Caption = 'Token : '
      ParentShowHint = False
      ShowHint = True
    end
    object cf: TLabel
      Left = 8
      Top = 64
      Width = 82
      Height = 13
      Caption = 'Translate From : '
      ParentShowHint = False
      ShowHint = True
    end
    object c10: TLabel
      Left = 10
      Top = 89
      Width = 70
      Height = 13
      Caption = 'Translate To : '
      ParentShowHint = False
      ShowHint = True
    end
    object ce: TEdit
      Left = 48
      Top = 30
      Width = 194
      Height = 19
      Hint = 
        'Paste your TOKEN here, get token from https://tranpas.cimosoft.c' +
        'om/'
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'cobatoken'
    end
    object cc: TComboBox
      Tag = 1
      Left = 89
      Top = 61
      Width = 154
      Height = 21
      Hint = 'Choose which language you want to translate from'
      Style = csDropDownList
      Ctl3D = False
      ItemIndex = 11
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = 'en - English'
      OnChange = ccChange
      Items.Strings = (
        'af - Afrikaans'
        'sq - Albanian'
        'ar - Arabic'
        'be - Belarusian'
        'bg - Bulgarian'
        'ca - Catalan'
        'zh-CN -  Chinese'
        'hr - Croatian'
        'cs - Czech'
        'da - Danish'
        'nl - Dutch'
        'en - English'
        'et - Estonian'
        'tl - Filipino'
        'fi - Finnish'
        'fr - French'
        'gl - Galician'
        'de - German'
        'el - Greek'
        'iw - Hebrew'
        'hi - Hindi'
        'hu - Hungarian'
        'is - Icelandic'
        'id - Indonesian'
        'ga - Irish'
        'it - Italian'
        'ja - Japanese'
        'ko - Korean'
        'lv - Latvian'
        'lt - Lithuanian'
        'mk - Macedonian'
        'ms - Malay'
        'mt - Maltese'
        'no - Norwegian'
        'fa - Persian'
        'pl - Polish'
        'pt - Portuguese'
        'ro - Romanian'
        'ru - Russian'
        'sr - Serbian'
        'sk - Slovak'
        'sl - Slovenian'
        'es - Spanish'
        'sw - Swahili'
        'sv - Swedish'
        'th - Thai'
        'tr - Turkish'
        'uk - Ukrainian'
        'vi - Vietnamese'
        'cy - Welsh'
        'yi - Yiddish')
    end
    object cd: TComboBox
      Left = 89
      Top = 85
      Width = 154
      Height = 21
      Hint = 'Choose which language you want to translate to'
      Style = csDropDownList
      Ctl3D = False
      ItemIndex = 23
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = 'id - Indonesian'
      OnChange = cdChange
      Items.Strings = (
        'af - Afrikaans'
        'sq - Albanian'
        'ar - Arabic'
        'be - Belarusian'
        'bg - Bulgarian'
        'ca - Catalan'
        'zh-CN -  Chinese'
        'hr - Croatian'
        'cs - Czech'
        'da - Danish'
        'nl - Dutch'
        'en - English'
        'et - Estonian'
        'tl - Filipino'
        'fi - Finnish'
        'fr - French'
        'gl - Galician'
        'de - German'
        'el - Greek'
        'iw - Hebrew'
        'hi - Hindi'
        'hu - Hungarian'
        'is - Icelandic'
        'id - Indonesian'
        'ga - Irish'
        'it - Italian'
        'ja - Japanese'
        'ko - Korean'
        'lv - Latvian'
        'lt - Lithuanian'
        'mk - Macedonian'
        'ms - Malay'
        'mt - Maltese'
        'no - Norwegian'
        'fa - Persian'
        'pl - Polish'
        'pt - Portuguese'
        'ro - Romanian'
        'ru - Russian'
        'sr - Serbian'
        'sk - Slovak'
        'sl - Slovenian'
        'es - Spanish'
        'sw - Swahili'
        'sv - Swedish'
        'th - Thai'
        'tr - Turkish'
        'uk - Ukrainian'
        'vi - Vietnamese'
        'cy - Welsh'
        'yi - Yiddish')
    end
    object c6: TButton
      Left = 9
      Top = 158
      Width = 75
      Height = 25
      Hint = 'Save current changes configuration'
      Caption = 'SAVE'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = c6Click
    end
    object c7: TButton
      Left = 169
      Top = 158
      Width = 75
      Height = 25
      Hint = 'About this program'
      Caption = 'ABOUT'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = c7Click
    end
    object c9: TCheckBox
      Left = 8
      Top = 114
      Width = 121
      Height = 17
      Hint = 'Keep the screen on top of'
      Caption = 'Keep window on top'
      TabOrder = 5
      OnClick = c9Click
    end
    object ca: TCheckBox
      Left = 8
      Top = 135
      Width = 145
      Height = 17
      Hint = 'Keep the screen on top of'
      Caption = 'Use B64 (recommended)'
      Checked = True
      State = cbChecked
      TabOrder = 7
      OnClick = c9Click
    end
    object cb: TCheckListBox
      Left = 1
      Top = 14
      Width = 255
      Height = 138
      Align = alTop
      BorderStyle = bsNone
      Color = clBtnFace
      ItemHeight = 13
      Items.Strings = (
        'Auto copy to clipboard after translate'
        'Auto save configuration on exit'
        'Auto translate after changing language'
        'Auto translate after load file'
        'Auto translate after typing'
        'Ask before translate'
        'Capture text from clipboard'
        'Notify when connected / disconnected'
        'Remove any non alphanumeric character'
        'Save last text source and result')
      TabOrder = 6
      Visible = False
    end
    object c8: TButton
      Left = 89
      Top = 158
      Width = 75
      Height = 25
      Hint = 'Show / hide additional configuration option'
      Caption = 'ADVANCED'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = c8Click
    end
  end
  object c0: TButton
    Left = 272
    Top = 96
    Width = 75
    Height = 21
    Hint = 'Begin the translation'
    Caption = 'TRANSLATE'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = c0Click
  end
  object c1: TButton
    Left = 359
    Top = 96
    Width = 75
    Height = 21
    Hint = 'Clear all textbox'
    Caption = 'CLEAR'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = c1Click
  end
  object c3: TButton
    Left = 533
    Top = 96
    Width = 75
    Height = 21
    Hint = 'Load plain text file to the textbox above'
    Caption = 'FROM FILE'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = c3Click
  end
  object c15: TStatusBar
    Left = 0
    Top = 206
    Width = 635
    Height = 19
    Panels = <
      item
        Text = 'Ready'
        Width = 550
      end
      item
        Alignment = taRightJustify
        Bevel = pbNone
        Text = 'Identifying'
        Width = 100
      end>
  end
  object c2: TButton
    Left = 446
    Top = 96
    Width = 75
    Height = 21
    Hint = 'Swap position between source and result'
    Caption = 'SWAP'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = c2Click
  end
  object c12: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = -1
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 392
    Top = 8
  end
  object c4: TColorDialog
    Ctl3D = False
    Options = [cdFullOpen, cdAnyColor]
    Left = 448
    Top = 8
  end
  object c16: TTimer
    OnTimer = c16Timer
    Left = 296
    Top = 48
  end
end
