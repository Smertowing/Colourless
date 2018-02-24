unit test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TStatus = (stBlue, stRed, stBlack);
  TPeak = record
    x,y:integer;
    status:TStatus;
  end;
  TPeakList = array[1..12] of TPeak;
  TForm1 = class(TForm)
    Image1: TImage;
    pnlSidebar: TPanel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  x0 = 40;
  y0 = 40;
  R = 40;

  Level1:array[1..2, 1..12] of integer = ((180,300,420,300,60,180,300,420,540,420,300,180),(110,40,110,200,400,320,320,320,400,500,500,500));
  Level1XShift = 100;
  Level1YShift = 20;
var
  Form1: TForm1;
  PeakList:TPeakList;


implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to 12 do
  begin
    PeakList[i].x := level1[1,i] + Level1XShift;
    PeakList[i].y := level1[2,i] + Level1YShift;
  end;
  Image1.Canvas.Pen.Width := 10;
  Image1.Canvas.MoveTo(PeakList[1].x, PeakList[1].y);
  for i := 1 to 12 do
  begin
    PeakList[i].x := level1[1,i];
    PeakList[i].y := level1[2,i];
    Image1.Canvas.LineTo(PeakList[i].x, PeakList[i].y);
  end;
  Image1.Canvas.Brush.Color := clBlue;
  Image1.Canvas.Pen.Width := 1;
  for i := 1 to 12 do
  begin
    Image1.Canvas.Ellipse(PeakList[i].x-R,PeakList[i].y-R,PeakList[i].x+R,PeakList[i].y+R);
  end;


  //Image1.Canvas.MoveTo(X0,Y0);
  //Image1.Canvas.LineTo(x0+100, y0+100);
  //Image1.Canvas.LineTo(x0+200, y0);
  {Image1.Canvas.Brush.Color := clBlue;
  Image1.Canvas.Ellipse(x0-R,Y0-R,X0+R,Y0+R);
  Image1.Canvas.Ellipse(x0+200-R,Y0-R,X0+200+R,Y0+R);}

end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  {if (((X0-x)*(X0-x) + (Y0-y)*(Y0-y) < R*R)) then
  begin
    //ShowMessage(IntToStr(x) + ' ' + IntToStr(y));
    if  Button=mbLeft then
      Image1.Canvas.Brush.Color := clRed
    else if Button=mbRight then
      Image1.Canvas.Brush.Color := clBlack;
    Image1.Canvas.Ellipse(x0-R,Y0-R,X0+R,Y0+R);
  end;   }
end;

end.
