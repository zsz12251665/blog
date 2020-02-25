var
	a,b,c:longint;
begin
	read(a,b,c);
	if a=b then
		begin
			write('YES');
			halt;
		end;
	if c=0 then
		begin
			write('NO');
			halt;
		end;
	if ((b-a) mod c=0) and ((a>b) xor (c>0)) then// Pay attention to the division you use! It mustn't be 0 or you will catch some errors
		write('YES')
	else
		write('NO');
end.
