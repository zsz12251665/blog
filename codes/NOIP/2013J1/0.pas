var
	n,i,t,ans:longint;
	x:integer;
begin
	ans:=0;
	read(n,x);
	for i:=1 to n do// Enumerate integers
		begin
			t:=i;
			while t>0 do// Check it bit by bit
				begin
					if t mod 10=x then
						inc(ans);
					t:=t div 10;
				end;
		end;
	write(ans);
end.
