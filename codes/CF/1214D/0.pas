var
	map:array[1..1000000]of boolean;
	a:array[1..1000000,1..4]of boolean;
	n,m,i,j:longint;
	s:ansistring;
procedure search(p:longint;mode:integer);
begin
	a[p,mode]:=true;
	case mode of
		1:// Search from start to end
			begin
				if (p mod m>0) and map[p+1] and not a[p+1,1] then// Check a to avoid visiting once again
					search(p+1,1);
				if (p+m<=n*m) and map[p+m] and not a[p+m,1] then
					search(p+m,1);
			end;
		2:// Search from end to start
			begin
				if (p mod m<>1) and map[p-1] and not a[p-1,2] then
					search(p-1,2);
				if (p-m>0) and map[p-m] and not a[p-m,2] then
					search(p-m,2);
			end;
		3:// Search with n first
			if (p+m<=n*m) and map[p+m] and a[p+m,1] and a[p+m,2] then
				search(p+m,3)
			else
				if (p mod m>0) and map[p+1] and a[p+1,1] and a[p+1,2] then
					search(p+1,3);
		4:// Search with m first
			if (p mod m>0) and map[p+1] and a[p+1,1] and a[p+1,2] then
				search(p+1,4)
			else
				if (p+m<=n*m) and map[p+m] and a[p+m,1] and a[p+m,2] then
					search(p+m,4);
	end;
end;
begin
	readln(n,m);
	for i:=0 to n-1 do
		begin
			readln(s);
			for j:=1 to m do
				begin
					map[i*m+j]:=s[j]='.';
					a[i*m+j,1]:=false;
					a[i*m+j,2]:=false;
					a[i*m+j,3]:=false;
					a[i*m+j,4]:=false;
				end;
		end;
	search(1,1);// Search from start to end
	if not a[n*m,1] then// If the treasure is already unreachable, output 0 and exit
		begin
			write(0);
			halt;
		end;
	search(n*m,2);// Search from end to start
	search(1,3);// Search with n first
	search(1,4);// Search with m first
	for i:=2 to n*m-1 do// Find the common cell except the start and the end
		if a[i,3] and a[i,4] then
			begin
				write(1);
				halt;
			end;
	write(2);
end.
