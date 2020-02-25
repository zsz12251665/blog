var
	sum:array[1..262144]of int64;
	arr:array[1..100000]of longint;
	left,right,lazytag:array[1..262144]of longint;
	n,q,i,a,b:longint;
	c:integer;
	s:char;
procedure init(p,l,r:longint);// Build and initialize the segment tree
begin
	left[p]:=l;
	right[p]:=r;
	lazytag[p]:=0;
	if l=r then
		begin
			sum[p]:=arr[l];
			exit;
		end;
	init(2*p,l,(l+r) div 2);
	init(2*p+1,(l+r) div 2+1,r);
	sum[p]:=sum[2*p]+sum[2*p+1];
end;
procedure add(p,l,r,c:longint);// The adding operation
var
	mid:longint;
begin
	sum[p]:=sum[p]+int64(c)*(r-l+1);// Update the sum and remember to use int64
	if (l=left[p]) and (r=right[p]) then
		begin
			if l<>r then// Add the lazytag
				lazytag[p]:=lazytag[p]+c;
			exit;
		end;
	mid:=(left[p]+right[p]) div 2;
	if lazytag[p]<>0 then// Pass down the lazytag
		begin
			add(2*p,left[p],mid,lazytag[p]);
			add(2*p+1,mid+1,right[p],lazytag[p]);
			lazytag[p]:=0;
		end;
	if r<=mid then
		add(2*p,l,r,c);
	if l>mid then
		add(2*p+1,l,r,c);
	if (l<=mid) and (r>mid) then
		begin
			add(2*p,l,mid,c);
			add(2*p+1,mid+1,r,c);
		end;
end;
function search(p,l,r:longint):int64;// The searching operation
var
	mid:longint;
begin
	if (l=left[p]) and (r=right[p]) then
		exit(sum[p]);
	mid:=(left[p]+right[p]) div 2;
	if lazytag[p]<>0 then// Pass down the lazytag
		begin
			add(2*p,left[p],mid,lazytag[p]);
			add(2*p+1,mid+1,right[p],lazytag[p]);
			lazytag[p]:=0;
		end;
	if r<=mid then
		exit(search(2*p,l,r));
	if l>mid then
		exit(search(2*p+1,l,r));
	if (l<=mid) and (r>mid) then
		exit(search(2*p,l,mid)+search(2*p+1,mid+1,r));
end;
begin
	read(n,q);
	for i:=1 to n do
		read(arr[i]);
	init(1,1,n);// Build and initialize the segment tree
	for i:=1 to q do
		begin
			read(s);
			while (s<>'C') and (s<>'Q') do
				read(s);
			if s='C' then// The adding operation
				begin
					read(a,b,c);
					add(1,a,b,c);
				end;
			if s='Q' then// The searching operation
				begin
					read(a,b);
					writeln(search(1,a,b));
				end;
		end;
end.
