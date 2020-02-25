var
	l,r,a:integer;
begin
	read(l,r,a);
	if l>r then// We suppose that there are more right-handers
		begin
			l:=l+r;// l=l0+r0
			r:=l-r;// r=l0+r0-r0=l0
			l:=l-r;// l=l0+r0-l0=r0
		end;
	if l+a<r then// If there are not enough ambidexters
		write(2*(l+a))
	else
		write(2*(r+(a+l-r) div 2));
end.
