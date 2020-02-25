var
	finger:array[1..10000]of integer;
	used:array[1..10000]of boolean;
	n,m,i:integer;
function find(a:integer):integer;
var
	i:integer;
begin
	for i:=a+1 to n do
		if not used[i] then// If there is another finger that is not used
			exit(i);
	exit(-1);
end;
procedure add(a:integer);
begin
	used[finger[a]]:=false;
	if find(finger[a])=-1 then
		begin
			add(a-1);// Carry on the previous bit
			finger[a]:=find(0);// Find the smallest finger that is not used
		end
	else
		finger[a]:=find(finger[a]);
	used[finger[a]]:=true;
end;
begin
	read(n,m);
	for i:=1 to n do
		begin
			read(finger[i]);
			used[finger[i]]:=true;
		end;
	for i:=1 to m do// To add m, just add 1 for m times
		add(n);
	for i:=1 to n do
		write(finger[i],' ');
end.
