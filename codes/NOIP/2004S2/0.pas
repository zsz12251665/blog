var
	fruit:array[1..20000]of longint;// To avoid overlimit, I made the fruit array twice larger
	n,size,i:integer;
	ans,tmp:longint;
procedure insert(a:longint);// The proceudure to insert a number into the fruit array
var
	i:integer;
	tmp:longint;
begin
	inc(size);
	fruit[size]:=a;
	i:=size;// Maintain the heap
	while (i>1) and (fruit[i]<fruit[i div 2]) do
		begin
			tmp:=fruit[i];
			fruit[i]:=fruit[i div 2];
			fruit[i div 2]:=tmp;
			i:=i div 2;
		end;
end;
function extract:longint;// The proceudure to extract the top from the fruit array
var
	i:integer;
	tmp:longint;
begin
	extract:=fruit[1];
	fruit[1]:=fruit[size];
	fruit[size]:=maxlongint;// Fill the null part with maxlongint
	dec(size);
	i:=1;// Maintain the heap
	while (fruit[i*2]<fruit[i]) or (fruit[i*2+1]<fruit[i]) do
		begin
			if fruit[i*2]<fruit[i*2+1] then
				i:=i*2
			else
				i:=i*2+1;
			tmp:=fruit[i];
			fruit[i]:=fruit[i div 2];
			fruit[i div 2]:=tmp;
		end;
end;
begin
	size:=0;
	ans:=0;
	read(n);
	for i:=1 to 2*n do// Fill the array with maxlongint
		fruit[i]:=maxlongint;
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
