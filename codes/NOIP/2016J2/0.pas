var
	m,d,count:integer;
	left,right,date:longint;
begin
	read(left,right);
	count:=0;
	for m:=1 to 12 do// Enumerate the month
		for d:=1 to 31 do// Enumerate the date
			begin
				if (m=2) and (d>29) or ((m=4) or (m=6) or (m=9) or (m=11)) and (d>30) then// Don't forget the short months
					continue;
				date:=d mod 10*1000+d div 10*100+m mod 10*10+m div 10;// Calculate the year
				date:=date*10000+m*100+d;// Get the complete date
				if (left<=date) and (right>=date) then
					inc(count);
			end;
	write(count);
end.
