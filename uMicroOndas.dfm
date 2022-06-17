object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Microondas'
  ClientHeight = 280
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 216
    Height = 280
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 11
      Width = 45
      Height = 13
      Caption = 'Entrada: '
    end
    object Label2: TLabel
      Left = 16
      Top = 43
      Width = 39
      Height = 13
      Caption = 'Tempo: '
    end
    object Label3: TLabel
      Left = 16
      Top = 67
      Width = 48
      Height = 13
      Caption = 'Pot'#234'ncia: '
    end
    object Label4: TLabel
      Left = 115
      Top = 43
      Width = 47
      Height = 13
      Caption = 'Segundos'
    end
    object Label5: TLabel
      Left = 115
      Top = 67
      Width = 47
      Height = 13
      Caption = 'Segundos'
    end
    object Label6: TLabel
      Left = 16
      Top = 88
      Width = 58
      Height = 13
      Caption = 'Instru'#231#245'es: '
    end
    object edtEntrada: TEdit
      Left = 64
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = edtEntradaChange
    end
    object spnTempo: TSpinEdit
      Left = 64
      Top = 40
      Width = 45
      Height = 22
      MaxValue = 120
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
    object spnPotencia: TSpinEdit
      Left = 64
      Top = 64
      Width = 45
      Height = 22
      MaxValue = 10
      MinValue = 1
      TabOrder = 2
      Value = 10
    end
    object btnIniciar: TButton
      Left = 24
      Top = 139
      Width = 75
      Height = 25
      Caption = 'Iniciar'
      Enabled = False
      TabOrder = 3
      OnClick = btnIniciarClick
    end
    object btnInicioRapido: TButton
      Left = 115
      Top = 139
      Width = 75
      Height = 25
      Caption = 'In'#237'cio R'#225'pido'
      Enabled = False
      TabOrder = 4
      OnClick = btnInicioRapidoClick
    end
    object Memo1: TMemo
      Left = 1
      Top = 177
      Width = 214
      Height = 102
      Align = alBottom
      ScrollBars = ssBoth
      TabOrder = 5
    end
    object edtInstru: TEdit
      Left = 73
      Top = 85
      Width = 121
      Height = 21
      MaxLength = 250
      TabOrder = 6
    end
  end
  object Panel2: TPanel
    Left = 216
    Top = 0
    Width = 355
    Height = 280
    Align = alRight
    TabOrder = 1
    object lblNovoTempo: TLabel
      Left = 16
      Top = 151
      Width = 39
      Height = 13
      Caption = 'Tempo: '
      Visible = False
    end
    object lblNovoPotencia: TLabel
      Left = 16
      Top = 176
      Width = 48
      Height = 13
      Caption = 'Pot'#234'ncia: '
      Visible = False
    end
    object lblNovoTSegundos: TLabel
      Left = 115
      Top = 151
      Width = 47
      Height = 13
      Caption = 'Segundos'
      Visible = False
    end
    object lblNovoPSegundos: TLabel
      Left = 115
      Top = 176
      Width = 47
      Height = 13
      Caption = 'Segundos'
      Visible = False
    end
    object lblNovoInstrucoes: TLabel
      Left = 16
      Top = 198
      Width = 58
      Height = 13
      Caption = 'Instru'#231#245'es: '
      Visible = False
    end
    object lblNovoNome: TLabel
      Left = 16
      Top = 128
      Width = 34
      Height = 13
      Caption = 'Nome: '
      Visible = False
    end
    object lblNovoCaractere: TLabel
      Left = 16
      Top = 219
      Width = 55
      Height = 13
      Caption = 'Caractere: '
      Visible = False
    end
    object rgProgramas: TRadioGroup
      Left = 1
      Top = 1
      Width = 353
      Height = 120
      Align = alTop
      Caption = 'Programas'
      Columns = 4
      TabOrder = 0
      OnClick = rgProgramasClick
    end
    object btnSalvaPrograma: TButton
      Left = 235
      Top = 149
      Width = 94
      Height = 25
      Caption = 'Salva Programa'
      TabOrder = 1
      Visible = False
      OnClick = btnSalvaProgramaClick
    end
    object mmProgramas: TMemo
      Left = -8
      Top = 36
      Width = 41
      Height = 25
      Lines.Strings = (
        'mmProgramas')
      ScrollBars = ssBoth
      TabOrder = 2
      Visible = False
    end
    object spnPotenciaNovo: TSpinEdit
      Left = 64
      Top = 173
      Width = 45
      Height = 22
      MaxValue = 10
      MinValue = 1
      TabOrder = 3
      Value = 10
      Visible = False
    end
    object spnTempoNovo: TSpinEdit
      Left = 64
      Top = 148
      Width = 45
      Height = 22
      MaxValue = 120
      MinValue = 1
      TabOrder = 4
      Value = 1
      Visible = False
    end
    object edtInstrucoes: TEdit
      Left = 80
      Top = 195
      Width = 121
      Height = 21
      MaxLength = 250
      TabOrder = 5
      Visible = False
    end
    object edtNomeNovo: TEdit
      Left = 80
      Top = 125
      Width = 121
      Height = 21
      MaxLength = 250
      TabOrder = 6
      Visible = False
    end
    object btnNovoPrograma: TButton
      Left = 235
      Top = 123
      Width = 94
      Height = 25
      Caption = 'Novo Programa'
      TabOrder = 7
      OnClick = btnNovoProgramaClick
    end
    object mmAux: TMemo
      Left = 272
      Top = 240
      Width = 64
      Height = 28
      ScrollBars = ssBoth
      TabOrder = 8
      Visible = False
    end
    object edtNovoCaractere: TEdit
      Left = 80
      Top = 216
      Width = 121
      Height = 21
      MaxLength = 1
      TabOrder = 9
      Visible = False
    end
  end
  object timerAquecimento: TTimer
    Enabled = False
    OnTimer = timerAquecimentoTimer
    Left = 352
    Top = 8
  end
end
