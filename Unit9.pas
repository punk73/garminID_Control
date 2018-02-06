unit Unit9;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FMX.StdCtrls, FMX.Grid, FMX.Controls.Presentation,
  FMX.ScrollBox, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TForm9 = class(TForm)
    detailStockGrid: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    GarminID : string;
  end;

var
  Form9: TForm9;

implementation

{$R *.fmx}

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDConnection1.Connected:=false;
  FDQuery1.Active:=false;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
  //ambil global GarminID
  //masukan ke label
  label2.Text:= GarminID;

  try
    FDConnection1.Connected:=True;
    FDQuery1.Connection:= FDConnection1;
    FDQuery1.SQL.Text:='select path, stock_awal, allocated_stock, stock from stocks where garmines_id="'+ GarminID +'"';
    FDQuery1.Active:=True;
  finally

  end;

end;

end.