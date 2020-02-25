var
	t,ti,a,b,c,tmp,ans:integer;
begin
	read(t);
	for ti:=1 to t do
		begin
			read(a,b,c);
			if a<b then// Sort the numbers in advance
				begin
					tmp:=a;
					a:=b;
					b:=tmp;
				end;
			if a<c then
				begin
					tmp:=a;
					a:=c;
					c:=tmp;
				end;
			if b<c then
				begin
					tmp:=b;
					b:=c;
					c:=tmp;
				end;
			ans:=0;// Try all the combinations
			if a>0 then
				begin
					dec(a);
					inc(ans);
				end;
			if b>0 then
				begin
					dec(b);
					inc(ans);
				end;
			if c>0 then
				begin
					dec(c);
					inc(ans);
				end;
			if (a>0) and (b>0) then
				begin
					dec(a);
					dec(b);
					inc(ans);
				end;
			if (a>0) and (c>0) then// The order should not be change here because we hope to use as many a as possible because it is the largest
				begin
					dec(a);
					dec(c);
					inc(ans);
				end;
			if (b>0) and (c>0) then
				begin
					dec(b);
					dec(c);
					inc(ans);
				end;
			if (a>0) and (b>0) and (c>0) then
				begin
					dec(a);
					dec(b);
					dec(c);
					inc(ans);
				end;
			writeln(ans);
		end;
end.
