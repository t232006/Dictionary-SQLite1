unit remproc;



interface
uses SysUtils, Controls, Windows, dialogs;
function StringToDate (st:string):TDate;
function DateToString (da:Tdate):string;

implementation

function StringToDate (st:string):TDate;
var dd,mm:byte; yyyy:word;
begin
  try
    dd:=strtoint(copy(st,1,2));
    delete(st,1,3);
    yyyy:=strtoint(copy(st,length(st)-6,4));
    delete(st,length(st)-7,8);
    if st=
    'Январь' then  mm:=01 else if st=
    'Февраль' then mm:=02 else if st=
    'Март'    then mm:=03 else if st=
    'Апрель'  then mm:=04 else if st=
    'Май'     then mm:=05 else if st=
    'Июнь'    then mm:=06 else if st=
    'Июль'    then mm:=07 else if st=
    'Август'  then mm:=08 else if st=
    'Сентябрь' then mm:=09 else if st=
    'Октябрь' then mm:=10 else if st=
    'Ноябрь'  then mm:=11 else if st=
    'Декабрь' then mm:=12
    else raise exception.Create('строка не содержит название месяца');
  except on EConvertError do showmessage('проблемы либо с числом, либо с годом');
  end;
  result:=EncodeDate(yyyy,mm,dd);

end;

function DateToString (da:Tdate):string;
var st,t:string;
  begin
    st:=datetostr(da);
    t:=copy(st,1,2); st[1]:=st[4]; st[2]:=st[5]; st[4]:=t[1]; st[5]:=t[2];
    st[3]:='/'; st[6]:='/';
    result:=st;
  end;

end.
