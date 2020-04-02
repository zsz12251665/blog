type
	arr=array[1..40000]of longint;// In order to pass the array as parameter, we'd better define a type for it
var
	a,b,cnt_a,cnt_b:arr;
	n,m,k,i,len_a,len_b,i_a,i_b:longint;
	ans:int64;
	tmp:integer;
procedure qsort(var a:arr;l,r:longint);// Sort the array in decrasing order
var
	x,y,tmp,std:longint;
begin
	x:=l;
	y:=r;
	std:=a[(l+r) div 2];
	while x<y do
		begin
			while a[x]>std do
				inc(x);
			while a[y]<std do
				dec(y);
			if x<=y then
				begin
					tmp:=a[x];
					a[x]:=a[y];
					a[y]:=tmp;
					inc(x);
					dec(y);
				end;
		end;
	if l<y then
		qsort(a,l,y);
	if r>x then
		qsort(a,x,r);
end;
begin
	read(n,m,k);
	len_a:=1;// Calculate the number of consecutive 1s
	len_b:=1;
	a[1]:=0;
	b[1]:=0;
	for i:=1 to n do
		begin
			read(tmp);
			if (tmp=0) and (a[len_a]>0) then
				begin
					inc(len_a);
					a[len_a]:=0;
				end;
			if tmp=1 then
				inc(a[len_a]);
		end;
	if a[len_a]=0 then
		dec(len_a);
	for i:=1 to m do
		begin
			read(tmp);
			if (tmp=0) and (b[len_b]>0) then
				begin
					inc(len_b);
					b[len_b]:=0;
				end;
			if tmp=1 then
				inc(b[len_b]);
		end;
	if b[len_b]=0 then
		dec(len_b);
	qsort(a,1,len_a);
	qsort(b,1,len_b);
	n:=1;// Combine the consecutive 1s with same length together
	m:=1;
	cnt_a[1]:=0;
	cnt_b[1]:=0;
	for i:=1 to len_a do
		if a[i]=a[n] then
			inc(cnt_a[n])
		else
			begin
				inc(n);
				cnt_a[n]:=1;
				a[n]:=a[i];
			end;
	if cnt_a[n]=0 then
		dec(n);
	for i:=1 to len_b do
		if b[i]=b[m] then
			inc(cnt_b[m])
		else
			begin
				inc(m);
				cnt_b[m]:=1;
				b[m]:=b[i];
			end;
	if cnt_b[m]=0 then
		dec(m);
	ans:=0;
	for i:=1 to trunc(sqrt(k)) do// Enumerate the height and width and calculate the number of subrectangles filled with 1s
		if i*i=k then
			for i_a:=1 to n do
				if a[i_a]<i then
					break
				else
					for i_b:=1 to m do
						if b[i_b]<i then
							break
						else
							ans:=ans+int64(a[i_a]-i+1)*(b[i_b]-i+1)*cnt_a[i_a]*cnt_b[i_b]
		else
			if k mod i=0 then
				begin
					for i_a:=1 to n do// i*(k div i)
						if a[i_a]<i then
							break
						else
							for i_b:=1 to m do
								if b[i_b]<k div i then
									break
								else
									ans:=ans+int64(a[i_a]-i+1)*(b[i_b]-k div i+1)*cnt_a[i_a]*cnt_b[i_b];
					for i_a:=1 to n do// (k div i)*i
						if a[i_a]<k div i then
							break
						else
							for i_b:=1 to m do
								if b[i_b]<i then
									break
								else
									ans:=ans+int64(a[i_a]-k div i+1)*(b[i_b]-i+1)*cnt_a[i_a]*cnt_b[i_b];
				end;
	write(ans);
end.
