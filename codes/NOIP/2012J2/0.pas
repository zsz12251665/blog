var
	num:array[1..10000,0..100]of longint;
	floor:array[1..10000,0..100]of integer;
	count:array[1..10000]of integer;// The count array is used to record the rooms with stairs on this floor
	n,m,x,ans,i,j,t:integer;
begin
	read(n,m);
	for i:=1 to n do
		begin
			count[i]:=0;
			for j:=0 to m-1 do
				begin
					read(floor[i,j],num[i,j]);
					count[i]:=count[i]+floor[i][j];
				end;
		end;
	ans:=0;
	read(x);
	for i:=1 to n do// Searching the right stairs to the upper floor
		begin
			ans:=(ans+num[i][x]) mod 20123;
			t:=(num[i][x]-1) mod count[i]+1;// It's here where we reduce the time searching by taking the remainder
			while t-floor[i,x]>0 do
				begin
					t:=t-floor[i,x];
					x:=(x+1) mod m;
				end;
		end;
	write(ans);
end.
