var
	n,i:longint;
	d,e,ans:integer;
begin
	ans:=maxint;
	read(n,d,e);
	e:=e*5;// Don't forget that it is a FIVE euro bill
	for i:=0 to n div e do// Enumerate the number of the 5 euro bills
		if ans>(n-i*e) mod d then
			ans:=(n-i*e) mod d;
	write(ans);
end.
