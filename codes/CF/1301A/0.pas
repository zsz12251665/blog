var
	t,ti,i:integer;
	a,b,c:string;
	ans:boolean;
begin
	readln(t);
	for ti:=1 to t do
		begin
			readln(a);
			readln(b);
			readln(c);
			ans:=true;
			for i:=1 to length(c) do
				if (a[i]<>c[i]) and (b[i]<>c[i]) then// Find the position which cannot be same
					begin
						ans:=false;
						break;
					end;
			if ans then
				writeln('YES')
			else
				writeln('NO');
		end;
end.
