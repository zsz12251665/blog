var
	a:array[1..100]of integer;
	unable:array[1..25000]of boolean;
	t,n,ans,i,j:integer;
procedure qsort(l,r:integer);
var
	x,y,tmp,std:integer;
begin
	x:=l;
	y:=r;
	std:=a[(l+r) div 2];
	while x<y do
		begin
			while a[x]<std do
				inc(x);
			while a[y]>std do
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
		qsort(l,y);
	if r>x then
		qsort(x,r);
end;
begin
	read(t);
	while t>0 do
		begin
			for i:=1 to 25000 do// Initialize the unable array
				unable[i]:=true;
			read(n);
			for i:=1 to n do
				read(a[i]);
			qsort(1,n);
			ans:=0;
			for i:=1 to n do
				if unable[a[i]] then
					begin
						inc(ans);
						unable[a[i]]:=false;
						for j:=1 to 25000-a[i] do// Update the unable array
							if not unable[j] then
								unable[j+a[i]]:=false;
					end;
			writeln(ans);
			dec(t);
		end;
end.
