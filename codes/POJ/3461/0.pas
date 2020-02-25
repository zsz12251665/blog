var
	s,t:ansistring;
	match:array[1..10000]of integer;
	q:integer;
	i,p,ans,len_t,len_s:longint;
begin
	readln(q);
	while q>0 do
		begin
			ans:=0;
			readln(t);
			readln(s);
			len_t:=length(t);
			len_s:=length(s);
			if len_s<len_t then
				begin
					writeln(0);
					continue;
				end;
			match[1]:=0;// Build the partial matching table
			for i:=2 to len_t do
				begin
					match[i]:=match[i-1];
					while (match[i]>0) and (t[i]<>t[match[i]+1]) do// If they are not matched, jump to the last match
						match[i]:=match[match[i]];
					if t[i]=t[match[i]+1] then// If they are matched, add the matching value
						inc(match[i]);
				end;
			p:=1;// p is the position of the model string
			for i:=1 to len_s do// Scan the question string to find the model string
				begin
					while (i>p) and (s[i]<>t[i-p+1]) do// If they are not matched, jump to the last match
						p:=i-match[i-p];
					if (s[i]=t[i-p+1]) and (i-p+1=len_t) then// The model string is found
						begin
							inc(ans);
							p:=i-match[i-p];
						end;
					if s[i]<>t[i-p+1] then// If the head is still unmatched, move the model string
						inc(p);
				end;
			writeln(ans);
			dec(q);
		end;
end.
