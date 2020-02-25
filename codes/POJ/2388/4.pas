var
	milk:array[1..10000]of longint;
	n,i:integer;
procedure qsort(l,r:integer);
var
	x,y:integer;
	tmp,std:longint;
begin
	x:=l;
	y:=r;
	std:=milk[(l+r) div 2];
	while x<y do
		begin
			while milk[x]<std do// Replace this line with "while milk[x]>std do" to sort in decrease order
				inc(x);
			while milk[y]>std do// Replace this line with "while milk[y]<std do" to sort in decrease order
				dec(y);
			if x<=y then
				begin
					tmp:=milk[x];
					milk[x]:=milk[y];
					milk[y]:=tmp;
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
	read(n);
	for i:=1 to n do
		read(milk[i]);
	qsort(1,n);
	write(milk[n div 2+1]);
end.
