var
	a,b:array[1..100000]of longint;// b[i] is all elements of the array a except a[i] merging together with the operator or
	n,ans,i,tmp:longint;
begin
	ans:=1;
	read(n);
	for i:=1 to n do
		begin
			read(a[i]);
			b[i]:=0;
		end;
	tmp:=0;
	for i:=1 to n do// Preprocessing the prefix
		begin
			b[i]:=b[i] or tmp;
			tmp:=tmp or a[i];
		end;
	tmp:=0;
	for i:=n downto 1 do// Preprocessing the suffix
		begin
			b[i]:=b[i] or tmp;
			tmp:=tmp or a[i];
		end;
	for i:=1 to n do// Find the maximum
		if (a[i] and not b[i])>(a[ans] and not b[ans]) then
			ans:=i;
	write(a[ans]);
	for i:=1 to n do
		if i<>ans then
			write(' ',a[i]);
end.
