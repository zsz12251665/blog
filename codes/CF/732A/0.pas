var
	k,r,ans:integer;
begin
	ans:=1;
	read(k,r);
	while ((k*ans) mod 10<>0) and ((k*ans) mod 10<>r) do// Enumerate the number of shovels to buy
		inc(ans);
	write(ans);
end.
