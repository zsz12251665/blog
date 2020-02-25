var
	f,c:array[1..100000]of longint;
	n,m,x,y,i:longint;
	ans:int64;
function find(p:longint):longint;
begin
	if f[p]<>p then
		f[p]:=find(f[p]);
	exit(f[p]);
end;
procedure merge(a,b:longint);// Merge the sets
var
	fa,fb:longint;
begin
	fa:=find(a);
	fb:=find(b);
	if c[fa]<c[fb] then// Make sure the root of the set is the smallest
		f[fb]:=fa
	else
		f[fa]:=fb;
end;
begin
	ans:=0;
	read(n,m);
	for i:=1 to n do
		begin
			read(c[i]);
			f[i]:=i;// Initialize the union find set
		end;
	for i:=1 to m do
		begin
			read(x,y);
			merge(x,y);
		end;
	for i:=1 to n do// Bribe the characters
		if c[find(i)]<>-1 then
			begin
				ans:=ans+c[find(i)];
				c[find(i)]:=-1;
			end;
	write(ans);
end.
