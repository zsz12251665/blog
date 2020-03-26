var
	s:ansistring;
	t,ti,len,p,i,max_pre,max_suf:integer;
function symmetricLength(b,e:integer):integer;// Find the length of the longest symmetric prefix and suffix of the substring of s
var
	i:integer;
begin
	for i:=0 to (e-b) div 2 do
		if s[b+i]<>s[e-i] then
			exit(i);
	exit(-1);// -1 means the substring is a palindrome
end;
begin
	readln(t);
	for ti:=1 to t do
		begin
			readln(s);
			len:=length(s);
			p:=symmetricLength(1,len);
			if p=-1 then// s is a palindrome
				begin
					writeln(s);
					continue;
				end;
			max_pre:=0;// The length of the longest palindrome which is the prefix or the suffix
			max_suf:=0;
			for i:=1 to len-2*p do// Enumerate the length
				begin
					if symmetricLength(p+1,p+i)=-1 then
						max_pre:=i;
					if symmetricLength(len-p-i+1,len-p)=-1 then
						max_suf:=i;
				end;
			if max_pre>max_suf then// Output the answer
				writeln(copy(s,1,p+max_pre),copy(s,len-p+1,p))
			else
				writeln(copy(s,1,p),copy(s,len-p-max_suf+1,p+max_suf));
		end;
end.
