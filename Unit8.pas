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
    psoConnection: TFDConnection;
    FDQuery1: TFDQuery;
    Label2: TLabel;
    Label3: TLabel;
    StringColumn5: TStringColumn;
    Label5: TLabel;
    psoVersionLabel: TLabel;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     modelNumber, globalPsoVersion,  currentStock, GarminID, allocated_stock: string;
  end;

var
  Form8: TForm8;

implementation
   uses tabbedTemplate, Unit9;
{$R *.fmx}

procedure TForm8.Button1Click(Sender: TObject);
begin
  try
    //isi form9.garmines_id;
    Form9 := TForm9.Create(nil);
    Form9.GarminID := GarminID;
    Form9.ShowModal;

  finally
    Form9.Free;
  end;
  //instantiate Form9;
end;

procedure TForm8.FormShow(Sender: TObject);
var
  tmpQueryPSO: TFDQuery;
  query: string;
  endDate: string;
  stock, allocatedStock: string;
  balance: string;
  demand: string;
  i: Integer;
  psoVersion: Variant;
begin
  psoConnection :=  TabbedForm.psoConnection;

  if not (modelNumber='') then
  begin
    try
      tmpQueryPSO:=TFDQuery.Create(nil);
      tmpQueryPSO.Connection:= psoConnection ;

      query:='select model_no, create_time ,sum(qty) as demand, DATE_FORMAT(start_date, "%Y-%m") as start_date from t_file where model_no in '+
             '('+ modelNumber +') and '+
             ' create_time=(select max(create_time) from t_file) ' +
             ' group by month(start_date) ' +
             ' order by start_date ASC  ';

      tmpQueryPSO.SQL.Text := query;
      tmpQueryPSO.Active:=true;
      tmpQueryPSO.Open();
      i:= 0;
      //clear dulu grid nya pakai procedure dari tabbedForm
      TabbedForm.clearGrid(detailDemandGrid);


      while not (tmpQueryPSO.Eof) do
      begin
        detailDemandGrid.RowCount := tmpQueryPSO.RecordCount ;

        endDate := tmpQueryPSO['start_date'] ;

        if not (currentStock='') then stock:=currentStock
        else stock:= '0';

        if not (allocated_stock='') then allocatedStock := '0'
        else allocatedStock:='0';

        demand:= tmpQueryPSO['demand'];
        //isi end date
        detailDemandGrid.Cells[0, i] := endDate ;

        //isi currentStock
        //isi currentStock
        if i=0 then
        begin
          detailDemandGrid.Cells[1,i] := currentStock;
          //isi allocated stock
        end
        else
        begin
          //stock = stock -
          detailDemandGrid.Cells[1,i] := IntToStr( StrToInt( detailDemandGrid.Cells[3,i-1]) );
        end;

        //isi demand
        detailDemandGrid.Cells[2, i] := demand ;
        //isi balance
        detailDemandGrid.Cells[3, i] := IntToStr( StrToInt(detailDemandGrid.Cells[1,i]) - StrToInt(demand) ) ;

        i:= i+1;
        tmpQueryPSO.Next;
      end;

      psoVersion := tmpQueryPSO['create_time'];
      if psoVersion = null then psoVersion := globalPsoVersion; //jika psoVersion lokal null, ambil dari global.


      psoVersionLabel.Text := psoVersion;
      Label2.Text:= GarminID;
    finally
      tmpQueryPSO.Free;
    end;
  end;

    //ShowMessage(modelNumber);
end;

end.
