var
	a,b,c,ans:int64;
function gcd(a,b:int64):int64;// This is a non-recursive form of the gcd function
var
	tmp:int64;
begin
	while b<>0 do
		begin
			tmp:=a mod b;// Divides their difference
			a:=b;
			b:=tmp;
		end;
	exit(a);
end;
begin
	read(a,b,c);
	ans:=a*b div gcd(a,b);
	ans:=ans*c div gcd(ans,c);
	write(ans);
end.
