var
	j,f,cj,cf:array[1..1000]of integer;// The array cf and cj are used to save a copy in merge sort
	m,n,i:integer;
	ans:longint;
procedure msort(l,r:integer);
var
	x,y:integer;
begin
	if l>=r then
		exit;
	msort(l,(l+r) div 2);
	msort((l+r) div 2+1,r);
	cj:=j;
	cf:=f;
	x:=l;
	y:=(l+r) div 2+1;
	for i:=l to r do
		begin
			if x>(l+r) div 2 then
				begin
					j[i]:=cj[y];
					f[i]:=cf[y];
					inc(y);
					continue;
				end;
			if y>r then
				begin
					j[i]:=cj[x];
					f[i]:=cf[x];
					inc(x);
					continue;
				end;
			if cj[x]*cf[y]>cj[y]*cf[x] then// Not using (cj[x]/cf[x])>(cj[y]/cj[y]) is to avoid dividing 0
				begin
					j[i]:=cj[x];
					f[i]:=cf[x];
					inc(x);
				end
			else
				begin
					j[i]:=cj[y];
					f[i]:=cf[y];
					inc(y);
				end;
		end;
end;
begin
	read(m,n);
	while (m<>-1) and (n<>-1) do
		begin
			for i:=1 to n do
				read(j[i],f[i]);
			msort(1,n);
			ans:=0;
			i:=1;
			while (i<=n) and (m>f[i]) do// Take the JavaBeans from high rewards to low ones
				begin
					ans:=ans+j[i];
					m:=m-f[i];
					inc(i);
				end;
			if i<=n then
				writeln(ans+m/f[i]*j[i]:0:3)
			else
				writeln(ans,'.000');// Do not forget the 3 numbers after the digit
			read(m,n);
		end;
end.
