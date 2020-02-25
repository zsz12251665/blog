var
	p:array[1..20,1..20]of integer;
	n,m,k,i,j,sum,maxi,maxj,lasti,lastj:integer;
begin
	maxi:=1;// The coordinate of the tree with most peanuts
	maxj:=1;
	read(n,m,k);
	for i:=1 to n do
		for j:=1 to m do
			begin
				read(p[i,j]);
				if p[i,j]>p[maxi,maxj] then// Find the tree with most peanuts
					begin
						maxi:=i;
						maxj:=j;
					end;
			end;
	lasti:=0;// Decide the start point, it is the coordinate of the last visited tree
	lastj:=maxj;
	sum:=0;
	k:=k-abs(maxj-lastj)-1;// Calculate the extra time
	if maxi>lasti then// If max point isn't on the way back
		k:=k-(maxi-lasti)*2;
	while k>=0 do// Check if it's in the time constraint
		begin
			sum:=sum+p[maxi,maxj];
			p[maxi,maxj]:=0;
			lasti:=maxi;
			lastj:=maxj;
			maxi:=1;
			maxj:=1;
			for i:=1 to n do
				for j:=1 to m do
					if p[i,j]>p[maxi,maxj] then// Find the tree with most peanuts
						begin
							maxi:=i;
							maxj:=j;
						end;
			k:=k-abs(maxj-lastj)-1;// Calculate the extra time
			if maxi>lasti then// If max point isn't on the way back
				k:=k-(maxi-lasti)*2;
		end;
	write(sum);
end.
