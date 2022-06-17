program pMicroOndas;

uses
  Forms,
  uMicroOndas in 'uMicroOndas.pas' {Form3},
  uProgramas in 'uProgramas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
