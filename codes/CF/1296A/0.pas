var
	t,ti,n,a,i,cnt:integer;
begin
	read(t);
	for ti:=1 to t do
		begin
			cnt:=0;
			read(n);
			for i:=1 to n do
				begin
					read(a);
					if a mod 2=1 then// Count the number of odd numbers
						inc(cnt);
				end;
			if (cnt mod 2=1) or (cnt>0) and (cnt<n) then
				writeln('YES')
			else
				writeln('NO');
		end;
end.
