var
	s,tmp:ansistring;// Since there is another t, we use tmp as the new string
	r:array[1..2000001]of longint;
	t,ti,p,i,mx,ce,max_pre,max_suf:longint;
begin
	readln(t);
	for ti:=1 to t do
		begin
			readln(s);
			p:=-1;// p=-1 means the string is a palindrome
			for i:=0 to length(s) div 2 do// Find the length of the longest symmetric prefix and suffix of the substring of s
				if s[1+i]<>s[length(s)-i] then
					begin
						p:=i;
						break;
					end;
			if p=-1 then// s is a palindrome
				begin
					writeln(s);
					continue;
				end;
			tmp:='#';// Forming the string tmp
			for i:=p+1 to length(s)-p do
				tmp:=tmp+s[i]+'#';
			mx:=0;
			for i:=1 to length(tmp) do// Calculate the array r
				begin
					if i<mx then// The optimization
						if mx-i<r[2*ce-i] then
							r[i]:=mx-i
						else
							r[i]:=r[2*ce-i]
					else
						r[i]:=1;
					while (i-r[i]>0) and (i+r[i]<=length(tmp)) and (tmp[i-r[i]]=tmp[i+r[i]]) do
						inc(r[i]);
					if i+r[i]>mx then// Update mx
						begin
							mx:=i+r[i];
							ce:=i;
						end;
				end;
			max_pre:=0;// The length of the longest palindrome which is the prefix or the suffix
			max_suf:=0;
			for i:=1 to length(tmp) div 2 do// Enumerate the length
				begin
					if r[i]=i then
						max_pre:=i-1;
					if r[length(tmp)+1-i]=i then
						max_suf:=i-1;
				end;
			if max_pre>max_suf then// Output the answer
				writeln(copy(s,1,p+max_pre),copy(s,length(s)-p+1,p))
			else
				writeln(copy(s,1,p),copy(s,length(s)-p-max_suf+1,p+max_suf));
		end;
end.
