var
	n,a,b,c,d,max,min:longint;
begin
	read(n,a,b,c,d);
	if a+c<a+b then// Update maximum pair values
		max:=a+b
	else
		max:=a+c;
	if max<b+d then
		max:=b+d;
	if max<c+d then
		max:=c+d;
	if a+c>a+b then// Update minimum pair values
		min:=a+b
	else
		min:=a+c;
	if min>b+d then
		min:=b+d;
	if min>c+d then
		min:=c+d;
	if max-min>n then// Pay attention to this situation
		write(0)
	else
		write(int64(n-max+min)*n);
end.
