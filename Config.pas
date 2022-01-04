unit Config;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo;

type
  TForm12 = class(TForm)
    txtPsoQuery: TMemo;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation
  uses Unit1, TabbedTemplate;

{$R *.fmx}

procedure TForm12.Button1Click(Sender: TObject);
begin
//  TTabbedForm
  TabbedTemplate.TabbedForm.psoQuery.SQL := txtPsoQuery.Lines;
  TabbedTemplate.TabbedForm.psoQuery.Active := True;
  self.Hide;
end;

end.
