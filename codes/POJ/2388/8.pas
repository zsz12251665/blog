var
	milk:array[1..10000]of longint;
	n,i,j:integer;
	tmp:longint;
begin
	read(n);
	for i:=1 to n do
		begin
			read(milk[i]);
			j:=i;
			while (j>1) and (milk[j div 2]>milk[j]) do// Replace this line with "while (j>1) and (milk[j div 2]<milk[j]) do" to sort in decrease order
				begin
					tmp:=milk[j];
					milk[j]:=milk[j div 2];
					milk[j div 2]:=tmp;
					j:=j div 2;
				end;
		end;
	for i:=1 to n div 2 do
		begin
			milk[1]:=milk[n-i+1];
			j:=1;
			while (2*j<n-i+1) and (milk[j]>milk[2*j]) or (2*j+1<n-i+1) and (milk[j]>milk[2*j+1]) do// Replace this line with "while (2*j<n-i+1) and (milk[j]<milk[2*j]) or (2*j+1<n-i+1) and (milk[j]<milk[2*j+1]) do" to sort in decrease order
				begin
					if (2*j+1<n-i+1) and (milk[2*j]>milk[2*j+1]) then// Replace this line with "if (2*j+1<n-i+1) and (milk[2*j]<milk[2*j+1]) then" to sort in decrease order
						j:=2*j+1
					else
						j:=2*j;
					tmp:=milk[j];
					milk[j]:=milk[j div 2];
					milk[j div 2]:=tmp;
				end;
		end;
	write(milk[1]);
end.
