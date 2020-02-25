var
	l,r,a:integer;
begin
	read(l,r,a);
	while a>0 do// Check which hand each ambidexter should use
		begin
			if l>r then
				inc(r)
			else
				inc(l);
			dec(a);
		end;
	if l>r then
		write(2*r)
	else
		write(2*l);
end.
