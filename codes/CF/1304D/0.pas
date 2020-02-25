var
	s:ansistring;
	g,l:array[1..200000]of longint;// g[i] is the number of '>' following consecutively and l[i] is the number of '<' following consecutively
	t,ti:integer;
	n,i,last:longint;
begin
	readln(t);
	for ti:=1 to t do
		begin
			readln(n,s);
			s:=copy(s,2,n);// There is a space between n and s, which becomes part of s
			g[n]:=0;// Calculate g[i] and l[i]
			l[n]:=0;
			for i:=n-1 downto 1 do
				if s[i]='<' then
					begin
						g[i]:=0;
						l[i]:=l[i+1]+1;
					end
				else
					begin
						g[i]:=g[i+1]+1;
						l[i]:=0;
					end;
			write(n-l[1]);// The lexicographically largest sequence
			last:=n;
			for i:=2 to n do
				begin
					if s[i-1]='>' then
						last:=n+1-i;
					write(' ',last-l[i]);
				end;
			writeln;
			write(1+g[1]);// The lexicographically smallest sequence
			last:=1;
			for i:=2 to n do
				begin
					if s[i-1]='<' then
						last:=i;
					write(' ',last+g[i]);
				end;
			writeln;
		end;
end.
