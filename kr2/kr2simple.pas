program Spis;
uses crt;

type 
  Pint = ^ListElem;
  ListElem = record
    value: integer;
    next: Pint;
    count:integer;
  end;


var 
  Head,Sp,Spp: Pint;
  F: boolean;
  maxItems,itemCount,DataType:integer;

procedure NtCreat(var Hed: Pint);
var 
  C, B: Pint;
begin
  New(C);
  Write('Введите значение: ');
  readln(C^.value);
  if hed = nil then
  begin
    hed := c;
    hed^.next := Hed;  
  end
  else
  begin
    B := hed;
    while B^.next <> hed do
      B := B^.next;
    C^.next := Hed;
    B^.next := C;
  end;
  
  Inc(itemCount);
end;

procedure DeleteLastElement(var Hed: Pint);
var
  prev, curr: Pint;
begin
  if Hed = nil then
  begin
    writeln('Список пуст!');
    readln;
    exit;
  end;
  prev := nil;
  curr := Hed;
  while curr^.next <> Hed do
  begin
    prev := curr;
    curr := curr^.next;
  end;
  if prev = nil then 
  begin
    dispose(Hed);
    Hed := nil;
    writeln('В вашем списке удалён последний элемент');
    Delay(1500);
  end
  else
  begin
    prev^.next := Hed;
    dispose(curr);
    writeln('Последний элемент списка удалён!');
    Delay(1500);
  end;
end;

procedure View(var Hed: Pint);
var 
  C: Pint;
begin
  C := Hed;
  if C = nil then
  begin
    writeln('Список пуст!');
    readln;
    exit;
  end;
  repeat
    writeln(C^.value);
    writeln('Далее (Enter)');
    readln;
    C := C^.next;
  until C = Hed;
  writeln('Конец списка! Возвращаемся к началу.');
  readln;
end;

function Show(): boolean;
var 
  choice: char;
begin
  writeln('Введите тип памяти для списка (1 - динамический, 0 - статический) --- 3 - выход из программы');
  Readln(DataType);
  if DataType = 3 then
  begin
    Exit
  end;
  
  if DataType = 0 then
  begin
    Writeln('введите макс число элементов в списке: ');
    Readln(maxItems);
    itemCount := 0;
  end;
  
  while DataType = 1 do begin
    ClrScr;
    Show := true;
    writeln('1- Создать элемент списка');
    writeln('2- Просмотреть весь список');
    writeln('3- Удалить последний элемент списка');
    writeln('4- Выход');
    writeln('5- Поменять тип данных на статический');
    choice := readkey;
    case choice of
      '1': NtCreat(Sp);
      '2': View(Sp);
      '3': DeleteLastElement(Sp);
      '4': Exit;
      '5': DataType := 0;
    end;
  end;
  
  while DataType = 0 do begin
    ClrScr;
    Show := true;
    writeln('1- Создать элемент списка');
    writeln('2- Просмотреть весь список');
    writeln('3- Удалить последний элемент списка');
    writeln('4- Выход');
    writeln('5- поменять тип данных на динамический');
    
    
    choice := readkey;
    case choice of
      '1':
      begin
        if itemCount < maxItems then
        begin
          NtCreat(Spp);
        end
        else
        begin
          Writeln('List is full.');
          Delay(3000);
        end;
      end;
      '2': View(Spp);
      '3': DeleteLastElement(Spp);
      '4': Exit;
      '5': DataType := 1;
    end;
  end;
end;



begin
  ClrScr;
  Head := nil;
  repeat
    F := Show();
    clrscr;
  until not F;
end.
