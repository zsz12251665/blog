var
	s:ansistring;
	n,i,cnt,min:longint;
begin
	cnt:=0;
	min:=0;
	readln(n);// Pass the line break by using readln to avoid reading a null string causing runtime error
	readln(s);
	for i:=1 to n do// Scan the sequence
		begin
			if s[i]='(' then// Count the difference of the numbers of brackets
				inc(cnt)
			else
				dec(cnt);
			if cnt<min then// The minimum of the difference shows how many right brackets appeared before their left brackets
				min:=cnt;
		end;
	if (cnt<>0) or (min<-1) then
		write('No')
	else
		write('Yes');
end.
