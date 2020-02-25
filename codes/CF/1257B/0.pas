var
	t,ti:integer;
	x,y:longint;
begin
	read(t);
	for ti:=1 to t do
		begin
			read(x,y);
			if (x>=y) or (x>3) or (x=2) and (y=3) then
				writeln('YES')
			else
				writeln('NO');
		end;
end.
