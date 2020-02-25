var
	a:array[1..1000]of longint;
	n,i,j,ans_i:integer;// ans_i is the index of the peak with the largest total number of floors
	min_a:longint;// The minimum value of a[i], used to make both sides of the peak monotonic but remained the array unchanged
	sum,ans_v:int64;// ans_v is the value of the largest total number of floors
begin
	ans_v:=0;
	read(n);
	for i:=1 to n do
		read(a[i]);
	for i:=1 to n do// Enumerate the peaks
		begin
			sum:=a[i];// Calculate the total number of floors
			min_a:=a[i];
			for j:=i-1 downto 1 do
				begin
					if a[j]<min_a then
						min_a:=a[j];
					sum:=sum+min_a;
				end;
			min_a:=a[i];
			for j:=i+1 to n do
				begin
					if a[j]<min_a then
						min_a:=a[j];
					sum:=sum+min_a;
				end;
			if sum>ans_v then// Take the largest one
				begin
					ans_v:=sum;
					ans_i:=i;
				end;
		end;
	for i:=ans_i-1 downto 1 do// Shape the answer
		if a[i+1]<a[i] then
			a[i]:=a[i+1];
	for i:=ans_i+1 to n do
		if a[i-1]<a[i] then
			a[i]:=a[i-1];
	for i:=1 to n do// Output the answer
		write(a[i],' ');
end.
