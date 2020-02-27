var
	cost:array[1..200000]of longint;
	n,a,b,k,h,i,ans:longint;
procedure qsort(l,r:longint);// Sort the cost array in increasing order
var
	x,y,tmp,std:longint;
begin
	x:=l;
	y:=r;
	std:=cost[(l+r) div 2];
	while x<y do
		begin
			while cost[x]<std do
				inc(x);
			while cost[y]>std do
				dec(y);
			if x<=y then
				begin
					tmp:=cost[x];
					cost[x]:=cost[y];
					cost[y]:=tmp;
					inc(x);
					dec(y);
				end;
		end;
	if l<y then
		qsort(l,y);
	if r>x then
		qsort(x,r);
end;
begin
	read(n,a,b,k);
	for i:=1 to n do// Calculate the cost
		begin
			read(h);
			h:=(h-1) mod (a+b)+1;
			if h<=a then
				cost[i]:=0
			else
				cost[i]:=(h-1) div a;
		end;
	qsort(1,n);// Sort the cost
	ans:=0;
	for i:=1 to n do// Choose greedily
		begin
			if k<cost[i] then
				break;
			k:=k-cost[i];
			inc(ans);
		end;
	write(ans);
end.
