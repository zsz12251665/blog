var
	dp:array[0..1000]of longint;
	t,m,cost,price,i,j:integer;
begin
	for i:=0 to 1000 do// Initialize the dp array
		dp[i]:=0;
	read(t,m);
	for i:=1 to m do
		begin
			read(cost,price);
			for j:=t downto cost do
				if dp[j]<dp[j-cost]+price then// dp=max(dp[j-cost]+price)
					dp[j]:=dp[j-cost]+price;
		end;
	write(dp[t]);
end.
