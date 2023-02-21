unit deepSearch;
interface
uses database, strUtils, basemanipulation;
procedure deepSeek(needle: string);

implementation
//uses MainForm;
procedure deepSeek(needle: string); 
var _to:string;

begin
    with DM2 do
    begin
      //DeepSearchProc.Prepared:=false;
      {deepsearchProc.parameters.ParamValues['@Needle'] :=needle;
      if ord(needle[1])<128 then //latin
        deepsearchProc.parameters.ParamValues['@Word']:=0
      else
        deepsearchProc.parameters.ParamValues['@Word']:=1;
      //DeepSearchProc.Prepare;
      DeepSearchProc.ExecProc;
      baserefresh;     }
      dropspot.ExecSQL;
      //deepsearch.parameters.ParamValues['@needle'] :=needle;
      if ord(needle[1])<128 then //latin
        _to:='Translation'
      else
        _to:='Word';
      deepsearch.commandtext:='UPDATE Dict set spot=true where '+_to+' like ''%'+needle+'%''';
      DeepSearch.Execute;
      baserefrash;
    end;
end;

end.
