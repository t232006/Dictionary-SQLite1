unit LogoThread;

interface
uses Classes, saver;
type
TLogoThread=Class(TThread)
  procedure Execute; override;

End;

implementation
uses MainForm;

{ TLogoThread }

procedure TLogoThread.Execute;
begin
  with form1 do
  begin
    if loadForm=false then
  begin
    StBar.Panels[0].Text:='������ � �������� �������';
    StBar.Tag:=1;   //error!!!
    exit;
  end;
  stBar.Tag:=0; //no error
  startexercises;
  end;

end;

end.
