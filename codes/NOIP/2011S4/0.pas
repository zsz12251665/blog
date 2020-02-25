var
	coe:array[0..1000,0..1000]of longint;
	a,b,k,n,m,i,j:longint;
begin
	read(a,b,k,n,m);
	a:=a mod 10007;// Avoid making the coefficient too large
	b:=b mod 10007;
	coe[0,0]:=1;
	for i:=0 to n do// DP Part
		for j:=0 to m do
			begin
				if (i=0) and (j=0) then
					continue;
				coe[i][j]:=0;
				if i>0 then// Do not forget this, or your array index may be overlimited
					coe[i,j]:=(coe[i,j]+coe[i-1,j]*a) mod 10007;
				if j>0 then
					coe[i,j]:=(coe[i,j]+coe[i,j-1]*b) mod 10007;
			end;
	write(coe[n,m]);
end.
