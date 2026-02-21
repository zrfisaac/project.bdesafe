// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ delphi7 ]
unit u_backup;

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
  StdCtrls,
  ComCtrls,
  ToolWin,
  Buttons, ImgList, Grids, DBGrids, DB, DBTables, DBClient, ActnList,
  Provider, CheckLst, Menus;

type
  TfrmBackup = class(TForm)
    pnBack: TPanel;
    pnSide: TPanel;
    pnCenter: TPanel;
    pbProgressItem: TProgressBar;
    pbProgressGroup: TProgressBar;
    pnStatus: TPanel;
    meStatus: TMemo;
    sbSide: TScrollBox;
    pnPassword: TPanel;
    pnUser: TPanel;
    pnDatabase: TPanel;
    pnServer: TPanel;
    pnAlias: TPanel;
    lbAlias: TLabel;
    edAlias: TEdit;
    edServer: TEdit;
    lbServer: TLabel;
    edDatabase: TEdit;
    lbDatabase: TLabel;
    edPassword: TEdit;
    lbPassword: TLabel;
    edUser: TEdit;
    lbUser: TLabel;
    pnSideFooter: TPanel;
    btDownload: TBitBtn;
    pcCenter: TPageControl;
    btServer: TBitBtn;
    btLocal: TBitBtn;
    btUpdate: TBitBtn;
    tsColumn: TTabSheet;
    imList: TImageList;
    dbgColumn: TDBGrid;
    dbBde: TDatabase;
    qryColumn: TQuery;
    dspColumn: TDataSetProvider;
    dtsColumn: TDataSource;
    cdsColumn: TClientDataSet;
    tsDummy: TTabSheet;
    sbDummy: TScrollBox;
    pnDummyColumn: TPanel;
    lbDummyColumn: TLabel;
    meDummyColumn: TMemo;
    tsLink: TTabSheet;
    dbgLink: TDBGrid;
    dtsLink: TDataSource;
    cdsLink: TClientDataSet;
    dspLink: TDataSetProvider;
    qryLink: TQuery;
    tsProcedure: TTabSheet;
    tsFunction: TTabSheet;
    dbgProcedure: TDBGrid;
    dbgFunction: TDBGrid;
    qryProcedure: TQuery;
    dspProcedure: TDataSetProvider;
    cdsProcedure: TClientDataSet;
    dtsProcedure: TDataSource;
    qryFunction: TQuery;
    dspFunction: TDataSetProvider;
    cdsFunction: TClientDataSet;
    dtsFunction: TDataSource;
    cklbAction: TCheckListBox;
    tsView: TTabSheet;
    dbgView: TDBGrid;
    cdsView: TClientDataSet;
    dtsView: TDataSource;
    dspView: TDataSetProvider;
    qryView: TQuery;
    tsTrigger: TTabSheet;
    dbgTrigger: TDBGrid;
    qryTrigger: TQuery;
    dspTrigger: TDataSetProvider;
    cdsTrigger: TClientDataSet;
    dtsTrigger: TDataSource;
    tsConstraint: TTabSheet;
    dbgConstraint: TDBGrid;
    dtsConstraint: TDataSource;
    cdsConstraint: TClientDataSet;
    dspConstraint: TDataSetProvider;
    qryConstraint: TQuery;
    pmAction: TPopupMenu;
    pmActionCheckAll: TMenuItem;
    pmActionUncheckAll: TMenuItem;
    pmActionToggleAll: TMenuItem;
    procedure btServerClick(Sender: TObject);
    procedure btDownloadClick(Sender: TObject);
    procedure btLocalClick(Sender: TObject);
    procedure btUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pmActionCheckAllClick(Sender: TObject);
    procedure pmActionUncheckAllClick(Sender: TObject);
    procedure pmActionToggleAllClick(Sender: TObject);
  public
    function fnAction(_pAction: String): Boolean;
    procedure fnDownload;
    procedure fnServer;
    procedure fnLocal;
    procedure fnUpdate;
  end;

var
  frmBackup: TfrmBackup;

implementation

{$R *.dfm}

{ TfrmBackup }

procedure TfrmBackup.fnDownload;
begin

end;

procedure TfrmBackup.fnLocal;
var
  _vError: Boolean;
  _vErrorMessage: String;
begin
  // # : Initialization
  _vError := False;
  _vErrorMessage := '';
  Self.cdsColumn.Close;
  Self.cdsLink.Close;
  Self.cdsConstraint.Close;
  Self.cdsTrigger.Close;
  Self.cdsView.Close;
  Self.cdsProcedure.Close;
  Self.cdsFunction.Close;

  // # : Column
  // {
  if not(_vError)
  and (Self.fnAction('Column')) then
  begin
    try
      Self.cdsColumn.Close;
      Self.cdsColumn.LoadFromFile('column.xml');
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Link
  // {
  if not(_vError)
  and (Self.fnAction('Link')) then
  begin
    try
      Self.cdsLink.Close;
      Self.cdsLink.LoadFromFile('link.xml');
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Constraint
  // {
  if not(_vError)
  and (Self.fnAction('Constraint')) then
  begin
    try
      Self.cdsConstraint.Close;
      Self.cdsConstraint.LoadFromFile('constraint.xml');
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Trigger
  // {
  if not(_vError)
  and (Self.fnAction('Trigger')) then
  begin
    try
      Self.cdsTrigger.Close;
      Self.cdsTrigger.LoadFromFile('trigger.xml');
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : View
  // {
  if not(_vError)
  and (Self.fnAction('View')) then
  begin
    try
      Self.cdsView.Close;
      Self.cdsView.LoadFromFile('view.xml');
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Procedure
  // {
  if not(_vError)
  and (Self.fnAction('Procedure')) then
  begin
    try
      Self.cdsProcedure.Close;
      Self.cdsProcedure.LoadFromFile('procedure.xml');
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Function
  // {
  if not(_vError)
  and (Self.fnAction('Function')) then
  begin
    try
      Self.cdsFunction.Close;
      Self.cdsFunction.LoadFromFile('function.xml');
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Error
  // {
  if (_vError) then
  begin
    Application.MessageBox(
       PChar(_vErrorMessage)
      ,PChar('Error')
      ,MB_ICONERROR or MB_OK
    );
  end;
  // }

  // # : Fix
  // {
  Self.pcCenter.TabIndex := Self.tsLink.TabIndex;
  Self.pcCenter.TabIndex := Self.tsColumn.TabIndex;
  // }
end;

procedure TfrmBackup.fnServer;
var
  _vError: Boolean;
  _vErrorMessage: String;
begin
  // # : Initialization
  _vError := False;
  _vErrorMessage := '';
  Self.cdsColumn.Close;
  Self.cdsLink.Close;
  Self.cdsConstraint.Close;
  Self.cdsTrigger.Close;
  Self.cdsView.Close;
  Self.cdsProcedure.Close;
  Self.cdsFunction.Close;

  // # : BDE
  // {
  if not(_vError) then
  begin
    try
      Self.dbBde.Close;
      Self.dbBde.AliasName := Self.edAlias.Text;
      Self.dbBde.Params.Values['SERVER NAME'] := Self.edServer.Text;
      Self.dbBde.Params.Values['DATABASE NAME'] := Self.edDatabase.Text;
      Self.dbBde.Params.Values['USER NAME'] := Self.edUser.Text;
      Self.dbBde.Params.Values['PASSWORD'] := Self.edPassword.Text;
      Self.dbBde.Open;
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Column
  // {
  if not(_vError)
  and (Self.fnAction('Column')) then
  begin
    try
      Self.qryColumn.Close;
      Self.qryColumn.Open;
      Self.cdsColumn.Close;
      Self.cdsColumn.Open;
      Self.cdsColumn.SaveToFile('column.xml', dfXML);
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Link
  // {
  if not(_vError)
  and (Self.fnAction('Link')) then
  begin
    try
      Self.qryLink.Close;
      Self.qryLink.Open;
      Self.cdsLink.Close;
      Self.cdsLink.Open;
      Self.cdsLink.SaveToFile('link.xml', dfXML);
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Constraint
  // {
  if not(_vError)
  and (Self.fnAction('Constraint')) then
  begin
    try
      Self.cdsConstraint.Close;
      Self.cdsConstraint.Open;
      Self.cdsConstraint.Close;
      Self.cdsConstraint.Open;
      Self.cdsConstraint.SaveToFile('constraint.xml', dfXML);
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Trigger
  // {
  if not(_vError)
  and (Self.fnAction('Trigger')) then
  begin
    try
      Self.cdsTrigger.Close;
      Self.cdsTrigger.Open;
      Self.cdsTrigger.Close;
      Self.cdsTrigger.Open;
      Self.cdsTrigger.SaveToFile('trigger.xml', dfXML);
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : View
  // {
  if not(_vError)
  and (Self.fnAction('View')) then
  begin
    try
      Self.qryView.Close;
      Self.qryView.Open;
      Self.cdsView.Close;
      Self.cdsView.Open;
      Self.cdsView.SaveToFile('view.xml', dfXML);
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Procedure
  // {
  if not(_vError)
  and (Self.fnAction('Procedure')) then
  begin
    try
      Self.qryProcedure.Close;
      Self.qryProcedure.Open;
      Self.cdsProcedure.Close;
      Self.cdsProcedure.Open;
      Self.cdsProcedure.SaveToFile('procedure.xml', dfXML);
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Function
  // {
  if not(_vError)
  and (Self.fnAction('Function')) then
  begin
    try
      Self.qryFunction.Close;
      Self.qryFunction.Open;
      Self.cdsFunction.Close;
      Self.cdsFunction.Open;
      Self.cdsFunction.SaveToFile('function.xml', dfXML);
    except
      on E: Exception do
      begin
        _vError := True;
        _vErrorMessage := 'Error :'#13#10 + E.Message;
      end;
    end;
  end;
  // }

  // # : Free
  // {
  Self.dbBde.Close;
  Self.qryColumn.Close;
  // }

  // # : Error
  // {
  if (_vError) then
  begin
    Application.MessageBox(
       PChar(_vErrorMessage)
      ,PChar('Error')
      ,MB_ICONERROR or MB_OK
    );
  end;
  // }

  // # : Fix
  // {
  Self.pcCenter.TabIndex := Self.tsLink.TabIndex;
  Self.pcCenter.TabIndex := Self.tsColumn.TabIndex;
  // }
end;

procedure TfrmBackup.fnUpdate;
begin

end;

procedure TfrmBackup.btServerClick(Sender: TObject);
begin
  Self.fnServer;
end;

procedure TfrmBackup.btDownloadClick(Sender: TObject);
begin
  Self.fnDownload;
end;

procedure TfrmBackup.btLocalClick(Sender: TObject);
begin
  Self.fnLocal;
end;

procedure TfrmBackup.btUpdateClick(Sender: TObject);
begin
  Self.fnUpdate;
end;

procedure TfrmBackup.FormCreate(Sender: TObject);
var
  _vI0: Integer;
begin
  // # : Visual
  Self.tsDummy.TabVisible := False;
  Self.pcCenter.TabIndex := Self.tsColumn.TabIndex;
  for _vI0 := 0 to Self.cklbAction.Items.Count - 1 do
    Self.cklbAction.Checked[_vI0] := True;
end;

function TfrmBackup.fnAction(_pAction: String): Boolean;
var
  _vIndex: Integer;
begin
  _vIndex := Self.cklbAction.Items.IndexOf(_pAction);
  if _vIndex >= 0 then
    Result := Self.cklbAction.Checked[_vIndex]
  else
    Result := False;
end;

procedure TfrmBackup.pmActionCheckAllClick(Sender: TObject);
var
  _vI0: Integer;
begin
  for _vI0 := 0 to Self.cklbAction.Items.Count - 1 do
    Self.cklbAction.Checked[_vI0] := True;
end;

procedure TfrmBackup.pmActionUncheckAllClick(Sender: TObject);
var
  _vI0: Integer;
begin
  for _vI0 := 0 to Self.cklbAction.Items.Count - 1 do
    Self.cklbAction.Checked[_vI0] := False;
end;

procedure TfrmBackup.pmActionToggleAllClick(Sender: TObject);
var
  _vI0: Integer;
begin
  for _vI0 := 0 to Self.cklbAction.Items.Count - 1 do
    Self.cklbAction.Checked[_vI0] := not(Self.cklbAction.Checked[_vI0]);
end;

end.

