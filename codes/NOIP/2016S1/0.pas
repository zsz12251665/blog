var
	face:array[1..100000]of integer;
	job:array[1..100000]of string;
	n,m,i,p,d,s:longint;
begin
	readln(n,m);
	for i:=1 to n do
		readln(face[i],job[i]);
	p:=1;// Start from the 1st toy
	for i:=1 to m do
		begin
			readln(d,s);
			if face[p]=d then
				p:=(p+n-s-1) mod n+1// Move clockwise
			else
				p:=(p+s-1) mod n+1;// Move counterclockwise
		end;
	writeln(copy(job[p],2,20));
end.
