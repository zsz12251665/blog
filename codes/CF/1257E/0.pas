var
	num,l:array[1..200000]of longint;
	a,b,c,len,i:longint;
procedure qsort(l,r:longint);// Sort the array num in increasing order
var
	x,y,tmp,std:longint;
begin
	x:=l;
	y:=r;
	std:=num[(l+r) div 2];
	while x<y do
		begin
			while num[x]<std do
				inc(x);
			while num[y]>std do
				dec(y);
			if x<=y then
				begin
					tmp:=num[x];
					num[x]:=num[y];
					num[y]:=tmp;
					inc(x);
					dec(y);
				end;
		end;
	if l<y then
		qsort(l,y);
	if r>x then
		qsort(x,r);
end;
function find(a,b,p:longint):longint;// Find the position to be replaced
begin
	if a>b then
		exit(a);
	if p>l[(a+b) div 2] then
		exit(find((a+b) div 2+1,b,p))
	else
		exit(find(a,(a+b) div 2-1,p));
end;
begin
	read(a,b,c);
	for i:=1 to a+b+c do
		read(num[i]);
	qsort(1,a);// Sort everyone's problems to make sure their problems are increasing
	qsort(a+1,a+b);
	qsort(a+b+1,a+b+c);
	len:=1;// Searching for the longest increasing sequence
	l[1]:=num[1];
	for i:=2 to a+b+c do
		if num[i]>l[len] then
			begin
				inc(len);
				l[len]:=num[i];
			end
		else
			l[find(1,len,num[i])]:=num[i];
	write(a+b+c-len);
end.
