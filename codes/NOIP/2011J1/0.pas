var
	n:longint;
begin
	read(n);
	if n<0 then// Check if n is a negative number
		begin
			write('-');
			n:=-n;
		end;
	if n=0 then// Check if n is zero
		begin
			write('0');
			halt;
		end;
	while n mod 10=0 do// Remove the prefix zero
		n:=n div 10;
	while n>0 do// Reverse the number
		begin
			write(n mod 10);
			n:=n div 10;
		end;
end.
