var
	h,d,q:array[1..15]of integer;// To enable cur optimization, add an array cur to record the latest edge we access from each point
	des,nxt,flow:array[1..2000]of integer;
	n,m,t,ti,u,v,w,i,tmp:integer;
	ans:longint;
procedure bfs(s,t:integer);
var
	head,foot,i,p:integer;
begin
	for i:=1 to n do// Reset the levels. To enable cur optimization, reset the cur array by adding "cur[i]:=h[i];" in the loop
		d[i]:=n;// d[i]=n means that you cannot reach the end point from this point
	head:=1;// Push the end point into the queue
	foot:=2;
	q[1]:=t;
	d[t]:=0;
	while head<>foot do
		begin
			p:=q[head];
			head:=head mod 15+1;
			i:=h[p];
			while i<>-1 do
				begin
					if (d[des[i]]=n) and (i mod 2=1) and (flow[i+1]>0) then// Find a new point
						begin
							d[des[i]]:=d[p]+1;// Set the level
							q[foot]:=des[i];// Push it into the queue
							foot:=foot mod 15+1;
						end;
					if (d[des[i]]=n) and (i mod 2=0) and (flow[i-1]>0) then// Find a new point
						begin
							d[des[i]]:=d[p]+1;// Set the level
							q[foot]:=des[i];// Push it into the queue
							foot:=foot mod 15+1;
						end;
					i:=nxt[i];
				end;
		end;
end;
function dfs(p,t,f:integer):integer;// f is the maximum flow available from the start point to point p
var
	i,tmp:integer;
begin
	if p=t then// Reach the end point
		exit(f);
	i:=h[p];// To enable cur optimization, use "i:=cur[p];" instead to start from the latest edge accessed
	while i<>-1 do
		begin
			if (d[des[i]]+1=d[p]) and (flow[i]>0) then
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
							exit(tmp);
						end;
				end;
			i:=nxt[i];
		end;
	exit(0);
end;
begin
	read(t);
	for ti:=1 to t do
		begin
			read(n,m);
			for i:=1 to n do
				h[i]:=-1;
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
			bfs(1,n);
			while d[1]<n do// Run BFS until the start point and the end point is not connected
				begin
					tmp:=dfs(1,n,maxint);
					while tmp>0 do// Keep trying until we cannot find a new augment path
						begin
							ans:=ans+tmp;
							tmp:=dfs(1,n,maxint);
						end;
					bfs(1,n);
				end;
			writeln('Case ',ti,': ',ans);
		end;
end.
