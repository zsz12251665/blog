var
	a,queue,index:array[1..1000000]of longint;
	head,foot,n,k,i:longint;
begin
	read(n,k);
	for i:=1 to n do
		read(a[i]);
	head:=1;
	foot:=1;
	for i:=1 to k-1 do
		begin
			while (foot>head) and (a[i]<queue[foot-1]) do// Pop out the nodes in the end to keep the queue monotonous
				dec(foot);
			queue[foot]:=a[i];
			index[foot]:=i;
			inc(foot);
		end;
	for i:=k to n do
		begin
			while (foot>head) and (a[i]<queue[foot-1]) do// Pop out the nodes in the end to keep the queue monotonous
				dec(foot);
			queue[foot]:=a[i];
			index[foot]:=i;
			inc(foot);
			if index[head]<=i-k then// Pop out the node that has been out of the range
				inc(head);
			write(queue[head],' ');
		end;
	writeln;
	head:=1;
	foot:=1;
	for i:=1 to k-1 do
		begin
			while (foot>head) and (a[i]>queue[foot-1]) do// Pop out the nodes in the end to keep the queue monotonous
				dec(foot);
			queue[foot]:=a[i];
			index[foot]:=i;
			inc(foot);
		end;
	for i:=k to n do
		begin
			while (foot>head) and (a[i]>queue[foot-1]) do// Pop out the nodes in the end to keep the queue monotonous
				dec(foot);
			queue[foot]:=a[i];
			index[foot]:=i;
			inc(foot);
			if index[head]<=i-k then// Pop out the node that has been out of the range
				inc(head);
			write(queue[head],' ');
		end;
end.
