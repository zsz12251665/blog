var
	w,t:ansistring;
	match:array[1..10000]of integer;
	q,qi:integer;
	i,p,ans,len_w,len_t:longint;
begin
	readln(q);
	for qi:=1 to q do
		begin
			ans:=0;
			readln(w);
			readln(t);
			len_w:=length(w);
			len_t:=length(t);
			if len_t<len_w then
				begin
					writeln(0);
					continue;
				end;
			match[1]:=0;// Build the partial match table
			for i:=2 to len_w do
				begin
					match[i]:=match[i-1];
					while (match[i]>0) and (w[i]<>w[match[i]+1]) do// If they are not matched, jump to the last match
						match[i]:=match[match[i]];
					if w[i]=w[match[i]+1] then// If they are matched, add the partial match value
						inc(match[i]);
				end;
			p:=1;// p is the position of w
			for i:=1 to len_t do// Scan t to find w
				begin
					while (i>p) and (t[i]<>w[i-p+1]) do// If they are not matched, jump to the last match
						p:=i-match[i-p];
					if (t[i]=w[i-p+1]) and (i-p+1=len_w) then// If w is found
						begin
							inc(ans);
							p:=i-match[i-p];
						end;
					if t[i]<>w[i-p+1] then// If the head is still unmatched, move w
						inc(p);
				end;
			writeln(ans);
		end;
end.
