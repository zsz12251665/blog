var
	b,g,n:integer;
function min(a,b:integer):integer;// The function of the minimum number of two (4 is too complex to compare)
begin
	if a<b then
		exit(a)
	else
		exit(b);
end;
begin
	read(b,g,n);
	write(min(min(b,g),min(b+g-n,n))+1);// We move the plus 1 to the end but it doesn't matter
end.
