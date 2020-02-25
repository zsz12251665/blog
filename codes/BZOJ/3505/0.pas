var
	n,m,i,j:integer;
	ans:int64;
function gcd(a,b:integer):integer;// Calculate the greatest common division of a and b
begin
	if b=0 then
		exit(a);
	exit(gcd(b,a mod b));
end;
begin
	read(n,m);
	inc(n);
	inc(m);
	ans:=int64(n*m)*(n*m-1)*(n*m-2) div 6;
	for i:=1 to n-1 do// Pick up the combinations on the same row
		ans:=ans-int64(n-i)*m*(i-1);
	for j:=1 to m-1 do// Pick up the combinations on the same column
		ans:=ans-int64(m-j)*n*(j-1);
	for i:=1 to n-1 do// Pick up the other combinations on the same line
		for j:=1 to m-1 do
			ans:=ans-int64(n-i)*(m-j)*(gcd(i,j)-1)*2;// There are two directions: (0,0) to (i,j) and (i,0) to (0,j)
	write(ans);
end.
