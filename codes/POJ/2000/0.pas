var
	k,i,j:integer;
	ans:longint;
begin
	read(k);
	while k<>0 do
		begin
			write(k,' ');
			i:=1;
			ans:=0;
			while k>0 do
				begin
					for j:=1 to i do
						if k>0 then// Do not forget to check if k equals 0 in the loop, or you may give too much coins
							begin
								ans:=ans+i;
								dec(k);
							end;
					inc(i);
				end;
			writeln(ans);
			read(k);
		end;
end.
