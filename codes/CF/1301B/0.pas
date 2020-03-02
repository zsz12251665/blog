var
	a:array[1..200000] of longint;
	t,ti:integer;
	n,min_a,max_a,m,k,i:longint;
begin
	read(t);
	for ti:=1 to t do
		begin
			max_a:=0;
			min_a:=1000000000;// You cannot use 2147483647 to initialize min_a in this problem. Otherwise if all a[i] is -1, the answer will be larger than 10^9. And it can also prevent k from overlimit
			read(n);
			for i:=1 to n do
				read(a[i]);
			for i:=1 to n do// Find the range of the elements beside -1
				if a[i]=-1 then
					begin
						if (i>1) and (a[i-1]<>-1) then
							begin
								if a[i-1]>max_a then
									max_a:=a[i-1];
								if a[i-1]<min_a then
									min_a:=a[i-1];
							end;
						if (i<n) and (a[i+1]<>-1) then
							begin
								if a[i+1]>max_a then
									max_a:=a[i+1];
								if a[i+1]<min_a then
									min_a:=a[i+1];
							end;
					end;
			k:=(max_a+min_a) div 2;
			m:=0;
			if a[1]=-1 then
				a[1]:=k;
			for i:=2 to n do// Calculate the maximum absolute difference
				begin
					if a[i]=-1 then
						a[i]:=k;
					if m<abs(a[i]-a[i-1]) then
						m:=abs(a[i]-a[i-1]);
				end;
			writeln(m,' ',k);
		end;
end.
