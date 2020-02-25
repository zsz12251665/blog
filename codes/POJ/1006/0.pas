var
	p,e,i,d,t:integer;
begin
	t:=0;
	read(p,e,i,d);
	while (p<>-1) or (e<>-1) or (i<>-1) or (d<>-1) do
		begin
			inc(t);
			writeln('Case ',t,': the next triple peak occurs in ',(5544*p+14421*e+1288*i-d+21251) mod 21252+1,' days.');// Pay attention to the format of the output
			read(p,e,i,d);
		end;
end.
