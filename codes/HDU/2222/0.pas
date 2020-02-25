var
	s:ansistring;
	next:array[0..500000,1..26]of longint;
	fail,last:array[0..500000]of longint;
	queue:array[1..500000]of longint;
	value:array[0..500000]of integer;
	t,ti,n,ans:integer;
	size,head,foot,p,i,tmp:longint;
begin
	readln(t);
	for ti:=1 to t do
		begin
			fillchar(next,sizeof(next),0);// Initialize the arrays
			fillchar(fail,sizeof(fail),0);
			fillchar(last,sizeof(last),0);
			fillchar(value,sizeof(value),0);
			ans:=0;
			readln(n);
			size:=0;// Build the trie
			for tmp:=1 to n do
				begin
					p:=0;
					readln(s);
					for i:=1 to length(s) do
						if next[p,ord(s[i])-96]=0 then
							begin
								inc(size);
								next[p,ord(s[i])-96]:=size;
								p:=next[p,ord(s[i])-96];
							end
						else
							p:=next[p,ord(s[i])-96];
					inc(value[p]);
				end;
			queue[1]:=0;// Build the fail array
			head:=1;
			foot:=2;
			while head<>foot do
				begin
					p:=queue[head];
					inc(head);
					for i:=1 to 26 do
						begin
							if next[p,i]<>0 then
								begin
									queue[foot]:=next[p,i];
									inc(foot);
									if p=0 then
										continue;
									tmp:=fail[p];// If they are not matched, jump to the last match
									while (tmp>0) and (next[tmp,i]=0) do
										tmp:=fail[tmp];
									fail[next[p,i]]:=next[tmp,i];
									if value[next[tmp,i]]=0 then// last is the last node of an model string
										last[next[p,i]]:=last[next[tmp,i]]
									else
										last[next[p,i]]:=next[tmp,i];
								end
							else
								next[p,i]:=fail[p];
						end;
				end;
			readln(s);
			for i:=1 to length(s) do// Scan the question string to find the model strings
				begin
					while (p<>0) and (next[p,ord(s[i])-96]=fail[p]) do// If they are not matched, jump to the last match
						p:=fail[p];
					p:=next[p,ord(s[i])-96];
					tmp:=p;// Jump back to find out all model strings available
					while tmp<>0 do
						begin
							ans:=ans+value[tmp];
							value[tmp]:=0;
							tmp:=last[tmp];
						end;
				end;
			writeln(ans);
		end;
end.
