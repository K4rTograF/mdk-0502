unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
  private

  public

  end;

type
  myForm = record  //запись
    Left: integer;  //левая граница формы
    Top: integer;  //верхняя
    Height: integer;  //высота формы
    Width: integer;  //ширина
    Caption: string[100];  //заголовок
    Checked: boolean;  //состояние флажка CheckBox1
    wsMax: boolean;  //окно развернуто?
  end; //record

var
  Form1: TForm1;
  MyF: myForm;  //наша переменная-запись


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if Edit1.Text <> '' then Form1.Caption:= Edit1.Text;
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
var
  f: file of myForm;  //типизированный файл для сохранения данных
begin
  //сначала настроим переменную-запись:
  //не сохраняем размеры и положение, если окно wsMaximized:
  if not (Form1.WindowState = wsMaximized) then begin
    MyF.Left:= Form1.Left;
    MyF.Top:= Form1.Top;
    MyF.Height:= Form1.Height;
    MyF.Width:= Form1.Width;
    MyF.wsMax:= False;
  end
  else MyF.wsMax:= True;
  //остальные настройки:
  MyF.Caption:= Form1.Caption;
  MyF.Checked:= CheckBox1.Checked;
  //теперь создаем или перезаписываем файл настроек:
  try
    AssignFile(f, 'MyProg.dat');
    Rewrite(f);
    Write(f, MyF); //записываем в файл данные из записи
  finally
    CloseFile(f);
  end;
  if not (Form1.WindowState = wsMaximized) then begin
    MyF.Left:= Form1.Left;
    MyF.Top:= Form1.Top;
    MyF.Height:= Form1.Height;
    MyF.Width:= Form1.Width;
    MyF.wsMax:= False;
  end
  else MyF.wsMax:= True;
  MyF.Caption:= Form1.Caption;
  MyF.Checked:= CheckBox1.Checked;
end;

end.

