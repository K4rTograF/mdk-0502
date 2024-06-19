unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    CountMounth: TEdit;
    d: TStaticText;
    Days1: TLabel;
    Days2: TLabel;
    Edit1: TEdit;
    Procents: TEdit;
    Edit3: TEdit;
    Days: TLabel;
    Memo1: TMemo;
    StaticText4: TStaticText;
    Sum: TEdit;
    TypeProcent: TComboBox;
    procedure Button1Click(Sender: TObject);
    procedure CountMounthChange(Sender: TObject);
    procedure DaysClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure ProcentsChange(Sender: TObject);
    procedure SumChange(Sender: TObject);
    procedure TypeProcentChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  ProcentType: String;
  Months: Integer;
  MounthProcent: Integer;
  DefaultSum: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.DaysClick(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  addProcent: Real;
begin
  if Months = 0 then begin
    ShowMessage('Введите кол-во месяцев');
    Exit;
  end;
  if MounthProcent = 0 then begin
    ShowMessage('Введите пероцент за месяц');
    Exit;
  end;
  if DefaultSum = 0 then begin
    ShowMessage('Введите начальную сумму');
    Exit;
  end;

  case ProcentType of
   'Простые проценты': begin
     addProcent := DefaultSum * (1+((MounthProcent * Months)/100));
   end;
   'Сложные проценты': begin
     addProcent := DefaultSum * Math.Power((1+(MounthProcent/100)),Months);
   end;
   else begin
     ShowMessage('Такого типа процентов не сущ.');
     Exit;
   end;
  end;
  Memo1.Lines.Clear();
  Memo1.Lines.Add('Тип процетнов ' + ProcentType);
  Memo1.Lines.Add('Коо-во месяцев ' + IntToStr(Months));
  Memo1.Lines.Add('Процент за месяц ' + IntToStr(MounthProcent));
  Memo1.Lines.Add('Начальная сумма ' + IntToStr(DefaultSum));
  Memo1.Lines.Add('Итоговая сумма ' + FloatToStr(addProcent));
end;

procedure TForm1.CountMounthChange(Sender: TObject);
begin
  if CountMounth.Text = '' then CountMounth.Text := '0';
  Months := StrToInt(CountMounth.Text);
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.ProcentsChange(Sender: TObject);
begin
  if Procents.Text = '' then Procents.Text := '0';
  MounthProcent := StrToInt(Procents.Text);
end;

procedure TForm1.SumChange(Sender: TObject);
begin
  if Sum.Text = '' then Sum.Text := '0';
  DefaultSum := StrToInt(Sum.Text);
end;

procedure TForm1.TypeProcentChange(Sender: TObject);
begin
  ProcentType := TypeProcent.Text;
end;

end.

