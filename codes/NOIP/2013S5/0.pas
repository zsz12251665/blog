var
	n,i,h,rise,drop,lh,lrise,ldrop:longint;// We just need h[i] and h[i-1], so we can scroll it by h and lh, etc.
begin
	lrise:=1;
	ldrop:=1;
	read(n,lh);// Take the first one will not make the answer worse either
	for i:=2 to n do
		begin
			read(h);
			rise:=1;
			drop:=1;
			if h>lh then
				rise:=ldrop+1
			else
				rise:=lrise;
			if h<lh then
				drop:=lrise+1
			else
				drop:=ldrop;
			lh:=h;// Scroll the space
			ldrop:=drop;
			lrise:=rise;
		end;
	if ldrop>lrise then// Compare the lengths
		write(ldrop)
	else
		write(lrise);
end.
