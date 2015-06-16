unit DBModelUnit;

interface

uses
  System.SysUtils, System.Classes, uADStanIntf, uADStanOption, uADStanError,
  uADGUIxIntf, uADPhysIntf, uADStanDef, uADStanPool, uADStanAsync,
  uADPhysManager, uADStanParam, uADDatSManager, uADDAptIntf, uADDAptManager,
  uADStanExprFuncs, uADGUIxFormsWait, uADCompGUIx, uADPhysSQLite, Data.DB,
  uADCompDataSet, uADCompClient, vcl.ComCtrls, Dialogs, DateUtils;

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
    ADQueryReport: TADQuery;
    ADQueryActualListtime_event_start: TStringField;
    ADQueryActualListtime_event_end: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure Refresh;
    procedure Save;
    function GetCaptionEvent: string;

    function GetCurrentConference: boolean;
    function GetCurrentRoundTab: boolean;
    function GetCurrentSeminar: boolean;
    function GetNextConference: boolean;
    function GetNextRoundTab: boolean;
    function GetNextSeminar: boolean;
    function GetFarConference: boolean;
    function GetFarRoundTab: boolean;
    function GetFarSeminar: boolean;

    procedure CreateReport(st: TStringList);

    procedure SortByDateStart;
    procedure SortByDateEnd;
    procedure SortByCaption;
    procedure SortByType;
    procedure SortByOrganiztion;
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
    ShowMessage('�� ������� ������������ � ���� ������.');
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

function GetRigthDate(dt: TdateTime):string;
var
  y, m, d: word;
begin
  result:= '';

  m := MonthOf(dt);              //������������ ����
  y := yearof(dt);
  d := Dayof(dt);
  if m <10 then
    result := IntToStr(y) + '-0' + IntToStr(m)
  else
    result := IntToStr(y) + '-' + IntToStr(m);

  if d<10 then
     result := result + '-0' + IntToStr(d)
  else
     result := result + '-' + IntToStr(d);

end;

//==========================
//��������� ������������ ����������� ����� ������
function TDBModel.GetCurrentConference:boolean;
var
  y, m, d: word;
  dt: TDateTime;
  str : string;
  FinDate: string;
begin

  m := MonthOf(now);              //�������� ������� �����
  y := yearof(now);
  dt := EndOfAMonth(y,m);         //�������� ��������� ���� �������� ������

  FinDate := GetRigthDate(dt);    //��������� � ������ ������

  with ADQueryReport do
  begin
    close;
    sql.Clear;

    str := 'select * from article_tab '+
     'WHERE ('+
     '(date_event_start >= date(' + QuotedStr('now') + '))'+  //������� ������� ������ �������� ������
       ' OR (date_event_end >= date(' + QuotedStr('now') + '))'+    //��� ��� �� ����������� � ���� �������
       ')' +
     ' AND (date_event_start <= ' + QuotedSTR(FinDate)+ ')'+  //�� �� ������� ���������� �����
     ' AND status = 1 ' +                           //������� ������ � ��������
     ' AND type_event_id = '+ QuotedStr('�����������') + //� �������� ��������� �����
     ' ORDER BY date_event_start'; //����������� �� ����, � ����� �� ����
    sql.Add(str);
    open;
  end;
  result := boolean(ADQueryReport.RecordCount);
end;

function TDBModel.GetCurrentRoundTab:boolean;
var
  y, m, d: word;
  dt: TDateTime;
  str : string;
  FinDate: string;
begin

  m := MonthOf(now);              //�������� ������� �����
  y := yearof(now);
  dt := EndOfAMonth(y,m);         //�������� ��������� ���� �������� ������

  FinDate := GetRigthDate(dt);    //��������� � ������ ������

  with ADQueryReport do
  begin
    close;
    sql.Clear;

    str := 'select * from article_tab '+
     'WHERE ('+
     '(date_event_start >= date(' + QuotedStr('now') + '))'+  //������� ������� ������ �������� ������
       ' OR (date_event_end >= date(' + QuotedStr('now') + '))'+    //��� ��� �� ����������� � ���� �������
       ')' +
     ' AND (date_event_start <= ' + QuotedSTR(FinDate)+ ')'+  //�� �� ������� ���������� �����
     ' AND status = 1 ' +                           //������� ������ � ��������
     ' AND type_event_id = '+ QuotedStr('������� ����') + //� �������� ��������� �����
     ' ORDER BY date_event_start'; //����������� �� ����, � ����� �� ����
    sql.Add(str);
    open;
  end;
  result := boolean(ADQueryReport.RecordCount);
end;

function TDBModel.GetCurrentSeminar:boolean;
var
  y, m, d: word;
  dt: TDateTime;
  str : string;
  FinDate: string;
begin

  m := MonthOf(now);              //�������� ������� �����
  y := yearof(now);
  dt := EndOfAMonth(y,m);         //�������� ��������� ���� �������� ������

  FinDate := GetRigthDate(dt);    //��������� � ������ ������

  with ADQueryReport do
  begin
    close;
    sql.Clear;

    str := 'select * from article_tab '+
     'WHERE ('+
     '(date_event_start >= date(' + QuotedStr('now') + '))'+  //������� ������� ������ �������� ������
       ' OR (date_event_end >= date(' + QuotedStr('now') + '))'+    //��� ��� �� ����������� � ���� �������
       ')' +
     ' AND (date_event_start <= ' + QuotedSTR(FinDate)+ ')'+  //�� �� ������� ���������� �����
     ' AND status = 1 ' +                           //������� ������ � ��������
     ' AND type_event_id = '+ QuotedStr('�������') + //� �������� ��������� �����
     ' ORDER BY date_event_start'; //����������� �� ����, � ����� �� ����
    sql.Add(str);
    open;
  end;
  result := boolean(ADQueryReport.RecordCount);
end;


//==========================
//��������� ������������ ����������� ���������� ������
function TDBModel.GetNextConference:boolean;
var
  y, m, d: word;
  dt: TDateTime;
  str : string;
  StartDate, FinDate: string;
begin

  dt := incMonth(now);            //����������� ����� �� 1
  m := MonthOf(dt);               //������������
  y := yearof(dt);

  dt := StartOfAMonth(y,m);         //�������� ������ ���� ��������� ������
  StartDate := GetRigthDate(dt);    //��������� � ������ ������

  dt := EndOfAMonth(y,m);         //�������� ��������� ���� ��������� ������
  FinDate := GetRigthDate(dt);    //��������� � ������ ������

  with ADQueryReport do
  begin
    close;
    sql.Clear;

    str := 'select * from article_tab '+
     'WHERE ('+
     '(date_event_start >= ' + QuotedStr(StartDate) + ')'+  //������� ������� ������ �������� ������
       ' OR (date_event_end >= ' + QuotedStr(StartDate) + ')'+    //��� ��� �� ����������� � ���� �������
       ')' +
     ' AND (date_event_start <= ' + QuotedStr(FinDate)+ ')'+  //�� �� ������� ���������� �����
     ' AND status = 1 ' +                           //������� ������ � ��������
     ' AND type_event_id = '+ QuotedStr('�����������') + //� �������� ��������� �����
     ' ORDER BY date_event_start'; //����������� �� ����, � ����� �� ����
    sql.Add(str);
    open;
  end;
  result := boolean(ADQueryReport.RecordCount);
end;

function TDBModel.GetNextRoundTab:boolean;
var
  y, m, d: word;
  dt: TDateTime;
  str : string;
  StartDate, FinDate: string;
begin

  dt := incMonth(now);            //����������� ����� �� 1
  m := MonthOf(dt);               //������������
  y := yearof(dt);

  dt := StartOfAMonth(y,m);         //�������� ������ ���� ��������� ������
  StartDate := GetRigthDate(dt);    //��������� � ������ ������

  dt := EndOfAMonth(y,m);         //�������� ��������� ���� ��������� ������
  FinDate := GetRigthDate(dt);    //��������� � ������ ������

  with ADQueryReport do
  begin
    close;
    sql.Clear;

    str := 'select * from article_tab '+
     'WHERE ('+
     '(date_event_start >= ' + QuotedStr(StartDate) + ')'+  //������� ������� ������ �������� ������
       ' OR (date_event_end >= ' + QuotedStr(StartDate) + ')'+    //��� ��� �� ����������� � ���� �������
       ')' +
     ' AND (date_event_start <= ' + QuotedStr(FinDate)+ ')'+  //�� �� ������� ���������� �����
     ' AND status = 1 ' +                           //������� ������ � ��������
     ' AND type_event_id = '+ QuotedStr('������� ����') + //� �������� ��������� �����
     ' ORDER BY date_event_start'; //����������� �� ����, � ����� �� ����
    sql.Add(str);
    open;
  end;
  result := boolean(ADQueryReport.RecordCount);
end;

function TDBModel.GetNextSeminar:boolean;
var
  y, m, d: word;
  dt: TDateTime;
  str : string;
  StartDate, FinDate: string;
begin

  dt := incMonth(now);            //����������� ����� �� 1
  m := MonthOf(dt);               //������������
  y := yearof(dt);

  dt := StartOfAMonth(y,m);         //�������� ������ ���� ��������� ������
  StartDate := GetRigthDate(dt);    //��������� � ������ ������

  dt := EndOfAMonth(y,m);         //�������� ��������� ���� ��������� ������
  FinDate := GetRigthDate(dt);    //��������� � ������ ������

  with ADQueryReport do
  begin
    close;
    sql.Clear;

    str := 'select * from article_tab '+
     'WHERE ('+
     '(date_event_start >= ' + QuotedStr(StartDate) + ')'+  //������� ������� ������ �������� ������
       ' OR (date_event_end >= ' + QuotedStr(StartDate) + ')'+    //��� ��� �� ����������� � ���� �������
       ')' +
     ' AND (date_event_start <= ' + QuotedStr(FinDate)+ ')'+  //�� �� ������� ���������� �����
     ' AND status = 1 ' +                           //������� ������ � ��������
     ' AND type_event_id = '+ QuotedStr('�������') + //� �������� ��������� �����
     ' ORDER BY date_event_start'; //����������� �� ����, � ����� �� ����
    sql.Add(str);
    open;
  end;
  result := boolean(ADQueryReport.RecordCount);
end;

//=========================
//����� ������� ������ ���� �������
function TDBModel.GetFarConference:boolean;
var
  y, m, d: word;
  dt: TDateTime;
  str : string;
  StartDate: string;
begin

  dt := incMonth(now,2);            //����������� ����� �� 1
  m := MonthOf(dt);               //������������
  y := yearof(dt);

  dt := StartOfAMonth(y,m);         //�������� ������ ���� ��������� ������
  StartDate := GetRigthDate(dt);    //��������� � ������ ������

  with ADQueryReport do
  begin
    close;
    sql.Clear;

    str := 'select * from article_tab '+
     'WHERE ('+
     '(date_event_start >= ' + QuotedStr(StartDate) + ')'+  //������� ������� ������ �������� ������
       ' OR (date_event_end >= ' + QuotedStr(StartDate) + ')'+    //��� ��� �� ����������� � ���� �������
       ')' +
     ' AND status = 1 ' +                           //������� ������ � ��������
     ' AND type_event_id = '+ QuotedStr('�����������') + //� �������� ��������� �����
     ' ORDER BY date_event_start'; //����������� �� ����, � ����� �� ����
    sql.Add(str);
    open;
  end;
  result := boolean(ADQueryReport.RecordCount);
end;

function TDBModel.GetFarRoundTab:boolean;
var
  y, m, d: word;
  dt: TDateTime;
  str : string;
  StartDate: string;
begin

  dt := incMonth(now,2);            //����������� ����� �� 1
  m := MonthOf(dt);               //������������
  y := yearof(dt);

  dt := StartOfAMonth(y,m);         //�������� ������ ���� ��������� ������
  StartDate := GetRigthDate(dt);    //��������� � ������ ������

  with ADQueryReport do
  begin
    close;
    sql.Clear;

    str := 'select * from article_tab '+
     'WHERE ('+
     '(date_event_start >= ' + QuotedStr(StartDate) + ')'+  //������� ������� ������ �������� ������
       ' OR (date_event_end >= ' + QuotedStr(StartDate) + ')'+    //��� ��� �� ����������� � ���� �������
       ')' +
     ' AND status = 1 ' +                           //������� ������ � ��������
     ' AND type_event_id = '+ QuotedStr('������� ����') + //� �������� ��������� �����
     ' ORDER BY date_event_start'; //����������� �� ����, � ����� �� ����
    sql.Add(str);
    open;
  end;
  result := boolean(ADQueryReport.RecordCount);
end;

function TDBModel.GetFarSeminar:boolean;
var
  y, m, d: word;
  dt: TDateTime;
  str : string;
  StartDate: string;
begin

  dt := incMonth(now,2);            //����������� ����� �� 1
  m := MonthOf(dt);               //������������
  y := yearof(dt);

  dt := StartOfAMonth(y,m);         //�������� ������ ���� ��������� ������
  StartDate := GetRigthDate(dt);    //��������� � ������ ������

  with ADQueryReport do
  begin
    close;
    sql.Clear;

    str := 'select * from article_tab '+
     'WHERE ('+
     '(date_event_start >= ' + QuotedStr(StartDate) + ')'+  //������� ������� ������ �������� ������
       ' OR (date_event_end >= ' + QuotedStr(StartDate) + ')'+    //��� ��� �� ����������� � ���� �������
       ')' +
     ' AND status = 1 ' +                           //������� ������ � ��������
     ' AND type_event_id = '+ QuotedStr('�������') + //� �������� ��������� �����
     ' ORDER BY date_event_start'; //����������� �� ����, � ����� �� ����
    sql.Add(str);
    open;
  end;
  result := boolean(ADQueryReport.RecordCount);
end;


//===========================
//�������� ������

procedure TDBModel.CreateReport(st: TStringList);
var
  str, s: string;
begin

  while not (ADQueryReport.Eof) do
  begin
    st.Add('<h2>'+DBModel.ADQueryReport.FieldByName('caption').AsString + '</h2>');

    if DBModel.ADQueryReport.FieldByName('date_event_start').AsString =
       DBModel.ADQueryReport.FieldByName('date_event_end').AsString
       then
        begin
          str := '<p><strong>' + DBModel.ADQueryReport.FieldByName('date_event_start').AsString;
          if DBModel.ADQueryReport.FieldByName('time_event_start').AsString <> '' then
           str := str + ' c ' + DBModel.ADQueryReport.FieldByName('time_event_start').AsString;

          if DBModel.ADQueryReport.FieldByName('time_event_end').AsString <> '' then
           str := str + ' �� ' + DBModel.ADQueryReport.FieldByName('time_event_end').AsString;

          str := str + '</strong>';
          st.Add(str);
        end
       else
       begin
        str := '<p><strong>' + DBModel.ADQueryReport.FieldByName('date_event_start').AsString;

        if DBModel.ADQueryReport.FieldByName('time_event_start').AsString <> '' then
           str := str + ' c ' + DBModel.ADQueryReport.FieldByName('time_event_start').AsString;

        str := str + ' - ';   
          
        str := str + DBModel.ADQueryReport.FieldByName('date_event_end').AsString;
        if DBModel.ADQueryReport.FieldByName('time_event_end').AsString <> '' then
           str := str + ' �� ' + DBModel.ADQueryReport.FieldByName('time_event_end').AsString;      
           
        str := str + '</strong>';
        st.Add(str);
       end;

    st.Add(DBModel.ADQueryReport.FieldByName('description').AsString);
    st.Add('</p>');

    str := DBModel.ADQueryReport.FieldByName('lang').AsString;
    if str <> '' then st.Add('<p><strong>����:</strong> ' + str + '</p>');

    str := DBModel.ADQueryReport.FieldByName('local').AsString;
    if str<>'' then st.Add('<p><strong>����� ����������:</strong> ' + str + '</p>');

    str :=  DBModel.ADQueryReport.FieldByName('contact').AsString;
    if str <> '' then st.Add('<p><strong>��������:</strong> ' + str + ' </p>');

    str :=  DBModel.ADQueryReport.FieldByName('registration').AsString;
    if str <> '' then st.Add('<p><strong>�����������:</strong> ' +str + '</p>');

    str :=  DBModel.ADQueryReport.FieldByName('link_to_site').AsString;
    if str <> '' then st.Add('<p><strong>��������� ����������:</strong> <a href=' + QuotedStr(str) + '>' + str + '</a></p>');

    str :=  DBModel.ADQueryReport.FieldByName('publication').AsString;
    if str <> '' then st.Add('<p><strong> ����������: </strong> ' + str + '</p>');

    str :=  DBModel.ADQueryReport.FieldByName('organizator').AsString;
    if str <> '' then st.Add('<p><strong> �����������: </strong>' + str + '</p>');
    st.Add('<br>');

    ADQueryReport.Next;
  end;
end;


//����������

procedure TDBModel.SortByCaption;
begin
  with ADQueryActualList do
  begin
    close;
    sql.Clear;
    sql.Add('select * from article_tab where (date_event_start >= date(' +
      QuotedStr('now')+ ')) OR (date_event_end >= date(' + QuotedStr('now')+ ')) order by caption');
    open;
  end;
end;

procedure TDBModel.SortByDateEnd;
begin
  with ADQueryActualList do
  begin
    close;
    sql.Clear;
    sql.Add('select * from article_tab where (date_event_start >= date(' +
      QuotedStr('now')+ ')) OR (date_event_end >= date(' + QuotedStr('now')+ ')) order by date_event_end');
    open;
  end;
end;

procedure TDBModel.SortByDateStart;
begin
  with ADQueryActualList do
  begin
    close;
    sql.Clear;
    sql.Add('select * from article_tab where (date_event_start >= date(' +
      QuotedStr('now')+ ')) OR (date_event_end >= date(' + QuotedStr('now')+ ')) order by date_event_start');
    open;
  end;
end;

procedure TDBModel.SortByOrganiztion;
begin
  with ADQueryActualList do
  begin
    close;
    sql.Clear;
    sql.Add('select * from article_tab where (date_event_start >= date(' +
      QuotedStr('now')+ ')) OR (date_event_end >= date(' + QuotedStr('now')+ ')) order by organizator');
    open;
  end;
end;

procedure TDBModel.SortByType;
begin
  with ADQueryActualList do
  begin
    close;
    sql.Clear;
    sql.Add('select * from article_tab where (date_event_start >= date(' +
      QuotedStr('now')+ ')) OR (date_event_end >= date(' + QuotedStr('now')+ ')) order by type_event_id');
    open;
  end;
end;


end.
