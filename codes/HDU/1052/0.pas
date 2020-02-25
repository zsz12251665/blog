var
	copy,king,tian:array[1..1000]of integer;// The array copy is used to save a copy in merge sort
	n,i,ans,king_best,tian_best,king_worst,tian_worst:integer;
procedure msort(l,r:integer);
var
	x,y:integer;
begin
	if l>=r then
		exit;
	msort(l,(l+r) div 2);
	msort((l+r) div 2+1,r);
	copy:=king;
	x:=l;
	y:=(l+r) div 2+1;
	for i:=l to r do
		begin
			if x>(l+r) div 2 then
				begin
					king[i]:=copy[y];
					inc(y);
					continue;
				end;
			if y>r then
				begin
					king[i]:=copy[x];
					inc(x);
					continue;
				end;
			if copy[x]<copy[y] then
				begin
					king[i]:=copy[y];
					inc(y);
				end
			else
				begin
					king[i]:=copy[x];
					inc(x);
				end;
		end;
	copy:=tian;// We sort the array king and array tian at the same time here
	x:=l;
	y:=(l+r) div 2+1;
	for i:=l to r do
		begin
			if x>(l+r) div 2 then
				begin
					tian[i]:=copy[y];
					inc(y);
					continue;
				end;
			if y>r then
				begin
					tian[i]:=copy[x];
					inc(x);
					continue;
				end;
			if copy[x]<copy[y] then
				begin
					tian[i]:=copy[y];
					inc(y);
				end
			else
				begin
					tian[i]:=copy[x];
					inc(x);
				end;
		end;
end;
begin
	read(n);
	while n<>0 do
		begin
			for i:=1 to n do
				read(tian[i]);
			for i:=1 to n do
				read(king[i]);
			msort(1,n);
			ans:=0;
			king_best:=1;
			tian_best:=1;
			king_worst:=n;
			tian_worst:=n;
			for i:=1 to n do// The greedy part
				begin
 					if tian[tian_worst]>king[king_worst] then
						begin
							inc(ans);
							dec(tian_worst);
							dec(king_worst);
							continue;
						end;
					if tian[tian_worst]<king[king_worst] then
						begin
							dec(ans);
							dec(tian_worst);
							inc(king_best);
							continue;
						end;
					if tian[tian_best]>king[king_best] then
						begin
							inc(ans);
							inc(tian_best);
							inc(king_best);
							continue;
						end;
					if tian[tian_worst]<king[king_best] then
						dec(ans);
					if tian[tian_worst]>king[king_best] then
						inc(ans);
					dec(tian_worst);
					inc(king_best);
				end;
			writeln(ans*200);
			read(n);
		end;
end.
