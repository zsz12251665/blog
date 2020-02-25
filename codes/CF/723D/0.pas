var
	island:array[1..50,1..50]of integer;
	lake:array[1..2500,1..3]of integer;// lake[i,1] is the x coordinate, lake[i,2] is the y coordinate, lake[i,3] is the size
	cnt,n,m,k,i,j,ans:integer;
	s:string;
procedure qsort(l,r:integer);// Sort the lakes according to their sizes
var
	x,y,std,tmp:integer;
begin
	x:=l;
	y:=r;
	std:=lake[(l+r) div 2,3];
	while x<y do
		begin
			while lake[x,3]<std do
				inc(x);
			while lake[y,3]>std do
				dec(y);
			if x<=y then
				begin
					tmp:=lake[x,1];// Exchange the information of lakes
					lake[x,1]:=lake[y,1];
					lake[y,1]:=tmp;
					tmp:=lake[x,2];
					lake[x,2]:=lake[y,2];
					lake[y,2]:=tmp;
					tmp:=lake[x,3];
					lake[x,3]:=lake[y,3];
					lake[y,3]:=tmp;
					inc(x);
					dec(y);
				end;
		end;
	if l<y then
		qsort(l,y);
	if r>x then
		qsort(x,r);
end;
function search(x,y:integer):integer;// Search the whole district to get the size of the lake
var
	tmp:integer;
begin
	if (island[x+1][y]=-10000) or (island[x-1][y]=-10000) or (island[x][y+1]=-10000) or (island[x][y-1]=-10000) then// If it is next to the sea, it is the sea too
		exit(-10000);
	island[x,y]:=-2;// Mark the water that has been counted
	tmp:=1;
	if island[x+1,y]=0 then// Search the water around
		tmp+=search(x+1,y);
	if island[x-1,y]=0 then
		tmp+=search(x-1,y);
	if island[x,y+1]=0 then
		tmp+=search(x,y+1);
	if island[x,y-1]=0 then
		tmp+=search(x,y-1);
	if tmp<0 then// If it is connected to water which is next to the sea, it is the sea too
		exit(-10000);
	exit(tmp);
end;
procedure fill(x,y,mark,key:integer);// Fill the lake with the mark and the key is the mark which it used to be
begin
	island[x,y]:=mark;
	if island[x+1,y]=key then
		fill(x+1,y,mark,key);
	if island[x-1,y]=key then
		fill(x-1,y,mark,key);
	if island[x,y+1]=key then
		fill(x,y+1,mark,key);
	if island[x,y-1]=key then
		fill(x,y-1,mark,key);
end;
begin
	cnt:=0;
	ans:=0;
	readln(n,m,k);
	for i:=1 to n do// Read the map of the island
		begin
			readln(s);
			for j:=1 to m do
				if s[j]='*' then// -1 means land, -10000 means sea, 0 means water
					island[i,j]:=-1
				else
					if (i=1) or (j=1) or (i=n) or (j=m) then
						island[i,j]:=-10000
					else
						island[i,j]:=0;
		end;
	for i:=1 to n do// Find all the lakes on the island
		for j:=1 to m do
			if island[i,j]=0 then
				begin
					fill(i,j,search(i,j),-2);
					if island[i,j]>0 then// Keep the information of lakes
						begin
							inc(cnt);
							lake[cnt,1]:=i;
							lake[cnt,2]:=j;
							lake[cnt,3]:=island[i,j];
						end;
				end;
	qsort(1,cnt);
	for i:=1 to cnt-k do// Fill the smallest lakes with land
		begin
			ans:=ans+lake[i,3];
			fill(lake[i,1],lake[i,2],-1,lake[i,3]);
		end;
	writeln(ans);
	for i:=1 to n do
		begin
			for j:=1 to m do
				if island[i,j]=-1 then
					write('*')
				else
					write('.');
			writeln;
		end;
end.
