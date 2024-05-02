program Deq;

type
  PNode = ^Node;
  Node = record
    data: Integer;
    next: PNode;
    prev: PNode;
  end;

type
  Deque = record
    front, rear: PNode;
  end;

procedure initDeque(var D: Deque);
begin
  D.front := nil;
  D.rear := nil;
end;

function isEmpty(var D: Deque): Boolean;
begin
  isEmpty := (D.front = nil) and (D.rear = nil);
end;

procedure addToFront(var D: Deque; num: Integer);
var
  newNode: PNode;
begin
  new(newNode);
  newNode^.data := num;
  newNode^.next := D.front;
  newNode^.prev := nil;

   if D.front <> nil then
    D.front^.prev := newNode;

   if D.rear = nil then
    D.rear := newNode;

  D.front := newNode;
end;

procedure addToRear(var D: Deque; num: Integer);
var
  newNode: PNode;
begin
  new(newNode);
  newNode^.data := num;
  newNode^.next := nil;
  newNode^.prev := D.rear;

   if D.rear <> nil then
    D.rear^.next := newNode;

  if D.front = nil then
    D.front := newNode;

  D.rear := newNode;
end;

procedure removeFromFront(var D: Deque);
var
  delNode: PNode;
begin
  if not isEmpty(D) then
  begin
    delNode := D.front;
    D.front := delNode^.next;

    if D.front = nil then
      D.rear := nil
    else
      D.front^.prev := nil;

    dispose(delNode);
  end
  else
  begin
    writeln('pusto');
  end;
end;

procedure removeFromRear(var D: Deque);
var
  delNode: PNode;
begin
  if not isEmpty(D) then
  begin
    delNode := D.rear;
    D.rear := delNode^.prev;

    if D.rear = nil then
      D.front := nil
    else
      D.rear^.next := nil;

    dispose(delNode);
  end
  else
  begin
    writeln('pusto');
  end;
end;

var
  D: Deque;
  int: integer;
  F_in, F_out: text;
begin
  InitDeque(D);
  assign(F_in, 'input16.txt');
  reset(F_in);
  assign(F_out, 'output16.txt');
  rewrite(F_out);
  while not eof(F_in) do
  begin
    read(F_in, int);
    addToRear(D, int);
  end;
    close(F_in);
  while not isEmpty(D) do
  begin
    int := D.rear^.data;
    removeFromRear(D);
    write(F_out, int+' ');
   end;
  close(F_out);
end.