var
	t,ti,n,m:longint;
	ans:int64;
begin
	read(t);
	for ti:=1 to t do
		begin
			read(n,m);
			ans:=int64(n+1)*n div 2;
			ans:=ans-int64((n-m) div (m+1)+1)*((n-m) div (m+1)+2) div 2*((n-m) mod (m+1));// Subtract the 0s with the length ((n-m) div (m+1)+1)
			ans:=ans-int64((n-m) div (m+1))*((n-m) div (m+1)+1) div 2*(m+1-(n-m) mod (m+1));// Subtract the 0s with the length (n-m) div (m+1)
			writeln(ans);
		end;
end.
