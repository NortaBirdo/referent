unit MainFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Data.DB, ComObj;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
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
    procedure N4Click(Sender: TObject);
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

procedure TMainForm.N4Click(Sender: TObject);
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
const
  wdAlignParagraphCenter = 1;
  wdAlignParagraphLeft = 0;
  wdAlignParagraphRight = 2;
  wdLineStyleSingle = 1;
var
  wdApp, wdDoc, wdRng, wdTable : Variant;
  i, j, Res : Integer;
  D : TDateTime;
  Bm : TBookMark;

begin

  try
    wdApp := CreateOleObject('Word.Application');
  except
    MessageBox(0, '�� ������� ��������� MS Word. �������� ��������.'
      ,'��������!', MB_OK + MB_ICONERROR + MB_APPLMODAL);
    Exit;
  end;

  wdApp.Visible := false;
  wdDoc := wdApp.Documents.Add;

  try
    wdRng := wdDoc.Content; //��������, ������������ �� ���������� ���������.

    //�������� 1. ��������� ������.

    wdRng.InsertAfter('��������� �����������'#13#10);
    wdRng.ParagraphFormat.Alignment := wdAlignParagraphLeft;
    wdRng.Font.Name := 'Calibri Light (���������)';
    wdRng.Font.Color := rgb(79, 129, 189);
 //   wdRng.Font.Bold := True;
    wdRng.Font.Size := 16;

   { //�������� 2. ����� ��������.

    //��������� �������� ������ ��������� ��������������� �� ������� ����������.
    wdRng.Start := wdRng.End;
    wdRng.InsertAfter(#13#10);
    D := Now;
    wdRng.InsertAfter('����: ' + FormatDateTime('dd.mm.yyyy', D) + #13#10);
    wdRng.InsertAfter('�����: ' + FormatDateTime('hh:nn:ss:zzz', D) + #13#10);
    //����� ���������� ���������.
    wdRng.ParagraphFormat.Reset;
    //������������ �� ������ ����.
    wdRng.ParagraphFormat.Alignment := wdAlignParagraphLeft;
    //������ ����� �� 2 ����������. ������ ������� ������� � ������������
    //�������� - � �������. 1 ����� = 0.035 ����������.
    //��� ������ � ���� LeftIndent, ������ ������������� �� ������ ���� �� ��������.
    //wdRng.ParagraphFormat.LeftIndent := 2 / 0.035;
    //��������� ������.
    wdRng.Font.Reset; //����� ���������� ������.
    wdRng.Font.Size := 12;
    wdRng.Font.Bold := True;

    //�������� 3. ��������� �������.

    wdRng.Start := wdRng.End;
    wdRng.InsertAfter(#13#10);
    wdRng.InsertAfter('������� 1. ������ � ��������� �����.'#13#10);
    wdRng.ParagraphFormat.Reset;
    wdRng.Font.Reset;
    wdRng.Font.Size := 12;
    wdRng.Font.Bold := False;

    //�������� 4. �������.

    if not Query1.Active then Query1.Open;

    wdRng.Start := wdRng.End;
    //��������� ������� MS Word. ���� ������ ������� � ����� ��������.
    wdTable := wdDoc.Tables.Add(wdRng.Characters.Last, 2, Query1.Fields.Count);
    //��������� ����� �������.
    wdTable.Borders.InsideLineStyle := wdLineStyleSingle;
    wdTable.Borders.OutsideLineStyle := wdLineStyleSingle;
    //����� ���������� ���������.
    wdRng.ParagraphFormat.Reset;
    //������������ ���� ������� - �� ������ ����.
    wdRng.ParagraphFormat.Alignment := wdAlignParagraphLeft;
    //���������� �����.
    wdRng := wdTable.Rows.Item(1).Range; //�������� ������ ������.
    wdRng.ParagraphFormat.Alignment := wdAlignParagraphCenter;
    wdRng.Font.Size := 10;
    wdRng.Font.Bold := True;
    //���������� ������ ������ ������ - ��� ������ ������ � �������.
    //��� ���������� ��������� �����, �� ���������� ����� ������������ � ���� ������.
    wdRng := wdTable.Rows.Item(2).Range; //�������� ������ ������.
    wdRng.ParagraphFormat.Alignment := wdAlignParagraphLeft;
    wdRng.Font.Size := 10;
    wdRng.Font.Bold := False;

    //���������� ����� �������.
    for i := 0 to Query1.Fields.Count - 1 do
      wdTable.Cell(1, i + 1).Range.Text := Query1.Fields[i].DisplayName;
    //���������� ������ �������.
    Query1.DisableControls;
    Bm := Query1.GetBookMark;
    Query1.First;
    i := 1; //������� ������ � ������� MS Word.
    while not Query1.Eof do begin
      Inc(i);
      //���� ���������, ��������� ����� ������ � ����� �������.
      if i > 2 then wdTable.Rows.Add;
      //���������� ������ � ������ ������� MS Word.
      for j := 0 to Query1.Fields.Count - 1 do
        wdTable.Cell(i, j + 1).Range.Text := Query1.Fields[j].AsString;
      Query1.Next;
    end;
    Query1.GotoBookMark(Bm);
    Query1.EnableControls;

  finally
    //��������� ����������� ���� MS Word. � ������, ���� wdApp.Visible := True.
    wdApp.ScreenUpdating := True;
  end;

  wdApp.DisplayAlerts := False; //��������� ����� ������ ��������������.
  try
    wdDoc.SaveAs(FileName:=Sd.FileName); //������ ��������� � ����.
  finally
    wdApp.DisplayAlerts := True; //�������� ����� ������ ��������������.
  end;

    }

  wdApp.Visible := True;
  wdApp.Activate;
  finally

  end;

end;

end.
