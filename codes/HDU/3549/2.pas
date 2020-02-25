var
	h,pre,q:array[1..15]of integer;// The pre array is used to record from which edge the point is
	des,nxt,flow:array[1..2000]of integer;
	visited:array[1..15]of boolean;
	n,m,t,ti,u,v,w,i,tmp:integer;
	ans:longint;
function bfs(s,t:integer):integer;// f is the maximum flow available from the start point to point p
var
	head,foot,i,j,p,ans:integer;
begin
	head:=1;
	foot:=2;
	for i:=1 to n do
		begin
			pre[i]:=-1;
			visited[i]:=false;
		end;
	q[1]:=s;// Push the start point into the queue
	visited[s]:=true;
	while head<>foot do
		begin
			p:=q[head];
			head:=head mod 15+1;
			i:=h[p];
			while i<>-1 do
				begin
					if not visited[des[i]] and (flow[i]>0) then// Find a new point
						begin
							visited[des[i]]:=true;
							pre[des[i]]:=i;
							if des[i]=t then// Reach the end point
								begin
									ans:=maxint;
									j:=pre[t];// Trace back to find the bottleneck edge
									while j<>-1 do
										begin
											if ans>flow[j] then
												ans:=flow[j];
											if j mod 2=1 then
												j:=pre[des[j+1]]
											else
												j:=pre[des[j-1]];
										end;
									j:=pre[t];
									while j<>-1 do
										begin
											flow[j]:=flow[j]-ans;// Update the edge
											if j mod 2=1 then// Update the inverse edge
												begin
													flow[j+1]:=flow[j+1]+ans;
													j:=pre[des[j+1]];
												end
											else
												begin
													flow[j-1]:=flow[j-1]+ans;
													j:=pre[des[j-1]];
												end;
										end;
									exit(ans);
								end;
							q[foot]:=des[i];// Push it into the queue
							foot:=foot mod 15+1;
						end;
					i:=nxt[i];
				end;
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
			tmp:=bfs(1,n);
			while tmp>0 do// Keep trying until we cannot find a new augment path
				begin
					ans:=ans+tmp;
					tmp:=bfs(1,n);
				end;
			writeln('Case ',ti,': ',ans);
		end;
end.
