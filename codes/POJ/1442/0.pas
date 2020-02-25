var
	add,small,big:array[1..30000]of longint;
	get:array[1..30000]of integer;
	m,n,i,j,k:integer;
	tmp:longint;
procedure qsort(l,r:integer);// The quick sort is used to make sure the get operation in increasing order, it isn't necessary
var
	x,y,tmp,std:integer;
begin
	x:=l;
	y:=r;
	std:=get[(l+r) div 2];
	while x<y do
		begin
			while get[x]<std do
				inc(x);
			while get[y]>std do
				dec(y);
			if x<=y then
				begin
					tmp:=get[x];
					get[x]:=get[y];
					get[y]:=tmp;
					inc(x);
					dec(y);
				end;
		end;
	if l<y then
		qsort(l,y);
	if r>x then
		qsort(x,r);
end;
begin
	read(m,n);
	for i:=1 to m do
		read(add[i]);
	for j:=1 to n do
		read(get[j]);
	qsort(1,n);// Sort the get array
	j:=1;
	for i:=1 to m do
		begin
			if (j>1) and (add[i]<big[1]) then// The ADD request which started with checking if the new element should be put into the big-root heap
				begin
					small[i-j+1]:=big[1];// Put the root element of the big-root heap into the small-root heap
					k:=i-j+1;
					while (k>1) and (small[k]<small[k div 2]) do
						begin
							tmp:=small[k];
							small[k]:=small[k div 2];
							small[k div 2]:=tmp;
							k:=k div 2;
						end;
					big[1]:=add[i];// Replace the root element of the big-root heap with the new element
					k:=1;
					while (2*k<j) and (big[k]<big[2*k]) or (2*k+1<j) and (big[k]<big[2*k+1]) do
						begin
							if (2*k+1<j) and (big[2*k]<big[2*k+1]) then
								k:=2*k+1
							else
								k:=2*k;
							tmp:=big[k];
							big[k]:=big[k div 2];
							big[k div 2]:=tmp;
						end;
				end
			else
				begin
					small[i-j+1]:=add[i];// Simply add the new element into the small-root heap
					k:=i-j+1;
					while (k>1) and (small[k]<small[k div 2]) do
						begin
							tmp:=small[k];
							small[k]:=small[k div 2];
							small[k div 2]:=tmp;
							k:=k div 2;
						end;
				end;
			while i=get[j] do// The GET request
				begin
					writeln(small[1]);// Output the asking element
					big[j]:=small[1];// Put the root element of the small-root heap into the big-root heap
					k:=j;
					while (k>1) and (big[k]>big[k div 2]) do
						begin
							tmp:=big[k];
							big[k]:=big[k div 2];
							big[k div 2]:=tmp;
							k:=k div 2;
						end;
					small[1]:=small[i-j+1];// Remove the root element of the small-root heap
					k:=1;
					while (2*k<i-j+1) and (small[k]>small[2*k]) or (2*k+1<i-j+1) and (small[k]>small[2*k+1]) do
						begin
							if (2*k+1<i-j+1) and (small[2*k]>small[2*k+1]) then
								k:=2*k+1
							else
								k:=2*k;
							tmp:=small[k];
							small[k]:=small[k div 2];
							small[k div 2]:=tmp;
						end;
					inc(j);
				end;
			if j>n then
				halt;
		end;
end.
