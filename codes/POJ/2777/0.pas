var
	left,right,colour:array[1..262144]of longint;
	lazytag:array[1..262144]of integer;
	l,o,i,a,b,cset:longint;
	t:integer;
	s:char;
procedure init(p,l,r:longint);// Build and initialize the segment tree
begin
	left[p]:=l;
	right[p]:=r;
	colour[p]:=1 shl 1;
	lazytag[p]:=0;
	if l=r then
		exit;
	init(2*p,l,(l+r) div 2);
	init(2*p+1,(l+r) div 2+1,r);
end;
procedure change(p,l,r:longint;c:integer);// The setting operation
var
	mid:longint;
begin
	if (l=left[p]) and (r=right[p]) then// If the range is covered, set the lazytag (that's why the operation is O(lg(n)))
		begin
			colour[p]:=1 shl c;
			if l<>r then
				lazytag[p]:=c;
			exit;
		end;
	mid:=(left[p]+right[p]) div 2;
	if lazytag[p]<>0 then// Pass down the lazytag
		begin
			change(2*p,left[p],mid,lazytag[p]);
			change(2*p+1,mid+1,right[p],lazytag[p]);
			lazytag[p]:=0;
		end;
	if r<=mid then
		change(2*p,l,r,c);
	if l>mid then
		change(2*p+1,l,r,c);
	if (l<=mid) and (r>mid) then
		begin
			change(2*p,l,mid,c);
			change(2*p+1,mid+1,r,c);
		end;
	colour[p]:=(colour[2*p]) or (colour[2*p+1]);// Update the colour state
end;
function search(p,l,r:longint):longint;// The asking operation
var
	mid:longint;
begin
	if (lazytag[p]<>0) or (l=left[p]) and (r=right[p]) then// Lazytag exists means the range is in the same colour, so we don't need to search
		exit(colour[p]);
	mid:=(left[p]+right[p]) div 2;
	if r<=mid then
		exit(search(2*p,l,r));
	if l>mid then
		exit(search(2*p+1,l,r));
	if (l<=mid) and (r>mid) then
		exit((search(2*p,l,mid)) or (search(2*p+1,mid+1,r)));
end;
begin
	read(l,t,o);
	init(1,1,l);// Build and initialize the segment tree
	for i:=1 to o do
		begin
			read(s);
			while (s<>'C') and (s<>'P') do
				read(s);
			if s='C' then// The setting operation
				begin
					read(a,b,t);
					change(1,a,b,t);
				end;
			if s='P' then// The asking operation
				begin
					read(a,b);
					cset:=search(1,a,b);
					t:=0;// Count the number of colours
					while cset<>0 do
						begin
							t:=t+cset mod 2;
							cset:=cset div 2;
						end;
					writeln(t);
				end;
		end;
end.
