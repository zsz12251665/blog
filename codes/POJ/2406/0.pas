var
	s:ansistring;
	i,j,len:longint;
	is_period:boolean;
begin
	readln(s);
	while s<>'.' do
		begin
			len:=length(s);
			for i:=1 to len do// Enumerate the length of a period
				if len mod i=0 then
					begin
						is_period:=true;
						for j:=1 to len do// Scan the whole string to check if it is a period
							if s[j]<>s[(j-1) mod i+1] then
								begin
									is_period:=false;
									break;
								end;
						if is_period then// The shortest period makes the biggest power index
							begin
								writeln(len div i);
								break;
							end;
					end;
			readln(s);
		end;
end.
