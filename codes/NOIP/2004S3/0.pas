var
	a,inca,deca:array[1..100]of integer;
	n,ans,i,j:integer;
begin
	read(n);
	for i:=1 to n do
		begin
			read(a[i]);
			inca[i]:=1;
			deca[i]:=1;
		end;
	for i:=2 to n do// Find the longest ascending subsequences
		for j:=1 to i-1 do
			if (a[j]<a[i]) and (inca[j]+1>inca[i]) then
				inca[i]:=inca[j]+1;
	for i:=n-1 downto 1 do// Find the longest descending subsequences
		for j:=n downto i+1 do
			if (a[j]<a[i]) and (deca[j]+1>deca[i]) then
				deca[i]:=deca[j]+1;
	ans:=n;
	for i:=1 to n do
		if n-inca[i]-deca[i]+1<ans then// Do not forget to add 1 because you've count i twice
			ans:=n-inca[i]-deca[i]+1;
	write(ans);
end.
