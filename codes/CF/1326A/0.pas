var
	t,ti:integer;
	n,i:longint;
begin
	read(t);
	for ti:=1 to t do
		begin
			read(n);
			if n=1 then
				begin
					writeln(-1);
					continue;
				end;
			write(2);//We use 2333... here
			for i:=2 to n do
				write(3);
			writeln;
		end;
end.
