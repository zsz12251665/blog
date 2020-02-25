var
	time,queue:array[0..100000]of longint;// The time array is used to mark if it is visited and keep the time to reach
	head,foot,tmp,n,k,t:longint;
begin
	for t:=0 to 100000 do// Initialize the time array
		time[t]:=-1;
	read(n,k);
	t:=0;
	head:=0;
	foot:=1;
	time[n]:=0;
	queue[head]:=n;
	tmp:=foot;// tmp is used to keep the end of the queue of this minute
	while true do
		begin
			inc(t);
			while head<> tmp do
				begin
					if queue[head]=k then// If FJ has come to k, print the time and halt
						begin
							write(time[queue[head]]);
							halt;
						end;
					if (queue[head]<100000) and (time[queue[head]+1]=-1) then
						begin
							time[queue[head]+1]:=t;
							queue[foot]:=queue[head]+1;
							foot:=(foot+1) mod 100000;// Don't forget to modulo 100000 to avoid getting over array limit
						end;
					if (queue[head]>-1) and (time[queue[head]-1]=-1) then
						begin
							time[queue[head]-1]:=t;
							queue[foot]:=queue[head]-1;
							foot:=(foot+1) mod 100000;
						end;
					if (queue[head]<50000) and (time[queue[head]*2]=-1) then
						begin
							time[queue[head]*2]:=t;
							queue[foot]:=queue[head]*2;
							foot:=(foot+1) mod 100000;
						end;
					head:=(head+1) mod 100000;
				end;
			tmp:=foot;
		end;
end.
