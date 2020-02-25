var
	apple:array[1..10]of integer;
	h,i,ans:integer;
begin
	for i:=1 to 10 do// Get the apples
		read(apple[i]);
	read(h);
	ans:=0;
	for i:=1 to 10 do// Count the apples
		if h+30>=apple[i] then
			inc(ans);
	write(ans);
end.
