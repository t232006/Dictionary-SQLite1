unit Logo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, lesson4, lessons, PoBukvam, cardsUnit, MainForm;

type
  TLogoForm = class(TForm)
    ProgressBar1: TProgressBar;
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public

  end;



implementation

{$R *.dfm}


procedure TLogoForm.FormPaint(Sender: TObject);
var arect:TRect;  BmpImage: TBitMap;
begin
    BmpImage:=TBitMap.Create;
    BmpImage.LOADFROMFILE('Dictionary.bmp');
    aRect:=Rect(0,0,550,512) ;
    Canvas.stretchDraw(aRect,BmpImage);
    BmpImage.Destroy;
    test:=TTest.create(6);
    progressbar1.Position:=Progressbar1.position+20;
    poBukv:=TPoBukvam.create;
    progressbar1.Position:=Progressbar1.position+20;
    complience:= Tcomplience.Create(6);
    progressbar1.Position:=Progressbar1.position+20;
    YesNo:=TYesNo.Create(1);
    progressbar1.Position:=Progressbar1.position+20;
    cards:=Tcards.create(12);
    progressbar1.Position:=Progressbar1.position+20;
    ProgressBar1.Tag:=1;
end;

end.
