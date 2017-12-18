unit Unit3;

interface

uses
  System.Classes, FireDac.comp.client, System.sysUtils;

type
  TuploadData = class(TThread)
  private
    { Private declarations }
     FileName:string;
  protected
    procedure Execute; override;
    procedure uploadData;
  public
    constructor Create( aFile:string );
    procedure OnTerminate(Sender: TObject);
  end;

implementation
  uses TabbedTemplate;

constructor TuploadData.Create(aFile: string);
begin
  FileName:=aFile;
  inherited Create(false);

end;

procedure TuploadData.Execute;
begin
  { Place thread code here }
    uploadData;
end;



procedure TuploadData.OnTerminate(Sender: TObject);
begin
  FreeAndNil(Self);
end;

procedure TuploadData.uploadData;
var
  list, row: TStringList;
  I: Integer;
  query: string;
  oConn:TFDConnection;
  oQuery:TFDQuery;
  oParams: TStringList;
  date, time, ynumber, serialNumber, unitId, linesName:string;
begin
  try
    list:=TStringList.Create;
    list.LoadFromFile(FileName);

    //setting parameter untu FDManager. dikunakan oleh TFDConnections
    try
      oParams := TSTringlist.Create;
      oParams.Add('Database=garmin_inventory');
      oParams.Add('User_Name=root');
      oParams.Add('Password=');
      oParams.Add('Pooled=True');
      FDManager.AddConnectionDef('garmin_inventory', 'MySQL', oParams );
    finally
      oParams.Free;
    end;

    for I := 0 to list.Count-1 do
    begin
      //input ke db.
      try
        row:= TStringList.Create;
        row.Text:= list[I]; //satu baris.
        row.CommaText := row.Text;
        row.Delimiter:= ',';
        //deklarasi kolom
        date:= row[0];
        time := row[1];
        ynumber:= row[2];
        serialNumber:= row[3];
        unitId:= row[4];
        if row.Count > 5  then //kadang jumlah row > 5 kadang tidak.
        begin
          linesName:= row[5];
        end
        else linesName:='';

        {Synchronize(
          procedure
          begin
             TabbedForm.loadingLabel.Visible:=true;
             if TabbedForm.loadingLabel.Text = 'Loading' then TabbedForm.loadingLabel.Text:='Loading.';
             if TabbedForm.loadingLabel.Text = 'Loading.' then TabbedForm.loadingLabel.Text:='Loading..';
             if TabbedForm.loadingLabel.Text = 'Loading..' then TabbedForm.loadingLabel.Text:='Loading...';
             if TabbedForm.loadingLabel.Text = 'Loading...' then TabbedForm.loadingLabel.Text:='Loading';
          end
        );}

        try
          //buat object Connection
          oConn:= TFDConnection.Create(nil);
          oConn.ConnectionDefName:= 'garmin_inventory';
          try
            oConn.Connected:=true;
            query:='insert into datalogs ( Date, Time, Y_Number, Serial_No, Unit_ID_No , LineName ) values ( "'+date+'" , "'+time+'","'+ynumber+'" , "'+serialNumber+'" , "'+unitId+'" , "'+linesName+'" )';
            oConn.ExecSQL(query);
          except
            on E:Exception do
            begin
              TabbedForm.loadingLabel.Text:= E.Message;
              TabbedForm.loadingLabel.Visible:=true;
            end;
          end;

        finally
          oConn.Free;
        end;





      finally
        row.Free;
      end;
    end;

    TabbedForm.duplicateQuery.Refresh;
    TabbedForm.loadingLabel.Text:= 'Finish!';
    //TabbedForm.ShowMessage('Data Updated!');
  finally
   list.Free;
  end;

end;

end.