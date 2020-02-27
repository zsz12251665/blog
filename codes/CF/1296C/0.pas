type
	node=record
		i,x,y:longint;// i is the index, x and y is the coodinate of the robot
	end;
var
	a:array[0..200000]of node;
	s:ansistring;
	t,ti:integer;
	n,i,ans:longint;
procedure qsort(l,r:longint);// Sort in increasing order of (x,y,i)
var
	x,y:longint;
	tmp,std:node;
begin
	x:=l;
	y:=r;
	std:=a[(l+r) div 2];
	while x<y do
		begin
			while (a[x].x<std.x) or (a[x].x=std.x) and ((a[x].y<std.y) or (a[x].y=std.y) and (a[x].i<std.i)) do
				inc(x);
			while (a[y].x>std.x) or (a[y].x=std.x) and ((a[y].y>std.y) or (a[y].y=std.y) and (a[y].i>std.i)) do
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
	readln(t);
	for ti:=1 to t do
		begin
			readln(n);
			readln(s);
			a[0].i:=0;// Record the index and coodinate
			a[0].x:=0;
			a[0].y:=0;
			for i:=1 to n do
				begin
					a[i]:=a[i-1];
					a[i].i:=i;
					case s[i] of
						'L':
							dec(a[i].x);
						'R':
							inc(a[i].x);
						'U':
							inc(a[i].y);
						'D':
							dec(a[i].y);
					end;
				end;
			qsort(0,n);
			ans:=-1;// ans is the index of the answer in the array, -1 means there are not answer yet
			for i:=1 to n do
				if (a[i].x=a[i-1].x) and (a[i].y=a[i-1].y) then// Share the same coodinate
					if (ans=-1) or (a[i].i-a[i-1].i<a[ans].i-a[ans-1].i) then// Update the answer
						ans:=i;
			if ans=-1 then
				writeln(-1)
			else
				writeln(a[ans-1].i+1,' ',a[ans].i);
		end;
end.
