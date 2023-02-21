unit UpDownHor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, ExtCtrls;

type
  TFrame4 = class(TFrame)
    Image1: TImage;
    Image2: TImage;
    Edit1: TEdit;
    procedure Image2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    const fmax:byte=30;
    const fmin:byte=2;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrame4.Image1Click(Sender: TObject);
var cur:variant;
begin
  cur:=edit1.Text;
  if cur>fmin then dec(cur);
  edit1.Text:=cur;
end;

procedure TFrame4.Image2Click(Sender: TObject);
var cur:variant;
begin
  cur:=edit1.Text;
  if cur<fmax then inc(cur);
  edit1.Text:=cur;
end;

end.
