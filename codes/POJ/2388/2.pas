var
	milk:array[1..10000]of longint;
	n,i,j:integer;
	tmp:longint;
begin
	read(n);
	for i:=1 to n do
		read(milk[i]);
	for i:=1 to n-1 do
		for j:=1 to n-i do
			if milk[j]>milk[j+1] then// Replace this line with "if milk[j]<milk[j+1] then" to sort in decrease order
				begin
					tmp:=milk[j];
					milk[j]:=milk[j+1];
					milk[j+1]:=tmp;
				end;
	write(milk[n div 2+1]);
end.
