program LspTest;

uses
  Vcl.Forms,
  lsplib_TLB in 'lsplib_TLB.pas',
  uLspMain in 'uLspMain.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
