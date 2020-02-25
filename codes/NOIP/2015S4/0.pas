var
	d:array[1..50001]of longint;
	l,n,m,i,left,right,ans,mid,tmp,cnt:longint;
begin
	read(l,n,m);
	for i:=1 to n do
		read(d[i]);
	d[n+1]:=l;
	left:=0;// Initialize the halving range
	right:=l;
	while left<=right do
		begin
			mid:=(left+right) div 2;
			tmp:=0;// tmp is the last rock that is not removed
			cnt:=0;// cnt counts the number of the rocks that has been removed
			for i:=1 to n+1 do
				if d[i]-tmp<mid then// Check if the distance is far enough
					inc(cnt)
				else
					tmp:=d[i];
			if cnt>m then// Check whether too many rocks are removed
				right:=mid-1
			else
				begin
					ans:=mid;// Update the answer
					left:=mid+1;
				end;
		end;
	write(ans);
end.
