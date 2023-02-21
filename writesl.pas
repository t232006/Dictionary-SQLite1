unit writesl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, lessons, StdCtrls;

type
  TForm2 = class(TForm)
    st1: TStaticText;
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  var gg:integer;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
    if edit1.text<>v[gg].slovo then
    begin
       edit1.font.style:=edit1.font.style+[fsstrikeout]
    end else
    begin
      st1.Caption:=writeslovo(gg);
      edit1.Text:='';
    end; 

end;


procedure TForm2.FormShow(Sender: TObject);
begin
  read1('words.txt');
  st1.Caption:=writeslovo(gg);
end;

end.
