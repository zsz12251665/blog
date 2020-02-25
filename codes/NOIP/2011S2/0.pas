var
	count,last:array[0..50]of longint;
	ans,n,i:longint;
	k,p,colour,cost:integer;
begin
	read(n,k,p);
	ans:=0;
	for colour:=0 to k-1 do// Initialize the arrays
		begin
			count[colour]:=0;
			last[colour]:=0;
		end;
	for i:=1 to n do
		begin
			read(colour,cost);
			inc(count[colour]);
			if cost<=p then
				begin
					last:=count;// Renew the last array
					ans:=ans+count[colour]-1;// Remember to minus 1 becuase they would not stay in the same hotel
				end
			else
				ans:=ans+last[colour];
		end;
	writeln(ans);
end.
