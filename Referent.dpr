program Referent;

uses
  Vcl.Forms,
  MainFormUnit in 'MainFormUnit.pas' {MainForm},
  DBModelUnit in 'DBModelUnit.pas' {DBModel: TDataModule},
  EventFormUnit in 'EventFormUnit.pas' {EventEditForm},
  HistFormUnit in 'HistFormUnit.pas' {HistForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDBModel, DBModel);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TEventEditForm, EventEditForm);
  Application.CreateForm(THistForm, HistForm);
  Application.Run;
end.
