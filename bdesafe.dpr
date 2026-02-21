program bdesafe;

uses
  Forms,
  u_main in 'source\u_main.pas' {frmMain},
  u_about in 'source\u_about.pas' {frmAbout},
  u_backup in 'source\u_backup.pas' {frmBackup},
  base in 'library\zrfisaac\base.pas',
  zrfi in 'library\zrfisaac\zrfi.pas' {frmZrfi};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'BDE Safe [ ALFA ]';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmBackup, frmBackup);
  Application.CreateForm(TfrmZrfi, frmZrfi);
  Application.Run;
end.
