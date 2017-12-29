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
    detailDemandGrid: TStringGrid;
    Label1: TLabel;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    psoConnection: TFDConnection;
    FDQuery1: TFDQuery;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     modelNumber, currentStock, GarminID: string;
  end;

var
  Form8: TForm8;


implementation
   uses tabbedTemplate;
{$R *.fmx}

procedure TForm8.FormShow(Sender: TObject);
var
  tmpQueryPSO: TFDQuery;
  query: string;
  endDate: string;
  stock: string;
  balance: string;
  demand: string;
  i: Integer;
begin
  psoConnection :=  TabbedForm.psoConnection;

  if not (modelNumber='') then
  begin
    try
      tmpQueryPSO:=TFDQuery.Create(nil);
      tmpQueryPSO.Connection:= psoConnection ;

      query:='select model_no,sum(qty) as demand, end_date from t_file where model_no in '+
             '('+ modelNumber +') and '+
             ' create_time=(select max(create_time) from t_file) ' +
             ' group by month(end_date) ' +
             ' order by end_date ASC  ';

      tmpQueryPSO.SQL.Text := query;
      tmpQueryPSO.Active:=true;
      tmpQueryPSO.Open();
      i:= 0;
      //clear dulu grid nya pakai procedure dari tabbedForm
      TabbedForm.clearGrid(detailDemandGrid);


      while not (tmpQueryPSO.Eof) do
      begin
        detailDemandGrid.RowCount := tmpQueryPSO.RecordCount ;

        endDate := tmpQueryPSO['end_date'] ;

        if not (currentStock='') then stock:=currentStock
        else stock:= '0';

        demand:= tmpQueryPSO['demand'];
        //isi end date
        detailDemandGrid.Cells[0, i] := endDate ;
        //isi currentStock
        if i=0 then
        begin
          detailDemandGrid.Cells[1,i] := currentStock;
        end
        else
        begin
          detailDemandGrid.Cells[1,i] := detailDemandGrid.Cells[3,i-1]  ;
        end;

        //isi demand
        detailDemandGrid.Cells[2, i] := demand ;
        //isi balance
        detailDemandGrid.Cells[3, i] := IntToStr( StrToInt(detailDemandGrid.Cells[1,i]) - StrToInt(demand)) ;



        i:= i+1;
        tmpQueryPSO.Next;
      end;

      Label2.Text:= GarminID;
    finally
      tmpQueryPSO.Free;
    end;
  end;

    //ShowMessage(modelNumber);
end;

end.
