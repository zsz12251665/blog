var
	n,m,i,count:longint;
function is_good(a:longint):boolean;
var
	i:longint;
begin
	i:=1;
	while i<a do
		begin
			if ((a div i) mod 100=62) or ((a div i) mod 10=4) then
				exit(false);
			i:=i*10;// It is a little dangerous here because i may overflow and you'll get a WA
		end;
	exit(true);
end;
begin
	read(n,m);
	while (n<>0) or (m<>0) do
		begin
			count:=0;
			for i:=n to m do// Search the interval
				if is_good(i) then
					inc(count);
			writeln(count);
			read(n,m);
		end;
end.
