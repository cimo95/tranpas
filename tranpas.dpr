program tranpas;

uses
  Forms,
  uutama in 'uutama.pas' {futama};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'TRANPAS GUI';
  Application.CreateForm(Tf0, f0);
  Application.Run;
end.
