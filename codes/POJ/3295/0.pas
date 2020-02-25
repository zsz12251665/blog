var
	stack:array[1..100]of integer;
	wff:string;
procedure solve;
var
	p,q,r,s,t,top,i:integer;
begin
	for p:=0 to 1 do// Enumerate every possible group of (p,q,r,s,t)
		for q:=0 to 1 do
			for r:=0 to 1 do
				for s:=0 to 1 do
					for t:=0 to 1 do
						begin
							top:=1;
							for i:=length(wff) downto 1 do// Do not forget to scan from end to start since it's a prefix expression
								case wff[i] of
									'p':
										begin
											stack[top]:=p;// Add number into the stack
											inc(top);
										end;
									'q':
										begin
											stack[top]:=q;
											inc(top);
										end;
									'r':
										begin
											stack[top]:=r;
											inc(top);
										end;
									's':
										begin
											stack[top]:=s;
											inc(top);
										end;
									't':
										begin
											stack[top]:=t;
											inc(top);
										end;
									'K':
										begin
											dec(top);
											stack[top-1]:=stack[top]*stack[top-1];// Calculate the answer and add it back to the stack
										end;
									'A':
										begin
											dec(top);
											stack[top-1]:=1-(1-stack[top])*(1-stack[top-1]);
										end;
									'N':
										stack[top-1]:=1-stack[top-1];
									'C':
										begin
											dec(top);
											if (stack[top]=1) and (stack[top-1]=0) then
												stack[top-1]:=0
											else
												stack[top-1]:=1;
										end;
									'E':
										begin
											dec(top);
											if stack[top]=stack[top-1] then
												stack[top-1]:=1
											else
												stack[top-1]:=0;
										end;
								end;
							if stack[top-1]=0 then
								begin
									writeln('not');
									exit;
								end;
						end;
	writeln('tautology');
end;
begin
	readln(wff);
	while wff<>'0' do
		begin
			solve;// There are over 5 loops, so an exit in another function can simplify the code
			readln(wff);
		end;
end.
