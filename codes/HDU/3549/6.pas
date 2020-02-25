var
	h,d,q:array[1..15]of integer;// To enable gap optimization, add "cnt:array[0..15]of integer;" to count the number of points in a level
	des,nxt,flow:array[1..2000]of integer;
	n,m,t,ti,u,v,w,i,tmp:integer;
	ans:longint;
procedure bfs(s,t:integer);
var
	head,foot,i,p:integer;
begin
	for i:=1 to n do// Reset the levels
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
	i:=h[p];
	while i<>-1 do
		begin
			if (d[des[i]]+1=d[p]) and (flow[i]>0) then
				begin
					if f<flow[i] then
						tmp:=dfs(des[i],t,f)
					else
						tmp:=dfs(des[i],t,flow[i]);
					// To enable gap optimization, uncomment the block below
					{
					if tmp=-1 then// -1 means that a gap is found
						exit(-1);
					}
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
	// To enable gap optimization, uncomment the block below
	{
	dec(cnt[d[p]]);
	if cnt[d[p]]=0 then// A gap is found
		exit(-1);
	}
	d[p]:=n;
	i:=h[p];
	while i<>-1 do
		begin
			if (d[des[i]]+1<d[p]) and (flow[i]>0) then
				d[p]:=d[des[i]]+1;
			i:=nxt[i];
		end;
	exit(0);// To enable gap optimization, add "inc(cnt[d[p]]);" before exit
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
			// To enable gap optimization, uncomment the block below
			{
			for i:=0 to n do// Initialize the cnt array
				cnt[i]:=0;
			for i:=1 to n do
				inc(cnt[d[i]]);
			}
			while d[1]<n do// Run DFS until the start point and the end point is not connected
				begin
					tmp:=dfs(1,n,maxint);
					// To enable gap optimization, uncomment the block below
					{
					if tmp<0 then// Check if there is gap
						break;
					}
					ans:=ans+tmp;
				end;
			writeln('Case ',ti,': ',ans);
		end;
end.
