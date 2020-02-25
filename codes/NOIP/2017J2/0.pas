var
	book:array[1..1000]of longint;
	n,q,i,j,tmp:integer;
	reader,ans:longint;
function match(book,reader:longint):boolean;
begin
	while reader>0 do
		begin
			if (book mod 10<>reader mod 10) or (book=0) then// If the index doesn't match or the length of the book index is too short
				exit(false);
			book:=book div 10;// Move a bit forward
			reader:=reader div 10;
		end;
	exit(true);
end;
begin
	read(n,q);
	for i:=1 to n do
		read(book[i]);
	for i:=1 to q do
		begin
			ans:=maxlongint;
			read(tmp,reader);
			for j:=1 to n do// Enumerate the books to find the right one
				if (match(book[j],reader)) and (book[j]<ans) then// If the index doesn't match or the length of the book index is too short
					ans:=book[j];
				if ans=maxlongint then
					ans:=-1;
				writeln(ans);
		end;
end.
