var
	a:array[1..2000]of longint;
	b:array[0..2000]of integer;
	n,m,i,j:integer;
begin
	read(n,m);
	for i:=0 to m do// Initialize the counter
		b[i]:=0;
	for i:=1 to n do// Input the playlist and count the number of the songs that each band will sing
		begin
			read(a[i]);
			if a[i]<=m then
				inc(b[a[i]]);
		end;
	for i:=1 to n do// Replace the songs
		if (a[i]>m) or (b[a[i]]>n div m) then
				for j:=1 to m do// Eunmerate the band can replace the song
					if b[j]<n div m then
						begin
							inc(b[0]);// Update the counter
							inc(b[j]);
							if a[i]<=m then
								dec(b[a[i]]);
							a[i]:=j;// Change the value
							break;
						end;
	writeln(n div m,' ',b[0]);
	for i:=1 to n do
		write(a[i],' ');
end.
