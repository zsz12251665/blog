var
	dp:array[0..31]of longint;
	n,ans,max,a,i,j:longint;
begin
	ans:=0;
	for j:=0 to 31 do// Initialize the dp array
		dp[j]:=0;
	read(n);
	for i:=1 to n do
		begin
			max:=0;
			read(a);
			for j:=0 to 31 do
				if (a and (1 shl j)<>0) and (max<dp[j]) then// Find the length of the longest subsequence that a[i] can append
					max:=dp[j];
			inc(max);
			for j:=0 to 31 do
				if (a and (1 shl j)<>0) and (dp[j]<max) then// Update the dp array
					begin
						dp[j]:=max;
						if ans<dp[j] then// Update the answer
							ans:=dp[j];
					end;
		end;
	write(ans);
end.
