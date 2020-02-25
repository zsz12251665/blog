var
	i,n:longint;
function prime(n:longint):boolean;
var
	i:longint;
begin
	for i:=2 to trunc(sqrt(n)) do// Attention that the loop is from 2 because 2 is the smallest prime
		if n mod i=0 then// If there is a division, exit false
			exit(false);
	exit(true);
end;
begin
	read(n);
	for i:=2 to n do
		if prime(i) and (n mod i=0) then// You can replace this line with "if n mod i=0 then"
			begin
				write(n div i);
				halt;
			end;
end.
