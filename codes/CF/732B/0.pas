var
	a:array[1..500]of integer;
	n,k,i:integer;
	ans:longint;
begin
	read(n,k);
	ans:=0;
	for i:=1 to n do
		read(a[i]);
	for i:=2 to n do// Enumerate any two consecutive days
		if a[i-1]+a[i]<k then
			begin
				ans:=ans+k-a[i]-a[i-1];// Add the second day to the requirement
				a[i]:=k-a[i-1];
			end;
	writeln(ans);
	for i:=1 to n do
		write(a[i],' ');
end.
