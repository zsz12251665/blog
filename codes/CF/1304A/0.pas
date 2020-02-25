var
	t,ti:integer;
	x,y,a,b:longint;
begin
	read(t);
	for ti:=1 to t do
		begin
			read(x,y,a,b);
			if (y>=x) and ((y-x) mod (a+b)=0) then
				writeln((y-x) div (a+b))
			else
				writeln(-1);
		end;
end.
