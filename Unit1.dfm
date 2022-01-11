object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1608#1575#1580#1607#1577' '#1575#1604#1578#1588#1601#1610#1585' '#1575#1604#1582#1575#1589#1577' '#1576#1575#1604#1605#1576#1585#1605#1580' '
  ClientHeight = 502
  ClientWidth = 838
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Button1: TButton
    Left = 719
    Top = 147
    Width = 111
    Height = 65
    Caption = #1578#1588#1601#1610#1585' '
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 711
    Top = 234
    Width = 100
    Height = 75
    Caption = #1601#1603' '#1575#1604#1578#1588#1601#1610#1585
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 623
    Top = 8
    Width = 207
    Height = 48
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TextHint = #1585#1602#1605' '#1575#1604#1578#1587#1580#1610#1604
  end
  object Edit4: TEdit
    Left = 328
    Top = 8
    Width = 297
    Height = 48
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TextHint = #1575#1604#1605#1601#1578#1575#1581
  end
  object Panel1: TPanel
    Left = 214
    Top = 315
    Width = 571
    Height = 179
    TabOrder = 4
    object Label5: TLabel
      Left = 480
      Top = 79
      Width = 71
      Height = 15
      Caption = ':'#1591#1608#1604' '#1575#1604#1587#1604#1587#1604#1577
    end
    object Label7: TLabel
      Left = 480
      Top = 120
      Width = 44
      Height = 15
      Caption = ':'#1575#1604#1587#1604#1587#1604#1577
    end
    object Label8: TLabel
      Left = 484
      Top = 40
      Width = 45
      Height = 15
      Caption = ':'#1605#1582#1589#1589
    end
    object Label9: TLabel
      Left = 480
      Top = 19
      Width = 79
      Height = 15
      Caption = ':'#1605#1580#1605#1608#1593#1577' '#1575#1604#1571#1581#1585#1601
    end
    object ComboBox1: TComboBox
      Left = 160
      Top = 16
      Width = 289
      Height = 23
      ItemIndex = 7
      TabOrder = 0
      Text = #1571#1581#1585#1601' '#1589#1594#1610#1585#1577' + '#1571#1581#1585#1601' '#1603#1576#1610#1585#1577' + '#1571#1613#1585#1602#1575#1605' A-Z a-z 0-9'
      Items.Strings = (
        #1571#1585#1602#1575#1605' '#1605#1606' 0-9'
        #1571#1581#1585#1601' '#1607#1575#1603#1587' '#1603#1576#1610#1585#1577' (0-F)'
        #1571#1581#1585#1601' '#1607#1575#1603#1587' '#1589#1594#1610#1585#1577' (0-f)'
        #1571#1581#1585#1601' '#1603#1576#1610#1585#1577' A-Z'
        #1571#1581#1585#1601' '#1589#1594#1610#1585#1577' a-z'
        #1571#1581#1585#1601' '#1603#1576#1610#1585#1577' + '#1571#1585#1602#1575#1605' A-Z + 0-9'
        #1571#1581#1585#1601' '#1589#1594#1610#1585#1577' + '#1571#1585#1602#1575#1605' a-z + 0-9'
        #1571#1581#1585#1601' '#1589#1594#1610#1585#1577' + '#1571#1581#1585#1601' '#1603#1576#1610#1585#1577' + '#1571#1613#1585#1602#1575#1605' A-Z a-z 0-9'
        #1578#1582#1589#1610#1589)
    end
    object CopyButton: TButton
      Left = 160
      Top = 145
      Width = 97
      Height = 25
      Caption = #1606#1587#1582
      TabOrder = 1
    end
    object CustomEditBox: TEdit
      Left = 160
      Top = 43
      Width = 289
      Height = 23
      TabOrder = 2
    end
    object DecRadioButton: TRadioButton
      Left = 284
      Top = 75
      Width = 86
      Height = 17
      Caption = #1593#1583#1583' '#1593#1588#1585#1610
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object GenerateButton: TButton
      Left = 352
      Top = 145
      Width = 97
      Height = 25
      Caption = #1575#1606#1588#1575#1569
      TabOrder = 4
      OnClick = GenerateButtonClick
    end
    object HexRadioButton: TRadioButton
      Left = 160
      Top = 75
      Width = 118
      Height = 17
      Caption = #1575#1604#1587#1583#1575#1587#1610' '#1593#1588#1585#1610
      TabOrder = 5
    end
    object LengthTextBox: TEdit
      Left = 376
      Top = 69
      Width = 73
      Height = 23
      TabOrder = 6
      Text = '150'
    end
    object SerialTextBox: TMemo
      Left = 160
      Top = 98
      Width = 289
      Height = 41
      Alignment = taCenter
      ScrollBars = ssVertical
      TabOrder = 7
    end
  end
  object Edit5: TEdit
    Left = 8
    Top = 8
    Width = 321
    Height = 48
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    TextHint = #1575#1604#1605#1583#1577' '#1575#1604#1578#1580#1585#1610#1576#1577' '#1576#1593#1583#1583' '#1605#1585#1575#1578' '#1575#1604#1575#1587#1578#1593#1605#1575#1604
  end
  object Button3: TButton
    Left = 8
    Top = 315
    Width = 200
    Height = 182
    Caption = #1575#1604#1575#1606#1578#1602#1575#1604' '#1575#1604#1609' '#1608#1575#1580#1607#1577' '#1575#1604#1605#1587#1578#1593#1605#1604' '
    TabOrder = 6
    OnClick = Button3Click
  end
  object Edit6: TEdit
    Left = 182
    Top = 78
    Width = 377
    Height = 65
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Text = 'motpass'
    TextHint = #1603#1604#1605#1577' '#1575#1604#1587#1585' '#1604#1578#1588#1601#1610#1585' '#1575#1604#1606#1589' '#1608#1601#1603' '#1575#1604#1578#1588#1601#1610#1585' '#1593#1606#1607
  end
  object mmo1: TMemo
    Left = 8
    Top = 147
    Width = 697
    Height = 81
    Alignment = taCenter
    Lines.Strings = (
      #1606#1578#1610#1580#1577' '#1575#1604#1578#1588#1601#1610#1585)
    TabOrder = 8
  end
  object mmo2: TMemo
    Left = 8
    Top = 234
    Width = 697
    Height = 81
    Alignment = taCenter
    Lines.Strings = (
      #1606#1578#1610#1580#1577' '#1601#1603' '#1575#1604#1578#1588#1601#1610#1585)
    TabOrder = 9
  end
end
