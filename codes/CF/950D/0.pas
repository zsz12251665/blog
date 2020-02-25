var
	n,x:int64;
	q,i:integer;
begin
	read(n,q);
	for i:=1 to q do
		begin
			read(x);
			while x mod 2=0 do// All number was in an odd-indexed cell at first, so we just need to retrospect the ones in even-indexed cell
				x:=n+x div 2;
			writeln((x+1) div 2);
		end;
end.
