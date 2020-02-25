var
	sum,tmp:double;
	i:integer;
begin
	sum:=0;
	for i:=1 to 12 do
		begin
			read(tmp);
			sum:=sum+tmp;
		end;
	write('$',sum/12:0:2);// In pascal write(sum:0:2); prints the sum with 2 digits and take the place of 0 chars. But if the length is over 0, this part makes no sence
end.
