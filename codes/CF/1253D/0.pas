var
	f:array[0..200000]of longint;
	n,m,i,x,y,p,ans:longint;
function find(p:longint):longint;
begin
	if f[p]<>p then
		f[p]:=find(f[p]);
	exit(f[p]);
end;
procedure merge(a,b:longint);
var
	fa,fb:longint;
begin
	fa:=find(a);
	fb:=find(b);
	if fa>fb then// Make sure the root point has the maximum index
		f[fb]:=fa
	else
		f[fa]:=fb;
end;
begin
	read(n,m);
	for i:=0 to n do
		f[i]:=i;
	for i:=1 to m do
		begin
			read(x,y);
			merge(x,y);
		end;
	ans:=0;
	p:=find(1);// p is the maximum index in this block
	for i:=1 to n do// Scan the sequence and add edges if necessary
		begin
			if find(i)<>p then// Find a point which does not match
				begin
					merge(i,p);
					p:=find(i);// Update the maximum index
					inc(ans);
				end;
			if (i=p) and (i<n) then// Jump to the next connected block
				p:=find(i+1);
		end;
	write(ans);
end.
