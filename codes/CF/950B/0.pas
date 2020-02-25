var
	x,y:array[1..100000]of longint;
	n,m,ans,total_x,total_y,i,j:longint;
begin
	ans:=0;
	read(n,m);
	for i:=1 to n do
		read(x[i]);
	for i:=1 to m do
		read(y[i]);
	i:=1;
	j:=1;
	total_x:=0;
	total_y:=0;
	while (i<=n) or (j<=m) do
		begin
			if total_x>total_y then// Add the smaller one
				begin
					total_y:=total_y+y[j];
					inc(j);
				end
			else
				begin
					total_x:=total_x+x[i];
					inc(i);
				end;
			if total_x=total_y then// Add it to the counter
				inc(ans);
		end;
	write(ans);
end.
