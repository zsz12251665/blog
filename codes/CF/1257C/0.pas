var
	last:array[1..200000]of longint;// Array last records the last of position of the numbers
	t,ti:integer;
	n,a,min,i:longint;
begin
	read(t);
	for ti:=1 to t do
		begin
			min:=maxlongint;
			read(n);
			for i:=1 to n do// Initialize the array last
				last[i]:=-1;
			for i:=1 to n do// Scan the sequence to find the closest pairs
				begin
					read(a);
					if (last[a]<>-1) and (min>i-last[a]+1) then
						min:=i-last[a]+1;
					last[a]:=i;
				end;
			if min=maxlongint then
				writeln(-1)
			else
				writeln(min);
		end;
end.
