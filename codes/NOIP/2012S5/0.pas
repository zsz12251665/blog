var
	left,right,min,lazytag:array[1..4000000]of longint;
	a:array[1..1000000]of longint;
	n,m,d,s,t,i:longint;
procedure init(l,r,p:longint);// Initialize the segment tree
begin
	left[p]:=l;
	right[p]:=r;
	lazytag[p]:=0;
	if l=r then
		begin
			min[p]:=a[l];
			exit;
		end;
	init(l,(l+r) div 2,2*p);
	init((l+r) div 2+1,r,2*p+1);
	if min[2*p]<min[2*p+1] then
		min[p]:=min[2*p]
	else
		min[p]:=min[2*p+1];
end;
procedure subtract(d,l,r,p:longint);
var
	mid:longint;
begin
	if (l=left[p]) and (r=right[p]) then// If the range is covered, set the lazytag
	begin
		min[p]:=min[p]-d;
		lazytag[p]:=lazytag[p]+d;
		exit;
	end;
	mid:=(left[p]+right[p]) div 2;
	if lazytag[p]<>0 then// Pass down the lazytag
		begin
			subtract(lazytag[p],left[p],mid,2*p);
			subtract(lazytag[p],mid+1,right[p],2*p+1);
			lazytag[p]:=0;
		end;
	if r<=mid then
		subtract(d,l,r,2*p);
	if l>mid then
		subtract(d,l,r,2*p+1);
	if (l<=mid) and (r>mid) then
		begin
			subtract(d,l,mid,2*p);
			subtract(d,mid+1,r,2*p+1);
		end;
	if min[2*p]<min[2*p+1] then
		min[p]:=min[2*p]
	else
		min[p]:=min[2*p+1];
end;
begin
	read(n,m);
	for i:=1 to n do
		read(a[i]);
	init(1,n,1);
	for i:=1 to m do
		begin
			read(d,s,t);
			subtract(d,s,t,1);
			if min[1]<0 then// if the classroom is not enough
				begin
					writeln(-1);
					write(i);
					halt;
				end;
		end;
	write(0);
end.
