var
	des,nxt:array[1..400000]of longint;
	h:array[1..200000]of longint;
	w:array[1..200000]of integer;
	n,i,j,u,v,sum,max:longint;// sum is the sum of the united weights, max is the maximum united weight
	first,second,linear,square:integer;// first keeps the first biggest weight and second keeps the second one
begin
	read(n);
	for i:=1 to n do// Initialize the adjacency table
		h[i]:=-1;
	for i:=1 to n-1 do
		begin
			read(u,v);
			des[2*i-1]:=v;// Put both sides of the edge into adjacency table
			des[2*i]:=u;
			nxt[2*i-1]:=h[u];
			nxt[2*i]:=h[v];
			h[u]:=2*i-1;
			h[v]:=2*i;
		end;
	for i:=1 to n do
		read(w[i]);
	sum:=0;
	max:=0;
	for i:=1 to n do
		begin
			linear:=0;
			square:=0;
			first:=-1;
			second:=-1;
			j:=h[i];
			while j<>-1 do
				begin
					if first<w[des[j]] then// Update the maximum two numbers
						begin
							second:=first;
							first:=w[des[j]];
						end
					else
						if second<w[des[j]] then
							second:=w[des[j]];
					linear:=(linear+w[des[j]]) mod 10007;// Update the linear sum
					square:=(square+w[des[j]]*w[des[j]]) mod 10007;// Update the square sum
					j:=nxt[j];
				end;
			if first*second>max then
				max:=first*second;
			sum:=(sum+linear*linear-square) mod 10007;// Adding the sum
		end;
	write(max,' ',sum);
end.
