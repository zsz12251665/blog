var
	tree:array[0..10000]of boolean;
	l,m,ans,s,e,i,j:integer;
begin
	read(l);
	for i:=0 to l do// Initialize the tree array
		tree[i]:=true;
	read(m);
	for i:=1 to m do
		begin
			read(s,e);
			for j:=s to e do// Cut the trees down
				tree[j]:=false;
		end;
	ans:=0;
	for i:=0 to l do// Count the number of the trees
		if tree[i] then
			inc(ans);
	write(ans);
end.
