unit uMicroOndas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Spin, StdCtrls, Grids, uProgramas;

type
  TForm3 = class(TForm)
    edtEntrada: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    spnTempo: TSpinEdit;
    spnPotencia: TSpinEdit;
    Label4: TLabel;
    Label5: TLabel;
    timerAquecimento: TTimer;
    Panel1: TPanel;
    btnIniciar: TButton;
    btnInicioRapido: TButton;
    Memo1: TMemo;
    rgProgramas: TRadioGroup;
    Panel2: TPanel;
    btnSalvaPrograma: TButton;
    mmProgramas: TMemo;
    lblNovoTempo: TLabel;
    lblNovoPotencia: TLabel;
    spnPotenciaNovo: TSpinEdit;
    spnTempoNovo: TSpinEdit;
    lblNovoTSegundos: TLabel;
    lblNovoPSegundos: TLabel;
    lblNovoInstrucoes: TLabel;
    edtInstrucoes: TEdit;
    lblNovoNome: TLabel;
    edtNomeNovo: TEdit;
    btnNovoPrograma: TButton;
    mmAux: TMemo;
    Label6: TLabel;
    edtInstru: TEdit;
    lblNovoCaractere: TLabel;
    edtNovoCaractere: TEdit;
    procedure btnIniciarClick(Sender: TObject);
    procedure edtEntradaChange(Sender: TObject);
    procedure btnInicioRapidoClick(Sender: TObject);
    procedure timerAquecimentoTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSalvaProgramaClick(Sender: TObject);
    procedure rgProgramasClick(Sender: TObject);
    procedure btnNovoProgramaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    pinTempo, pinPotencia : integer;
    pinDecorrido : integer;
    pstAquecer : string;
    pstSaida : String;
    pboArquivo : boolean;

    p : array of Programas;

    procedure carregarProgramas();
    procedure iniciaProcesso;
    procedure aquece1Seg(t, p : integer);    
    procedure finalizar();
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.edtEntradaChange(Sender: TObject);
begin
  if FileExists(trim(edtEntrada.Text)) then
  begin
    pboArquivo:= true;
  end
  else
  begin
    pboArquivo:= false;
  end;
  if rgProgramas.ItemIndex = 0 then
  begin
    if trim(edtEntrada.text)<>'' then
    begin
      btnIniciar.Enabled := true;
      btnInicioRapido.Enabled := true;
    end
    else
    begin
      btnIniciar.Enabled := false;
      btnInicioRapido.Enabled := false;
    end;
  end
  else
  begin
    btnIniciar.Enabled := true;
    btnInicioRapido.Enabled := true;
  end;
end;

procedure TForm3.btnIniciarClick(Sender: TObject);
begin
  pinTempo := spnTempo.Value;
  pinPotencia := spnPotencia.Value;
  iniciaProcesso();
end;

procedure TForm3.btnInicioRapidoClick(Sender: TObject);
begin
  pinTempo := 30;
  pinPotencia := 8;
  iniciaProcesso();
end;

procedure TForm3.btnSalvaProgramaClick(Sender: TObject);
var
  lstTexto:string;
begin
  if Trim(edtNomeNovo.Text) = '' then
  begin
    raise Exception.Create('Nome do novo programa não pode ser vazio.');
    exit;
  end;
  lstTexto := trim(edtNomeNovo.Text)+'/'+inttostr(spnTemponovo.Value)+'/'+inttostr(spnPotenciaNovo.Value)+'/'+edtInstrucoes.Text+'/'+edtNovoCaractere.Text;;
  mmProgramas.Lines.Add(lstTexto);
  mmProgramas.Lines.SavetoFile(ExtractFilePath(application.ExeName)+ 'Programas.txt');
  lblNovoTempo.visible := false;
  lblNovoPotencia.visible := false;
  lblNovoTSegundos.visible := false;
  lblNovoPSegundos.visible := false;
  lblNovoInstrucoes.visible := false;
  lblNovoNome.visible := false;
  spnPotenciaNovo.visible := false;
  spnTempoNovo.visible := false;
  edtNomeNovo.visible := false;
  edtInstrucoes.visible := false;
  btnSalvaPrograma.Visible := false;
  lblNovoCaractere.Visible := false;
  edtNovoCaractere.Visible:= false;
  carregarProgramas;
end;

procedure TForm3.btnNovoProgramaClick(Sender: TObject);
begin
  lblNovoTempo.visible := true;
  lblNovoPotencia.visible := true;
  lblNovoTSegundos.visible := true;
  lblNovoPSegundos.visible := true;
  lblNovoInstrucoes.visible := true;
  lblNovoNome.visible := true;
  lblNovoCaractere.Visible := true;
  edtNovoCaractere.Visible:= true;
  spnPotenciaNovo.visible := true;
  spnTempoNovo.visible := true;
  edtNomeNovo.visible := true;
  edtInstrucoes.visible := true;
  btnSalvaPrograma.Visible := true;
  edtInstrucoes.Clear;
  edtNomeNovo.clear;
  spnPotenciaNovo.Value := 10;
  spnTempoNovo.Value := 1;
end;

procedure TForm3.iniciaProcesso();
begin
  if rgProgramas.ItemIndex = 0 then
  begin
    btnIniciar.Enabled := false;
    btninicioRapido.Enabled := false;
    timerAquecimento.Enabled := true;
    pstAquecer := '.';
    pinDecorrido := 0;
    pstSaida := edtEntrada.Text;
  end
  else
  begin
    if trim(edtEntrada.Text) = '' then
      edtEntrada.Text := rgProgramas.Items.Strings[rgProgramas.ItemIndex];
    if pos(uppercase(rgProgramas.Items.Strings[rgProgramas.ItemIndex]),uppercase(edtEntrada.Text))>0 then
    begin
      btnIniciar.Enabled := false;
      btninicioRapido.Enabled := false;
      timerAquecimento.Enabled := true;
      pinDecorrido := 0;
      pstSaida := edtEntrada.Text;
    end
    else
    begin
      raise Exception.Create('Alimento incompatível com programa.');
    end;
  end;
end;

procedure TForm3.timerAquecimentoTimer(Sender: TObject);
begin
  timerAquecimento.Enabled := false;
  aquece1Seg(pinTempo,pinPotencia);
end;

procedure TForm3.aquece1Seg(t, p: integer);
var
  lstPontos, lstArquivo: String;
  i:integer;
begin
  lstPontos := '';
  for I := 0 to p - 1 do
  begin
    lstPontos := lstPontos + pstAquecer;
  end;

  pinDecorrido := pinDecorrido +1;
  pstSaida := pstSaida + lstPontos;
  memo1.lines.Clear;
  memo1.lines.Add(pstSaida);
  if pboArquivo then
  begin
    Memo1.Lines.SaveToFile(trim(edtEntrada.Text));
  end;
  if pinDecorrido <> t then
    timerAquecimento.Enabled := true
  else
    finalizar();
end;

procedure TForm3.finalizar();
begin
  memo1.Lines.Add('AQUECIDA.');
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
  pboArquivo:= false;
  carregarProgramas;
end;

procedure TForm3.carregarProgramas;
var
  i:integer;
  lstAux,lstNome,lstInstrucao,lstCaracter:string;
  linTempo,linPotencia:integer;
begin
  if FileExists(ExtractFilePath(application.ExeName) + 'Programas.txt') then
  begin
    mmProgramas.Lines.Clear;
    mmProgramas.Lines.LoadFromFile(ExtractFilePath(application.ExeName)+ 'Programas.txt');
    rgProgramas.Items.Clear;
    for I := 0 to mmProgramas.Lines.Count - 1 do
    begin
      lstAux := mmProgramas.Lines.Strings[i];
      setLength(p,i+1);
      p[i] := Programas.Create;
      p[i].setNome(copy(lstAux,1,pos('/',lstAux)-1));
      rgProgramas.Items.Add(p[i].getNome);
      lstAux := copy(lstAux,pos('/',lstAux)+1,length(lstAux));
      linTempo := Strtoint(copy(lstAux,1,pos('/',lstAux)-1));
      lstAux := copy(lstAux,pos('/',lstAux)+1,length(lstAux));
      linPotencia := Strtoint(copy(lstAux,1,pos('/',lstAux)-1));
//    edtEntrada.Text := rgProgramas.Items.Strings[rgProgramas.ItemIndex];
      lstAux := copy(lstAux,pos('/',lstAux)+1,length(lstAux));
      lstInstrucao := copy(lstAux,1,pos('/',lstAux)-1);
      lstAux := copy(lstAux,pos('/',lstAux)+1,length(lstAux));
      lstCaracter := lstAux;
      p[i].setTempo(linTempo);
      p[i].setPotencia(linPotencia);
      p[i].setInstrucoes(lstInstrucao);
      p[i].setCaractere(lstCaracter);
    end;
    rgProgramas.ItemIndex:=0;
  end;
end;

procedure TForm3.rgProgramasClick(Sender: TObject);
var
  lstAux : string;
begin
  if rgProgramas.ItemIndex = 0 then
  begin
    spnTempo.Enabled := true;
    spnPotencia.Enabled := true;
  end
  else
  begin
    spnTempo.Enabled := true;
    spnPotencia.Enabled := true;
    spnTempo.Value := p[rgProgramas.ItemIndex].getTempo;
    spnPotencia.Value := p[rgProgramas.ItemIndex].getPotencia;
    edtInstru.Text := p[rgProgramas.ItemIndex].getInstrucoes;
    pstAquecer := p[rgProgramas.ItemIndex].getCaractere;
{
    lstAux := mmProgramas.Lines.Strings[rgProgramas.ItemIndex];
    lstAux := copy(lstAux,pos('/',lstAux)+1,length(lstAux));
    spnTempo.Value := Strtoint(copy(lstAux,1,pos('/',lstAux)-1));
    lstAux := copy(lstAux,pos('/',lstAux)+1,length(lstAux));
    spnPotencia.Value := Strtoint(copy(lstAux,1,pos('/',lstAux)-1));
//    edtEntrada.Text := rgProgramas.Items.Strings[rgProgramas.ItemIndex];
    lstAux := copy(lstAux,pos('/',lstAux)+1,length(lstAux));
    edtInstru.Text := copy(lstAux,1,pos('/',lstAux)-1);
    lstAux := copy(lstAux,pos('/',lstAux)+1,length(lstAux));
    pstAquecer := lstAux;
}
    spnTempo.Enabled := false;
    spnPotencia.Enabled := false;
    edtInstru.Enabled := false;
    btnIniciar.Enabled := true;
    btnInicioRapido.Enabled := true;
  end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i:integer;
begin
  for i := 0 to Length(p) - 1 do
    p[i].Destroy;
end;

end.
