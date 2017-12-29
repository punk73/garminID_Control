unit Unit8;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.StdCtrls, FMX.Controls.Presentation,
  FMX.ScrollBox, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm8 = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    psoConnection: TFDConnection;
    FDQuery1: TFDQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var modelNumber: string;
  end;

var
  Form8: TForm8;


implementation
   uses tabbedTemplate;
{$R *.fmx}

procedure TForm8.FormCreate(Sender: TObject);
var
  tmpQueryPSO: TFDQuery;
  query: string;
begin
  psoConnection :=  TabbedForm.psoConnection;

  if not (modelNumber='') then
    begin
      try
        tmpQueryPSO:=TFDQuery.Create(nil);
        tmpQueryPSO.Connection:= psoConnection ;

        query:='select model_no,sum(qty), month(end_date) from t_file where model_no in '+
               '('+ modelNumber +') and '+
               ' create_time=(select max(create_time) from t_file) ' +
               ' group by month(end_date) ' +
               ' order by end_date ASC  ';

        tmpQueryPSO.SQL.Text := query;
        tmpQueryPSO.Active:=true;
        tmpQueryPSO.Open();



      finally
        tmpQueryPSO.Free;
      end;
    end;
end;

end.
