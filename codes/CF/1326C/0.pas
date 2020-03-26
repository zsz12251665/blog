var
	n,k,p,i,cnt:longint;
	ans:int64;// Though it should be smaller than 998244353, we are using int64 to avoid overlimit when multiplication
begin
	read(n,k);
	ans:=0;
	cnt:=1;
	for i:=1 to n do
		begin
			read(p);
			if p>n-k then
				begin
					ans:=(ans*cnt) mod 998244353;
					if ans=0 then// The numbers before the first number lareger than (n-k) is not needed
						inc(ans);
					cnt:=1;
				end
			else
				inc(cnt);
		end;
	write(int64(n-k+1+n)*k div 2,' ',ans);
end.
