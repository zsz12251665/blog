var
	n,i:integer;
	m:longint;
begin
	read(n,m);
	if n div 2*(n div 2-1+n mod 2)<m then// n is not enough to make m triples
		begin
			write(-1);
			halt;
		end;
	i:=1;// Adding numbers from 1 to i
	while (n>0) and (m>0) do
		if (i-1) div 2<=m then
			begin
				write(i,' ');
				dec(n);
				m:=m-(i-1) div 2;
				inc(i);
			end
		else
			begin
				write(i+((i-1) div 2-m)*2,' ');
				dec(n);
				break;
			end;
	for i:=1 to n do// The rest of the a[i], making a[i]+a[j]=a[k] impossible
		write((100000-n+i)*10000,' ');
end.
