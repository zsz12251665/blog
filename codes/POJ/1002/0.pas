var
	count:array[0..9999999]of longint;
	s:string;
	n,i,tmp:longint;
	j:integer;
	no_duplicates:boolean;
begin
	fillchar(count,sizeof(count),0);// Initialize the counter
	readln(n);
	for i:=1 to n do
		begin
			readln(s);
			tmp:=0;// Decode the telephone number
			for j:=1 to length(s) do
				case s[j] of// A convenient thing in Pascal is that you can use commas to combine some cases together
					'0':
						tmp:=tmp*10;
					'1':
						tmp:=tmp*10+1;
					'2','A','B','C':
						tmp:=tmp*10+2;
					'3','D','E','F':
						tmp:=tmp*10+3;
					'4','G','H','I':
						tmp:=tmp*10+4;
					'5','J','K','L':
						tmp:=tmp*10+5;
					'6','M','N','O':
						tmp:=tmp*10+6;
					'7','P','R','S':
						tmp:=tmp*10+7;
					'8','T','U','V':
						tmp:=tmp*10+8;
					'9','W','X','Y':
						tmp:=tmp*10+9;
				end;
			inc(count[tmp]);// Update the counter
		end;
	no_duplicates:=true;
	for i:=0 to 9999999 do// Find duplicated numbers
		if count[i]>1 then
			begin
				writeln(i div 1000000,i div 100000 mod 10,i div 10000 mod 10,'-',i div 1000 mod 10,i div 100 mod 10,i div 10 mod 10,i mod 10,' ',count[i]);// Print the number bit by bit
				no_duplicates:=false;
			end;
	if no_duplicates then
		write('No duplicates.');
end.
