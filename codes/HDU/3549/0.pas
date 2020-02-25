var
	h:array[1..15]of integer;
	des,nxt,flow:array[1..2000]of integer;
	visited:array[1..15]of boolean;
	n,m,t,ti,u,v,w,i,tmp:integer;
	ans:longint;
function dfs(p,t,f:integer):integer;// f is the maximum flow available from the start point to point p
var
	i,tmp:integer;
begin
	if p=t then// Reach the end point
		exit(f);
	visited[p]:=true;
	i:=h[p];
	while i<>-1 do
		begin
			if not visited[des[i]] and (flow[i]>0) then
				begin
					if f<flow[i] then
						tmp:=dfs(des[i],t,f)
					else
						tmp:=dfs(des[i],t,flow[i]);
					if tmp>0 then// Find a new augment path
						begin
							flow[i]:=flow[i]-tmp;// Update the edge
							if i mod 2=1 then// Update the inverse edge
								flow[i+1]:=flow[i+1]+tmp
							else
								flow[i-1]:=flow[i-1]+tmp;
							visited[p]:=false;
							exit(tmp);
						end;
				end;
			i:=nxt[i];
		end;
	visited[p]:=false;
	exit(0);
end;
begin
	read(t);
	for ti:=1 to t do
		begin
			read(n,m);
			for i:=1 to n do
				begin
					h[i]:=-1;
					visited[i]:=false;
				end;
			for i:=1 to m do
				begin
					read(u,v,w);
					des[2*i-1]:=v;// Build the edge
					nxt[2*i-1]:=h[u];
					flow[2*i-1]:=w;
					h[u]:=2*i-1;
					des[2*i]:=u;// Build the inverse edge
					nxt[2*i]:=h[v];
					flow[2*i]:=0;
					h[v]:=2*i;
				end;
			ans:=0;
			tmp:=dfs(1,n,maxint);
			while tmp>0 do// Keep trying until we cannot find a new augment path
				begin
					ans:=ans+tmp;
					tmp:=dfs(1,n,maxint);
				end;
			writeln('Case ',ti,': ',ans);
		end;
end.
