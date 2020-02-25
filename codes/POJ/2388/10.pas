var
	counter:array[1..1000000]of integer;
	milk:longint;
	n,i,tmp:integer;
begin
	for milk:=1 to 1000000 do
		counter[milk]:=0;
	read(n);
	for i:=1 to n do
		begin
			read(milk);
			inc(counter[milk]);
		end;
	tmp:=0;
	for milk:=1 to 1000000 do// Replace this line with "for milk:=1000000 downto 1 do" to sort in decrease order
		if tmp+counter[milk]>n div 2 then
			begin
				write(milk);
				halt;
			end
		else
			tmp:=tmp+counter[milk];
end.
