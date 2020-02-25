var
	milk:array[1..10000]of longint;
	n,i,j:integer;
	tmp:longint;
begin
	read(n);
	for i:=1 to n do
		read(milk[i]);
	for i:=2 to n do
		for j:=1 to i-1 do
			if milk[i]<milk[j] then// Replace this line with "if milk[i]>milk[j] then" to sort in decrease order
				begin
					tmp:=milk[j];
					milk[j]:=milk[i];
					milk[i]:=tmp;
				end;
	write(milk[n div 2+1]);
end.
