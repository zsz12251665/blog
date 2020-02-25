var
	des,nxt:array[1..2000]of integer;
	h,dis_s,dis_t,queue:array[1..1000]of integer;
	in_queue:array[1..1000]of boolean;
	n,m,s,t,i,u,v,p,ans:integer;
begin
	read(n,m,s,t);
	for i:=1 to n do// Initialize arrays
		begin
			dis_s[i]:=maxint;
			dis_t[i]:=maxint;
			h[i]:=-1;
			in_queue[i]:=false;
		end;
	for i:=1 to m do// Read the edges
		begin
			read(u,v);
			nxt[2*i-1]:=h[u];
			nxt[2*i]:=h[v];
			des[2*i-1]:=v;
			des[2*i]:=u;
			h[u]:=2*i-1;
			h[v]:=2*i;
		end;
	queue[1]:=s;// Use SPFA to find the distance to s
	in_queue[s]:=true;
	dis_s[s]:=0;
	u:=1;// u is the head of the queue and v is the foot
	v:=2;
	while u<>v do
		begin
			p:=queue[u];
			u:=u mod 1000+1;
			in_queue[p]:=false;
			i:=h[p];
			while i<>-1 do
				begin
					if dis_s[des[i]]>dis_s[p]+1 then
						begin
							dis_s[des[i]]:=dis_s[p]+1;
							if not in_queue[des[i]] then
								begin
									queue[v]:=des[i];
									v:=v mod 1000+1;
									in_queue[des[i]]:=true;
								end;
						end;
					i:=nxt[i];
				end;
		end;
	queue[1]:=t;// Use SPFA to find the distance to t
	in_queue[t]:=true;
	dis_t[t]:=0;
	u:=1;
	v:=2;
	while u<>v do
		begin
			p:=queue[u];
			u:=u mod 1000+1;
			in_queue[p]:=false;
			i:=h[p];
			while i<>-1 do
				begin
					if dis_t[des[i]]>dis_t[p]+1 then
						begin
							dis_t[des[i]]:=dis_t[p]+1;
							if not in_queue[des[i]] then
								begin
									queue[v]:=des[i];
									v:=v mod 1000+1;
									in_queue[des[i]]:=true;
								end;
						end;
					i:=nxt[i];
				end;
		end;
	ans:=0;
	for u:=1 to n do// Enumerate the pairs to find the possible edges
		for v:=1 to u-1 do
			if (dis_s[u]+dis_t[v]+1>=dis_s[t]) and (dis_t[u]+dis_s[v]+1>=dis_t[s]) then// Both dis_s[t] and dis_t[s] mean the distance between s and t
				inc(ans);
	write(ans-m);// Remove the edges that already exist
end.
