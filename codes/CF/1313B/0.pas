var
	t,ti:integer;
	n,x,y:longint;
begin
	read(t);
	for ti:=1 to t do
		begin
			read(n,x,y);
			if x+y>n then
				if x+y=2*n then
					writeln(n,' ',n)
				else
					writeln(x+y+1-n,' ',n)
			else
				writeln(1,' ',x+y-1);
		end;
end.
