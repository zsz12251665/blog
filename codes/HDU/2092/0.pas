var
	p,q,i:integer;
begin
	read(p,q);
	while (p<>0) or (q<>0) do
		begin
			if p*p-4*q<0 then// If p*p-4*q<0, there won't be a square root
				writeln('No')
			else
				for i:=0 to 10002 do// 10002*10002=100040004>10000*10000+4*10000
					begin
						if i*i=p*p-4*q then
							begin
								writeln('Yes');
								break;
							end;
						if i*i>p*p-4*q then
							begin
								writeln('No');
								break;
							end;
					end;
			read(p,q);
		end;
end.
