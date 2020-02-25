var
	a,b,x,y:longint;
procedure exgcd(a,b:longint;var x,y:longint);
begin
	if b=0 then// The recursion border
		begin
			x:=1;// Keep the quotients
			y:=0;
			exit;
		end;
	exgcd(b,a mod b,y,x);// Recur gcd
	y:=y-a div b*x;// Update the quotients
end;
begin
	read(a,b);
	exgcd(a,b,x,y);
	write((x mod b+b) mod b);// Output the minimum positive integer
end.
