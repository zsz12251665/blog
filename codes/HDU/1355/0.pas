var
	p:array[1..50,1..50]of integer;
	t,ti,n,m,k,i,j,max_i,max_j,last_i,last_j:integer;
	sum:longint;
begin
	read(t);
	for ti:=1 to t do
		begin
			max_i:=1;// The coordinate of the tree with most peanuts
			max_j:=1;
			read(n,m,k);
			for i:=1 to n do
				for j:=1 to m do
					begin
						read(p[i,j]);
						if p[i,j]>p[max_i,max_j] then// Find the tree with most peanuts
							begin
								max_i:=i;
								max_j:=j;
							end;
					end;
			last_i:=0;// Decide the start point, it is the coordinate of the last visited tree
			last_j:=max_j;
			sum:=0;
			k:=k-abs(max_j-last_j)-1;// Calculate the extra time
			if max_i>last_i then// If max point isn't on the way back
				k:=k-(max_i-last_i)*2;
			while k>=0 do// Check if it's in the time constraint
				begin
					sum:=sum+p[max_i,max_j];
					p[max_i,max_j]:=0;
					last_i:=max_i;
					last_j:=max_j;
					max_i:=1;
					max_j:=1;
					for i:=1 to n do
						for j:=1 to m do
							if p[i,j]>p[max_i,max_j] then// Find the tree with most peanuts
								begin
									max_i:=i;
									max_j:=j;
								end;
					k:=k-abs(max_j-last_j)-1;// Calculate the extra time
					if max_i>last_i then// If max point isn't on the way back
						k:=k-(max_i-last_i)*2;
				end;
			writeln(sum);
		end;
end.
