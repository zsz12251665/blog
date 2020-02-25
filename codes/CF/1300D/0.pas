var
	x,y:array[1..100000]of longint;
	n,i:longint;
begin
	read(n);
	if n mod 2=1 then// There are odd points (edges)
		begin
			write('NO');
			halt;
		end;
	for i:=1 to n do
		read(x[i],y[i]);
	for i:=1 to n div 2 do
		if (x[i+1]-x[i]<>x[i+n div 2]-x[(i+n div 2) mod n+1]) or (y[i+1]-y[i]<>y[i+n div 2]-y[(i+n div 2) mod n+1]) then// The vectors of the subtenses are not opposite to each other
			begin
				write('NO');
				halt;
			end;
	write('YES');
end.
