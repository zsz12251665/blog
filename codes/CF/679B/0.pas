var
	m,x:int64;
	h,a:longint;
function cube(a:longint):int64;
begin
	exit(int64(a)*a*a);
end;
function count(m:int64):longint;// Count how many blocks can be added at most
var
	a:longint;
begin
	if m<8 then
		exit(m);
	a:=1;
	while cube(a+1)<=m do
		inc(a);
	if cube(a)-1-cube(a-1)>m-cube(a) then// Choose the situation with the maximum volume remained
		exit(1+count(cube(a)-1-cube(a-1)))
	else
		exit(1+count(m-cube(a)));
end;
begin
	x:=0;
	h:=0;
	read(m);
	while m>0 do// m is the volume remained
		begin
			inc(h);
			a:=1;// find the biggest cube
			while cube(a+1)<=m do
				inc(a);
			if count(cube(a)-1-cube(a-1))>count(m-cube(a)) then// Choose the tallest solution
				begin
					m:=cube(a)-1-cube(a-1);
					x:=x+cube(a-1);
				end
			else
				begin
					m:=m-cube(a);
					x:=x+cube(a);
				end;
		end;
	write(h,' ',x);
end.
