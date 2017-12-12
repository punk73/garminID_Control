unit TIsiGridThread;

interface

uses
  System.Classes;

type
  TIsiGrid = class(TThread)
  private
    { Private declarations }
  protected
    procedure Execute; override;
    procedure isiGrid;
  end;

implementation
   uses TabbedTemplate;
{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure TIsiGrid.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; 
    
    or 
    
    Synchronize( 
      procedure 
      begin
        Form1.Caption := 'Updated in thread via an anonymous method' 
      end
      )
    );
    
  where an anonymous method is passed.
  
  Similarly, the developer can call the Queue method with similar parameters as 
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.
    
}

{ TIsiGrid }

procedure TIsiGrid.Execute;
begin
  NameThreadForDebugging('isiGridThread');
  { Place thread code here }
   isiGrid;
end;

procedure TIsiGrid.isiGrid;
var
  row: TStringList;
  I: Integer;
begin
  try
    row := TStringList.Create;

    TabbedForm.duplicateGrid.RowCount:= logData.Count;
    for I := 0 to (logData.Count-1) do
    begin
      row.Text := logData[I];
      row.CommaText := row.Text;
      row.Delimiter:= ',';
      TabbedForm.duplicateGrid.Cells[0, I] := row[0];
      TabbedForm.duplicateGrid.Cells[1, I] := row[1];
      TabbedForm.duplicateGrid.Cells[2, I] := row[2];
      TabbedForm.duplicateGrid.Cells[3, I] := row[3];
      TabbedForm.duplicateGrid.Cells[4, I] := row[4];
    end;
  finally
    row.Free;
  end;

end;

end.
