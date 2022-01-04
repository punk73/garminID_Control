unit Unit7;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Edit, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.TabControl, System.ImageList, FMX.ImgList;

type
  TForm7 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    PasswordEditButton1: TPasswordEditButton;
    LoginConnection: TFDConnection;
    FDQuery1: TFDQuery;
    Label3: TLabel;
    edtPassword2: TEdit;
    PasswordEditButton2: TPasswordEditButton;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Label4: TLabel;
    Panel2: TPanel;
    Button3: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    PasswordEditButton3: TPasswordEditButton;
    Edit3: TEdit;
    PasswordEditButton4: TPasswordEditButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit4: TEdit;
    PasswordEditButton5: TPasswordEditButton;
    ImageList1: TImageList;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
 uses unit6;
{$R *.fmx}

procedure TForm7.Button1Click(Sender: TObject);
var
  query: string;
  tmpquery: TFDQuery;
begin
  {error handler start}
  if edtUsername.Text='' then
  begin
    ShowMessage('username cannot be empty!');
    edtUsername.SetFocus;
    Exit;
  end;

  if edtPassword.Text='' then
  begin
    ShowMessage('Password cannot be empty!');
    edtPassword.SetFocus;
    Exit;
  end;

  if edtPassword2.Text='' then
  begin
    ShowMessage('New Password cannot be empty!');
    edtPassword2.SetFocus;
    Exit;
  end;


  if not ( edtPassword.Text = edtPassword2.Text ) then
  begin
    ShowMessage('Password is not match!');
    edtPassword.SetFocus;
    Exit;
  end;

  //cek username
  try
    tmpquery:= TFDQuery.Create(nil);
    tmpquery.Connection:= LoginConnection;
    tmpquery.SQL.Text:= 'select username from users where username ="'+ edit1.Text +'"';
    try
      tmpquery.Open();
      if tmpquery.RecordCount > 0 then
      begin
        ShowMessage('username already exist !');
        edtUsername.SetFocus;
        exit;
      end;
    except
      on E:exception do ShowMessage(E.Message);
    end;

  finally
    tmpquery.Free;
  end;

  {error handler finish}

  try
    query:='insert into users (username, password) values ("'+edtUsername.Text+'","'+edtPassword.Text+'")';

    LoginConnection.ExecSQL(query);
    ShowMessage('Saved!');

    //bersih
    edtUsername.Text:='';
    edtPassword.Text:='';
    edtPassword2.Text:='';
    
    //comeback to previous form
    ModalResult := mrCancel;

  except
    on E:exception do
      ShowMessage(E.Message);
  end;

end;

procedure TForm7.Button3Click(Sender: TObject);
var
  query: string;
  tmpquery: TFDQuery;
begin
  {error handler start}
  if Edit1.Text='' then
  begin
    ShowMessage('username cannot be empty!');
    Edit1.SetFocus;
    Exit;
  end;

  if Edit2.Text='' then
  begin
    ShowMessage('Password cannot be empty!');
    Edit2.SetFocus;
    Exit;
  end;

  if Edit3.Text='' then
  begin
    ShowMessage('New Password cannot be empty!');
    Edit3.SetFocus;
    Exit;
  end;

  if Edit4.Text='' then
  begin
    ShowMessage('Retype New Password!');
    Edit4.SetFocus;
    Exit;
  end;

  if not ( Edit3.Text = Edit4.Text ) then
  begin
    ShowMessage('New Password is not match!');
    edit3.SetFocus;
    Exit;
  end;

  //cek username
  try
    tmpquery:= TFDQuery.Create(nil);
    tmpquery.Connection:= LoginConnection;
    tmpquery.SQL.Text:= 'select username,password from users where username ="'+ edit1.Text +'" and password="'+ edit2.Text +'" ';
    try
      tmpquery.Open();
      if tmpquery.RecordCount = 0 then
      begin
        ShowMessage('username or password incorrect !');
        Edit1.SetFocus;
        exit;
      end;
    except
      on E:exception do ShowMessage(E.Message);
    end;

  finally
    tmpquery.Free;
  end;

  {error handler finish}

  try
    query:='update users set password="'+edit3.Text+'" where username="'+edit1.Text+'" and password="'+edit2.Text+'"';

    LoginConnection.ExecSQL(query);
    ShowMessage('Password Changed!');

    //bersih
    edit1.Text:='';
    edit2.Text:='';
    edit3.Text:='';
    edit4.Text:='';

    //comeback to previous form
    ModalResult := mrCancel;

  except
    on E:exception do
      ShowMessage(E.Message);
  end;

end;

procedure TForm7.Edit2KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
var
  tmpquery: TFDQuery;
begin
  if Key=13 then
  begin
    try
      tmpquery:= TFDQuery.Create(nil);
      tmpquery.Connection:= LoginConnection;
      tmpquery.SQL.Text:= 'select username,password from users where username ="'+ edit1.Text +'" and password="'+ edit2.Text +'" ';
      try
        tmpquery.Open();
        if tmpquery.RecordCount = 0 then
        begin
          ShowMessage('username not found!');
          Edit1.SetFocus;
          exit;
        end
        else
        begin
          edit3.SetFocus;
        end;
      except
        on E:exception do ShowMessage(E.Message);
      end;

    finally
      tmpquery.Free;
    end;
  end;

end;

procedure TForm7.FormCreate(Sender: TObject);
var
  oParams: TStringList;
begin
  try
    if FileExists(ExtractFilePath(ParamStr(0)) + 'file.ini' ) then
    begin
      try
        oParams:=Tstringlist.Create;
        oParams.LoadFromFile( ExtractFilePath(ParamStr(0)) + 'file.ini' );
        //oParams.Add('Pooled=True');
        FDManager.AddConnectionDef('garmin_inventory_login', 'MySQL', oParams);
        LoginConnection.ConnectionDefName:='garmin_inventory_login';
      finally
        oParams.Free;
      end;
    end;

    LoginConnection.Connected:=true;
  except
    on E:exception do
    ShowMessage(E.ClassName +' has rised exception of '+ E.Message);
  end;
end;

end.
