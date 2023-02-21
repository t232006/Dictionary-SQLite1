unit saver;

interface
uses VCL.Graphics, Classes, Sysutils;


   procedure saveForm;
   procedure loadForm;

implementation
uses MainForm, frame;

procedure loadForm;
  var f:textfile;
    sf:string;
    fk:byte;
begin
    try
    with form1 do
      begin
      assignfile(f,'init.ini');
      reset(f);

      readln(f, sf);
      color:=strtoint(sf);

      Shape1.Brush.Color:=strtoint(sf);

      readln(f,sf);
      Grid.Font.size:=strtoint(sf);
      Frame42.Edit1.Text:=sf;

      readln(f,sf);
      Grid.Font.color:=strtoint(sf);
      ShTableFontColor.Brush.Color:=strtoint(sf);

      readln(f,sf);
      color_scale:=strtoint(sf);
      ShScaleColor.Brush.Color:=strtoint(sf);

      readln(f,sf);
      TableGreedRow.RowBrushColor1:=strtoint(sf);
      Frame31.Shape1.Brush.Color:=strtoint(sf);

      readln(f,sf);
      TableGreedRow.RowBrushColor2:=strtoint(sf);
      Frame31.Shape2.Brush.Color:=strtoint(sf);

      readln(f,sf);
      n5.Checked:=strtobool(sf);
      ChShowScale.Checked:=n5.Checked;

      readln(f,sf);
      n6.Checked:=strtobool(sf);
      ChShowNumber.Checked:=n6.Checked;

          readln(f,sf);
          fk:=strToint(sf);
          case fk of
             0:Form1.N8Click(Form1);
             1:Form1.N9Click(Form1);//n9.Checked:=true;
             2:Form1.N10Click(Form1);//n10.checked:=true;
             3:Form1.N12Click(Form1);//n12.checked:=true;
           end;

       readln(f,sf);
       ShCardColor.Brush.Color:=strtoint(sf);
       for fk:=1 to 12 do
       begin
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).panel.color:= strtoint(sf);
       end;

      readln(f,sf);
      LaBottomCard.Font.Color:=strtoint(sf);
      for fk:=1 to 12 do
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Font.Color:=strtoint(sf);

      readln(f,sf);
      LaBottomCard.Font.Size:=strtoint(sf);
        for fk:=1 to 12 do
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Font.size:=strtoint(sf);

       readln(f,sf);
       LaBottomCard.Font.Name:=sf;
        for fk:=1 to 12 do
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).Panel1.Font.name:=sf;

        readln(f,sf);
        LaUpperCard.Font.Color:=strtoint(sf);
      for fk:=1 to 12 do
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).Panel2.Font.Color:=strtoint(sf);

      readln(f,sf);
      LaUpperCard.Font.Size:=strtoint(sf);
        for fk:=1 to 12 do
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).Panel2.Font.size:=strtoint(sf);

       readln(f,sf);
       LaUpperCard.Font.Name:=sf;
        for fk:=1 to 12 do
        (form1.FindComponent('frame2'+inttostr(fk)) as tframe2).Panel2.Font.name:=sf;
    end;
    finally
    closefile(f);
    end;
end;

procedure saveForm;
var f:textfile;
begin
  assignfile(f,'init.ini');
  Rewrite(f);
  with form1 do
  begin
    writeln(f,inttostr(Color));
    writeln(f,inttostr(Grid.Font.Size));
    writeln(f,inttostr(  Grid.Font.color));
    writeln(f,inttostr(color_scale));

    writeln(f, inttostr(tablegreedrow.Rowbrushcolor1 ));
    writeln(f, inttostr(tablegreedrow.Rowbrushcolor2 ));

    writeln(f,booltostr(n5.checked));
    writeln(f,booltostr(n6.checked));

    if n8.checked then writeln(f,inttostr(0)) else
    if n9.checked then writeln(f,inttostr(1)) else
    if n10.checked then writeln(f,inttostr(2)) else
    if n12.checked then writeln(f,inttostr(3));

    writeln(f,inttostr(Frame21.Panel1.Color ));
    writeln(f,inttostr(Frame21.Panel1.Font.Color  ));
    writeln(f,inttostr(Frame21.Panel1.Font.size  ));
    writeln(f,(Frame21.Panel1.Font.name  ));
    writeln(f,inttostr(Frame21.Panel2.Font.Color  ));
    writeln(f,inttostr(Frame21.Panel2.Font.size  ));
    writeln(f,(Frame21.Panel2.Font.name  ));

    closefile(f);
  end;
end;
end.
