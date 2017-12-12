unit Unit2;

interface
uses FMX.Grid;

type

  TStringGridRowDeletion = class helper for TStringGrid

  public
    procedure RemoveRows(RowIndex, RCount: Integer);
    procedure Clear;
  end;



implementation

{ TStringGridRowDeletion }

procedure TStringGridRowDeletion.Clear;
var
  i: integer;
begin
  for i := 0 to RowCount -1 do
    RemoveRows(0, RowCount);
end;

procedure TStringGridRowDeletion.RemoveRows(RowIndex, RCount: Integer);
var
  i,j: Integer;
begin

  {for i := RowIndex to RowCount - 1 do
    //Row[i] := Row[i + RCount];

  RowCount := RowCount -RCount;}
  if (RowIndex = RowCount) then
    RowCount := RowCount - 1
  else
  begin
    for i := RowIndex to (RowCount-1) do
      for j := 0 to (ColumnCount-1) do
        Cells[j, i] := Cells[j, i + 1];

    RowCount := RowCount - 1;
  end;
end;

end.
