var
	c,sum:array[1..2000,0..2000]of integer;
	t,k,n,m,i,j:integer;
	ans:longint;
begin
	read(t,k);
	for i:=1 to 2000 do// Make the Pascal Triangle and the prefix sum of the line
		begin
			c[i,0]:=1;
			c[i,i]:=1;
			sum[i,0]:=0;
			for j:=1 to i-1 do
				begin
					c[i,j]:=(c[i-1,j]+c[i-1,j-1]) mod k;
					sum[i,j]:=sum[i,j-1];
					if c[i,j]=0 then
						inc(sum[i,j]);
				end;
			sum[i,i]:=sum[i,i-1];
		end;
	while t>0 do
		begin
			read(n,m);
			ans:=0;
			for i:=2 to n do// Add the prefix sum together to get the answer
				if i>m then
					ans:=ans+sum[i,m]
				else
					ans:=ans+sum[i,i];
			writeln(ans);
			dec(t);
		end;
end.
