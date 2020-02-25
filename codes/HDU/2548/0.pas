var
	t,i:integer;
	u,v,w,l:double;
begin
	read(t);
	for i:=1 to t do
		begin
			read(u,v,w,l);
			writeln(l/(u+v)*w:0:3);// In Pascal, the / operator returns a real number answer while the div operator returns an integer (And the div operator is only available for integers but not real numbers)
		end;
end.
