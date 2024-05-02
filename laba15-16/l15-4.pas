type
  PNode = ^Node;
    Node = record
      num: integer;
      next: PNode;
    end;
var Head: PNode;
min, max, i, random_num: integer;
procedure CreateNode(var head: PNode; NewNum: integer);
var current, NewNode: PNode;
begin
  New(NewNode);
  NewNode^.num:= NewNum;
  NewNode^.next := nil;
  if head = nil then
  begin
    head := newNode;
  end
  else
  begin
    current := head;
    while current^.next <> nil do
    begin
        current := current^.next;
    end;
    current^.next := NewNode;
  end;
end;
procedure FindMinMax(Head: PNode; var min, max: integer);
var current: PNode;
begin
  if Head = nil then
  begin
    min := 0;
    max := 0;
  end;
  current := Head;
  min := current^.num;
  max := current^.num;

  while current <> nil do
  begin
      if current^.num < min then
          min := current^.num;
      
      if current^.num > max then
          max := current^.num;
      
      current := current^.next; 
  end;
end;
begin
  randomize;
  Head := nil;
  for i := 1 to 10 do
  begin
    random_num := random(100);
    write(random_num+' ');
    CreateNode(Head, random_num);
  end;
  writeln;
  FindMinMax(Head, min, max);
  writeln('Max: ', max);
  writeln('Min: ', min);
end.