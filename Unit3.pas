unit Unit3;

interface

uses
  System.Classes, FireDac.comp.client, System.sysUtils;

type
  TuploadData = class(TThread)
  private
    { Private declarations }
     FileName, lineId :string;

  protected
    procedure Execute; override;
    procedure uploadData;
  public
    constructor Create( aFile:string; aLineId:string );
    procedure OnTerminate(Sender: TObject);
  end;

implementation
  uses TabbedTemplate;

constructor TuploadData.Create(aFile: string;aLineId:string );
begin
  FileName:=aFile;
  lineId := aLineId;

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
  I, lastPointer: Integer;
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

      //jika ada file.ini, ambil setting dari file tersebut;
      if FileExists(ExtractFilePath(ParamStr(0)) + 'file.ini' ) then
      begin
        oParams.LoadFromFile( ExtractFilePath(ParamStr(0)) + 'file.ini' );
        oParams.Add('Pooled=True');
      end
      else
      begin
        oParams.Add('Database=garmin_inventory');
        oParams.Add('User_Name=root');
        oParams.Add('Server=136.198.117.48');
        oParams.Add('Password=JvcSql@123');
        oParams.Add('Pooled=True');
      end;

      FDManager.AddConnectionDef('garmin_inventory', 'MySQL', oParams );
    finally
      oParams.Free;
    end;

    //get last pointer
      //buat object Connection
      oConn:= TFDConnection.Create(nil);
      oConn.ConnectionDefName:= 'garmin_inventory';

      try
        oConn.Connected:=true;  //activate oConn
        oQuery:=TFDQuery.Create(nil);
        oQuery.Connection:=oConn;
        oQuery.SQL.Text:='select * from line where id='+lineId;
        oQuery.Active:=true;
        oQuery.Open();
        while not (oQuery.Eof) do
        begin
          lastPointer := oQuery['last_pointer'];
          //update last_pointer
          try
            oConn.ExecSQL('update line set last_pointer='+ IntToStr(list.Count-1));
          except
            on E:Exception do
            begin
              TabbedForm.loadingLabel.Text:= E.Message;
              TabbedForm.loadingLabel.Visible:=true;
            end;
          end;

        end;
      finally
        oQuery.Free;
      end;

    //I = last pointer
    for I := lastPointer to list.Count-1 do
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
        else
        begin
         linesName:='';
        end;

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
  finally
   list.Free;
  end;

end;

end.
