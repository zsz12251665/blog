var
	q,qi,n,i:integer;
	m,t,l,h,lp,hp,last:longint;// lp and hp are the lowest and the highest possible temperature, last is the time last customer arrives
	ans:boolean;
begin
	read(q);
	for qi:=1 to q do
		begin
			read(n,m);
			lp:=m;
			hp:=m;
			last:=0;
			ans:=true;
			for i:=1 to n do
				begin
					read(t,l,h);
					if l>lp-t+last then// Update the range
						lp:=l
					else
						lp:=lp-t+last;
					if h<hp+t-last then
						hp:=h
					else
						hp:=hp+t-last;
					last:=t;
					ans:=ans and (lp<=hp);// Check if all range exist
				end;
			if ans then
				writeln('YES')
			else
				writeln('NO');
		end;
end.
