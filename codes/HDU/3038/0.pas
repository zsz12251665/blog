var
	f:array[0..200000]of longint;
	d:array[0..200000]of int64;// d[i] is the difference of the prefix sum to the i-th and the prefix sum to the f[i]-th
	n,m,a,b,s,i,ans:longint;
function find(p:longint):longint;
var
	fp:longint;
begin
	if f[p]=p then
		exit(p);
	fp:=find(f[p]);
	d[p]:=d[p]+d[f[p]];
	f[p]:=fp;
	exit(f[p]);
end;
function merge(a,b,s:longint):boolean;
var
	fa,fb:longint;
begin
	fa:=find(a);
	fb:=find(b);
	if fa=fb then// The relationship is clear
		exit(d[b]-d[a]<>s);// Find a wrong answer
	d[fb]:=s+d[a]-d[b];
	f[fb]:=fa;
	exit(false);
end;
begin
	while not eof(input) do
		begin
			read(n,m);
			for i:=0 to n do// Initialize the union find set and the difference
				begin
					f[i]:=i;
					d[i]:=0;
				end;
			ans:=0;
			for i:=1 to m do
				begin
					read(a,b,s);
					if merge(a-1,b,s) then
						inc(ans);
				end;
			writeln(ans);
		end;
end.
