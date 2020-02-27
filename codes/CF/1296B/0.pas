var
	t,ti:integer;
	s:longint;
	ans:int64;
begin
	read(t);
	for ti:=1 to t do
		begin
			ans:=0;
			read(s);
			while s>9 do
				begin
					ans:=ans+s-s mod 10;// Spend as many 10 burles as possible
					s:=s div 10+s mod 10;
				end;
			writeln(ans+s);// Don't forget to spend the burles left
		end;
end.
