var
	big_m:array[1..500,1..500]of longint;
	n,m,x,y,k,i,j:integer;
	t,ti:longint;
	is_clever:boolean;
begin
	read(n,m,t);
	for i:=1 to n do
		for j:=1 to m do
			read(big_m[i,j]);
	for ti:=1 to t do
		begin
			is_clever:=true;
			read(x,y,k);
			for i:=1 to k-1 do// Check each pair of lines
				begin
					for j:=1 to k-1 do
						if big_m[x+i,y]-big_m[x+i-1,y]<>big_m[x+i,y+j]-big_m[x+i-1,y+j] then// We set x2=x1-1, y2=y1-1 here to make sure it applies to the other numbers
							begin
								is_clever:=false;
								break;
							end;
					if not is_clever then
						break;
				end;
			if is_clever then
				writeln('Y')
			else
				writeln('N');
		end;
end.
