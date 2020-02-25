var
	cash,save,spend,i:integer;
begin
	cash:=0;
	save:=0;
	for i:=1 to 12 do
		begin
			read(spend);
			cash:=cash+300-spend;
			if cash<0 then// Judge whether the money is enough or not
				begin
					write('-',i);
					halt;
				end;
			save:=save+cash div 100;// Save the hundreds of money
			cash:=cash mod 100;
		end;
	cash:=cash+save*120;
	write(cash);
end.
