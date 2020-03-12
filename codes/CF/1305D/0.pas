	var
	d,h:array[1..1000]of integer;// d[i] is the degree of point i
	des,nxt:array[1..2000]of integer;
	n,p,q,i,j,lca:integer;
begin
	read(n);
	for i:=1 to n do
		begin
			d[i]:=0;
			h[i]:=-1;
		end;
	for i:=1 to n-1 do
		begin
			read(p,q);
			inc(d[p]);
			inc(d[q]);
			des[2*i-1]:=q;
			nxt[2*i-1]:=h[p];
			h[p]:=2*i-1;
			des[2*i]:=p;
			nxt[2*i]:=h[q];
			h[q]:=2*i;
		end;
	for i:=1 to n div 2 do// Send the queries
		begin
			p:=-1;// Find two leaf points
			for j:=1 to n do
				if d[j]=1 then
					begin
						if p=-1 then
							p:=j
						else
							begin
								q:=j;
								break;
							end;
					end;
			writeln('? ',p,' ',q);// Send the query
			flush(output);
			read(lca);
			if (p=lca) or (q=lca) then// LCA is one of the endpoints
				begin
					writeln('! ',lca);
					halt;
				end;
			d[p]:=-1;// Remove the points
			d[q]:=-1;
			j:=h[p];
			while j<>-1 do
				begin
					dec(d[des[j]]);
					j:=nxt[j];
				end;
			j:=h[q];
			while j<>-1 do
				begin
					dec(d[des[j]]);
					j:=nxt[j];
				end;
		end;
	for i:=1 to n do// Find the last point
		if d[i]>=0 then
			begin
				writeln('! ',i);
				halt;
			end;
end.
