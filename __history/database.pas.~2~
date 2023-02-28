unit database;

interface

uses
  SysUtils, Classes, DB, DBTables, Data.Win.ADODB;

type
  TDataModule2 = class(TDataModule)
    dssynch: TDataSource;
    dspotential: TDataSource;
    dsselectsel: TDataSource;
    dstopic: TDataSource;
    ADOConnection: TADOConnection;
    top: TADOTable;
    Dict: TADOTable;
    dstop: TDataSource;
    dsdict: TDataSource;
    topic: TADOQuery;
    topicquery: TADOQuery;
    dropch: TADOCommand;
    selectsel: TADOQuery;
    potential: TADODataSet;
    addball: TADOQuery;
    droprate: TADOCommand;
    synch: TADOQuery;
    topid: TIntegerField;
    topicid: TIntegerField;
    topiccountdicttopic: TIntegerField;
    DeepSearch: TADOCommand;
    dropspot: TADOQuery;
    DictNumber: TAutoIncField;
    DictWord: TWideStringField;
    DictTranslation: TWideStringField;
    DictTopic: TIntegerField;
    DictScore: TSmallintField;
    DictUsersel: TBooleanField;
    DictRelevation: TIntegerField;
    DictSpot: TBooleanField;
    topName: TWideStringField;
    DictTopicName: TStringField;
    DictDateRec: TDateField;
    topicName: TWideStringField;
    DictPhrase: TBooleanField;
    procedure vokabAfterRefresh(DataSet: TDataSet);
    procedure synchAfterOpen(DataSet: TDataSet);
    procedure DictWordGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DictUserselGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  //procedure edittable(op:boolean);


var
  DM2: TDataModule2;

implementation

uses MainForm;


{$R *.dfm}

procedure TDataModule2.DictUserselGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text:='';
end;

procedure TDataModule2.DictWordGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
    Text:=Sender.AsString
end;

procedure TDataModule2.synchAfterOpen(DataSet: TDataSet);
begin
with form1 do
  begin
    SpeedButton9.Enabled:=true;
    StBar.panels[1].Text:='Выделено слов: '+inttostr(DBGrid2.SelectedRows.Count);
    Fill4Status;
  end;
end;

procedure TDataModule2.vokabAfterRefresh(DataSet: TDataSet);
//var R:Integer;
begin
  seAndCor.calcProgress;
  form1.StBar.Panels[4].Text:='Потенциал: '+seAndCor.potcount;
  {if (DataSet.Filtered) then
    begin
      DataSet.Filtered:=false;
      R:=DataSet.RecordCount;
      form1.StBar.panels[0].Text:='Всего слов: '+inttostr(R);
      DataSet.Filtered:=true;
    end;  }
  form1.StBar.panels[0].Text:='Всего слов: '+inttostr(DataSet.RecordCount);
end;


end.
