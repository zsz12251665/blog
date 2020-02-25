var
	k,i,j:integer;
	ans:longint;
begin
	read(k);
	ans:=0;
	i:=1;
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
	write(ans);
end.
