unit Unit7;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs;

type
  TForm7 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtUsername: TEdit;
    edtPassword: TEdit;
    PasswordEditButton1: TPasswordEditButton;
    Button2: TButton;
    LoginConnection: TFDConnection;
    FDQuery1: TFDQuery;
    Button3: TButton;
    Edit1: TEdit;
    PasswordEditButton2: TPasswordEditButton;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.fmx}

end.
