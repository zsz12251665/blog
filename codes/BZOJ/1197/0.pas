var
	f:array[1..15,0..100]of int64;// f[n,m] keeps the number of kinds of flowers
	n,m,i,j:integer;
begin
	read(m,n);
	for i:=1 to n do// When m=0
		f[i,0]:=1;
	for j:=1 to m do// When n=1
		f[1,j]:=2*j;
	for i:=2 to n do// When n>1 and m>0
		for j:=1 to m do
			f[i,j]:=f[i-1,j-1]+f[i,j-1];
	write(f[n,m]);
end.
