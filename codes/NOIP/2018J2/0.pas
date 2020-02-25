var
	a:array[1..100000]of longint;
	n,m,s1,s2,p1,p2,i:longint;
	diff:int64;
function abs(a:int64):int64;
begin
	if a>0 then
		exit(a)
	else
		exit(-a);
end;
begin
	p2:=1;
	diff:=0;
	read(n);
	for i:=1 to n do
		read(a[i]);
	read(m,p1,s1,s2);
	a[p1]:=a[p1]+s1;
	for i:=1 to n do// Calculate the difference of their powers
		diff:=diff+int64(i-m)*a[i];
	for i:=1 to n do// Enumerate the position to put your soldiers
		if abs(int64(i-m)*s2+diff)<abs(int64(p2-m)*s2+diff) then// int64 is required because the data can reach 5,000,000
			p2:=i;
	write(p2);
end.
