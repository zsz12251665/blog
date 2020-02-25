var
	visit:array[1..1000]of boolean;// Remember to set up a visit array to prevent your dfs from falling into a loop
	x,y,z:array[1..1000]of int64;// To avoid overlimit or too many type conversions, I set the large integers as int64 directly
	h,r:int64;
	t,n,i,j:integer;
	getout:boolean;
function dfs(p:integer):boolean;
var
	i:integer;
begin
	visit[p]:=true;// Set the visit tag
	if z[p]>=h-r then// Check if the mouse has got out
		exit(true);
	for i:=1 to n do// Find the way to go on
		if not visit[i] and ((x[i]-x[p])*(x[i]-x[p])+(y[i]-y[p])*(y[i]-y[p])+(z[i]-z[p])*(z[i]-z[p])<=4*r*r) and dfs(i) then
			exit(true);
	exit(false);
end;
begin
	read(t);
	while t>0 do
		begin
			read(n,h,r);
			for i:=1 to n do
				begin
					visit[i]:=false;
					read(x[i],y[i],z[i]);
				end;
			getout:=false;
			for i:=1 to n do// Enumerate the way to get in
				begin
					if z[i]<=r then
						getout:=dfs(i);
					if getout then
						break;
				end;
			if getout then
				writeln('Yes')
			else
				writeln('No');
			dec(t);
		end;
end.
