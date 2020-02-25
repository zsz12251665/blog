var
	count:array[0..1000000]of longint;// count[i] keeps the number of the is_good numbers from 0 to i
	n,m,i:longint;
function is_good(a:longint):boolean;
begin
	while a>0 do
		begin
			if (a mod 100=62) or (a mod 10=4) then
				exit(false);
			a:=a div 10;
		end;
	exit(true);
end;
begin
	count[0]:=1;
	for i:=1 to 1000000 do
		if is_good(i) then
			count[i]:=count[i-1]+1
		else
			count[i]:=count[i-1];
	read(n,m);
	while (n<>0) or (m<>0) do
		begin
			writeln(count[m]-count[n-1]);// Don't forget to use the one before n, or you may lose the number n
			read(n,m);
		end;
end.
