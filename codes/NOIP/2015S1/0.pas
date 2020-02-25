var
	field:array[1..39,1..39]of integer;
	n,i,j,t:integer;
begin
	read(n);
	for i:=1 to n do// Initialize the field array
		for j:=1 to n do
			field[i,j]:=0;
	i:=1;
	j:=n div 2+1;
	for t:=1 to n*n do// Put the numbers into the field array
		begin
			field[i,j]:=t;
			if (i=1) and (j<>n) then
				begin
					i:=n;
					inc(j);
					continue;
				end;
			if (i<>1) and (j=n) then
				begin
					dec(i);
					j:=1;
					continue;
				end;
			if (i=1) and (j=n) or (field[i-1,j+1]<>0) then
				inc(i)
			else
				begin
					dec(i);
					inc(j);
				end;
		end;
	for i:=1 to n do// Print the field array
		begin
			for j:=1 to n do
				write(field[i,j],' ');
			writeln;
		end;
end.
