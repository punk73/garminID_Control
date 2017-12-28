program TabbedApplication;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  System.StartUpCopy,
  FMX.Forms,
  FMX.Dialogs,
  TabbedTemplate in 'TabbedTemplate.pas' {TabbedForm},
  Unit1 in 'Unit1.pas',
  Unit2 in 'Unit2.pas',
  Unit3 in 'Unit3.pas',
  Unit4 in 'Unit4.pas' {DuplicatedForm},
  Unit5 in 'Unit5.pas',
  Unit6 in 'Unit6.pas' {Form6};

{$R *.res}

begin
  if TForm6.Execute then
  begin
    Application.Initialize;
    Application.CreateForm(TTabbedForm, TabbedForm);
    Application.CreateForm(TDuplicatedForm, DuplicatedForm);
    Application.Run;
  end
  else
  begin
    ShowMessage('username or password is wrong!');
  end;

end.
