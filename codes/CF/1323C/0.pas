var
	s:ansistring;
	n,i,p,cnt,ans:longint;// cnt is the difference between the numbers of the left brackets and the right brackets
begin
	cnt:=0;
	ans:=0;
	readln(n);
	readln(s);
	p:=-1;// p=-1 means no incorrect substring start postion was found, otherwise it contains the start position
	for i:=1 to n do
		begin
			if s[i]='(' then
				inc(cnt)
			else
				dec(cnt);
			if (cnt<0) and (p=-1) then// The start position is found
				p:=i;
			if (cnt>=0) and (p<>-1) then// The end position is found
				begin
					ans:=ans+i-p+1;
					p:=-1;
				end;
		end;
	if cnt<>0 then// The numbers of left brackets and the right brackets are not equal
		ans:=-1;
	write(ans);
end.
