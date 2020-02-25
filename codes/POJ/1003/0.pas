var
	d:double;
	ans:integer;
begin
	read(d);
	while d>0 do
		begin
			ans:=1;// Don't forget it starts from 2 to ans+1
			while d>0 do
				begin
					inc(ans);
					d:=d-1/ans;
				end;
			writeln(ans-1,' card(s)');// Do not forget to minus 1 since it starts from 2 to ans+1
			read(d);
		end;
end.
