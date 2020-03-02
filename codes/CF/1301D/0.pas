var
	s:array[1..200000] of string;// The pattern how Bashar is moving
	c:array[1..200000] of integer;// How many times Bashar should moves
	n,m,size,i:integer;
	k:longint;
begin
	read(n,m,k);
	if 4*n*m-2*n-2*m<k then// The distance is longer than the maximum available
		begin
			write('NO');
			halt;
		end;
	writeln('YES');
	if m=1 then
		begin
			writeln(2);
			writeln(k-k div 2,' D');
			writeln(k div 2,' U');
			halt;
		end;
	size:=0;
	for i:=1 to n do
		begin
			inc(size);// Move to the right border (or as right as possible)
			if k>m-1 then
				c[size]:=m-1
			else
				c[size]:=k;
			s[size]:='R';
			k:=k-c[size];
			if k=0 then
				break;
			if i<n then// Not the last row
				begin
					inc(size);// Move back to the left
					if k div 3>m-1 then
						c[size]:=m-1
					else
						c[size]:=k div 3;
					s[size]:='DUL';
					if c[size]>0 then
						k:=k-3*c[size]
					else
						dec(size);
					if k>0 then
						begin
							inc(size);// Move downward or finish the last steps
							c[size]:=1;
							if k=2 then
								begin
									s[size]:='DU';
									k:=k-2;
								end
							else
								begin
									s[size]:='D';
									dec(k);
								end;
						end;
				end
			else// The last row
				begin
					inc(size);// Move back to the left
					if k>m-1 then
						c[size]:=m-1
					else
						c[size]:=k;
					s[size]:='L';
					k:=k-c[size];
					if k>0 then
						begin
							inc(size);// Move upward back to the start point
							c[size]:=k;
							s[size]:='U';
							k:=k-c[size];
						end;
				end;
			if k=0 then
				break;
		end;
	writeln(size);
	for i:=1 to size do
		writeln(c[i],' ',s[i]);
end.
