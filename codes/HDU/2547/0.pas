var
	t,i:integer;
	a,b,c,d:double;
begin// This problem does not need any comments to explain it
	read(t);
	for i:=1 to t do
		begin
			read(a,b,c,d);
			writeln(sqrt((a-c)*(a-c)+(b-d)*(b-d)):0:1);
		end;
end.
