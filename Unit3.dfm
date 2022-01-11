object Form3: TForm3
  Left = 0
  Top = 0
  Caption = #1608#1575#1580#1607#1577' '#1575#1604#1605#1587#1578#1593#1605#1604' '#1575#1604#1578#1610' '#1587#1610#1578#1605' '#1601#1610#1607#1575' '#1575#1590#1607#1575#1585' '#1591#1585#1610#1602#1577' '#1575#1604#1578#1601#1593#1610#1604
  ClientHeight = 465
  ClientWidth = 597
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  DesignSize = (
    597
    465)
  TextHeight = 15
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 441
    Width = 591
    Height = 21
    Align = alBottom
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    ExplicitTop = 437
    ExplicitWidth = 4
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 581
    Height = 57
    Alignment = taCenter
    Anchors = [akTop]
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TextHint = #1578#1608#1604#1610#1583' '#1585#1602#1605' '#1575#1604#1578#1587#1580#1610#1604'+'#1575#1610#1583#1578' '#1602#1585#1575#1569#1577' '#1601#1602#1591
  end
  object mmo1: TMemo
    Left = 8
    Top = 176
    Width = 581
    Height = 193
    ParentCustomHint = False
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight, akBottom]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 168
    Top = 375
    Width = 241
    Height = 57
    Caption = 'BitBtn1'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object tmrstpwatch: TTimer
    OnTimer = tmrstpwatchTimer
    Left = 280
    Top = 96
  end
end
