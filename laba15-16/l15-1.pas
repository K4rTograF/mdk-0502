var i:integer;
i_ptr: ^integer;
begin
  i := 2;
  i_ptr := @i;
  writeln(i_ptr^)
end.