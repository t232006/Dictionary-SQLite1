unit CloudSaveThread;

interface
uses Utilite, SysUtils, Classes, Controls, Forms, ShellAPI, Windows, messages;
const CANCEL_CLOUD = WM_USER+110;
type
  Tcloud = class
    public
      procedure saveToCloud(whereFrom:string);
      procedure loadFromCloud(id, whereTo:string);
  end;

TSaveThread = class(TThread)
  public DBDir:string;
  protected
  procedure Execute; override;
  procedure SaveProcess;
end;

TLoadThread = class(TThread)
  private
  _id:string;
  public
  DBDir: string;
  property ID:string write _id;
  protected
  procedure Execute; override;
  procedure LoadProgress;
end;

implementation
//uses MainForm;
procedure Tcloud.saveToCloud(whereFrom:string);
var  command, filename:string;
     cmd: TCmd;
begin
    filename := ExtractFileName(WhereFrom);
    WhereFrom := ExtractFileDir(WhereFrom);
    command := Format(' client_secret.json %s %s', [WhereFrom, filename]);// %s %s',[GetCurrentDir,'saver\client_secret_for_Delphi.json', WhereTo, 'Dictionary.db']);
    cmd:=TCmd.Create('simulatorParams.exe', command);
    cmd.WinExecAndWait;
    SendMessage(getforegroundWindow, CANCEL_CLOUD, 0, 0);
    //shellexecute(0, 'open', 'UploaderDB.exe', Pchar(command), 'saver', SW_show);
    //shellexecute(0, 'open', PChar(theprogr), Pchar(command), nil, SW_SHOW);
end;

procedure Tcloud.loadFromCloud(id, whereTo: string);
var command: string;
    cmd: TCmd;
begin
    command := Format(' client_secret.json %s %s', [id, WhereTo]);
    cmd:= TCmd.Create('downloadDB.exe', command);
    cmd.WinExecAndWait;
    SendMessage(getforegroundWindow, CANCEL_CLOUD, 0,0);
    //shellexecute(0, 'open', 'simulatorParams.exe', Pchar(command), nil, SW_show);
end;


procedure TSaveThread.Execute;
begin
  SaveProcess;
end;

procedure TLoadThread.Execute;
begin
  LoadProgress;
end;

procedure TLoadThread.LoadProgress;
var Cloud: TCloud;
begin
   Cloud:=Tcloud.Create();
   Cloud.LoadFromCloud(_id, DBDir);
   Cloud.Free;
end;

procedure TSaveThread.SaveProcess();
var Cloud: TCloud;
begin
    Cloud:=Tcloud.Create();
    Cloud.SaveToCloud(DBDir);
    Cloud.Free;
end;

end.
