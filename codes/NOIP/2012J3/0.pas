var
	dp:array[0..100,0..100]of longint;
	n,m,a,i,j,k:integer;
begin
	read(n,m);
	dp[0,0]:=1;
	for i:=1 to n do
		begin
			read(a);// We can scroll a because we just need it once
			for j:=0 to m do
				if a>j then// Without this, the array may be overlimited
					for k:=0 to j do
						dp[i,j]:=(dp[i,j]+dp[i-1,j-k]) mod 1000007
				else
					for k:=0 to a do
						dp[i,j]:=(dp[i,j]+dp[i-1,j-k]) mod 1000007;
		end;
	write(dp[n,m]);
end.
