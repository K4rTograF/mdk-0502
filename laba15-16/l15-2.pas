type PNode = ^Node;  
     Node = record    
       word: string; 
       count: integer;   
       next: PNode;      
     end;
var Head, current, previous: PNode;
F:text;
cWord: string;
Found: boolean;
count: integer;
procedure CreateNode(var NewNode: PNode; NewWord: string);
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
end;
procedure AddFirst (var Head: PNode; NewNode: PNode);
begin
  NewNode^.next := Head;
  Head := NewNode;
end;
procedure AddAfter(var p: PNode; NewNode: PNode);
begin
  NewNode^.next := p^.next;
  p^.next := NewNode;
end;
function MakePlace(Head: PNode; NewWord: string): PNode;
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord > pp^.word) do
    pp := pp^.next;
  Result := pp;
end;
procedure AddBefore(Place: PNode; NewNode: PNode);
begin
  if Place = nil then
    AddFirst(Head, NewNode)
  else
  begin
    AddAfter(Place, NewNode);
  end;
end;
begin
  assign(F, 'input.txt');
  reset(F);
  Head := nil;
  while not eof(F) do
  begin
    readln(F, cWord);
    Found := False;
    current := Head;
    while (current <> nil) and (not Found) do
      begin
      if current^.word = cWord then
      begin
        Inc(current^.count);
        Found := True;
      end;
      previous := current;
      current := current^.next;
    end;
    if not Found then
    begin
      count += 1;
      CreateNode(current, cWord);
      AddBefore(previous, current);
    end;
  end;
  close(F);
  current := Head;
  while current <> nil do begin
    writeln(current^.word + ': '+current^.count);
    current := current^.next;
  end;
  writeln(count);
end.