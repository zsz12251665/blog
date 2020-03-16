var
	s:array[1..100]of string;
	n,i,j,t:integer;
	ans:longint;
begin
	readln(n);
	for i:=1 to n do
		readln(s[i]);
	ans:=0;
	for i:=1 to n do
		begin
			t:=0;// Count the number of chocolates in the i-th row
			for j:=1 to n do
				if s[i][j]='C' then
					inc(t);
			ans:=ans+t*(t-1) div 2;
			t:=0;// Count the number of chocolates in the i-th column
			for j:=1 to n do
				if s[j][i]='C' then
					inc(t);
			ans:=ans+t*(t-1) div 2;
		end;
	write(ans);
end.
