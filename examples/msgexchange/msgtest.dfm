object FrmTest: TFrmTest
  Left = 390
  Top = 282
  Caption = 'Msg test'
  ClientHeight = 348
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    356
    348)
  PixelsPerInch = 96
  TextHeight = 13
  object BtServer: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start server'
    TabOrder = 0
    OnClick = BtServerClick
  end
  object BtClient: TButton
    Left = 251
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Start client'
    TabOrder = 1
    OnClick = BtClientClick
  end
  object MmLog: TMemo
    Left = 8
    Top = 39
    Width = 340
    Height = 301
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object TmrSend: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = TmrSendTimer
    Left = 72
    Top = 104
  end
  object TmrLog: TTimer
    Interval = 50
    OnTimer = TmrLogTimer
    Left = 248
    Top = 216
  end
end
