var
	s:ansistring;
	h,f,nxt,len:array[1..300000]of longint;
	queue:array[0..1,1..300000]of longint;
	head,foot:array[0..1]of longint;
	cnt,i,j:longint;
begin
	readln(s);
	cnt:=0;
	head[0]:=1;// Initialize the queue
	head[1]:=1;
	foot[0]:=0;
	foot[1]:=0;
	for i:=1 to length(s) do
		begin
			nxt[i]:=-1;
			if head[49-ord(s[i])]<=foot[49-ord(s[i])] then// Use queue to find the suitable zebra sequence in a short time
				begin
					j:=queue[49-ord(s[i]),head[49-ord(s[i])]];
					inc(head[49-ord(s[i])]);
					nxt[f[j]]:=i;
					f[j]:=i;
					inc(len[j]);
					inc(foot[ord(s[i])-48]);
					queue[ord(s[i])-48,foot[ord(s[i])-48]]:=j;
					continue;
				end;
			if s[i]='1' then
				begin
					write(-1);
					halt;
				end
			else
				begin
					inc(cnt);
					h[cnt]:=i;
					f[cnt]:=i;
					len[cnt]:=1;
					inc(foot[ord(s[i])-48]);
					queue[ord(s[i])-48,foot[ord(s[i])-48]]:=cnt;
				end;
		end;
	if head[1]<=foot[1] then// Check whether the queue of '1' is empty to check if there is a zebra sequence ended with '1'
		begin
			write(-1);
			halt;
		end;
	write(cnt);
	for i:=1 to cnt do
		begin
			writeln;
			write(len[i]);
			j:=h[i];
			while j<>-1 do
				begin
					write(' ',j);
					j:=nxt[j];
				end;
		end;
end.
