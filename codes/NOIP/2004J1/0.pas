var
	ans,mxt,a,b,i:integer;
begin
	ans:=0;
	mxt:=8;// mxt equals 8 because she won't be unhappy if the time is less than 8 hours
	for i:=1 to 7 do
		begin
			read(a,b);
			if a+b>mxt then
				begin
					mxt:=a+b;
					ans:=i;
				end;
		end;
	writeln(ans);
end.
