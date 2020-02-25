var
	cnt,i:integer;
	s:string;
begin
	cnt:=0;
	readln(s);
	for i:=1 to length(s) do// Scan the whole input
		if (ord(s[i])>47) and (ord(s[i])<58) or (ord(s[i])>64) and (ord(s[i])<91) or (ord(s[i])>96) and (ord(s[i])<123) then// When c is a letter or a number, add the counter
			inc(cnt);
	write(cnt);
end.
