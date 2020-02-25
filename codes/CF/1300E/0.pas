var
	p:array[1..1000000]of double;// p[i] is the numerator of the average
	q:array[1..1000000]of longint;// q[i] is the denominator of the average as well as the number of elements
	n,size,i,j,tmp:longint;// size is the number of elements inside the stack
begin
	size:=0;
	read(n);
	for i:=1 to n do
		begin
			inc(size);
			read(tmp);
			p[size]:=tmp;
			q[size]:=1;
			while (size>1) and (p[size]/q[size]<p[size-1]/q[size-1]) do// Average with the previous block
				begin
					p[size-1]:=p[size-1]+p[size];
					q[size-1]:=q[size-1]+q[size];
					dec(size);
				end;
		end;
	for i:=1 to size do
		for j:=1 to q[i] do
			writeln(p[i]/q[i]:0:10);
end.
