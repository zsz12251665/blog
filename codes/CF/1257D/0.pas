var
	a,p,s:array[1..200000]of longint;
	t,ti,n,m,i,j,cnt,ans,max:longint;
procedure qsort(l,r:longint);// Sort the heroes
var
	x,y,tmp,std_p,std_s:longint;
begin
	x:=l;
	y:=r;
	std_p:=p[(l+r) div 2];
	std_s:=s[(l+r) div 2];
	while x<y do
		begin
			while (p[x]>std_p) or (p[x]=std_p) and (s[x]>std_s) do
				inc(x);
			while (p[y]<std_p) or (p[y]=std_p) and (s[y]<std_s) do
				dec(y);
			if x<=y then
				begin
					tmp:=p[x];
					p[x]:=p[y];
					p[y]:=tmp;
					tmp:=s[x];
					s[x]:=s[y];
					s[y]:=tmp;
					inc(x);
					dec(y);
				end;
		end;
	if l<y then
		qsort(l,y);
	if r>x then
		qsort(x,r);
end;
begin
	read(t);
	for ti:=1 to t do
		begin
			max:=-1;
			ans:=0;
			read(n);
			for i:=1 to n do
				begin
					read(a[i]);
					if a[i]>max then
						max:=a[i];
				end;
			read(m);
			for i:=1 to m do
				read(p[i],s[i]);
			qsort(1,m);
			if max>p[1] then// Check whether all the monsters can be defeated
				begin
					writeln(-1);
					continue;
				end;
			max:=-1;
			for i:=1 to m do// Remove the useless heroes
				if s[i]>max then
					max:=s[i]
				else
					p[i]:=-1;
			qsort(1,m);
			i:=1;// Use greedy algorithm to defeat as many monsters as possible
			while i<=n do
				begin
					cnt:=0;
					max:=a[i];
					for j:=1 to m do// Replace a hero with less power but more endurance
						begin
							if (i>n) or (max>p[j]) then
								break;
							while (i<=n) and (cnt<s[j]) and (p[j]>=max) do// Defeating monsters
								begin
									inc(i);
									inc(cnt);
									if a[i]>max then
										max:=a[i];
								end;
						end;
					inc(ans);
				end;
			writeln(ans);
		end;
end.
