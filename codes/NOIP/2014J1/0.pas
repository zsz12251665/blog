var
	a:array[1..100]of integer;
	n,cnt,i,j:integer;
begin
	cnt:=0;
	read(n);
	for i:=1 to n do
		read(a[i]);
	for i:=1 to n do// Enumerate the numbers
		for j:=0 to n*n-1 do// Enumerate the pairs in one loop by enumerating (j1-1)*n+(j2-1)
			if (j div n<>j mod n) and (a[i]=a[j div n+1]+a[j mod n+1]) then
				begin
					inc(cnt);
					break;// We are asked to count the number of the numbers, not the pairs
				end;
	write(cnt);
end.
