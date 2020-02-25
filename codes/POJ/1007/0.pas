var
	s:array[1..100]of string;
	count:array[1..100]of integer;
	n,m,i,j,k,min:integer;
begin
	readln(n,m);
	for i:=1 to m do
		begin
			readln(s[i]);
			count[i]:=0;
			for j:=1 to n do// Count the inversions
				for k:=j+1 to n do
					if s[i][j]>s[i][k] then
						inc(count[i]);
		end;
	for i:=1 to m do// Sort and output the strings
		begin
			min:=1;
			for j:=2 to m do
				if count[j]<count[min] then
					min:=j;
			count[min]:=maxint;// Set count[i] as maxint to mark that it is outputed
			writeln(s[min]);
		end;
end.
