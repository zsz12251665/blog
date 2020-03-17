var
	u,v:int64;
begin
	read(u,v);
	if u=v then
		begin
			if u=0 then
				write(0)
			else
				begin
					writeln(1);
					write(u);
				end;
			halt;
		end;
	if (u>v) or ((v-u) mod 2=1) then// (v-u) is not positive and even
		begin
			write(-1);
			halt;
		end;
	v:=(v-u) div 2;
	if (v and u)=0 then
		begin
			writeln(2);
			write(u+v,' ',v);
		end
	else
		begin
			writeln(3);
			write(u,' ',v,' ',v);
		end;
end.
