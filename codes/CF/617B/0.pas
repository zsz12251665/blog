var
	n,i,tmp,cnt:integer;
	ans:int64;// You need a long long to store the answer because the answer can be as large as 2^50 or 3^33
begin
	read(n);
	ans:=0;
	cnt:=1;
	for i:=1 to n do
		begin
			read(tmp);
			if tmp=0 then
				inc(cnt)
			else
				begin
					ans:=ans*cnt;
					if ans=0 then// We don't need the empty bars before the first nut
						inc(ans);
					cnt:=1;
				end;
		end;
	write(ans);
end.
