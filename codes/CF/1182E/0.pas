var
	coe,pwr,tmp:array[1..5,1..5]of int64;
	f:array[1..3]of int64;
	n,c,ans,t:int64;
	i,j,k:integer;
begin
	ans:=1;
	read(n,f[1],f[2],f[3],c);
	for i:=1 to 5 do// Initialize the matrices
		begin
			for j:=1 to 5 do
				begin
					coe[i,j]:=0;
					pwr[i,j]:=0;
				end;
			coe[i,i]:=1;
		end;
	pwr[1,1]:=1;
	pwr[1,2]:=1;
	pwr[1,3]:=1;
	pwr[1,4]:=1;
	pwr[2,1]:=1;
	pwr[3,2]:=1;
	pwr[4,4]:=1;
	pwr[5,5]:=1;
	pwr[4,5]:=2;
	n:=n-3;// Run the power of the matrix
	while n>0 do
		begin
			if n mod 2=1 then
				begin
					for i:=1 to 5 do
						for j:=1 to 5 do
							tmp[i,j]:=0;
					for i:=1 to 5 do
						for j:=1 to 5 do
							for k:=1 to 5 do
								tmp[i,j]:=(tmp[i,j]+coe[i,k]*pwr[k,j] mod 1000000006) mod 1000000006;
					for i:=1 to 5 do
						for j:=1 to 5 do
							coe[i,j]:=tmp[i,j];
				end;
			for i:=1 to 5 do
				for j:=1 to 5 do
					tmp[i,j]:=0;
			for i:=1 to 5 do
				for j:=1 to 5 do
					for k:=1 to 5 do
						tmp[i,j]:=(tmp[i,j]+pwr[i,k]*pwr[k,j] mod 1000000006) mod 1000000006;
			for i:=1 to 5 do
				for j:=1 to 5 do
					pwr[i,j]:=tmp[i,j];
			n:=n div 2;
		end;
	t:=(2*coe[1,4]+coe[1,5]) mod 1000000006;// Calculate the power of c
	while t>0 do
		begin
			if t mod 2=1 then
				ans:=c*ans mod 1000000007;
			c:=c*c mod 1000000007;
			t:=t div 2;
		end;
	for i:=1 to 3 do// Calculate the power of f
		while coe[1,i]>0 do
			begin
				if coe[1,i] mod 2=1 then
					ans:=f[4-i]*ans mod 1000000007;
				f[4-i]:=f[4-i]*f[4-i] mod 1000000007;
				coe[1,i]:=coe[1,i] div 2;
			end;
	write(ans);
end.
