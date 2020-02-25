var
	nation:array[1..300000]of longint;
	count,passenger:array[1..100001]of longint;
	time:array[1..100000]of longint;
	n,ans,queue,i,j:longint;
begin
	ans:=0;
	queue:=1;
	for i:=1 to 100001 do// Initialize the count array
		count[i]:=0;
	passenger[1]:=1;
	read(n);
	for i:=1 to n do
		begin
			read(time[i],passenger[i+1]);
			passenger[i+1]:=passenger[i]+passenger[i+1];
			for j:=passenger[i] to passenger[i+1]-1 do
				begin
					read(nation[j]);
					if count[nation[j]]=0 then// If there was no one else with this nationality, refresh the answer
						inc(ans);
					inc(count[nation[j]]);
				end;
			while time[queue]+86400<=time[i] do// Check whether the head ship is still in the interval
				begin
					for j:=passenger[queue] to passenger[queue+1]-1 do
						begin
							dec(count[nation[j]]);
							if count[nation[j]]<=0 then// If there was no one else with this nationality, refresh the answer
								dec(ans);
						end;
					inc(queue);
				end;
			writeln(ans);
		end;
end.
