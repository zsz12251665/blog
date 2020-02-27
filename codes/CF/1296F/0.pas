type
	survey=record
		a,b:integer;
		g:longint;
	end;
var
	s:array[1..5000]of survey;
	des,nxt:array[1..10000]of integer;
	h,que,fa,d:array[1..5000]of integer;
	f:array[1..5000]of longint;// f[i] is the scenery beauty of the edge connecting i and fa[i]
	n,m,i,j,p,q,head,foot,lca:integer;
	min:longint;
procedure qsort(l,r:integer);// Sort the survey array in increasing order of g
var
	x,y:integer;
	std:longint;
	tmp:survey;
begin
	x:=l;
	y:=r;
	std:=s[(l+r) div 2].g;
	while x<y do
		begin
			while s[x].g<std do
				inc(x);
			while s[y].g>std do
				dec(y);
			if x<=y then
				begin
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
function find_lca(a,b:integer):integer;// Find the lowest common ancestor of a and b
begin
	while d[a]>d[b] do
		a:=fa[a];
	while d[a]<d[b] do
		b:=fa[b];
	while a<>b do
		begin
			a:=fa[a];
			b:=fa[b];
		end;
	exit(a);
end;
begin
	read(n);
	for i:=1 to n do
		begin
			h[i]:=-1;
			f[i]:=1;// The minimum value of f[i] is 1
		end;
	for i:=1 to n-1 do// Input the graph
		begin
			read(p,q);
			des[2*i-1]:=q;
			nxt[2*i-1]:=h[p];
			h[p]:=2*i-1;
			des[2*i]:=p;
			nxt[2*i]:=h[q];
			h[q]:=2*i;
		end;
	fa[1]:=1;// Build the tree
	d[q]:=1;
	que[1]:=1;
	head:=1;
	foot:=2;
	while head<>foot do
		begin
			p:=que[head];
			inc(head);
			i:=h[p];
			while i<>-1 do
				begin
					if des[i]<>fa[p] then
						begin
							fa[des[i]]:=p;
							d[des[i]]:=d[p]+1;
							que[foot]:=des[i];
							inc(foot);
						end;
					i:=nxt[i];
				end;
		end;
	read(m);
	for i:=1 to m do// Input the surveys
		read(s[i].a,s[i].b,s[i].g);
	qsort(1,m);// Sort the surveys
	for i:=1 to m do// Apply the surveys
		begin
			lca:=find_lca(s[i].a,s[i].b);
			j:=s[i].a;
			while j<>lca do
				begin
					if f[j]<s[i].g then
						f[j]:=s[i].g;
					j:=fa[j];
				end;
			j:=s[i].b;
			while j<>lca do
				begin
					if f[j]<s[i].g then
						f[j]:=s[i].g;
					j:=fa[j];
				end;
		end;
	for i:=1 to m do// Validate the surveys
		begin
			lca:=find_lca(s[i].a,s[i].b);
			min:=maxlongint;
			j:=s[i].a;
			while j<>lca do
				begin
					if f[j]<min then
						min:=f[j];
					j:=fa[j];
				end;
			j:=s[i].b;
			while j<>lca do
				begin
					if f[j]<min then
						min:=f[j];
					j:=fa[j];
				end;
			if min<>s[i].g then// The result is different
				begin
					write(-1);
					halt;
				end;
		end;
	for i:=1 to n-1 do
		if d[des[2*i-1]]<d[des[2*i]] then// Output the result in the order of the edges
			write(f[des[2*i]],' ')
		else
			write(f[des[2*i-1]],' ');
end.
