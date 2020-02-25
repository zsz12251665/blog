var
	c,rank:array[1..300000]of longint;// rank[i] keeps the order of c[i]
	timeline:array[1..600000]of boolean;
	n,k,i,mt:longint;// mt is the minimum time that a plane can depart now
	sum:int64;
procedure qsort(l,r:longint);
var
	x,y,tmp,std:longint;
begin
	x:=l;
	y:=r;
	std:=c[rank[(l+r) div 2]];
	while x<y do
		begin
			while c[rank[x]]>std do
				inc(x);
			while c[rank[y]]<std do
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
	read(n,k);
	for i:=1 to n do
		begin
			read(c[i]);
			rank[i]:=i;
			timeline[i]:=false;
		end;
	qsort(1,n);
	sum:=0;
	mt:=1;
	for i:=1 to n do
		begin
			if rank[i]>=mt+k then// Check if it is still able to depart as the initial schedule planned
				begin
					timeline[rank[i]-k]:=true;
					c[rank[i]]:=rank[i];// The c array is now scrolled to keep the moment to depart
				end
			else
				begin
					sum:=sum+int64(c[rank[i]])*(mt+k-rank[i]);// If you do not change it into int64, it may overflow
					timeline[mt]:=true;
					c[rank[i]]:=mt+k;
				end;
			while timeline[mt] do
				inc(mt);
		end;
	writeln(sum);
	for i:=1 to n do
		write(c[i],' ');
end.
