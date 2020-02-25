var
	height,length:array[1..10000,1..10000]of integer;
	r,c,ans,i,j:integer;
function search(x,y:integer):integer;// Search function
var
	max:integer;
begin
	if length[x,y]<>0 then// If the point has been searched, return the answer
		exit(length[x,y]);
	max:=0;// Search the longest length
	if (x>1) and (height[x-1,y]<height[x,y]) and (search(x-1,y)>max) then
		max:=length[x-1,y];
	if (y>1) and (height[x,y-1]<height[x,y]) and (search(x,y-1)>max) then
		max:=length[x,y-1];
	if (x<r) and (height[x+1,y]<height[x,y]) and (search(x+1,y)>max) then
		max:=length[x+1,y];
	if (y<c) and (height[x,y+1]<height[x,y]) and (search(x,y+1)>max) then
		max:=length[x,y+1];
	length[x,y]:=max+1;// Do not forget to plus 1, or you'll forget to count this point
	exit(length[x,y]);
end;
begin
	read(r,c);
	for i:=1 to r do
		for j:=1 to c do
			begin
				length[i,j]:=0;// Initialize the length array
				read(height[i,j]);
			end;
	ans:=0;// Search the longest length of each point and keep the longest one
	for i:=1 to r do
		for j:=1 to c do
			if search(i,j)>ans then
				ans:=length[i,j];
	write(ans);
end.
