program Tree;

uses
  Forms,
  UFrm in 'UFrm.pas' {MainForm},
  UNode in 'UNode.pas',
  UTree in 'UTree.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
 