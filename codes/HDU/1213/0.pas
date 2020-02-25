var
	uf_set:array[1..1000]of integer;// The array uf_set is the union find set
	is_counted:array[1..1000]of boolean;
	t,ti,n,m,sum,i,a,b:integer;
function find(a:integer):integer;
begin
	if uf_set[a]<>a then
		uf_set[a]:=find(uf_set[a]);
	exit(uf_set[a]);
end;
begin
	read(t);
	for ti:=1 to t do
		begin
			sum:=0;
			read(n,m);
			for i:=1 to n do// Initialize the arrays
				begin
					uf_set[i]:=i;
					is_counted[i]:=false;
				end;
			for i:=1 to m do
				begin
					read(a,b);
					uf_set[find(a)]:=find(b);// Merge the sets
				end;
			for i:=1 to n do// Count the number of the tables
				if not is_counted[find(i)] then
					begin
						is_counted[find(i)]:=true;
						inc(sum);
					end;
			writeln(sum);
		end;
end.
