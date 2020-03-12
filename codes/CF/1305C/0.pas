var
	num:array[0..999]of longint;// num[i] contains an a[j] that a[j]%m==i
	n,a,k:longint;
	m,ans,i,j:integer;
begin
	read(n,m);
	for i:=0 to m-1 do
		num[i]:=-1;// -1 means that there is no number yet
	for k:=1 to n do// Find same remainders
		begin
			read(a);
			if num[a mod m]=-1 then
				num[a mod m]:=a
			else// Find a second one
				begin
					write(0);
					halt;
				end;
		end;
	ans:=1;// Calculate the answer
	for i:=0 to m-1 do
		if num[i]<>-1 then
			for j:=0 to i-1 do
				if num[j]<>-1 then
					ans:=(abs(num[i]-num[j]) mod m*ans) mod m;
	write(ans);
end.
