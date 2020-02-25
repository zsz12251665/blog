var
	s:ansistring;
	n:integer;
function traversal(l,r:integer):char;// The function of recursion
var
	lc,rc:char;
begin
	if l=r then// If it is a leaf node, return it
		if s[l]='0' then
			begin
				write('B');
				exit('B');
			end
		else
			begin
				write('I');
				exit('I');
			end;
	lc:=traversal(l,(l+r-1) div 2);// Get the childern nodes by recursion
	rc:=traversal((l+r-1) div 2+1,r);
	if lc=rc then// Decide what the parent node should be
		begin
			write(lc);
			exit(lc);
		end
	else
		begin
			write('F');
			exit('F');
		end;
end;
function power(n:integer):integer;// Calculate 2^n
begin
	power:=1;
	while n>0 do
		begin
			dec(n);
			power:=power*2;
		end;
end;
begin
	readln(n);
	readln(s);
	n:=ord(traversal(1,power(n)));// Though we don't need the return of the traversal function at last, it is better to collect the return in Pascal
end.
