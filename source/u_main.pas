// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi7 ]
unit u_main;

interface

uses
  // # : delphi
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  ExtCtrls,
  ComCtrls,
  ActnList,
  Menus;

type
  TfrmMain = class(TForm)
    sbStatus: TStatusBar;
    pnBack: TPanel;
    miMenu: TMainMenu;
    acAction: TActionList;
    miHelp: TMenuItem;
    miAbout: TMenuItem;
    miConfiguration: TMenuItem;
    miZrfisaac: TMenuItem;
    procedure FormCreate(Sender: TObject);
  private
    vMenu: TPanel;
  public
    procedure fnMenu(_pClass: TFormClass; var _pVariable); overload;
    procedure fnMenu(var _pVariable; _pClass: TFormClass); overload;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  // # : zrfisaac
  base,
  // # : source
  u_backup;

{$R *.dfm}

procedure TfrmMain.fnMenu(_pClass: TFormClass; var _pVariable);
var
  _vInstance: TForm;
  _vBack: TPanel;
begin
  if Assigned(TForm(_pVariable)) then
    _vInstance := TForm(_pVariable)
  else
  begin
    _vInstance := TForm(_pClass.NewInstance);
    TForm(_pVariable) := _vInstance;
    try
      _vInstance.Create(Self);
    except
      TComponent(_pVariable) := nil;
      raise;
    end;
  end;
  _vBack := TPanel(_vInstance.FindComponent('pnBack'));
  if Assigned(_vBack) then
  begin
    if Assigned(vMenu) then
    begin
      vMenu.Parent := TForm(vMenu.Owner);
      vMenu := Nil;
    end;
    vMenu := _vBack;
    _vBack.Parent := Self.pnBack;
  end
  else
  begin
    _vInstance.ShowModal;
  end;
end;

procedure TfrmMain.fnMenu(var _pVariable; _pClass: TFormClass);
begin
  Self.fnMenu(_pClass, _pVariable);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // # : Title
  Self.Caption := Application.Title;

  // # : Version
  if (Self.sbStatus.Panels.Count > 0) then
    Self.sbStatus.Panels[0].Text := fnVersion;
  if (Self.sbStatus.Panels.Count > 1) then
    Self.sbStatus.Panels[1].Text := fnVersion('InternalName') + '     ';

  // # : Routine
  fnMenu(TfrmBackup, frmBackup);
end;

end.
