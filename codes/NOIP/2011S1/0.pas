var
	a,b,g,k:array[1..10000]of longint;
	n,i:integer;
	x,y:longint;
begin
	read(n);
	for i:=1 to n do
		read(a[i],b[i],g[i],k[i]);
	read(x,y);
	for i:=n downto 1 do// Remember that we need to output the top one
		if (a[i]<=x) and (b[i]<=y) and (a[i]+g[i]>=x) and (b[i]+k[i]>=y) then// If it has covered the coordinate, output it then exit
			begin
				write(i);
				halt;
			end;
	write(-1);// If no carpet has covered the coordinate, output -1
end.
