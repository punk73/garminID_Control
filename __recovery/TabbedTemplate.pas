unit TabbedTemplate;

interface

uses
  Winapi.Windows, ShellApi, FMX.Platform.Win ,System.Generics.Collections, Winapi.Messages,  Vcl.Graphics, System.IOUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  System.SysUtils, System.DateUtils , System.Types, System.StrUtils , System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Gestures, System.Rtti, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, FMX.Controls.Presentation, FMX.Edit, FMX.Ani, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, 
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Layouts, FMX.ListBox,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope,
  JvBackgrounds, FMX.Menus,  FMX.ExtCtrls, FMX.Colors, FMX.Memo, FMX.ComboEdit,
  System.ImageList, FMX.ImgList;

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
    Label3: TLabel;
    edtPathStock: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtStocks: TEdit;
    Button7: TButton;
    Button8: TButton;
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
    Button1: TButton;
    Panel6: TPanel;
    Label1: TLabel;
    edtDupPath: TEdit;
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
    garminDemandQtyGrid: TStringGrid;
    Label17: TLabel;
    demandQuery: TFDQuery;
    BindSourceDB5: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB5: TLinkGridToDataSource;
    edtLineName: TEdit;
    Label18: TLabel;
    loadingLabel: TLabel;
    Label19: TLabel;
    edtSearchModel: TEdit;
    SearchEditButton1: TSearchEditButton;
    demandGarminCombo: TComboEdit;
    stockGarminCombo: TComboEdit;
    Button14: TButton;
    Button9: TEllipsesEditButton;
    StyleBook1: TStyleBook;
    Button2: TEllipsesEditButton;
    ImageList1: TImageList;
    Button12: TButton;
    Timer1: TTimer;
    Label6: TLabel;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure demandGarminCombo2Change(Sender: TObject);
    procedure demandGarminCombo2KeyUp(Sender: TObject; var Key: Word; var KeyChar:
        Char; Shift: TShiftState);
    procedure demandGarminComboChange(Sender: TObject);
    procedure demandGarminComboKeyUp(Sender: TObject; var Key: Word; var KeyChar:
        Char; Shift: TShiftState);

    procedure duplicateGridCellClick(const Column: TColumn; const Row: Integer);
    procedure edtSearchModelKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift:
        TShiftState);
    procedure edtDupPathChangeTracking(Sender: TObject);
    procedure edtGarminIdChangeTracking(Sender: TObject);
    procedure edtLineNameChangeTracking(Sender: TObject);
    procedure edtLineNameKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
        Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure garminDemandQtyGridCellClick(const Column: TColumn; const Row:
        Integer);
    procedure garminGridCellClick(const Column: TColumn; const Row: Integer);
    procedure listModelItemClick(const Sender: TCustomListBox; const Item:
        TListBoxItem);
    procedure listModelperGarminItemClick(const Sender: TCustomListBox; const Item:
        TListBoxItem);
    procedure listPathItemClick(const Sender: TCustomListBox; const Item:
        TListBoxItem);
    procedure refreshQuery;
    procedure stockGarminComboChange(Sender: TObject);
    procedure stockGridCellClick(const Column: TColumn; const Row: Integer);
    procedure TabItem1Click(Sender: TObject);
    procedure SelectFileInExplorer(const Fn: string);
    procedure TabItem2Click(Sender: TObject);
    procedure TabItem3Click(Sender: TObject);
    procedure TabItem4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mainGridCellDblClick(const Column: TColumn; const Row: Integer);



  private
    procedure getSelectedListModel;
    procedure isiMainGrid(I: Integer);
    { Private declarations }
  public
    { Public declarations }

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
    procedure pindahFile(paramPath:string);
    procedure finishThread;
    procedure getImage;
    function DirIsReadOnly(Path:string):Boolean;
    procedure isiNumber();

  end;

var
  TabbedForm: TTabbedForm;
  logData, GlobalListModelNumber,GlobalAvailableListModel, AllModelNumber, AllGarminId : TStringList;
  //GlobalListModelNumber Is model number from table garmines_pso
  //AllModelNumber is model number from pso databases (db mas Alvi) per last create_time
  // dua duanya di isi di getModelNumber
  olderID:string;


implementation
    uses Unit1, Unit2,  Unit3, Unit4, Unit5, Unit8;

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.iPhone4in.fmx IOS}

procedure TTabbedForm.aktif;
begin

  //module garmin id
  Button5.Enabled:=true;
  Button6.Enabled:=true;
  listModel.Enabled:=true;

  //UpperCase()


end;

procedure TTabbedForm.bersih;
begin
  edtGarminId.Text:='';
  //stockGarminCombo.ItemIndex:=-1;
  edtPathStock.Text:='';
  edtStocks.Text:='0';
  edtTotalDemand.Text:='0';




end;

procedure TTabbedForm.Button10Click(Sender: TObject);
var baseFolder: string;
  query: string;
  path:string;
begin
  try
    //error handler
    if Trim(edtLineName.Text)='' then
    begin
      ShowMessage('you need to fill the line name first!');
      edtLineName.SetFocus;
      Exit;
    end;

    //cek apa edtDupPath sudah diisi.
    if (Trim(edtDupPath.Text) = '') then
    begin
      ShowMessage('you need to choose the path Firts!');
      edtDupPath.SetFocus;
      exit;
    end;

    //cek edtDupPath contain valid directory
    if not (FileExists(edtDupPath.Text)) then //jika edtDupPath tidak valid
    begin
      ShowMessage('You set invalid folder path or filename! ');
      edtDupPath.SetFocus;
      exit;
    end;

    //simpan new path ke db
    try
       path:= StringReplace( edtDupPath.Text,'\', '\\', [rfReplaceAll, rfIgnoreCase]  );
       query:='insert into line (name, path) values("'+edtLineName.Text+'","'+path+'")';
       //ShowMessage(query);
       FDConnection1.ExecSQL(query);
       lineQuery.Refresh;
    except
      on E:exception do
        ShowMessage(E.ClassName+' has rised an exception of '+E.Message);
    end;

    //bersih edtDUpPath
    edtDupPath.Text:='';
    edtLineName.Text:='';
    button10.Enabled:=false;
  except
     on E:exception do
     ShowMessage(E.ClassName +' rised an error of '+E.Message);
  end;
end;

procedure TTabbedForm.Button11Click(Sender: TObject);
var
  query: string;
  message: Integer;
  path, localPath :string;
begin
  //ShowMessage( lineGrid.Selected.ToString);
  message:= MessageDlg('Delete Data ?', TMsgDlgType.mtConfirmation , mbOkCancel , 0 );
  if message = mrOk then
  begin
    try
      query:='delete from line where id='+ lineGrid.Cells[0, lineGrid.Selected ];
      //ShowMessage(query);
      FDConnection1.ExecSQL(query);

      path:=  lineGrid.Cells[2, lineGrid.Selected ];
      localPath := ExtractFilePath( ParamStr(0) );
      localPath:= StringReplace(localPath, 'Win32\debug\', 'DATALOG\'+ ExtractFileName(path) , [rfReplaceAll, rfIgnoreCase]);

      //ShowMessage(localPath + ' ' + path);
      if DeleteFile(localPath) then
      ShowMessage('Data Deleted!')
      else ShowMessage('Data not Deleted! '+ SysErrorMessage(GetLastError) );

      lineQuery.Refresh;
    except
       on E:exception do
       ShowMessage(E.ClassName + ' has rised exception of ' + E.Message );
    end;
  end;
end;

procedure TTabbedForm.Button12Click(Sender: TObject);
var
  I: Integer;
  Alist: TStrings;
  
  query: string;
  model_no: string;
  tmpQuery: TFDQuery;
  modelNo:tstringlist;
begin
  //error handler
  if demandGarminCombo.ItemIndex=-1 then
  begin
    ShowMessage('You need to choose garmin id first!');
    exit;
  end;
  //Error Handler
  if (listModel.ItemIndex=-1) then
  begin
    ShowMessage('You need to choose listModel first!');
    exit;
  end;
  
  //set to 0
  edtTotalDemand.Text:='0';
  
  //ambil data basedon garmin id
  try
    tmpQuery := TFDQuery.Create(Self);
    tmpQuery.Connection:= FDConnection1;
    tmpQuery.SQL.Text:= 'select * from garmines_pso where garmines_id="'+demandGarminCombo.Text+'"';
    tmpQuery.Active:=true;
    try
      tmpQuery.Open();
      modelNo := TStringList.Create;
      modelNo.Clear;

      while not (tmpQuery.Eof) do
      begin
        modelNo.Add( tmpQuery['model_number'] );
        tmpQuery.Next;
      end;
    except
      on E:exception do
      begin
        ShowMessage(E.Message);
      end;
    end;

    
  finally
    tmpQuery.Free;
  end;
  

  //ambil dari listModel yang ter check list
  for I:= listModel.Count-1 downto 0 do
  begin
   if (listModel.ListItems[I].IsChecked) then
   begin
    //ShowMessage( listModel.Items[ I ] );
    //set edtTotalDemand
    edtTotalDemand.Text:= gridModel.Cells[1, cariIndex(listModel.ListItems[I].Text, AllModelNumber ) ] ;
    query:='insert into garmines_pso (garmines_id, model_number, demand ) values ("'+ demandGarminCombo.Text +'", "'+listModel.ListItems[I].Text+'", "'+ edtTotalDemand.Text +'" )';

    try
      FDConnection1.ExecSQL(query);
      demandQuery.Refresh;
    except
       on E : Exception do
       ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
   end
   else
   begin
      //jika tidak diceklis, dan ada di array modelNo maka hapus
      if isInArray(listmodel.Items[I], modelNo ) then
      begin
         query:= 'delete from garmines_pso where model_number="'+listmodel.Items[I]+'"';
         try
            FDConnection1.ExecSQL(query);
         except
            on E:exception do
            begin
              ShowMessage(E.Message);
              //exit;
            end;
         end; 
      end;
   end;

  end;

  demandQuery.Refresh;

  //refresh globalAvailable based on current state
  GlobalAvailableListModel.Clear;
  //looping based on gridModel, get column 0
  //GlobalListModelNumber = list yg ada di table pso.
  getSelectedListModel; //refresh GlobalListModelNumber
    
  //refresh globalAvailable list model
  for I := 0 to gridModel.RowCount-1 do
  begin
    model_no := gridModel.Cells[0, I];
    //cek either it is available in globalListModel or not,
    //if not, add it to clobalAvailableListModel
    if not isInArray(model_no, GlobalListModelNumber ) then
    begin
      GlobalAvailableListModel.Add(model_no);
    end;
  end;
  //set global list model ke listModel.items
  listModel.Items:=GlobalAvailableListModel;

  edtSearchModel.Text:='';
  modelNo.Free;

  demandGarminComboChange(Self); //ambil yg checked nya
  
  ShowMessage('Data Saved!');

end;

procedure TTabbedForm.Button14Click(Sender: TObject);
var
  I: Integer;
  list:TStringList;
  garminID, stock, demand, balance, rowContent,path:string;
  reportName: string;
begin
  getGarminId;
  try
    //buat tstringlist
    list := tstringlist.Create;
    for I := 0 to mainGrid.RowCount-1 do
    begin
      garminID:= mainGrid.Cells[0,I];
      stock:= mainGrid.Cells[1,I];
      demand:=mainGrid.Cells[2,I];
      balance:=mainGrid.Cells[3,I];
      rowContent := garminId +','+ stock +','+ demand +','+ balance;
      //isi tstringlist
      list.Add(rowContent);
    end;
    //preapare path
    path:= ExtractFilePath( ParamStr(0) );
    path:= path + 'reports\'; //StringReplace(path, 'Win32\debug\', 'csv\', [rfReplaceAll, rfIgnoreCase]);
    //ShowMessage(path);
    //buat folder jika folder tidak ada.
    if not DirectoryExists(path) then
    begin
      if not CreateDir(path)then
      begin
       ShowMessage('New directory add failed with error : '+
                   IntToStr(GetLastError)+' '+ SysErrorMessage(GetLastError) );
       exit;
      end;
    end;

    reportName:='garmin_inventory_'+Label9.Text+'.csv';

    if FileExists( path + reportName ) then
      DeleteFile(path + reportName );

    //simpan tstringlist ke path
    list.SaveToFile( path + reportName );

    ShowMessage( SysErrorMessage( GetLastError ) );
    SelectFileInExplorer(path);
  finally

    list.Free;
  end;


end;

procedure TTabbedForm.Button1Click(Sender: TObject);
var
  I: Integer;
  path,localPath: string;
  logItem:TStringList;
  anotherThread: TuploadData;
  //ThreadHandlers: array of THandle;
  arrThread:array of TuploadData;
  tmpUploadData :TuploadData;
  ThreadHandlers: array of THandle ;
  lineId: string;
begin

  if lineGrid.RowCount=0 then
  begin
    ShowMessage('you need to set log file path first!');
    exit;
  end;

  loadingLabel.Text:='Loading ...';
  loadingLabel.Visible:=true;
  
  try
    //set length untuk arrThread (penampung thread) & array ThreadHandlers (penampung thread.handle)
    setlength(ThreadHandlers, lineGrid.RowCount  );
    setlength( arrThread , lineGrid.RowCount  );

    for I := lineGrid.RowCount-1 downto 0 do
    begin

      path:= lineGrid.Cells[2, I] ;
      lineId := lineGrid.Cells[0,I];
      //path = nama path server + line id


      //cek apakah file terkait ada.
      //copy ke localfolder;
      if FileExists(path) then
      begin
        pindahFile(path);
        //ShowMessage(path);
      end
      else
      begin
         ShowMessage('Copy file failed : '+ IntToStr(i) + SysErrorMessage(GetLastError) );

         //kurangi length value of array
         setlength( arrThread , (length(arrThread)-1)  );
         setlength(ThreadHandlers, (length(ThreadHandlers)-1)  );

         Continue;
      end;


      //masuk ke file local
      //localPath:= file local
      localPath := ExtractFilePath( ParamStr(0) );
      localPath:= localPath + 'DATALOG\' +ExtractFileName(path);

      try
        lineGrid.Selected:= I;
        ShowMessage(inttostr(I));

        arrThread[I] := TuploadData.Create(localPath, lineId);  //simpan lewat anotherThread
      finally

      end;

    end;

    
    //isi thread handlers dengan TuploadThread.handle
    {for I := Length( arrThread ) - 1 downto Length( arrThread ) - 1 do begin
        ThreadHandlers[I]:= arrThread[I].Handle;
    end; }

     for tmpUploadData in arrThread do
     begin
        I:=0;
        ThreadHandlers[I] := tmpUploadData.Handle;
        I:=I+1;
     end;



    WaitForMultipleObjects(lineGrid.RowCount, Pointer(ThreadHandlers) , True, INFINITE);

    ShowMessage( SysErrorMessage(GetLastError) );
    Sleep(100);
    loadingLabel.Visible:=false;
    duplicateQuery.Refresh;
    lineQuery.Refresh;
  finally
    //free up threadHandlers
    for I := 0 to Length(arrThread)-1 do
    begin
      arrThread[I].Free;
    end;
      
  end;


end;

procedure TTabbedForm.Button2Click(Sender: TObject);
begin
  with TFileOpenDialog.Create(nil) do
  begin
    try
      //Options := [fdoPickFolders];
      if (Execute and (FileName <> '')) then
      begin
        edtDupPath.Text:= FileName;
      end;
    finally
      Free;
    end;
  end;

end;

procedure TTabbedForm.Button3Click(Sender: TObject);
begin

  bersih;
  nonaktif;
end;

procedure TTabbedForm.Button4Click(Sender: TObject);
begin
  updateStock;
  getGarminId;
end;

procedure TTabbedForm.Button5Click(Sender: TObject);
var
  garminId: string;
  listGarminID:TStringlist;
  I: Integer;
begin

  if not FDConnection1.Connected then
      Exit;

  //define variable
  garminId:= Trim( edtGarminId.Text );
  try
    
    listGarminID := TStringList.Create;
    listGarminID.Clear;
    //isi garmin id
    for I := 0 to mainGrid.RowCount-1 do
    begin
      listGarminID.Add(mainGrid.Cells[0,I])
    end;
    

    if (button5.Text='Save') then
    begin
      try
        if not isInArray(garminId, listGarminID ) then
        begin
          FDConnection1.ExecSQL('insert into garmines (id) values (:id)'
          ,[ garminId ] );
          garminQuery.Refresh;
        end
        else
        begin
          ShowMessage('that garmin id is already exist!');
          edtGarminId.SetFocus;
          exit;
        end;
        
      except
        //ShowMessage('something wrong');
        on E : Exception do
        begin
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
          exit;
        end;
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
  finally
    listGarminID.Free;
  end;
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
    stockGarminCombo.SetFocus;
    exit;
  end;
  //error handling
  if ( Trim(edtPathStock.Text) ='') then
  begin
    ShowMessage('You need to browse the folder first !');
    exit;
  end;

  if not (DirectoryExists(edtPathStock.Text)) then
  begin
    ShowMessage('You need to browse the correct path !');
    edtPathStock.SetFocus;
    exit;
  end;


  try
    edtPathStock.Text:= StringReplace( edtPathStock.Text, '\','\\', [rfReplaceAll, rfIgnoreCase] );
    query:='INSERT INTO `stocks`(`garmines_id`, `stock`, `path`) VALUES ("'+stockGarminCombo.Text+'","'+edtStocks.Text+'","'+edtPathStock.Text+'")';
    //ShowMessage(query);
    FDConnection1.ExecSQL(query);
    stockQuery.Refresh;

    //listPath.Items.Add( edtPathStock.Text );
    {refreshQuery;
    stockGarminComboChange(Self); //untuk update listbox, jika data yang barusan di input sudah masuk.
    getGarminId;
    bersih;}

    //edit path jadi bersih
    edtPathStock.Text:='';
    ShowMessage('Data Saved!');
    stockGarminComboChange(Self);
    //path pindah ke list path
    //stock update based on current total



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
    listPath.SetFocus;
    exit;
  end;


  message:= MessageDlg('Hapus Data??', TMsgDlgType.mtConfirmation , mbOkCancel , 0 );
  if message = mrOk then
  begin
    path:= listPath.Selected.Text;
    //edit path supaya backslash kebaca di mySql
    path:= StringReplace(path, '\','\\', [rfReplaceAll, rfIgnoreCase]);
    garminId:= stockGarminCombo.Text;
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
  colId, colStock, colDemand, colBalance, colAllocatedStock :string;

begin
  //fungsi ini berulang. I adalah indexnya
  //modelQuery.SQL.Text:= 'select sum(qty) as jml from t_file where create_time=(select max(create_time) from t_file) group by model_no';
  //modelQuery.Open();



  //module main program
  colId := garminQuery['id'];
  colStock := garminQuery['stock'];

  colDemand:= garminQuery['demand']; //demand dr DB
  colAllocatedStock := garminQuery['allocated_stock']; //Allocated_Stock

  //demand hasil proses ( demand-alloated stock )
  colDemand:= inttostr(strtoInt(colDemand) - StrToInt(colAllocatedStock));

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

procedure TTabbedForm.demandGarminCombo2Change(Sender: TObject);
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
    //listModelperGarmin.Clear;

    garmines_pso_Query.SQL.Text:= 'select * from garmines_pso where garmines_id="'+demandGarminCombo.Text+'" group by Model_Number ';
    garmines_pso_Query.Open();

    try
      //buat tstringlist local disini,
      tmpModel:=Tstringlist.Create;

      //nanti cek isInArray(str, localStringlist);
      tmpModel.Clear;
      while not (garmines_pso_Query.Eof) do
      begin
        //listModelperGarmin.Items.Add(garmines_pso_Query['Model_Number']);
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

procedure TTabbedForm.demandGarminCombo2KeyUp(Sender: TObject; var Key: Word;
    var KeyChar: Char; Shift: TShiftState);
var
  aStr:string;
  I: Integer;
  LastTimeKeydown:TDatetime;
    Keys:string;
begin
  //if key=vkReturn then exit;
  if (keychar in [chr(48)..chr(57)]) or (keychar in [chr(65)..chr(90)]) or (keychar in [chr(97)..chr(122)]) then begin
    //combination of keys? (500) is personal reference
    if (MilliSecondsBetween(LastTimeKeydown,Now)>1000) then
    begin
      keys:=keys+keychar;
      //ShowMessage(IntToStr(MilliSecondsBetween(LastTimeKeydown,Now)) + ' else '+ keys );
    end
    else // start new combination
    begin
      keys:=keychar;
      //ShowMessage(IntToStr(MilliSecondsBetween(LastTimeKeydown,Now)) + ' else '+ keys );
    end;


    //last time key was pressed
    LastTimeKeydown:=Now;

    //lookup item
    for I := 0 to demandGarminCombo.count-1 do
      if uppercase(copy(demandGarminCombo.items[i],0,keys.length))=uppercase(keys) then begin

        demandGarminCombo.itemindex:=i;
        break;  //first item found is good
      end;
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
    //reload listmodel
    listModel.Clear;
    listModel.Items := GlobalAvailableListModel;

    //ambil data dari database.
    garmines_pso_Query.SQL.Text:= 'select * from garmines_pso where garmines_id="'+demandGarminCombo.Text+'" group by Model_Number ';
    garmines_pso_Query.Open();

    while not (garmines_pso_Query.Eof) do
    begin
      //tambahkan hasil query ke listmode lalu diceklis.
      //listModel.Items.Add(garmines_pso_Query['Model_Number']);
      listModel.Items.Insert(0, garmines_pso_Query['Model_Number'] );
      listModel.ListItems[ listModel.Items.IndexOf(garmines_pso_Query['Model_Number']) ].IsChecked:=true;

      //jika garmines_pso_Query['Model_Number'] ada di array AllModelNumber maka tambahkan ke total.
      isInArrayResult:= cariIndex( garmines_pso_Query['Model_Number'], AllModelNumber );
      //jika ketemu di fungsi
      if (isInArrayResult <> -1) then
      begin
        //jika isInArrayResult hasilnya bukan -1 maka ambil return value nya
        // sebagai index di grid.
        total:= total+ StrToInt( gridModel.Cells[1, isInArrayResult ] );
      end;
      //listModel.ListItems[I].IsChecked:=false;
      garmines_pso_Query.Next;
      I:=I+1;
    end;

    //ShowMessage('changed!~');
    edtTotalDemand.Text:= IntToStr(total);
  end;

end;

procedure TTabbedForm.demandGarminComboKeyUp(Sender: TObject; var Key: Word;
    var KeyChar: Char; Shift: TShiftState);
var
  item: string;
  I: Integer;
  filteredValue:TStringList;
begin
  item:= demandGarminCombo.Text; //Trim( edit1.Text + KeyChar );
  //ShowMessage(item);
  try
    filteredValue:=TStringList.Create;
    filteredValue.Clear;
    
    for I := 0 to AllGarminId.Count-1 do
    begin
      if (pos( UpperCase(item) , UpperCase( AllGarminId[I]) )> 0 ) then
      begin
        filteredValue.Add(AllGarminId[I]);
          
      end;
    end;

    demandGarminCombo.Items:= filteredValue; 

    if (item='') then demandGarminCombo.Items:=AllGarminId;
    
    //SendMessage(demandGarminCombo.handle , CB_SHOWDROPDOWN, Integer(True), 0);
    //SendMessage(ComboBox1.handle, CB_SHOWDROPDOWN, Integer(True), 0);  
  finally
    filteredValue.Free;
  end;
end;

function TTabbedForm.DirIsReadOnly(Path: string): Boolean;
var
 attrs    : Integer;
begin
 attrs  := FileGetAttr(Path);
 Result :=  ( attrs > 0 ) and ( faReadOnly  > 0 );
end;

procedure TTabbedForm.duplicateGridCellClick(const Column: TColumn; const Row:
    Integer);
var
  unitId: string;
  serialNumber: string;
  yNumber: string;
begin

  yNumber:= duplicateGrid.Cells[3,Row] ;
  serialNumber:=duplicateGrid.Cells[4,Row];
  unitId:=duplicateGrid.Cells[5,Row];

  DuplicatedForm.Y_Number:= yNumber;
  DuplicatedForm.Serial_No:= serialNumber;
  DuplicatedForm.Unit_ID_no:= unitId;

  DuplicatedForm.ShowModal;
end;

procedure TTabbedForm.edtSearchModelKeyUp(Sender: TObject; var Key: Word; var KeyChar:
    Char; Shift: TShiftState);
var
  item: string;
  I: Integer;
  filteredValue:TStringList;
begin
  item:= edtSearchModel.Text; //Trim( edit1.Text + KeyChar );
  //ShowMessage(item);
  try
    filteredValue:=TStringList.Create;
    filteredValue.Clear;
    
    for I := 0 to GlobalAvailableListModel.Count-1 do
    begin
      if (pos( UpperCase(item) , UpperCase( GlobalAvailableListModel[I]) )> 0 ) then
      begin
        filteredValue.Add(GlobalAvailableListModel[I]);
          
      end;
    end;

    listModel.Items:= filteredValue; 

    if (item='') then listModel.Items:=GlobalAvailableListModel;
      
  finally
    filteredValue.Free;
  end;
end;

procedure TTabbedForm.edtDupPathChangeTracking(Sender: TObject);
begin
  if (edtLineName.Text <> '') and (edtDupPath.Text <> '') then
  begin
    button10.Enabled:=true;
  end;
end;

procedure TTabbedForm.edtGarminIdChangeTracking(Sender: TObject);
begin
  if not (edtGarminId.Text='') then aktif
  else nonaktif;
end;

procedure TTabbedForm.edtLineNameChangeTracking(Sender: TObject);
begin
  if (edtLineName.Text <> '') and (edtDupPath.Text <> '') then
  begin
    button10.Enabled:=true;
  end;
end;

procedure TTabbedForm.edtLineNameKeyUp(Sender: TObject; var Key: Word; var
    KeyChar: Char; Shift: TShiftState);
begin
  if Key=13 then
    button2.SetFocus;

end;

procedure TTabbedForm.finishThread;
begin
  ShowMessage('loading finish!');
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
  sleep(10);
  updateDemand;
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

  nonaktif;

end;

procedure TTabbedForm.garminDemandQtyGridCellClick(const Column: TColumn; const
    Row: Integer);
begin
  demandGarminCombo.ItemIndex:= demandGarminCombo.Items.IndexOf( garminDemandQtyGrid.Cells[0, Row] );
  demandGarminComboChange(Self);
  garminDemandQtyGrid.Cells[1, Row] := edtTotalDemand.Text;
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
  if DirectoryExists(DirName) and DirIsReadOnly(DirName) then
    Result := Length(TDirectory.GetDirectories(DirName))
  else
    Result:=-1;
end;

procedure TTabbedForm.getGarminId;
var
  I: Integer;
  query: string;
begin

  query:='SELECT  garmines.id, ' +
          ' ifnull( s.total_stock, 0 ) as stock , '+
          'ifnull( s.total_allocated, 0 ) as allocated_stock, ' +
          ' ifnull( d.total_demand,0) as demand ' +
          ' FROM `garmines` ' +
          ' LEFT  JOIN ( ' +
            ' SELECT garmines_id, ifnull( SUM(stocks.stock),0 ) as total_stock, ' +
            ' ifnull( SUM(stocks.allocated_stock ), 0 ) as total_allocated '+
            'FROM stocks '+
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

  AllGarminId:= Tstringlist.Create;
  allGarminId.Clear;

  mainGrid.RowCount:= garminQuery.RecordCount;

  while not (garminQuery.Eof) do
  begin
    allGarminId.Add( garminQuery['id'] );  //global garmin Id
    isiMainGrid(I);
    garminQuery.Next;
    I:=I+1;
  end;

  refreshGarminCombo;
end;

procedure TTabbedForm.getImage;
begin
  //  ImageList1.AddOrSet()
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
    //GlobalListmodel adalah model number yg sudah memiliki garmin id.

    getSelectedListModel;  //hasilnya di GlobalListModelNumber

    GlobalAvailableListModel:=TSTringlist.Create;
    GlobalAvailableListModel.Clear;
    //ShowMessage( GlobalListModelNumber.Text );

    while not ( modelQuery.Eof ) do
    begin

      gridModel.RowCount:= modelQuery.RecordCount;
      model_no:= modelQuery['model_no'] ;

      if not isInArray(model_no, GlobalListModelNumber ) then
      begin
        //Jika modelQuery['model_no'] tidak ada di GlobalListModelNumber, maka
        // tambah listmodel
        GlobalAvailableListModel.Add(modelQuery['model_no']);
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

procedure TTabbedForm.isiNumber;
var tmpObject: TStringColumn;
  I: Integer;
begin
  //for I := Low to High do
  tmpObject := TStringColumn.Create(nil);
  tmpObject.Header:='Number';
  for I := 1 to garminGrid.RowCount do
  begin
    //tmpObject.inser
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
var
  oParams: TStringList;
begin
  try

    try
      if FileExists(ExtractFilePath(ParamStr(0)) + 'file.ini' ) then
      begin
        try
          oParams:=Tstringlist.Create;
          oParams.LoadFromFile( ExtractFilePath(ParamStr(0)) + 'file.ini' );
          oParams.Add('Pooled=True');
          FDManager.AddConnectionDef('garmin_inventory', 'MySQL', oParams);
          FDConnection1.ConnectionDefName:='garmin_inventory';
        finally
          oParams.Free;
        end;
      end;


      FDConnection1.Connected:=true;
    except
      on E:exception do
      ShowMessage(E.ClassName +' has rised exception of '+ E.Message);
    end;

    try
      if FileExists(ExtractFilePath(ParamStr(0)) + 'dbpso.ini' ) then
      begin
        try
          oParams:=Tstringlist.Create;
          oParams.LoadFromFile( ExtractFilePath(ParamStr(0)) + 'dbpso.ini' );
          oParams.Add('Pooled=True');
          FDManager.AddConnectionDef('db_pso', 'MySQL', oParams);
          psoConnection.ConnectionDefName:='db_pso';
        finally
          oParams.Free;
        end;
      end;
      psoConnection.Connected:=true;

    except
      on E:exception do
      ShowMessage(E.ClassName +' has rised exception of '+ E.Message);
    end;

    garmines_pso_Query.Active:=true;
    duplicateQuery.Active:=true;
    garminQuery.Active:=true;
    lineQuery.Active:=true;
    demandQuery.Active:= true;
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
  demandGarminCombo.ItemIndex:=-1;
  //listModel.Enabled:=false;

  //module duplication checker
  button10.Enabled:=false;

end;

procedure TTabbedForm.pindahFile(paramPath:String);
var
   baseFolder: string;
begin

   baseFolder := ExtractFilePath( ParamStr(0) );
   baseFolder:= baseFolder + 'DATALOG\'; //StringReplace(baseFolder, 'Win32\debug\', 'DATALOG\', [rfReplaceAll, rfIgnoreCase]);

   if not (DirectoryExists(baseFolder)) then //jika baseFolder tidak ada, maka buat.
    begin
      if not CreateDir(baseFolder)then
      begin
       ShowMessage('New directory add failed with error : '+
                   IntToStr(GetLastError)+' '+ SysErrorMessage(GetLastError) );
       exit;
      end;
    end;

   //ShowMessage(baseFolder);
    if not CopyFile(PChar( paramPath ),PChar( baseFolder + ExtractFileName(paramPath)  ),false) then
    begin
      ShowMessage( SysErrorMessage(GetLastError) );
    end;

    //ShowMessage(baseFolder + ExtractFileName(paramPath));
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
  demandQuery.Refresh;
  stockQuery.Refresh;
  garmines_pso_Query.Refresh;
end;

procedure TTabbedForm.SelectFileInExplorer(const Fn: string);
begin
  ShellExecute( FmxHandleToHWND(Self.Handle), 'open', 'explorer.exe',
    PChar('/select,"' + Fn+'"'), nil, SW_NORMAL);
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
    query:='insert into garmines_pso (garmines_id, model_number ) values('+ demandGarminCombo.Text +', '+value[I]+' )';
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
    //cek apakah Globallistmodelnumber sudah di declare sebelumnya, kalau sudah,
    //gausah create lagi.
    if not Assigned(GlobalListModelNumber) then
      GlobalListModelNumber:=TStringList.Create;

    GlobalListModelNumber.Clear;
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



procedure TTabbedForm.listModelItemClick(const Sender: TCustomListBox; const
    Item: TListBoxItem);
var
  I: Integer;
begin
  for I := 0 to gridModel.RowCount-1  do
  begin
    if gridModel.Cells[0,I]=Item.Text then
    begin
      gridModel.SelectRow(I);
      gridModel.SetFocus;
      gridModel.TopRow:= I;
      exit;  //biar cepet, gausah lanjut for nya
    end;
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
      gridModel.TopRow:= I;
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
  garminId:= stockGarminCombo.Text;

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

procedure TTabbedForm.mainGridCellDblClick(const Column: TColumn;
  const Row: Integer);
var
  garminID, modelNumber : string;
  tmpquery: TFDQuery;
  tmpQueryPSO :TFDQuery;
  query: string;
begin
  garminID := mainGrid.Cells[0, Row];
  try
    tmpquery:=TFDQuery.Create(nil);
    tmpquery.Connection:= FDConnection1 ;
    tmpquery.SQL.Text :='select * from garmines_pso where garmines_id="'+garminID+'"';
    tmpquery.Active:=true;
    tmpquery.Open();
    modelNumber:='';
    while not (tmpquery.Eof) do
    begin
      modelNumber := modelNumber + '"'+ tmpquery['Model_Number'] +'",';
      //ShowMessage(modelNumber);
      tmpquery.Next;
    end;

    //hapus koma dibelakang dari var modelnumber
    Delete(modelNumber, length(modelNumber), 1 );
    TabbedForm.mod

    //ShowMessage(modelNumber);
    {if not (modelNumber='') then
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
    end;}

  finally
    tmpquery.Free;
  end;

end;

procedure TTabbedForm.stockGarminComboChange(Sender: TObject);
var
  query: string;
  total:Integer;
  tmpQuery: TFDQuery;
begin
  try
    query:='SELECT `path`,stock FROM `stocks` where garmines_id="'+stockGarminCombo.Text+'"';
    total:=0;
    listPath.Clear;

    try

      tmpQuery:= TFDQuery.Create(Self);
      tmpQuery.Connection:= FDConnection1;
      tmpQuery.SQL.Text:= query;
      tmpQuery.Active:=true;
      tmpQuery.Open();

      while not (tmpQuery.Eof) do
      begin

        listPath.Items.Add( tmpQuery['path']);
        total:=total+tmpQuery['stock'];
        tmpQuery.Next;
      end;
      edtStocks.Text:= IntToStr(total);


    finally
      tmpQuery.Free;
    end;


  except
   on E: Exception do
    ShowMessage(E.ClassName +' has rised an exceptions '+ E.Message );
  end;

end;

procedure TTabbedForm.stockGridCellClick(const Column: TColumn; const Row:
    Integer);
var
  selectedGrid: string;
  index: Integer;
  I: Integer;
begin
     AllGarminId.Clear;
     for I := 0 to stockGarminCombo.Items.Count-1 do
     begin
       AllGarminId.Add(stockGarminCombo.Items[I]);
     end;

     selectedGrid:= stockGrid.Cells[1, Row];
     index:= cariIndex(selectedGrid, AllGarminId );
     //ShowMessage( IntToStr(index) +'  '+ selectedGrid +'  '+ AllGarminId.Text );
     stockGarminCombo.ItemIndex := index;

     //run stock on change
     stockGarminComboChange(Self);
     if (stockGrid.Cells[2,Row] <> edtStocks.Text) then //avoid (BCD)
        //showMessage(stockGrid.Cells[2,Row] +'<>'+ edtStocks.Text);
         stockGrid.Cells[2,Row] := edtStocks.Text;

end;

procedure TTabbedForm.TabItem1Click(Sender: TObject);
begin
  updateStock;
  getGarminId;
end;

procedure TTabbedForm.TabItem2Click(Sender: TObject);
begin
  lineQuery.Refresh;
  duplicateQuery.Refresh;
end;

procedure TTabbedForm.TabItem3Click(Sender: TObject);
begin
  garminQuery.Refresh;
end;

procedure TTabbedForm.TabItem4Click(Sender: TObject);
begin
 // stockQuery.Refresh;
end;

procedure TTabbedForm.Timer1Timer(Sender: TObject);
begin
   label6.Text:= TimeToStr(Time);
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
    try
      tmpQuery.Open();
      //looping garmin_pso
      while not (tmpQuery.Eof) do
      begin
        //cari tmpQuery['model_number'] di gridModel.
        index:= cariIndex(tmpQuery['model_number'], AllModelNumber);
        // jika tmpQuery['demand'] != gridModel[1,I] maka update
        if not (index= -1) then //jika ketemu
        begin
          //ShowMessage(gridModel.Cells[1, index]+' = '+ IntToStr(tmpQuery['demand']) );
          if not ( gridModel.Cells[1, index] = tmpQuery['demand'] ) then //jika value nya beda.
          begin
            //update
            //ShowMessage(IntToStr(tmpQuery['demand']));
            total:= strToInt( gridModel.Cells[1, index] );
            queryUpdate:= 'UPDATE `garmines_pso` SET `demand`='+ IntToStr(total)+' WHERE id='+ IntToStr( tmpQuery['id']) +'';
            try
              FDConnection1.ExecSQL(queryUpdate);
            except
               on E:Exception do
                  ShowMessage(E.Message);
            end;
            
          end;

        end;

        tmpQuery.Next;
      end;
    except
      on E:Exception do
        ShowMessage(E.Message);
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
  selisih: Integer;
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
        total:= GetDirectoryCount( tmpQuery['path'] ); //Value Baru
        //tmpQuery['stock'] = value lama
        selisih := tmpQuery['stock'] - total ; //selisih = value lama- value baru

        //ShowMessage(inttostr(total));
        //ShowMessage(tmpQuery['path']+''+ );
        if not (total=-1) then //total=-1 jika filepath di db invalid di computer client
        begin
          if not (total = tmpQuery['stock']) then
          begin
            //update
            queryUpdate:= 'UPDATE `stocks` SET `stock`='+ IntToStr(total)+', allocated_stock='+ IntToStr(selisih) +' WHERE id='+ IntToStr( tmpQuery['id']) +'';
            FDConnection1.ExecSQL(queryUpdate);
          end;
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
