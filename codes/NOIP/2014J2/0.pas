var
	a,b:longint;
	l,i,j,x,y:integer;
function gcd(a,b:integer):integer;// Check if a and b are co-prime to each other
var
	tmp:integer;
begin
	if a<b then
		begin
			tmp:=a;
			a:=b;
			b:=tmp;
		end;
	if a mod b=0 then
		exit(b)
	else
		exit(gcd(b,a mod b));
end;
begin
	x:=maxint;// Maximum x and minimum y to make the ratio as big as possible
	y:=1;
	read(a,b,l);
	for i:=1 to l do// Enumerate every pair of (i,j) in [1..l]
		for j:=1 to l do
			if (gcd(i,j)=1) and (i*b>=a*j) and (i*y<x*j) then// i*b>=a*j <=> i/j>=a/b, i*y<x*j <=> i/j<x/y
				begin
					x:=i;
					y:=j;
				end;
	write(x,' ',y);
end.
