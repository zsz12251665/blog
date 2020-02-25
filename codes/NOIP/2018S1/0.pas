var
	n,ans,i:longint;
	d,last:integer;
begin
	ans:=0;
	read(n);
	last:=0;// For the first layer, all height should be added, so last will be 0
	for i:=1 to n do
		begin
			read(d);
			if d>last then// If d>last, we need to add more operation to reach it
				ans:=ans+d-last;
			last:=d;
		end;
	write(ans);
end.
