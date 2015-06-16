unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Data.DB, ComObj;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Label1: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBGrid1: TDBGrid;
    N13: TMenuItem;
    SaveDialog1: TSaveDialog;
    N1: TMenuItem;

    procedure N10Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure N13Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses DBModelUnit, EventFormUnit, HistFormUnit;

procedure TMainForm.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);

const
  CtrlState: array[Boolean] of integer =
        (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED) ;
begin
  if (Column.Field.DataType=ftBoolean) then
  begin
    DBGrid1.Canvas.FillRect(Rect) ;
    if VarIsNull(Column.Field.Value) then
      DrawFrameControl(DBGrid1.Canvas.Handle,Rect,
             DFC_BUTTON, DFCS_BUTTONCHECK or DFCS_INACTIVE)
    else
      DrawFrameControl(DBGrid1.Canvas.Handle,Rect, DFC_BUTTON,
             CtrlState[Column.Field.AsBoolean]) ;
  end;

end;

procedure TMainForm.DBGrid1CellClick(Column: TColumn);
begin
    if (Column.Field.DataType=ftBoolean) then
  begin
    Column.Grid.DataSource.DataSet.Edit;
    Column.Field.Value:= not Column.Field.AsBoolean;
    Column.Grid.DataSource.DataSet.Post;

  end;
end;


//���������� ��� ����� �� �������� �������
procedure TMainForm.DBGrid1TitleClick(Column: TColumn);
begin
  if Column.Title.Caption = '��������' then
    DBModel.SortByCaption;
  if Column.Title.Caption = '���� ������' then
    DBModel.SortByDateStart;
  if Column.Title.Caption = '���� ���������' then
    DBModel.SortByDateEnd;
  if Column.Title.Caption = '���' then
    DBModel.SortByType;
  if Column.Title.Caption = '�����������' then
    DBModel.SortByOrganiztion;

end;

//===========================================================

procedure TMainForm.DBGrid1DblClick(Sender: TObject);
begin
  EventEditForm.ShowModal;
  DBModel.Refresh;
end;

procedure TMainForm.N10Click(Sender: TObject);
begin
  ShowMessage('�����������: ����������� �������. E-mail: sokolovskynik@gmail.com; ����: samodelkin.biz. 2014');
end;

procedure TMainForm.N13Click(Sender: TObject);
begin
  HistForm.ShowModal;
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
  MainForm.Close;
end;

//�������� �������
procedure TMainForm.N6Click(Sender: TObject);
begin
  DBModel.ADQueryActualList.Insert;
  EventEditForm.AddDateEdit.Text := DateToStr(Date);
  EventEditForm.ShowModal;
  DBModel.Refresh;
end;

//������������� �������
procedure TMainForm.N7Click(Sender: TObject);
begin
  EventEditForm.ShowModal;
  DBModel.Refresh;
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
  if MessageDlg('�� ������������� ������ ������� �������: "' + DBModel.GetCaptionEvent+ '"?', mtConfirmation, mbYesNo, 0) = idYes then
    DBmodel.ADQueryActualList.Delete;
end;

//������� �������
procedure TMainForm.N9Click(Sender: TObject);
var
  Outline: TStringList;
begin

  outLine := TStringList.Create;

  try
    //������ ����������� ���� �����
    outLine.Add('<h1>��������� �����������</h1>');
    if DBmodel.GetCurrentConference then
    begin
      outLine.Add('<h1>�����������</h1>');
      DBModel.CreateReport(OutLine);
    end;

    //������ ������� ������ ���� �����
    if DBmodel.GetCurrentRoundTab then
    begin
      outLine.Add('<h1>������� �����</h1>');
      DBModel.CreateReport(OutLine);
    end;

    //������ ��������� ���� �����
    if DBmodel.GetCurrentSeminar then
    begin
      outLine.Add('<h1>��������</h1>');
      DBModel.CreateReport(OutLine);
    end;

    //������ ����������� ��������� �����
    outLine.Add('<h1>����������� � ��������� ������</h1>');
    if DBmodel.GetNextConference then
    begin
      outLine.Add('<h1>�����������</h1>');
      DBModel.CreateReport(OutLine);
    end;

    //������ ������� ������ ��������� �����
    if DBmodel.GetNextRoundTab then
    begin
      outLine.Add('<h1>������� �����</h1>');
      DBModel.CreateReport(OutLine);
    end;

    //������ ��������� ��������� �����
    if DBmodel.GetNextSeminar then
    begin
      outLine.Add('<h1>��������</h1>');
      DBModel.CreateReport(OutLine);
    end;

    //������ ����������� ����������
    outLine.Add('<h1>������� �����������</h1>');
    if DBmodel.GetFarConference then
    begin
      outLine.Add('<h1>�����������</h1>');
      DBModel.CreateReport(OutLine);
    end;

    //������ ������� ������ ����������
    if DBmodel.GetFarRoundTab then
    begin
      outLine.Add('<h1>������� �����</h1>');
      DBModel.CreateReport(OutLine);
    end;

    //������ ��������� ����������
    if DBmodel.GetFarSeminar then
    begin
      outLine.Add('<h1>��������</h1>');
      DBModel.CreateReport(OutLine);
    end;

    outLine.SaveToFile('Report ' + DateToStr(now) + '.html', TEncoding.Unicode);
  except
    ShowMessage('������ �������� ��������');
    exit;
  end;

  ShowMessage('���� �������� � �������� � ����������.');
end;

end.
