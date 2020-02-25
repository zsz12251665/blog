var
	n,ans,i:longint;
	h,last:integer;
begin
	ans:=0;
	read(n);
	last:=0;// For the first brick, all height should be added, so last will be 0
	for i:=1 to n do
		begin
			read(h);
			if h>last then// If h>last, we need to add more operation to reach it
				ans:=ans+h-last;
			last:=h;
		end;
	write(ans);
end.
