var
	a:array[1..200000]of longint;
	n,i:longint;
	t,ti:integer;
procedure qsort(l,r:longint);// Sort the array in increase order
var
	x,y:longint;
	tmp,std:longint;
begin
	x:=l;
	y:=r;
	std:=a[(l+r) div 2];
	while x<y do
		begin
			while a[x]<std do
				inc(x);
			while a[y]>std do
				dec(y);
			if x<=y then
				begin
					tmp:=a[x];
					a[x]:=a[y];
					a[y]:=tmp;
					inc(x);
					dec(y);
				end;
		end;
	if l<y then
		qsort(l,y);
	if r>x then
		qsort(x,r);
end;
begin
	read(t);
	for ti:=1 to t do
		begin
			read(n);
			for i:=1 to 2*n do
				read(a[i]);
			qsort(1,2*n);
			writeln(a[n+1]-a[n]);
		end;
end.
