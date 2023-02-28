object DataModule2: TDataModule2
  Height = 374
  Width = 509
  object dssynch: TDataSource
    DataSet = synch
    Left = 32
    Top = 24
  end
  object dspotential: TDataSource
    DataSet = potential
    Left = 192
    Top = 32
  end
  object dsselectsel: TDataSource
    DataSet = selectsel
    Left = 240
    Top = 256
  end
  object dstopic: TDataSource
    DataSet = topic
    Left = 360
    Top = 120
  end
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Extended Properti' +
      'es="DSN=dictionary;Database=H:\SQLiteBrowser\dictionary.db;StepA' +
      'PI=0;SyncPragma=;NoTXN=0;Timeout=;ShortNames=0;LongNames=0;NoCre' +
      'at=0;NoWCHAR=0;FKSupport=0;JournalMode=;OEMCP=0;LoadExt=;BigInt=' +
      '0;JDConv=0;"'
    LoginPrompt = False
    Left = 432
    Top = 16
  end
  object top: TADOTable
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'Topic'
    Left = 408
    Top = 144
    object topid: TIntegerField
      FieldName = 'id'
    end
    object topName: TWideStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object Dict: TADOTable
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    Filtered = True
    TableName = 'Dict'
    Left = 456
    Top = 144
    object DictNumber: TAutoIncField
      FieldName = 'Number'
      ReadOnly = True
    end
    object DictWord: TWideStringField
      FieldName = 'Word'
      Size = 255
    end
    object DictTranslation: TWideStringField
      FieldName = 'Translation'
      Size = 255
    end
    object DictTopic: TIntegerField
      FieldName = 'Topic'
    end
    object DictScore: TSmallintField
      FieldName = 'Score'
    end
    object DictUsersel: TBooleanField
      FieldName = 'Usersel'
      DisplayValues = ' '
    end
    object DictRelevation: TIntegerField
      FieldName = 'Relevation'
    end
    object DictSpot: TBooleanField
      FieldName = 'Spot'
    end
    object DictTopicName: TStringField
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'TopicName'
      LookupDataSet = top
      LookupKeyFields = 'id'
      LookupResultField = 'Name'
      KeyFields = 'Topic'
      Size = 60
      Lookup = True
    end
    object DictDateRec: TDateField
      FieldName = 'DateRec'
    end
    object DictPhrase: TBooleanField
      FieldName = 'Phrase'
    end
  end
  object dstop: TDataSource
    DataSet = top
    Left = 408
    Top = 88
  end
  object dsdict: TDataSource
    DataSet = Dict
    Left = 456
    Top = 88
  end
  object topic: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select topic.id, topic.name, count(dict.topic)'
      'from topic left join dict'
      'on dict.topic=topic.id'
      'group by id, name')
    Left = 360
    Top = 176
    object topicid: TIntegerField
      FieldName = 'id'
    end
    object topiccountdicttopic: TIntegerField
      FieldName = 'count(dict.topic)'
    end
    object topicName: TWideStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object topicquery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'update Dict set usersel=true where')
    Left = 304
    Top = 160
  end
  object dropch: TADOCommand
    CommandText = 'UPDATE Dict'#13#10'SET usersel=false'#13#10#13#10
    Connection = ADOConnection
    Parameters = <>
    Left = 80
    Top = 304
  end
  object selectsel: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Dict where usersel=1')
    Left = 240
    Top = 304
  end
  object potential: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 'select sum(Score) as sumScore from Dict where usersel=true'
    Parameters = <>
    Left = 192
    Top = 96
  end
  object addball: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 296
    Top = 256
  end
  object droprate: TADOCommand
    Connection = ADOConnection
    Parameters = <>
    Left = 128
    Top = 304
  end
  object synch: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 32
    Top = 88
  end
  object DeepSearch: TADOCommand
    Connection = ADOConnection
    Parameters = <>
    Left = 88
    Top = 176
  end
  object dropspot: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'update Dict set spot=false')
    Left = 192
    Top = 184
  end
end
