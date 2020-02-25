var
	s:ansistring;
	h,f,nxt,len:array[1..300000]of longint;// The array h and the array f are the head and the foot of the adjacency table
	cnt,i,j:longint;// cnt is the number of the zebra sequences
	is_added:boolean;
begin
	readln(s);
	cnt:=0;
	for i:=1 to length(s) do
		begin
			nxt[i]:=-1;
			is_added:=false;// Whether this char has been added to a zebra sequence
			for j:=1 to cnt do// Enumerate the zebra sequences to find the suitable one
				if s[f[j]]<>s[i] then
					begin
						nxt[f[j]]:=i;
						f[j]:=i;
						inc(len[j]);
						is_added:=true;
						break;
					end;
			if is_added then
				continue;
			if s[i]='1' then// Too many '1's are found to divide the 01 string into serval zebra sequences
				begin
					write(-1);
					halt;
				end
			else// Create a new zebra sequence
				begin
					inc(cnt);
					h[cnt]:=i;
					f[cnt]:=i;
					len[cnt]:=1;
				end;
		end;
	for i:=1 to cnt do// Check if there is a zebra sequence ended with '1'
		if s[f[i]]='1' then
			begin
				write(-1);
				halt;
			end;
	write(cnt);// Output the answer
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
