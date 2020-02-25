var
	queue:array[1..3,1..8000000]of longint;// Don't worry about the memory because you are given 512 MB in this problem
	head,foot:array[1..3]of longint;
	n,m,u,v,i:longint;
	q,t,j,mx:integer;
	worm:int64;
procedure qsort(l,r:longint);
var
	x,y,tmp,std:longint;
begin
	x:=l;
	y:=r;
	std:=queue[1,(l+r) div 2];
	while x<y do
		begin
			while queue[1,x]>std do
				inc(x);
			while queue[1,y]<std do
				dec(y);
			if x<=y then
				begin
					tmp:=queue[1,x];
					queue[1,x]:=queue[1,y];
					queue[1,y]:=tmp;
					inc(x);
					dec(y);
				end;
		end;
	if l<y then
		qsort(l,y);
	if r>x then
		qsort(x,r);
end;
begin
	read(n,m,q,u,v,t);
	for i:=1 to n do
		read(queue[1,i]);
	qsort(1,n);
	head[1]:=1;// Initialize the queues
	head[2]:=1;
	head[3]:=1;
	foot[1]:=n;
	foot[2]:=0;
	foot[3]:=0;
	for i:=1 to m do
		begin
			worm:=-maxlongint;// Find the longest worm
			for j:=1 to 3 do
				if (head[j]<=foot[j]) and (worm<queue[j,head[j]]) then
					begin
						mx:=j;
						worm:=queue[j,head[j]];
					end;
			inc(head[mx]);
			worm:=worm+i*q-q;// Don't forget to add the length while not being cut
			if i mod t=0 then
				write(worm,' ');
			inc(foot[2]);// Push the two pieces into the queue
			inc(foot[3]);
			queue[2,foot[2]]:=worm*u div v-i*q;
			queue[3,foot[3]]:=worm-queue[2,foot[2]]-2*i*q;
		end;
	writeln;
	for i:=1 to n+m do
		begin
			worm:=-maxlongint;// Find the longest worm
			for j:=1 to 3 do
				if (head[j]<=foot[j]) and (worm<queue[j,head[j]]) then
					begin
						mx:=j;
						worm:=queue[j,head[j]];
					end;
			inc(head[mx]);
			worm:=worm+m*q;
			if i mod t=0 then
				write(worm,' ');
		end;
end.
