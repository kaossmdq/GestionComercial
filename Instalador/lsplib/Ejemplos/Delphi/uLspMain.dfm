object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 240
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 80
    Top = 40
    Width = 153
    Height = 41
    Caption = 'Autorizar Liquidacion'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 80
    Top = 112
    Width = 153
    Height = 41
    Caption = 'Ajustar Liquidacion'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 80
    Top = 176
    Width = 153
    Height = 41
    Caption = 'Consultar Liquidacion'
    TabOrder = 2
    OnClick = Button3Click
  end
end
