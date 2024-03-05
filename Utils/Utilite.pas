unit Utilite;

interface
uses WinAPI.Windows, System.SysUtils, VCL.forms,
      shellAPI, Classes, strUtils, ShlObj;

type arraydir = array[0..255] of char;

TCmd = class
    private Programname, params, dir: string;
    StartupInfo:TStartupInfo;
    saSecurity: TSecurityAttributes;
    public
    Constructor Create(Programname, params: String);
    function WinExecAndWait:cardinal;
    function CmdScreen:string;
end;

//function CmdScreen: string;
TFilesList = class
  private
    collection:array of string;
    procedure split(s:string; c:char);

  published
  function MaxLength: byte;
    //property MaxLength:byte; read getMaxLength;
   //function getfilesList(): TStringList; overload;
   function getfilesList(source: string): TStringList; overload;

end;



function GetSpecialPath(CSIDL: word):string;


implementation
function TFilesList.getfilesList(source: string): TStringList;
var sList:TStringList;
begin
    split(source, ' ');
    sList:=TStringList.Create;
    for var i:byte := Low(collection) to High(collection) do
      sList.Add(collection[i]);
    result:=sList;
end;

function TFilesList.MaxLength: byte;
var k:byte;
begin
  k:=0; result:=0;
  while k < length(collection) do
  begin
     if result<length(collection[k]) then result:=length(collection[k]);
     inc(k,2);
  end;

end;

procedure TFilesList.split(s: string; c: Char);
var _pos:word;
begin
  while s<>'' do
  begin
    setlength(collection, length(collection)+1);
    _pos:=AnsiPos(c,s);
    collection[length(collection)-1]:=trim(AnsiLeftStr(s,_pos));
    delete(s,1,_pos);
  end;
end;


function GetSpecialPath(CSIDL: word): string;
var s: PChar;
begin
s:=stralloc(max_path);
if not SHGetSpecialFolderPath(0, s, CSIDL, true)
then s := '';
result := s;
end;


{function TfilesList.getfilesList(): TStringList;
//type Tcollect=array of string;

var f:textfile;
    s:string;
    sList:TStringList;
    i:word;
    filename:string;
begin
   filename:=Concat(GetSpecialPath(CSIDL_APPDATA),'\Individual dictionary\','fileslist.b');
   try
     assignfile(f, filename);
     reset(f);
     readln(f,s);
     closefile(f);
     sList:=TStringList.Create;
     split(s,' ');
     for i := Low(collection) to High(collection) do
      sList.Add(collection[i]);
     //DeleteFile(filename);
   finally
   result:=sList;
   end;
end;      }

constructor TCmd.Create(Programname, params: string);
begin
     self.ProgramName:=ProgramName;
     self.params:=params;
end;

function TCmd.WinExecAndWait:cardinal;
    var ProcessInfo:TProcessInformation;
    begin
       FillChar(StartupInfo,Sizeof(StartupInfo),#0);
     StartupInfo.cb:= Sizeof(StartupInfo);
     StartupInfo.dwFlags:= STARTF_USESHOWWINDOW;
     StartupInfo.wShowWindow:= SW_HIDE;
     if not CreateProcess(PChar(ProgramName),
      PChar(params),
      nil,
      nil,
      false,
      CREATE_NEW_CONSOLE or
      NORMAL_PRIORITY_CLASS,
      nil,
      nil,
      StartupInfo,
      ProcessInfo) then result := 0
     else begin
      WaitforSingleObject(ProcessInfo.hProcess, INFINITE);
      GetExitCodeProcess(ProcessInfo.hProcess, result);
     end;
      //shellexecute(0, 'open', Pchar(Programname), Pchar(params), Pchar(dir), SW_show);
  end;

function TCmd.CmdScreen: string;
const
  CReadBuffer = 2400;
var

 piProcess:  TProcessInformation;
 pBuffer:    array [0 .. CReadBuffer] of AnsiChar;
 dRead:      DWord;

begin
  saSecurity.nLength:= SizeOf(TSecurityAttributes);
  saSecurity.bInheritHandle:=True;
  StartupInfo.cb:=SizeOf(TStartupInfo);
  StartupInfo.dwFlags:= STARTF_USESTDHANDLES+STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow:=SW_HIDE;
  if CreatePipe(StartupInfo.hStdInput, StartupInfo.hStdOutput, @saSecurity, CReadBuffer) then
  begin
    StartupInfo.hStdError:=StartupInfo.hStdOutput;
    if CreateProcessW(PChar(Programname), PChar(params), @saSecurity, 0, True, 0, 0, 0, StartupInfo, piProcess) then
    begin
      sleep(4000);
      dRead:=0;
      ReadFile(StartupInfo.hStdInput, pBuffer, CReadBuffer, dRead, 0);
      pBuffer[dRead]:=#0;
      TerminateProcess(piProcess.hProcess,0);
    end;
    CloseHandle(StartupInfo.hStdInput);
    CloseHandle(StartupInfo.hStdOutput);
  end;
  result:=pBuffer;
end;


end.
