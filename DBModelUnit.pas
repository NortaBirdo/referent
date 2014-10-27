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
    ADQueryArticle: TADQuery;
    DataSourceArticle: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

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

  ADQueryArticle.Active := true;

  except
    ShowMessage('Не удалось подключиться к базе данных.');
    exit;
  end;


end;


end.
