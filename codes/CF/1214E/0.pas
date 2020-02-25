var
	d,rank:array[1..100000]of longint;
	chain:array[1..200000]of longint;
	n,len,i:longint;
procedure qsort(l,r:longint);// Sort the pairs according to the distances
var
	x,y,tmp,std:longint;
begin
	x:=l;
	y:=r;
	std:=rank[(l+r) div 2];
	while x<y do
		begin
			while d[rank[x]]>d[std] do
				inc(x);
			while d[rank[y]]<d[std] do
				dec(y);
			if x<=y then
				begin
					tmp:=rank[x];
					rank[x]:=rank[y];
					rank[y]:=tmp;
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
	read(n);
	for i:=1 to n do
		begin
			read(d[i]);
			rank[i]:=i;
		end;
	qsort(1,n);// Sort the pairs according to the distances
	len:=n;// Form the main chain with the odd points
	chain[1]:=2*rank[1]-1;
	for i:=2 to n do
		begin
			writeln(2*rank[i-1]-1,' ',2*rank[i]-1);
			chain[i]:=2*rank[i]-1;
		end;
	for i:=1 to n do// Adding the even points
		if i+d[rank[i]]-1<len then// Check if the even node will extend the main chain
			writeln(chain[i+d[rank[i]]-1],' ',2*rank[i])
		else
			begin
				writeln(chain[len],' ',2*rank[i]);
				inc(len);
				chain[len]:=2*rank[i];
			end;
end.
