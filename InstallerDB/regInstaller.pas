unit regInstaller;

interface
uses
  System.SysUtils,
  System.Classes,
  registry,
  winApi.Windows;
Type TDBRegistry=class
  reg:TRegistry;
  key1:string;
  public
  procedure WritePath(filename:string);
  function GetPath: string;
  constructor Create;
  destructor Destroy;
end;

implementation

destructor TDBRegistry.Destroy;
begin
  reg.Free;
end;

Constructor TDBRegistry.Create;
begin
    reg:=TRegistry.Create;
    reg.rootkey:= HKEY_LOCAL_MACHINE;
    key1:='SOFTWARE\ODBC\ODBC.INI\dictionary';
end;

function TDBRegistry.GetPath: string;
begin
    reg.OpenKey(key1, false);
    result:=reg.ReadString('Database');
    reg.CloseKey;
end;

procedure TDBRegistry.WritePath(filename:string);
var key2:string;
begin
  with reg do
    begin
      if not(keyexists(key1)) then
      begin
        openkey(key1,true);
        WriteString('Driver','C:\WINDOWS\system32\sqlite3odbc.dll');
        CloseKey;
        key2:='SOFTWARE\ODBC\ODBC.INI\ODBC Data Sources';
        openKey(key2,true);
        WriteString('dictionary','SQLite3 ODBC Driver');
        CloseKey;
      end;
      OpenKey(key1,false);
      WriteString('Database',filename);
      CloseKey;
    end;
end;
end.
