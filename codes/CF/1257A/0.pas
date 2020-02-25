var
	t,ti,n,x,a,b,i:integer;
begin
	read(t);
	for ti:=1 to t do
		begin
			read(n,x,a,b);
			if a>b then// Make sure a is smaller than b
				begin
					i:=a;
					a:=b;
					b:=i;
				end;
			for i:=1 to x do// Swap the students
				if a=1 then
					if b=n then
						break
					else
						inc(b)
				else
					dec(a);
			writeln(b-a);
		end;
end.
