var
	milk,copy:array[1..10000]of longint;
	n,i:integer;
procedure msort(l,r:integer);
var
	x,y:integer;
begin
	if l>=r then
		exit;
	msort(l,(l+r) div 2);
	msort((l+r) div 2+1,r);
	copy:=milk;
	x:=l;
	y:=(l+r) div 2+1;
	for i:=l to r do
		begin
			if x>(l+r) div 2 then
				begin
					milk[i]:=copy[y];
					inc(y);
					continue;
				end;
			if y>r then
				begin
					milk[i]:=copy[x];
					inc(x);
					continue;
				end;
			if copy[x]>copy[y] then// Replace this line with "if copy[x]<copy[y] then" to sort in decrease order
				begin
					milk[i]:=copy[y];
					inc(y);
				end
			else
				begin
					milk[i]:=copy[x];
					inc(x);
				end;
		end;
end;
begin
	read(n);
	for i:=1 to n do
		read(milk[i]);
	msort(1,n);
	write(milk[n div 2+1]);
end.
