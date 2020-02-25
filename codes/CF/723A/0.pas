var
	a,b,c,tmp:integer;
begin
	read(a,b,c);// We use a0, b0, c0 to represent the original value of a, b, c
	if a<b then// Using another variable
		begin
			tmp:=a;// tmp=a0
			a:=b;// a=b0
			b:=tmp;// b=tmp=a0
		end;
	if b<c then// Using the bit operator xor
		begin
			b:=b xor c;// b=b0 xor c0
			c:=b xor c;// c=(b0 xor c0) xor c0=b0
			b:=b xor c;// b=(b0 xor c0) xor b0=c0
		end;
	if a<b then// Using the sum
		begin
			a:=a+b;// a=a0+b0
			b:=a-b;// b=(a0+b0)-b0=a0
			a:=a-b;// a=(a0+b0)-a0=b0
		end;
	write(a-c);
end.
