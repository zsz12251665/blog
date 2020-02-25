var
	field:array[0..101,0..101]of char;// Make the minefield a little larger to avoid the subscript out of range
	n,m,i,j,count:integer;
begin
	for i:=0 to 101 do// Initialize the minefield
		for j:=0 to 101 do
			field[i,j]:='?';
	readln(n,m);
	for i:=1 to n do
		for j:=1 to m do
			if j<m then// This is to avoid the problem that the char enter and the char return might bring
				read(field[i,j])
			else
				readln(field[i,j]);
	for i:=1 to n do// Scan the minefield
		begin
			for j:=1 to m do
				if field[i,j]<>'*' then
					begin
						count:=0;
						if field[i-1,j-1]='*' then
							inc(count);
						if field[i-1,j]='*' then
							inc(count);
						if field[i-1,j+1]='*' then
							inc(count);
						if field[i,j-1]='*' then
							inc(count);
						if field[i,j+1]='*' then
							inc(count);
						if field[i+1,j-1]='*' then
							inc(count);
						if field[i+1,j]='*' then
							inc(count);
						if field[i+1,j+1]='*' then
							inc(count);
						write(count)
					end
				else
					write('*');
			writeln;
		end;
end.
