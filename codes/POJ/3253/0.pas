var
	plank:array[1..20000]of int64;
	n,size,i:integer;
	ans,tmp:int64;
procedure insert(a:int64);// Insert a number into the plank array
var
	i:integer;
	tmp:int64;
begin
	inc(size);
	plank[size]:=a;
	i:=size;// Maintain the heap
	while (i>1) and (plank[i]<plank[i div 2]) do
		begin
			tmp:=plank[i];
			plank[i]:=plank[i div 2];
			plank[i div 2]:=tmp;
			i:=i div 2;
		end;
end;
function extract:int64;// Extract the top from the plank array
var
	i:integer;
	tmp:int64;
begin
	extract:=plank[1];
	plank[1]:=plank[size];
	dec(size);
	i:=1;// Maintain the heap
	while (2*i<=size) and ((plank[2*i]<plank[i]) or (plank[2*i+1]<plank[i])) do
		if (2*i+1<=size) and (plank[2*i]>plank[2*i+1]) then
			begin
				tmp:=plank[i];
				plank[i]:=plank[2*i+1];
				i:=2*i+1;
				plank[i]:=tmp;
			end
		else
			begin
				tmp:=plank[i];
				plank[i]:=plank[2*i];
				i:=2*i;
				plank[i]:=tmp;
			end;
end;
begin
	size:=0;
	ans:=0;
	read(n);
	for i:=1 to n do
		begin
			read(tmp);
			insert(tmp);
		end;
	for i:=1 to n-1 do
		begin
			tmp:=extract+extract;
			ans:=ans+tmp;
			insert(tmp);
		end;
	write(ans);
end.
