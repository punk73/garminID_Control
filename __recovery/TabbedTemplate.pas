unit TabbedTemplate;

interface

uses
  Winapi.Windows, Winapi.Messages,  Vcl.Graphics, System.IOUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.SysUtils, System.Types, System.StrUtils , System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Gestures, System.Rtti, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, FMX.Controls.Presentation, FMX.Edit, FMX.Ani, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Layouts, FMX.ListBox,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  JvBackgrounds, FMX.Menus, FMX.ComboEdit, FMX.ExtCtrls, FMX.Colors;

type
  TTabbedForm = class(TForm)
    HeaderToolBar: TToolBar;
    ToolBarLabel: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    GestureManager1: TGestureManager;
    Panel1: TPanel;
    Panel2: TPanel;
    duplicateGrid: TStringGrid;
    FDConnection1: TFDConnection;
    modelQuery: TFDQuery;
    Panel3: TPanel;
    Button4: TButton;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    edtGarminId: TEdit;
    Button5: TButton;
    Button6: TButton;
    garminGrid: TStringGrid;
    stockGarminCombo: TComboBox;
    Label3: TLabel;
    edtPathStock: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtStocks: TEdit;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    stockGrid: TStringGrid;
    Label7: TLabel;
    BindingsList1: TBindingsList;
    stockQuery: TFDQuery;
    garminQuery: TFDQuery;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    TabItem6: TTabItem;
    Panel8: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label6: TLabel;
    demandGarminCombo: TComboBox;
    Button12: TButton;
    Label12: TLabel;
    edtTotalDemand: TEdit;
    Label13: TLabel;
    listPath: TListBox;
    OpenDialog1: TOpenDialog;
    Label14: TLabel;
    listModel: TListBox;
    Button3: TButton;
    duplicateQuery: TFDQuery;
    BindSourceDB4: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB4: TLinkGridToDataSource;
    psoConnection: TFDConnection;
    Label16: TLabel;
    psoVersionQuery: TFDQuery;
    gridModel: TStringGrid;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    ComboBox1: TComboBox;
    Label8: TLabel;
    garmines_pso_Query: TFDQuery;
    Label9: TLabel;
    Button13: TButton;
    listModelperGarmin: TListBox;
    Button1: TButton;
    Panel6: TPanel;
    Label1: TLabel;
    Button2: TButton;
    Edit1: TEdit;
    Button10: TButton;
    lineGrid: TStringGrid;
    Button11: TButton;
    lineQuery: TFDQuery;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Popup1: TPopup;
    CalloutPanel1: TCalloutPanel;
    Label15: TLabel;
    mainGrid: TStringGrid;
    StringColumn7: TStringColumn;
    StringColumn8: TStringColumn;
    StringColumn9: TStringColumn;
    StringColumn10: TStringColumn;
    StringGrid1: TStringGrid;
    Label17: TLabel;
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure demandGarminComboChange(Sender: TObject);
    procedure edtGarminIdChangeTracking(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure garminGridCellClick(const Column: TColumn; const Row: Integer);
    procedure listModelperGarminItemClick(const Sender: TCustomListBox; const Item:
        TListBoxItem);
    procedure listPathItemClick(const Sender: TCustomListBox; const Item:
        TListBoxItem);
    procedure stockGarminComboChange(Sender: TObject);
    procedure refreshQuery;



  private
    procedure getSelectedListModel;
    procedure isiMainGrid(I: Integer);
    { Private declarations }
  public
    { Public declarations }
    procedure setGrid();
    procedure koneksi();
    //    var logData: TStringList;
    procedure validasiLogFile;

    procedure aktif;
    procedure nonaktif;
    procedure showLoading;
    procedure bersih;
    procedure getModelNumber;
    procedure getPsoVersion;
    procedure getGarminId;
    procedure isiPsoVersion;
    procedure isAvailable(table,id,result: string);
    function isInRecord(table,id: string): boolean ;
    procedure simpanDemand(garmin_id:string;value:TStrings);
    function isInArray(str:string; list:TStringList): boolean;
    function GetDirectoryCount(const DirName: string): Integer;
    procedure getStock;
    procedure updateStock;
    procedure listModelRefresh;
    function cariIndex(str:string; list:TStringList):Integer;
    procedure updateDemand;
    procedure refreshGarminCombo;
    procedure clearGrid(grid: TStringGrid);
  end;

var
  TabbedForm: TTabbedForm;
  logData, GlobalListModelNumber, AllModelNumber : TStringList;
  //GlobalListModelNumber Is model number from table garmines_pso
  //AllModelNumber is model number from pso databases (db mas Alvi) per last create_time
  // dua duanya di isi di getModelNumber
  olderID:string;


implementation
    uses Unit1, Unit2, TIsiGridThread;

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.iPhone4in.fmx IOS}

procedure TTabbedForm.aktif;
begin
  
  //module garmin id
  Button5.Enabled:=true;
  Button6.Enabled:=true;
  listModel.Enabled:=true;



end;

procedure TTabbedForm.bersih;
begin
  edtGarminId.Text:='';
  //stockGarminCombo.ItemIndex:=-1;
  edtPathStock.Text:='';
  edtStocks.Text:='0';
  edtTotalDemand.Text:='0';




end;

procedure TTabbedForm.Button12Click(Sender: TObject);
var
  I: Integer;
  Alist: TStrings;
  query: string;
begin
  //ambil dari listModel yang ter check list
  for I := 0 to listModel.Count-1 do
  begin
   if listModel.ListItems[I].IsChecked then
   begin
    //ShowMessage( listModel.Items[ I ] );
    query:='insert into garmines_pso (garmines_id, model_number, demand ) values ("'+ demandGarminCombo.Selected.Text +'", "'+listModel.ListItems[I].Text+'", "'+ edtTotalDemand.Text +'" )';
    try
      FDConnection1.ExecSQL(query);

    except
       on E : Exception do
       ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
    
   end;
  end;

  refreshQuery;
  getGarminId;
  listModelRefresh; //untuk menghilangkan list model yang sudah dipilih.
  demandGarminComboChange(Self); //untuk memindahkan yg dipilih ke listModelPerGarmin

  ShowMessage('Data Saved!');
  
end;

procedure TTabbedForm.Button13Click(Sender: TObject);
var
  query: string;
  message: Integer;
begin

  message:= MessageDlg('Confirmation', TMsgDlgType.mtConfirmation , mbOkCancel , 0 );
  if message = mrOk then
  begin

    query:='delete from garmines_pso where model_number="'+ listModelperGarmin.Selected.Text +'"';
    FDConnection1.ExecSQL(query);
    garmines_pso_Query.Refresh;

    listModelRefresh;  //reload listModel & gridModel
    refreshQuery;
    getGarminId;
    bersih;
    nonaktif;
    ShowMessage('Data Terhapus!');
    demandGarminCombo.SetFocus;
  end;



end;

procedure TTabbedForm.Button14Click(Sender: TObject);
begin
  clearGrid(mainGrid);
end;

procedure TTabbedForm.Button3Click(Sender: TObject);
begin

  bersih;
  nonaktif;
end;

procedure TTabbedForm.Button4Click(Sender: TObject);
begin
  getGarminId;
end;

procedure TTabbedForm.Button5Click(Sender: TObject);
var
  garminId: string;
begin

  //define variable
  garminId:= edtGarminId.Text;

  if not FDConnection1.Connected then
    Exit;

  if (button5.Text='Save') then
  begin
    try
      FDConnection1.ExecSQL('insert into garmines (id) values (:id)'
      ,[ garminId ] );
      garminQuery.Refresh;
    except
      //ShowMessage('something wrong');
      on E : Exception do
        ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  end
  else
  begin
    try
      FDConnection1.ExecSQL('update garmines set id= :id where id= :oldId'
      ,[ garminId, olderID ] );
      garminQuery.Refresh;
    except
      //ShowMessage('something wrong');
      on E : Exception do
        ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  end;

  refreshGarminCombo;
  refreshQuery;
  getGarminId;
  bersih;
  nonaktif;
  ShowMessage('Data Saved!');
  TabControl1.ActiveTab:= TabItem3;
end;

procedure TTabbedForm.Button6Click(Sender: TObject);
var
  message: Integer;
  id : string;
  inRecord:boolean;
begin
  //cek bukan kosong dan tersedia pada grid.
  id:= edtGarminId.Text;

  if Trim(edtGarminId.Text) ='' then Exit;
  
  inRecord:= isInRecord('garmines',edtGarminId.Text);
  if not inRecord then Exit; //jika tidak di record, maka exit, gausah hapus
  

  message:= MessageDlg('Confirmation', TMsgDlgType.mtConfirmation , mbOkCancel , 0 );
  if message = mrOk then
  begin
    FDConnection1.ExecSQL('delete from garmines where id=:id', [id]);
    garminQuery.Refresh;
    bersih;
    nonaktif;
    refreshQuery;
    getGarminId;
    refreshGarminCombo;
    ShowMessage('Data Terhapus!');
  end;
end;

procedure TTabbedForm.Button7Click(Sender: TObject);
var
  query: string;
begin
  //error handling
  if (stockGarminCombo.ItemIndex=-1) then
  begin
    ShowMessage('You need to choose garmin Id first !');
    exit;
  end;
  //error handling
  if ( Trim(edtPathStock.Text) ='') then
  begin
    ShowMessage('You need to browse the folder first !');
    exit;
  end;

  try
    edtPathStock.Text:= StringReplace( edtPathStock.Text, '\','\\', [rfReplaceAll, rfIgnoreCase] );
    query:='INSERT INTO `stocks`(`garmines_id`, `stock`, `path`) VALUES ("'+stockGarminCombo.Selected.Text+'","'+edtStocks.Text+'","'+edtPathStock.Text+'")';
    //ShowMessage(query);
    FDConnection1.ExecSQL(query);
    stockQuery.Refresh;

    //listPath.Items.Add( edtPathStock.Text );
    refreshQuery;
    stockGarminComboChange(Self); //untuk update listbox, jika data yang barusan di input sudah masuk.
    getGarminId;
    bersih;

    ShowMessage('Data Saved!');
  except
     on E : Exception do
      ShowMessage(E.ClassName+' rised Exception Of '+E.Message);
  end;
end;

procedure TTabbedForm.Button8Click(Sender: TObject);
var
  path: string;
  garminId: string;
  query: string;
  message: Integer;
begin
  //error handler
  if listPath.ItemIndex = -1 then
  begin
    ShowMessage('you need to choose path list first!');
    exit;
  end;


  message:= MessageDlg('Hapus Data??', TMsgDlgType.mtConfirmation , mbOkCancel , 0 );
  if message = mrOk then
  begin
    path:= listPath.Selected.Text;
    //edit path supaya backslash kebaca di mySql
    path:= StringReplace(path, '\','\\', [rfReplaceAll, rfIgnoreCase]);
    garminId:= stockGarminCombo.Selected.Text;
    query:= 'DELETE FROM `stocks` WHERE `path`="'+path+'" AND `garmines_id`="'+garminId+'"';
    try
      FDConnection1.ExecSQL(query);

      ShowMessage('Data Terhapus');
      //hapus listpath
      listPath.Selected.Destroy;
      //reload
      refreshQuery;
      getGarminId;

    except
      on E:Exception do
        ShowMessage(E.ClassName+ ' has rised Execption of ' + E.Message );
    end;
    bersih;
  end;
end;

procedure TTabbedForm.Button9Click(Sender: TObject);

begin
  with TFileOpenDialog.Create(nil) do
  begin
    try
      Options := [fdoPickFolders];
      if (Execute and (FileName <> '')) then
      begin
        //ShowMessage(FileName);
        edtPathStock.Text:= FileName;
        edtStocks.Text:= IntToStr( GetDirectoryCount(FileName) );
      end;
    finally
      Free;
    end;
  end;

end;


function TTabbedForm.cariIndex(str: string; list: TStringList): Integer;
var
  I: Integer;
begin
  for I := 0 to (list.Count-1) do
  begin
    //ShowMessage( str +'='+ list[I] );
    if (list[I]=str) then
    begin
      Result:=I;
      //ShowMessage( str +'='+ list[I] +'='+ IntToStr(I) );
      exit;

    end;

  end;

  Result:=-1;
end;

procedure TTabbedForm.clearGrid(grid: TStringGrid);
begin
  grid.Clear;
end;

procedure TTabbedForm.isiMainGrid(I: Integer);
var
  colId, colStock, colDemand, colBalance:string;

begin
  //fungsi ini berulang. I adalah indexnya
  //modelQuery.SQL.Text:= 'select sum(qty) as jml from t_file where create_time=(select max(create_time) from t_file) group by model_no';
  //modelQuery.Open();



  //module main program
  colId := garminQuery['id'];
  colStock := garminQuery['stock'];
  colDemand:= garminQuery['demand'];
  colBalance := IntToStr( StrToInt(colStock) - StrToInt(colDemand) );

  mainGrid.Cells[0, I] := colId ;
  mainGrid.Cells[1, I] := colStock;
  mainGrid.Cells[2,I] := colDemand;
  mainGrid.Cells[3,I] := colBalance;



end;

procedure TTabbedForm.ComboBox1Change(Sender: TObject);
var query:string;
begin

  if ComboBox1.Selected.Text='Unit ID' then
  begin
    query:= 'SELECT *, COUNT(`Unit_ID_No`) AS duplicated_unitID FROM `datalogs` '+
            'GROUP BY `Unit_ID_No` '+
            'HAVING COUNT(`Unit_ID_No`) > 1';
  end
  else
  begin
    query:= ' SELECT *, COUNT( concat(`Y_Number`,"",`Serial_No`) ) as duplicatedGarmin FROM `datalogs` GROUP BY concat(`Y_Number`,"",`Serial_No`) HAVING COUNT( concat(`Y_Number`,"",`Serial_No`) ) > 1 ORDER BY `duplicatedGarmin` DESC  ';
  end;

  try
    duplicateQuery.SQL.Text:= query;
    duplicateQuery.Open();
    //update grid otomatis karena sudah di bind Visualy
  Except
    on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
  end;

end;

procedure TTabbedForm.demandGarminComboChange(Sender: TObject);
var
  total,I: Integer;
  tmpModel: TStringList;
  isInArrayResult:Integer;
begin
  if not (demandGarminCombo.ItemIndex = -1) then
  begin
    aktif;
    total:=0;
    I:=0;
    listModelperGarmin.Clear;

    garmines_pso_Query.SQL.Text:= 'select * from garmines_pso where garmines_id="'+demandGarminCombo.Selected.Text+'" group by Model_Number ';
    garmines_pso_Query.Open();

    try
      //buat tstringlist local disini,
      tmpModel:=Tstringlist.Create;

      //nanti cek isInArray(str, localStringlist);
      tmpModel.Clear;
      while not (garmines_pso_Query.Eof) do
      begin
        listModelperGarmin.Items.Add(garmines_pso_Query['Model_Number']);
        //jika garmines_pso_Query['Model_Number'] ada di array AllModelNumber maka tambahkan ke total.
         isInArrayResult:= cariIndex( garmines_pso_Query['Model_Number'], AllModelNumber );
        //jika ketemu di fungsi
        if (isInArrayResult <> -1) then
        begin
          //jika isInArrayResult hasilnya bukan -1 maka ambil return value nya
          // sebagai index di grid.
          total:= total+ StrToInt( gridModel.Cells[1, isInArrayResult ] );
        end;
        listModel.ListItems[I].IsChecked:=false;
        garmines_pso_Query.Next;
        I:=I+1;
      end;
    finally
      tmpModel.Free;
    end;
    //ShowMessage('changed!~');
    edtTotalDemand.Text:= IntToStr(total);
  end;
end;

procedure TTabbedForm.edtGarminIdChangeTracking(Sender: TObject);
begin
  if not (edtGarminId.Text='') then aktif
  else nonaktif;
end;

procedure TTabbedForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
  koneksi;
  isiPsoVersion;
  getGarminId;
  getModelNumber;
  updateStock;
  updateDemand;
  //updateStock; //update stock in db basedOn folder
  ComboBox1.ItemIndex:=0;
end;

procedure TTabbedForm.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount-1] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex+1];
      Handled := True;
    end;

    sgiRight:
    begin
      if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
        TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex-1];
      Handled := True;
    end;
  end;
{$ENDIF}
end;

procedure TTabbedForm.FormShow(Sender: TObject);
begin
  setGrid;
  nonaktif;

end;

procedure TTabbedForm.garminGridCellClick(const Column: TColumn; const Row:
    Integer);
begin
  //ambil data pada row yang di klik, set ke edtgarminid
  edtGarminId.Text:= garminGrid.Cells[0, Row];
  Button5.Text:='Update';
  olderID:= garminGrid.Cells[0, Row];
  edtGarminId.SetFocus;
end;

function TTabbedForm.GetDirectoryCount(const DirName: string): Integer;
begin
  Result := Length(TDirectory.GetDirectories(DirName));
end;

procedure TTabbedForm.getGarminId;
var
  I: Integer;
  query: string;
begin

  query:='SELECT  garmines.id, ' +
          ' ifnull( s.total_stock, 0 ) as stock , '+
          ' ifnull( d.total_demand,0) as demand ' +
          ' FROM `garmines` ' +
          ' LEFT  JOIN ( ' +
            ' SELECT garmines_id, ifnull( SUM(stocks.stock),0 ) as total_stock FROM stocks '+
              ' GROUP BY stocks.garmines_id ' +
          ' ) AS s ON garmines.id = s.garmines_id ' +
          ' LEFT  JOIN ( ' +
            ' SELECT garmines_id, ifnull( SUM( garmines_pso.demand ) ,0) as total_demand '+
              ' FROM garmines_pso '+
              ' GROUP BY garmines_pso.garmines_id '+
          ' ) as d ON garmines.id = d.garmines_id ';

  garminQuery.SQL.Text:=query;
  garminQuery.Open();
  garminQuery.Refresh;
  garminQuery.First;
  I:=0;
  clearGrid(mainGrid);
  mainGrid.RowCount:= garminQuery.RecordCount;

  while not (garminQuery.Eof) do
  begin
    isiMainGrid(I);
    garminQuery.Next;
    I:=I+1;
  end;

  refreshGarminCombo;
end;

procedure TTabbedForm.getModelNumber;
var baris : Integer;
model_no:string;
begin
    modelQuery.SQL.Text:= 'select model_no, sum(qty) as jml from t_file where create_time=(select max(create_time) from t_file) group by model_no';
    modelQuery.Open();
    modelQuery.First;
    baris := 0;
    //set AllModelNumber
    AllModelNumber:= TStringList.Create;
    AllModelNumber.Clear;
    //nanti set disini
    getSelectedListModel;  //hasilnya di GlobalListModelNumber

    //ShowMessage( GlobalListModelNumber.Text );

    while not (modelQuery.Eof) do
    begin
      gridModel.RowCount:= modelQuery.RecordCount;
      model_no:= modelQuery['model_no'] ;

      if not isInArray(model_no, GlobalListModelNumber ) then
      begin
        //Jika modelQuery['model_no'] tidak ada di GlobalListModelNumber, maka
        // tambah listmodel
        listModel.Items.Add(modelQuery['model_no']);
      end;
      gridModel.Cells[0,baris] := modelQuery['model_no'] ;
      AllModelNumber.Add(modelQuery['model_no']);
      gridModel.Cells[1,baris] := modelQuery['jml'] ;
      modelQuery.Next;
      baris := baris+1;
    end;
end;

procedure TTabbedForm.getPsoVersion;
begin

end;

procedure TTabbedForm.isAvailable(table, id, result: string);
var
  hasil: string;
begin
  result:='true';
  //cek apakah id tsb ada di table. kalau tidak, kirim message.
  try
    hasil:=FDConnection1.ExecSQLScalar('select id from '+table+' where id="'+id+'"');
    if (Trim( hasil )='' )then
    begin
      ShowMessage('That Data is not Exist!');
      result:='false';
    end;
  except
    on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
  end;
end;

function TTabbedForm.isInArray(str: string; list: TStringList): boolean;
var
  I: Integer;
begin

  for I := 0 to (list.Count-1) do
  begin
    //ShowMessage( str +'='+ list[I] );
    if (list[I]=str) then
    begin
      Result:=True;
      //ShowMessage( str +'='+ list[I] );
      exit;

    end;

  end;

  Result:=false;

end;

function TTabbedForm.isInRecord(table, id: string): boolean;
var hasil:string;
begin
  try
    hasil:=FDConnection1.ExecSQLScalar('select id from '+table+' where id="'+id+'"');
    if (Trim( hasil )='' )then
    begin
      ShowMessage('That Data is not Exist!');
      bersih;
      nonaktif;
      result:=false;
    end
    else
    begin
      result:=true;
    end;

  except
    on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
  end;
end;

procedure TTabbedForm.isiPsoVersion;
begin
  //'select distinct create_time from t_file order by create_time desc'
  psoVersionQuery.SQL.Text:='select max(create_time) as version from t_file';
  psoVersionQuery.Open();
  Label9.Text:= psoVersionQuery['version'];

end;

procedure TTabbedForm.koneksi;
begin
  try
    FDConnection1.Connected:=true;
    psoConnection.Connected:=true;
    garmines_pso_Query.Active:=true;
    duplicateQuery.Active:=true;
    garminQuery.Active:=true;
    lineQuery.Active:=true;
    psoVersionQuery.Active:=true;
    stockQuery.Active:=true;
    modelQuery.Active:=true;
  except
    on E:exception do
      ShowMessage(E.ClassName +' has rised exception of '+ E.Message);

  end;

end;

procedure TTabbedForm.nonaktif;
begin

  //module garmin id
  Button5.Enabled:=false;
  Button6.Enabled:=false;
  olderID:='';  //global variable for update purpose
  button5.Text:='Save';
  listModelperGarmin.Clear;
  demandGarminCombo.ItemIndex:=-1;
  //listModel.Enabled:=false;


end;

procedure TTabbedForm.refreshGarminCombo;
begin
  stockGarminCombo.Clear;
  demandGarminCombo.Clear;
  try
    garminQuery.SQL.Text:='select * from garmines';
    garminQuery.Open();

    while not (garminQuery.Eof) do
    begin
      stockGarminCombo.Items.Add( garminQuery['id'] );
      demandGarminCombo.Items.Add( garminQuery['id'] );
      garminQuery.Next;
    end;
  except
    on E: Exception do
      ShowMessage( E.ClassName +' rised and Exceptions with message : '+ E.Message );
  end;
end;

procedure TTabbedForm.refreshQuery;
begin
  stockQuery.Refresh;
  garmines_pso_Query.Refresh;
end;

procedure TTabbedForm.setGrid;
begin



end;

procedure TTabbedForm.showLoading;
begin
  if Label14.Text='Loading' then Label14.Text:='Loading.';
  if Label14.Text='Loading.' then Label14.Text:='Loading..';
  if Label14.Text='Loading..' then Label14.Text:='Loading...';
  if Label14.Text='Loading...' then Label14.Text:='Loading';
end;

procedure TTabbedForm.simpanDemand(garmin_id:string; value: TStrings);
var
  I: Integer;
  query: string;
begin

  for I := 0 to value.Count-1 do
  begin
    query:='insert into garmines_pso (garmines_id, model_number ) values('+ demandGarminCombo.Selected.Text +', '+value[I]+' )';
    ShowMessage(query);
  end;
end;

procedure TTabbedForm.getSelectedListModel;
var
  I: Integer;
begin
  garmines_pso_Query.SQL.Text := 'SELECT `Model_Number` FROM `garmines_pso` GROUP BY `Model_Number` ';
  garmines_pso_Query.Open;
  garmines_pso_Query.First;
  I := 0;
  try

    GlobalListModelNumber:=TStringList.Create;

    while not (garmines_pso_Query.Eof) do
    begin

      GlobalListModelNumber.Add(garmines_pso_Query['model_number']);
      garmines_pso_Query.Next;
      I := I + 1;
    end;

  finally

  end;

  //pindah ke procedure
  // masukan ke array
  // kondisi apa listmodel[I] ada di listmodelNumber .. //pakai MatchStr
  //jika iya, maka skip.
end;

procedure TTabbedForm.getStock;
begin
  try
  stockQuery.SQL.Text:='SELECT id,garmines_id, SUM(`stock`) as total FROM `stocks` GROUP BY `garmines_id`';
  stockQuery.Open();
  except
    on E:Exception do
      showmessage(E.ClassName+' Has rised Exeptions of : '+E.Message);
  end;
end;

procedure TTabbedForm.listModelperGarminItemClick(const Sender: TCustomListBox;
    const Item: TListBoxItem);
var
  I: Integer;
begin
  for I := 0 to gridModel.RowCount-1  do
  begin
    if gridModel.Cells[0,I]=Item.Text then
    begin
      gridModel.SelectRow(I);
      gridModel.SetFocus;
      //edtTotalDemand.Text:= gridModel.Cells[1,I];
      listModel.ClearSelection;
      exit;  //biar cepet, gausah lanjut for nya
    end;
  end;


end;

procedure TTabbedForm.listModelRefresh;
var
  query: TFDQuery;
  I:Integer;
begin
  //ini masih lambat, harusnya bisa lebih cepat.

  //jika GlobalListModelNumber empty maka jalankan getSelectedListModel
  if GlobalListModelNumber.Count = 0 then getSelectedListModel;
   //ambil dari SQL. tp lumayan lama.
  {try
    query:= TFDQuery.Create(Self);
    query.Connection:= psoConnection;
    query.SQL.Text:='select model_no, sum(qty) as jml from t_file where create_time=(select max(create_time) from t_file) group by model_no';
    query.Open();

    while not (query.Eof) do
    begin
      if not isInArray(query['model_no'], GlobalListModelNumber ) then listModel.Items.Add( query['model_no'] );
      query.Next;
    end;

  finally
    query.Free;
  end;}

  listModel.Clear; //clear list
  //ambil dari Grid.
  try
    for I := 0 to (gridModel.RowCount-1) do
    begin
      if not (isInArray( gridModel.Cells[0, I], GlobalListModelNumber )) then
      begin
        listModel.Items.Add(gridModel.Cells[0, I]);
      end;
    end;
  finally

  end;
end;

procedure TTabbedForm.listPathItemClick(const Sender: TCustomListBox; const
    Item: TListBoxItem);
var
  path: string;
  garminId: string;
  query: string;
  total: Integer;
  tmpQuery: TFDQuery;
begin
  path:= listPath.Selected.Text;
  //edit path supaya backslash kebaca di mySql
  path:= StringReplace(path, '\','\\', [rfReplaceAll, rfIgnoreCase]);
  garminId:= stockGarminCombo.Selected.Text;

  try
    query:='SELECT stock FROM `stocks` where garmines_id="'+garminId+'" and path="'+path+'" ';
    total:=0;
    try
      tmpQuery:= TFDQuery.Create(Self);
      tmpQuery.Connection:= FDConnection1;
      tmpQuery.SQL.Text:= query;
      tmpQuery.Active:=true;
      tmpQuery.Open();
      total:= tmpQuery['stock'];
      edtStocks.Text:= IntToStr(total);
    finally
      tmpQuery.Destroy;
    end;


  except
   on E: Exception do
    ShowMessage(E.ClassName +' has rised an exceptions '+ E.Message );
  end;

end;

procedure TTabbedForm.stockGarminComboChange(Sender: TObject);
var
  query: string;
  total:Integer;
  tmpQuery: TFDQuery;
begin
  try
    query:='SELECT `path`,stock FROM `stocks` where garmines_id="'+stockGarminCombo.Selected.Text+'"';
    total:=0;
    try
      tmpQuery:= TFDQuery.Create(Self);
      tmpQuery.Connection:= FDConnection1;
      tmpQuery.SQL.Text:= query;
      tmpQuery.Active:=true;
      tmpQuery.Open();
      listPath.Clear;
      while not (tmpQuery.Eof) do
      begin
        listPath.Items.Add( tmpQuery['path']);
        total:=total+tmpQuery['stock'];
        tmpQuery.Next;
      end;
      edtStocks.Text:= IntToStr(total);
    finally
      tmpQuery.Destroy;
    end;


  except
   on E: Exception do
    ShowMessage(E.ClassName +' has rised an exceptions '+ E.Message );
  end;
end;

procedure TTabbedForm.updateDemand;
var
  query: string;
  total,index: Integer;
  tmpQuery: TFDQuery;
  queryUpdate: string;
begin
  //ambil model_number, sum(demand) as demand dari table garmin_pso
  query:='SELECT id,Model_Number, demand FROM `garmines_pso` GROUP by Model_Number';
  try
    tmpQuery:= TFDQuery.Create(Self);
    tmpQuery.Connection:= FDConnection1;
    tmpQuery.SQL.Text:= query;
    tmpQuery.Active:=true;
    tmpQuery.Open();

    //looping garmin_pso
    while not (tmpQuery.Eof) do
    begin
      //cari tmpQuery['model_number'] di gridModel.
      index:= cariIndex(tmpQuery['model_number'], AllModelNumber);
      // jika tmpQuery['demand'] != gridModel[1,I] maka update
      if not (index= -1) then //jika ketemu
      begin
        //ShowMessage(IntToStr(index));
        if not ( gridModel.Cells[1, index] = tmpQuery['demand'] ) then //jika value nya beda.
        begin
          //update
          //ShowMessage(IntToStr(tmpQuery['demand']));
          total:= strToInt( gridModel.Cells[1, index] );
          queryUpdate:= 'UPDATE `garmines_pso` SET `demand`='+ IntToStr(total)+' WHERE id='+ IntToStr( tmpQuery['id']) +'';
          FDConnection1.ExecSQL(queryUpdate);
        end;

      end;

      tmpQuery.Next;
    end;

  finally
     tmpQuery.Free;
  end;

end;

procedure TTabbedForm.updateStock;
var
  query, queryUpdate: string;
  total, I,Code: Integer;
  tmpQuery: TFDQuery;
begin
    query:='SELECT id,`path`,stock FROM `stocks`';
    total:=0;
    try
      tmpQuery:= TFDQuery.Create(Self);
      tmpQuery.Connection:= FDConnection1;
      tmpQuery.SQL.Text:= query;
      tmpQuery.Active:=true;
      tmpQuery.Open();

      while not (tmpQuery.Eof) do
      begin
        total:= GetDirectoryCount( tmpQuery['path'] );
        //ShowMessage(tmpQuery['path']+''+ );
        if not (total= tmpQuery['stock']) then
        begin
          //update
          queryUpdate:= 'UPDATE `stocks` SET `stock`='+ IntToStr(total)+' WHERE id='+ IntToStr( tmpQuery['id']) +'';
          //ShowMessage(queryUpdate);
          FDConnection1.ExecSQL(queryUpdate);
        end;

        tmpQuery.Next;
      end;
    finally
      tmpQuery.Free;
    end;

    //stockQuery.Open();
    //stockQuery.Refresh;
    //select path & stock
    // check path ke getDirectoryCount
    // jika stock != getDirectoryCount
      //update stock


end;

procedure TTabbedForm.validasiLogFile;
begin
  //for I := Low to High do
    
end;

end.
