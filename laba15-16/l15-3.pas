program LinkedList;
type
  PNode = ^Node;
    Node = record
    num: Integer;
    next: PNode;
  end;

var
head, current, newNode: PNode;
i: Integer;

begin
new(head);
current := head;

for i := 1 to 10 do
begin
New(newNode);
newNode^.num := i;
newNode^.next := nil;
current^.next := newNode;
current := newNode;
end;

current := head^.next;
while current <> nil do
begin
Write(current^.num, ' ');
current := current^.next;
end;
Writeln;

current := head^.next;
while current <> nil do
begin
if current^.num mod 2 = 0 then
Write(current^.num, ' ');
current := current^.next;
end;
end.





