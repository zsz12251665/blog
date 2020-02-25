var
	win,lose:array[1..1000]of int64;// the array win keeps the winner list and the array lose keeps the loser list
	champion:int64;
	n,i,j:longint;
procedure getname(a:longint);// A function that keeps the name strings in integers so that it can be easily compared
var
	s:string;
	i:longint;
	p:int64;
begin
	win[a]:=0;
	lose[a]:=0;
	readln(s);
	p:=1;// Turn name strings to integers
	for i:=1 to pos(' ',s)-1 do
		begin
			win[a]:=win[a]+p*ord(s[i]);
			p:=p*128;
		end;
	p:=1;
	for i:=pos(' ',s)+1 to length(s) do
		begin
			lose[a]:=lose[a]+p*ord(s[i]);
			p:=p*128;
		end;
end;
begin
	readln(n);
	while n<>0 do
		begin
			for i:=1 to n do
				getname(i);
			for i:=1 to n do// Scan the array lose and array win to check if the winner used to lose a match
				for j:=1 to n do
					if win[j]=lose[i] then
						win[j]:=-1;
			champion:=-1;// champion=-1 means there is no champion
			for i:=1 to n do// Scan the array win to check if there are more than one champion or no champion
				if (win[i]<>-1) and (win[i]<>champion) then
					if champion=-1 then
						champion:=win[i]
					else
						begin
							champion:=-1;
							break;
						end;
				if champion=-1 then
					writeln('No')
				else
					writeln('Yes');
			readln(n);
		end;
end.
