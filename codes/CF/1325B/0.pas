var
	a:array[1..100000]of longint;
	n,i,ans:longint;
	t,ti:integer;
procedure qsort(l,r:longint);// Sort the array in increasing order
var
	x,y,tmp,std:longint;
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
			for i:=1 to n do
				read(a[i]);
			qsort(1,n);// Sort the array in increasing order
			ans:=n;// Count the number of different numbers
			for i:=2 to n do
				if a[i]=a[i-1] then
					dec(ans);
			writeln(ans);
		end;
end.
