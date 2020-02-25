var
	a,b,c,power,ans,gcd:int64;
	i,k:integer;
function exgcd(a,b:int64;var x,y:int64):int64;// A combined version of exGCD and GCD
begin
	if b=0 then
		begin
			x:=1;
			y:=0;
			exit(a);
		end;
	exgcd:=exgcd(b,a mod b,y,x);
	y:=y-a div b*x;
end;
begin
	read(a,b,c,k);
	while (a<>0) or (b<>0) or (c<>0) or (k<>0) do
		begin
			power:=1;
			for i:=1 to k do
				power:=power*2;
			b:=b-a;
			if b<0 then// Make sure the number is positive
				b:=b+power;
			gcd:=exgcd(c,power,ans,a);
			if b mod gcd<>0 then// There is no need to check if c is 0
				begin
					writeln('FOREVER');
					read(a,b,c,k);
					continue;
				end;
			ans:=ans*(b div gcd) mod (power div gcd);
			if ans<0 then// Make sure the number is positive
				ans:=ans+power div gcd;
			writeln(ans);
			read(a,b,c,k);
		end;
end.
