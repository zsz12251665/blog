var
	mu:array[1..10000000]of integer;
	pre:array[0..10000000]of longint;
	prime:array[1..10000000]of longint;
	isPrime:array[1..10000000]of boolean;
	n,size,i,j,d:longint;
	ans:int64;
begin
	size:=0;
	read(n);
	for i:=2 to n do
		isPrime[i]:=true;
	mu[1]:=1;
	for i:=2 to n do// The linear sieve to calculate mu[i] and find the primes
		begin
			if isPrime[i] then
				begin
					mu[i]:=-1;
					inc(size);
					prime[size]:=i;
				end;
			for j:=1 to size do
				begin
					if i*prime[j]>n then
						break;
					isPrime[i*prime[j]]:=false;
					if i mod prime[j]=0 then
						begin
							mu[i*prime[j]]:=0;
							break;
						end
					else
						mu[i*prime[j]]:=-mu[i];
				end;
		end;
	pre[0]:=0;// Calculate the prefix sum of mu[i]
	for i:=1 to n do
		pre[i]:=pre[i-1]+mu[i];
	ans:=0;// Calculate the answer
	for i:=1 to size do
		begin
			d:=1;
			while d<=n div prime[i] do
				begin
					j:=n div prime[i] div d;
					ans:=ans+int64(pre[n div prime[i] div j]-pre[d-1])*j*j;
					d:=n div prime[i] div j+1;
				end;
		end;
	write(ans);
end.
