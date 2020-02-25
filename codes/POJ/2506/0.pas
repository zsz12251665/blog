var
	ans:array[0..250,1..100]of integer;// ans[i,j] is the j-th bit of ans[i] from the right
	i,j,tmp:integer;
	start:boolean;
begin
	for i:=0 to 1 do// Initialize ans[0] and ans[1]
		for j:=1 to 100 do
			ans[i,j]:=0;
	ans[0,1]:=1;
	ans[1,1]:=1;
	for i:=2 to 250 do// Pretreat ans[2] to ans[250]
		begin
			tmp:=0;// High precision addition
			for j:=1 to 100 do
				begin
					tmp:=tmp+2*ans[i-2,j]+ans[i-1,j];// ans[i]=2*ans[i-2]+ans[i-1]
					ans[i,j]:=tmp mod 10;
					tmp:=tmp div 10;
				end;
		end;
	while not EOF do
		begin
			readln(i);
			start:=false;
			for j:=100 downto 1 do
				begin
					if not start and(ans[i,j]=0) then// Remove the prefix made up of 0
						continue;
					start:=true;
					write(ans[i,j]);
				end;
			writeln;
		end;
end.
