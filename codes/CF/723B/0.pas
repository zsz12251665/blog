var
	s:string;
	n,i,cnt,max,tmp:integer;
	in_parentheses:boolean;
begin
	cnt:=0;
	max:=0;
	tmp:=0;
	in_parentheses:=false;
	readln(n);// For Pascal coders, it is a better choice to use readln while processing strings
	readln(s);
	for i:=1 to n do
		begin
			if s[i]='(' then
				begin
					if tmp>max then// Update the max length of words that is not in parentheses
						max:=tmp;
					tmp:=0;
					in_parentheses:=true;
					continue;
				end;
			if s[i]=')' then
				begin
					if tmp>0 then// Count the number of words that is in parentheses
						inc(cnt);
					tmp:=0;
					in_parentheses:=false;
					continue;
				end;
			if s[i]='_' then
				begin
					if not in_parentheses and (tmp>max) then// Update the max length of words that is not in parentheses
						max:=tmp;
					if in_parentheses and (tmp>0) then// Count the number of words that is in parentheses
						inc(cnt);
					tmp:=0;
					continue;
				end;
			inc(tmp);
		end;
	if tmp>max then// Update the max length of words that is not in parentheses
		max:=tmp;
	write(max,' ',cnt);
end.
