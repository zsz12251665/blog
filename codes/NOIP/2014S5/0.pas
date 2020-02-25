var
	h_nxt,f_nxt:array[1..200000]of longint;// the h arrays are the edges in the normal order, the f ones are the edges in the reverse order
	h,f:array[1..10000]of longint;
	h_des,f_des:array[1..200000]of integer;
	dis,status,queue:array[1..10000]of integer;
	inqueue:array[1..10000]of boolean;
	m,j:longint;
	n,s,t,i,p,head,foot:integer;
procedure mark(p:integer);// Mark the points that are linked to the destination
var
	i:longint;
begin
	i:=f[p];
	while i<>-1 do
		begin
			if status[f_des[i]]=0 then
				begin
					status[f_des[i]]:=1;
					mark(f_des[i]);
				end;
			i:=f_nxt[i];
		end;
end;
begin
	read(n,m);
	for i:=1 to n do// Initialize the arrays
		begin
			h[i]:=-1;// The sign of the end
			f[i]:=-1;
			status[i]:=0;// status[i]=1 means i is linked to t, status[i]=0 means it isn't, and status[i]>=10 means there is at least 1 point which is connected to i but not linked to t
			dis[i]:=maxint;
			inqueue[i]:=false;
		end;
	for j:=1 to m do
		begin
			read(f_des[j],h_des[j]);
			h_nxt[j]:=h[f_des[j]];// Insert the edges
			f_nxt[j]:=f[h_des[j]];
			h[f_des[j]]:=j;
			f[h_des[j]]:=j;
		end;
	read(s,t);
	status[t]:=1;
	mark(t);
	for i:=1 to n do// Mark the points that is connect to the points which are not linked to the destination
		begin
			j:=h[i];
			while j<>-1 do
				begin
					if status[h_des[j]] mod 10<>1 then
						begin
							status[i]:=status[i]+10;
							break;
						end;
					j:=h_nxt[j];
				end;
		end;
	dis[s]:=0;// Use SPFA to find the shortest path
	queue[1]:=s;
	inqueue[s]:=true;
	head:=1;
	foot:=2;
	while head<>foot do
		begin
			p:=queue[head];
			head:=head mod 10000+1;
			inqueue[p]:=false;
			j:=h[p];
			while j<>-1 do
				begin
					if (status[h_des[j]]=1) and (dis[h_des[j]]>dis[p]+1) then// Check if this point is optional
						begin
							if not inqueue[h_des[j]] then
								begin
									inqueue[h_des[j]]:=true;
									queue[foot]:=h_des[j];
									foot:=foot mod 10000+1;
								end;
							dis[h_des[j]]:=dis[p]+1;
						end;
					j:=h_nxt[j];
				end;
		end;
	if dis[t]=maxint then
		write(-1)
	else
		write(dis[t]);
end.
