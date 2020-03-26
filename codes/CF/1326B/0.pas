var
	n,i,b:longint;
	x:int64;
begin
	read(n);
	x:=0;// x[1]=0
	for i:=1 to n do
		begin
			read(b);
			write(b+x,' ');// a[i]=b[i]+x[i]
			if b>0 then// Update the maximum value
				x:=b+x;
		end;
end.
