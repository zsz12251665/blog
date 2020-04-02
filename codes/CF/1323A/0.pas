var
	t,ti,n,a,ans,i:integer;
begin
	read(t);
	for ti:=1 to t do
		begin
			read(n);
			ans:=-1;// ans shows the position of the even number (-1 means there is no even number)
			for i:=1 to n do
				begin
					read(a);
					if a mod 2=0 then
						ans:=i;
				end;
			if ans<>-1 then// There is an even number
				begin
					writeln(1);
					writeln(ans);
				end
			else
				if n=1 then// Only a single odd number provided
					writeln(-1)
				else// More than 1 odd numbers
					begin
						writeln(2);
						writeln('1 2');
					end;
		end;
end.
