var
	key,txt:ansistring;
	i:integer;
begin
	readln(key);// In Pascal, read a string means to read every char until a return or an enter, so you'd better to readln them string by string
	readln(txt);
	for i:=1 to length(txt) do
		txt[i]:=chr((ord(txt[i]) mod 32-ord(key[(i-1) mod length(key)+1]) mod 32+26) mod 26+ord(txt[i])-ord(txt[i]) mod 32+1);// In ASCII, 'A' ~ 'Z' are 65 to 90, 'a' ~ 'z' are 97 to 122. So a char which modulo 32 can show its order in the alphabet
	write(txt);
end.
