var
	t,ti,n,a,i,ans,sum:integer;
begin
	read(t);
	for ti:=1 to t do
		begin
			ans:=0;
			sum:=0;
			read(n);
			for i:=1 to n do
				begin
					read(a);
					if a=0 then// Maintain the product is not 0
						begin
							inc(ans);
							inc(sum);
						end
					else
						sum:=sum+a;
				end;
			if sum=0 then// Maintain the sum is not 0
				inc(ans);
			writeln(ans);
		end;
end.
