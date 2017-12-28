unit Unit6;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.ImageList, FMX.ImgList, FMX.Objects;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    LoginConnection: TFDConnection;
    FDQuery1: TFDQuery;
    edtUsername: TEdit;
    edtPassword: TEdit;
    PasswordEditButton1: TPasswordEditButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure bersih;
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

procedure TForm6.bersih;
begin
  edtUsername.Text:='';
  edtPassword.Text:='';
end;

procedure TForm6.Button1Click(Sender: TObject);
var tmpQuery:TFDQuery;
begin
  try
     tmpQuery:= TFDQuery.Create(Self);
     tmpQuery.Connection:= LoginConnection;
     tmpQuery.SQL.Text:= 'select username from users where username="'+edtUsername.Text+'" and password="'+edtPassword.Text+'"';
     tmpQuery.Active:=true;
     tmpQuery.Open();

     if tmpQuery.RecordCount <> 0 then
     begin
       ShowMessage('you are logged in!');
     end
     else
     begin
       ShowMessage('username or password is wrong!');

     end;

  finally
     tmpQuery.Free;
  end;
end;

procedure TForm6.FormCreate(Sender: TObject);
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
        FDManager.AddConnectionDef('garmin_inventory', 'MySQL', oParams);
        LoginConnection.ConnectionDefName:='garmin_inventory';
      finally
        oParams.Free;
      end;
    end;
    LoginConnection.Connected:=true;
  except
    on E:exception do
    ShowMessage(E.ClassName +' has rised exception of '+ E.Message);
  end;


  //Image1.Bitmap.LoadFromFile(ExtractFilePath( ParamStr(0) ) + 'icon\user.png' );

end;

end.
