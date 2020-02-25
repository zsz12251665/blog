var
	field,parent,queue:array[0..24]of integer;// To make the queue smaller, we use one-dimensional array with (x,y)=field[5x+y]
	head,foot,i:integer;
procedure show(a:integer);// Print the answer in reverse order by the function stack
begin
	if a<>0 then
		show(parent[a]);
	writeln('(',a div 5,', ',a mod 5,')');
end;
begin
	for i:=0 to 24 do
		begin
			read(field[i]);
			if field[i]=1 then
				parent[i]:=-2
			else
				parent[i]:=-1;
		end;
	queue[0]:=0;
	parent[0]:=0;
	head:=0;
	foot:=1;
	while head<foot do// Make the BFS tree
		begin
			if (queue[head] mod 5>0) and (parent[queue[head]-1]=-1) then
				begin
					queue[foot]:=queue[head]-1;
					parent[queue[head]-1]:=queue[head];
					inc(foot);
				end;
			if (queue[head] mod 5<4) and (parent[queue[head]+1]=-1) then
				begin
					queue[foot]:=queue[head]+1;
					parent[queue[head]+1]:=queue[head];
					inc(foot);
				end;
			if (queue[head] div 5>0) and (parent[queue[head]-5]=-1) then
				begin
					queue[foot]:=queue[head]-5;
					parent[queue[head]-5]:=queue[head];
					inc(foot);
				end;
			if (queue[head] div 5<4) and (parent[queue[head]+5]=-1) then
				begin
					queue[foot]:=queue[head]+5;
					parent[queue[head]+5]:=queue[head];
					inc(foot);
				end;
			inc(head);
		end;
	show(24);// Print the path
end.
