var
	n,i,na,nb,pa,pb:integer;// pa counts the number of the times that Little A wins, pb counts the number of the times that Little B wins
	a,b:array[1..200]of integer;
begin
	pa:=0;
	pb:=0;
	read(n,na,nb);
	for i:=1 to na do
		read(a[i]);
	for i:=1 to nb do
		read(b[i]);
	for i:=1 to n do// Simulate the rounds
		begin
			if (a[(i-1) mod na+1]=0) and (b[(i-1) mod nb+1]=2)// Judge if Little A wins
			or (a[(i-1) mod na+1]=0) and (b[(i-1) mod nb+1]=3)
			or (a[(i-1) mod na+1]=1) and (b[(i-1) mod nb+1]=0)
			or (a[(i-1) mod na+1]=1) and (b[(i-1) mod nb+1]=3)
			or (a[(i-1) mod na+1]=2) and (b[(i-1) mod nb+1]=1)
			or (a[(i-1) mod na+1]=2) and (b[(i-1) mod nb+1]=4)
			or (a[(i-1) mod na+1]=3) and (b[(i-1) mod nb+1]=2)
			or (a[(i-1) mod na+1]=3) and (b[(i-1) mod nb+1]=4)
			or (a[(i-1) mod na+1]=4) and (b[(i-1) mod nb+1]=0)
			or (a[(i-1) mod na+1]=4) and (b[(i-1) mod nb+1]=1) then
				inc(pa);
			if (b[(i-1) mod nb+1]=0) and (a[(i-1) mod na+1]=2)// Judge if Little B wins
			or (b[(i-1) mod nb+1]=0) and (a[(i-1) mod na+1]=3)
			or (b[(i-1) mod nb+1]=1) and (a[(i-1) mod na+1]=0)
			or (b[(i-1) mod nb+1]=1) and (a[(i-1) mod na+1]=3)
			or (b[(i-1) mod nb+1]=2) and (a[(i-1) mod na+1]=1)
			or (b[(i-1) mod nb+1]=2) and (a[(i-1) mod na+1]=4)
			or (b[(i-1) mod nb+1]=3) and (a[(i-1) mod na+1]=2)
			or (b[(i-1) mod nb+1]=3) and (a[(i-1) mod na+1]=4)
			or (b[(i-1) mod nb+1]=4) and (a[(i-1) mod na+1]=0)
			or (b[(i-1) mod nb+1]=4) and (a[(i-1) mod na+1]=1) then
				inc(pb);
		end;
	write(pa,' ',pb);
end.
