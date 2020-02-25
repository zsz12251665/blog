var
	done:array[1..4,1..4]of boolean;
	i,j,k,ans:integer;
	handle:string;
begin
	for i:=1 to 4 do// Initialize the done array
		for j:=1 to 4 do
			done[i,j]:=false;
	for i:=1 to 4 do
		begin
			readln(handle);
			for j:=1 to 4 do
				if handle[j]='+' then// Scan the handles
					begin
						for k:=1 to 4 do
							begin
								done[i,k]:=not done[i,k];
								done[k,j]:=not done[k,j];
							end;
						done[i,j]:=not done[i,j];// In the for-loop, (i,j) has been done twice, so add once more can keep that all the seven handles is done
					end;
		end;
	ans:=0;
	for i:=1 to 4 do// Count the number
		for j:=1 to 4 do
			if done[i,j] then
				inc(ans);
	writeln(ans);
	for i:=1 to 4 do
		for j:=1 to 4 do
			if done[i,j] then
				writeln(i,' ',j);
end.
