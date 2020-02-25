var
	n,i,j,ans,tmp,prc,amt:longint;// Remember to make the ans as large as possible to make sure that you can get the cost of each kind
begin
	read(n);
	ans:=maxlongint;
	for i:=1 to 3 do
		begin
			read(amt,prc);
			tmp:=0;
			j:=n;
			while j>0 do// In oreder to avoid count one more pack, I pick the packs one after one
				begin
					j:=j-amt;
					tmp:=tmp+prc;
				end;
			if tmp<ans then
				ans:=tmp;
		end;
	write(ans);
end.
