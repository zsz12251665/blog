var
	v:array[1..100]of char;// The array v keeps the variable names
	s:string;
	c:array[1..100]of integer;
	t,l,complexity,depth,max,a,b,i,j:integer;// depth means the depth of the loops
	err:boolean;
begin
	read(t);
	while t>0 do
		begin
			read(l);
			readln(s);
			if s=' O(1)' then// Read the time complexity
				complexity:=0
			else
				val(copy(s,6,length(s)-6),complexity);// val(s,n) is a procedure which turns a string s into a number and save it in n
			err:=false;
			depth:=1;
			max:=0;
			for i:=1 to l do
				begin
					readln(s);
					if err then
						continue;
					if s='E' then// Quit a loop
						begin
							dec(depth);
							if depth<0 then
								err:=true;
							continue;
						end;
					v[depth]:=s[3];// Read the variable name
					for j:=1 to depth-1 do// Check if there are two same variable names
						if v[j]=v[depth] then
							begin
								err:=true;
								break;
							end;
					if err then
						continue;
					s:=copy(s,5,length(s));
					if copy(s,1,pos(' ',s)-1)='n' then
						a:=1000
					else
						val(copy(s,1,pos(' ',s)-1),a);
					if copy(s,pos(' ',s)+1,length(s))='n' then
						b:=1000
					else
						val(copy(s,pos(' ',s)+1,length(s)),b);
					if depth=1 then
						c[depth]:=0
					else
						c[depth]:=c[depth-1];
					if (c[depth]>-1) and (b=1000) and (a<>b) then// The loop increase the time complexity
						inc(c[depth]);
					if a>b then// The loop won't run
						c[depth]:=-1;
					if c[depth]>max then
						max:=c[depth];
					inc(depth);
				end;
			if (depth<>1) or err then
				writeln('ERR')
			else
				if max=complexity then
					writeln('Yes')
				else
					writeln('No');
			dec(t);
		end;
end.
