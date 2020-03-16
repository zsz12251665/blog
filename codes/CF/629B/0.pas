var
	f,m:array[1..366]of integer;
	s:char;
	n,l,r,i,j,ans:integer;
begin
	for i:=1 to 366 do// Initialize the counter
		begin
			f[i]:=0;
			m[i]:=0;
		end;
	read(n);
	for i:=1 to n do
		begin
			repeat
				read(s);
			until (s='F') or (s='M');
			read(l,r);
			for j:=l to r do// Update the counter
				if s='F' then
					inc(f[j])
				else
					inc(m[j]);
		end;
	ans:=0;
	for i:=1 to 366 do// Find the maximum number of participants
		begin
			if f[i]<m[i] then
				j:=f[i]
			else
				j:=m[i];
			if j>ans then
				ans:=j;
		end;
	write(2*ans);
end.
