unit uProgramas;

interface

type Programas = class
  private
    tempo : integer;
    potencia : integer;
    nome : String;
    instrucoes : String;
    caractere : String;
  public

    procedure setTempo(t : integer);
    procedure setPotencia(pot : integer);
    procedure setNome(nom : string);
    procedure setInstrucoes(ins : string);
    procedure setCaractere(car : string);

    function getTempo : integer;
    function getPotencia : integer;
    function getNome : string;
    function getInstrucoes: string;
    function getCaractere: string;

end;


implementation

{ Programas }

function Programas.getCaractere: string;
begin
  result := Self.caractere;
end;

function Programas.getInstrucoes: string;
begin
  result := Self.instrucoes;
end;

function Programas.getNome: string;
begin
  result := Self.nome;
end;

function Programas.getPotencia: integer;
begin
  result := Self.Potencia;
end;

function Programas.getTempo: integer;
begin
  result := Self.tempo;
end;

procedure Programas.setCaractere(car: string);
begin
  Self.caractere := car;
end;

procedure Programas.setInstrucoes(ins: string);
begin
  Self.instrucoes := ins;
end;

procedure Programas.setNome(nom: string);
begin
  Self.nome := nom;
end;

procedure Programas.setPotencia(pot: integer);
begin
  Self.potencia := pot;
end;

procedure Programas.setTempo(t: integer);
begin
  Self.tempo := t;
end;

end.
