var
	next,visit:array[1..200000]of longint;
	n,min,i,t,last,p:longint;
begin
	min:=maxlongint;
	read(n);
	for i:=1 to n do
		begin
			read(next[i]);
			visit[i]:=-1;// Initialize the visit array
		end;
	t:=1;
	last:=0;// last is used check whether the path we found is a circle
	for i:=1 to n do
		if visit[i]=-1 then
			begin
				p:=i;
				while visit[p]=-1 do// When we reach a point visited, stop the loop
					begin
						visit[p]:=t;
						p:=next[p];
						inc(t);
					end;
				if (visit[p]>last) and (min>t-visit[p]) then// visit[p]<last means we've visited this point in a previous round
					min:=t-visit[p];
				last:=t-1;
			end;
	write(min);
end.
