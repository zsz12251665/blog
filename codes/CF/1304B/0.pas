var
	s:array[1..100]of string;
	pre,suf:ansistring;// The prefix and the suffix of the answer
	sym:array[1..100,1..100]of boolean;
	unused:array[1..100]of boolean;
	n,m,i,j,k:integer;
begin
	pre:='';
	suf:='';
	readln(n,m);
	for i:=1 to n do
		begin
			unused[i]:=true;
			readln(s[i]);
		end;
	for i:=1 to n do
		for j:=1 to i do
			begin
				sym[i,j]:=true;// Checking whether each pair of strings is symmetric
				sym[j,i]:=true;
				for k:=1 to m do
					if s[i][k]<>s[j][m+1-k] then
						begin
							sym[i,j]:=false;
							sym[j,i]:=false;
							break;
						end;
			end;
	for i:=1 to n do// Finding the pairs
		if unused[i] then
			for j:=1 to i-1 do
				if unused[j] and sym[i,j] then
					begin
						pre:=pre+s[i];
						suf:=s[j]+suf;
						unused[i]:=false;
						unused[j]:=false;
						break;
					end;
	for i:=1 to n do// Find a middle one
		if unused[i] and sym[i,i] then
			begin
				pre:=pre+s[i];
				break;
			end;
	writeln(length(pre)+length(suf));
	writeln(pre+suf);
end.
