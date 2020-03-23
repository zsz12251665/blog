var
	b,d,s,tmp:int64;
begin
	read(b,d,s);
	if b<d then// Swap the variables to make sure b>=d>=s
		begin
			tmp:=b;
			b:=d;
			d:=tmp;
		end;
	if b<s then
		begin
			tmp:=b;
			b:=s;
			s:=tmp;
		end;
	if d<s then
		begin
			tmp:=d;
			d:=s;
			s:=tmp;
		end;
	tmp:=0;// Calculate the answer
	if d<b-1 then
		tmp:=tmp+b-1-d;
	if s<b-1 then
		tmp:=tmp+b-1-s;
	write(tmp);
end.
