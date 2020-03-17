var
	u,v,d:array[1..100000]of longint;
	n,i,max_p,cnt:longint;// max_p is the node with maximum degree
begin
	max_p:=1;
	read(n);
	for i:=1 to n do
		d[i]:=0;
	for i:=1 to n-1 do
		begin
			read(u[i],v[i]);
			inc(d[u[i]]);
			inc(d[v[i]]);
			if d[u[i]]>d[max_p] then// Find the node with maximum degree
				max_p:=u[i];
			if d[v[i]]>d[max_p] then
				max_p:=v[i];
		end;
	if d[max_p]<3 then// The tree is a chain
		for i:=0 to n-2 do
			writeln(i)
	else
		begin
			cnt:=0;
			for i:=1 to n-1 do
				if (u[i]=max_p) or (v[i]=max_p) then// Allocate the minimum labels to the edges connecting to max_p
					begin
						writeln(cnt);
						inc(cnt);
					end
				else
					writeln(n-1-i+cnt);
		end;
end.
