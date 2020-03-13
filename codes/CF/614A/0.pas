var
	l,r,pwr:int64;
	k:longint;
begin
	pwr:=1;
	read(l,r,k);
	while l div pwr>=k do// l>=k*pwr, the loop continues until pwr<=l but pwr*k>l
		pwr:=k*pwr;
	if pwr=l then// If pwr==l, pwr is the first one, otherwise k*pwr is the first one
		write(pwr,' ')
	else
		if r div pwr<k then// r<k*pwr, k*pwr is not in range, so there is no such numbers
			begin
				write(-1);
				halt;
			end;
	while r div pwr>=k do// while r>=pwr*k, output pwr*k
		begin
			pwr:=k*pwr;
			write(pwr,' ');
		end;
end.
