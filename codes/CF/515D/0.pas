var
	field:array[1..2000,1..2000]of char;
	dx,dy:array[1..4]of integer;
	n,m,i,j:integer;
	is_unique:boolean;
	s:ansistring;
function check(x,y:integer):boolean;// Check if it is a slot
var
	i,cnt:integer;
begin
	cnt:=0;
	for i:=1 to 4 do
		if (x+dx[i]>0) and (x+dx[i]<=n) and (y+dy[i]>0) and (y+dy[i]<=m) and (field[x+dx[i],y+dy[i]]='.') then
			inc(cnt);
	exit(cnt=1);
end;
procedure update(x,y:integer);
var
	i:integer;
begin
	for i:=1 to 4 do// Find the right direction to fill the slot with a tile
		if (x+dx[i]>0) and (x+dx[i]<=n) and (y+dy[i]>0) and (y+dy[i]<=m) and (field[x+dx[i],y+dy[i]]='.') then
			begin
				if i=1 then
					begin
						field[x,y]:='^';
						field[x+dx[i],y+dy[i]]:='v';
					end;
				if i=2 then
					begin
						field[x,y]:='v';
						field[x+dx[i],y+dy[i]]:='^';
					end;
				if i=3 then
					begin
						field[x,y]:='<';
						field[x+dx[i],y+dy[i]]:='>';
					end;
				if i=4 then
					begin
						field[x,y]:='>';
						field[x+dx[i],y+dy[i]]:='<';
					end;
				x:=x+dx[i];
				y:=y+dy[i];
				break;
			end;
	for i:=1 to 4 do// Check if there are any new slot around
		if (x+dx[i]>0) and (x+dx[i]<=n) and (y+dy[i]>0) and (y+dy[i]<=m) and (field[x+dx[i],y+dy[i]]='.') and check(x+dx[i],y+dy[i]) then
			update(x+dx[i],y+dy[i]);
end;
begin
	dx[1]:=1;
	dx[2]:=-1;
	dx[3]:=0;
	dx[4]:=0;
	dy[1]:=0;
	dy[2]:=0;
	dy[3]:=1;
	dy[4]:=-1;
	readln(n,m);
	for i:=1 to n do
		begin
			readln(s);// String and char array are different in Pascal, so you need to separate the chars
			for j:=1 to m do
				field[i,j]:=s[j];
		end;
	for i:=1 to n do// Find the point with 1 edge remains and fill it with a tile
		for j:=1 to m do
			if (field[i,j]='.') and check(i,j) then
				update(i,j);
	is_unique:=true;// Check if there are any point empty
	for i:=1 to n do
		for j:=1 to m do
			if field[i,j]='.' then
				is_unique:=false;
	if is_unique then
		for i:=1 to n do
			begin
				s:='';// Due to the large amount of data, you need to recombine the char array as an string or you will get an ILE
				for j:=1 to m do
					s:=s+field[i,j];
				writeln(s);
			end
	else
		write('Not unique');
end.
