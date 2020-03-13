var
	buf,s,ans:ansistring;// Because the input string in Pascal is separated by the return, so we use a buffer string buf
	n,i,cnt,len:longint;
begin
	ans:='1';
	cnt:=0;
	readln(n);
	readln(buf);
	buf:=buf+' ';
	for i:=1 to n do
		begin
			s:=copy(buf,1,pos(' ',buf)-1);
			delete(buf,1,pos(' ',buf));
			len:=length(s);
			while (len>0) and (s[len]='0') do// Count and remove the suffix 0s
				begin
					inc(cnt);
					dec(len);
				end;
			if len=0 then// The number is 0
				begin
					write(0);
					halt;
				end;
			s:=copy(s,1,len);
			if s<>'1' then// If it is not a beautiful number, save it in the string ans
				ans:=s;
		end;
	write(ans);// Output the answer
	for i:=1 to cnt do
		write(0);
end.
