uses math;// We need to use the max function and the min function in math
var
	k:array[0..128,0..128]of longint;
	d,n,i,j,x,y,cnt:integer;
	ans,sum:int64;
begin
	cnt:=0;
	ans:=0;
	read(d,n);
	for i:=0 to 128 do// Initialize the k array
		for j:=0 to 128 do
			k[i,j]:=0;
	for i:=1 to n do
		begin
			read(x,y);
			read(k[x,y]);
		end;
	for x:=0 to 128 do// Enumerate the transmitter
		for y:=0 to 128 do
			begin
				sum:=0;// Calculate the sum of the matrix with the center of (x,y)
				for i:=max(0,x-d) to min(128,x+d) do// To avoid the array overlimited, we use the max function and the min function
					for j:=max(0,y-d) to min(128,y+d) do
						sum:=sum+k[i,j];
				if sum=ans then// Count the number of the solution
					inc(cnt);
				if sum>ans then// Update the best solution
					begin
						ans:=sum;
						cnt:=1;// Reset the counter
					end;
			end;
	write(cnt,' ',ans);
end.
