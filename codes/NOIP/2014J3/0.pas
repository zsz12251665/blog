var
	n,i,j:integer;
	ans:longint;
begin
	read(n,i,j);
	ans:=0;
	while true do
		begin
			if i=1 then// At the top border
				begin
					ans:=ans+j;
					break;
				end;
			if i=n then// At the bottom border
				begin
					ans:=ans+3*n-1-j;
					break;
				end;
			if j=1 then// At the left border
				begin
					ans:=ans+4*n-2-i;
					break;
				end;
			if j=n then// At the right border
				begin
					ans:=ans+n-1+i;
					break;
				end;
			ans:=ans+4*n-4;// Solve the problem recursively
			n:=n-2;
			dec(i);
			dec(j);
		end;
	write(ans);
end.
