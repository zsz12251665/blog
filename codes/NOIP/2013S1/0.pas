var
	n,m,k,x:longint;
	power,base:int64;// To avoid overlimit, we use int64 here
begin
	read(n,m,k,x);
	power:=1;
	base:=10;
	while k>0 do// The fast power algorithm
		begin
			if k mod 2=1 then// Divide k into binary
				power:=(power*base) mod n;
			base:=(base*base) mod n;
			k:=k div 2;
		end;
	write((power*m+x) mod n);
end.
