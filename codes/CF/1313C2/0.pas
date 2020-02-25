var
	a,stack_c,stack_v:array[1..500000]of longint;// stack_c[i] is the number of the same elements, stack_v[i] is the value of the elements
	tot:array[1..500000]of int64;// tot[i] is the total number of floors with the peak at i
	n,i,size,cnt,ans:longint;
	sum:int64;// The total sum of the elements in the stack
begin
	read(n);
	for i:=1 to n do
		begin
			read(a[i]);
			tot[i]:=-a[i];// You will count a[i] twice in the following, so we subtract one in advance
		end;
	size:=0;
	sum:=0;
	for i:=1 to n do// From front to back
		begin
			cnt:=1;
			while (size>0) and (stack_v[size]>a[i]) do// Take the elements larger out to maintain the monotonicity
				begin
					cnt:=cnt+stack_c[size];
					sum:=sum-int64(stack_c[size])*stack_v[size];
					dec(size);
				end;
			inc(size);// Push the new element into the stack
			stack_c[size]:=cnt;
			stack_v[size]:=a[i];
			sum:=sum+int64(cnt)*a[i];
			tot[i]:=tot[i]+sum;
		end;
	size:=0;
	sum:=0;
	for i:=n downto 1 do// From back to front
		begin
			cnt:=1;
			while (size>0) and (stack_v[size]>a[i]) do// Take the elements larger out to maintain the monotonicity
				begin
					cnt:=cnt+stack_c[size];
					sum:=sum-int64(stack_c[size])*stack_v[size];
					dec(size);
				end;
			inc(size);// Push the new element into the stack
			stack_c[size]:=cnt;
			stack_v[size]:=a[i];
			sum:=sum+int64(cnt)*a[i];
			tot[i]:=tot[i]+sum;
		end;
	ans:=1;// Find the one with the largest total number of floors
	for i:=2 to n do
		if tot[i]>tot[ans] then
			ans:=i;
	for i:=ans-1 downto 1 do// Shape the answer
		if a[i+1]<a[i] then
			a[i]:=a[i+1];
	for i:=ans+1 to n do
		if a[i-1]<a[i] then
			a[i]:=a[i-1];
	for i:=1 to n do// Output the answer
		write(a[i],' ');
end.
