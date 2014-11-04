unit DBModelUnit;

interface

uses
  System.SysUtils, System.Classes, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager,
  uADStanExprFuncs, uADGUIxFormsWait, uADCompGUIx, uADPhysSQLite, Data.DB,
  uADCompDataSet, uADCompClient, vcl.ComCtrls, Dialogs;

type
  TDBModel = class(TDataModule)
    ADConnection1: TADConnection;
    ADQuerySQL: TADQuery;
    ADPhysSQLiteDriverLink1: TADPhysSQLiteDriverLink;
    ADGUIxWaitCursor1: TADGUIxWaitCursor;
    ADQueryHist: TADQuery;
    DataSourceHist: TDataSource;
    ADQueryActualList: TADQuery;
    DataSourceActualList: TDataSource;
    ADQueryActualListid: TADAutoIncField;
    ADQueryActualListdate_event_start: TDateField;
    ADQueryActualListdate_event_end: TDateField;
    ADQueryActualListdate_add: TDateField;
    ADQueryActualListcaption: TStringField;
    ADQueryActualListdescription: TMemoField;
    ADQueryActualListlocal: TMemoField;
    ADQueryActualListcontact: TStringField;
    ADQueryActualListregistration: TStringField;
    ADQueryActualListlink_to_site: TStringField;
    ADQueryActualListlang: TStringField;
    ADQueryActualListpublication: TStringField;
    ADQueryActualListorganizator: TStringField;
    ADQueryActualListstatus: TBooleanField;
    ADQueryActualListtype_event_id: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure Refresh;
    procedure Save;
    function GetCaptionEvent: string;
  end;

var
  DBModel: TDBModel;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDBModel.DataModuleCreate(Sender: TObject);
var
  path: string;
begin
  GetDir(0, path);

  ADPhysSQLiteDriverLink1.VendorHome := path;
  ADPhysSQLiteDriverLink1.VendorLib := 'sqlite3.dll';

  try
  with ADConnection1 do
  begin
    Connected := false;
    Params.Clear;
    Params.Add('DriverID=SQLite');
    Params.add('Database=' + path + '\article.db');
    Connected := true;
  end;

  ADQueryActualList.Active := true;
  ADQueryHist.Active := true;

  except
    ShowMessage('Не удалось подключиться к базе данных.');
    exit;
  end;
end;


function TDBModel.GetCaptionEvent: string;
begin
  result := ADQueryActualList.FieldByName('caption').AsString;
end;

procedure TDBModel.Refresh;
begin
  ADQueryActualList.Refresh;
  ADQueryHist.Refresh;
end;

procedure TDBModel.Save;
begin
  if ADQueryActualList.Modified then
    ADQueryActualList.post;

end;

end.
