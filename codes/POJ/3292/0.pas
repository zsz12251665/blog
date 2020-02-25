var
	isprime:array[1..1000001]of integer;// We Mark H-primes with 1, H-semi-primes with 2 and the others with 0
	prime,queue:array[1..1000001]of longint;
	primesize,n,ans,i,j:longint;
begin
	for i:=1 to 250000 do// Initialize the isprime array
		isprime[4*i+1]:=1;
	primesize:=0;
	for i:=1 to 250000 do// The Sieve of Euler
		begin
			if isprime[4*i+1]=1 then
				begin
					prime[primesize]:=4*i+1;
					inc(primesize);
				end;
			for j:=1 to primesize do
				begin
					if (4*i+1)*prime[j]>1000001 then
						break;
					isprime[(4*i+1)*prime[j]]:=0;
					if (4*i+1) mod prime[j]=0 then
						break;
				end;
		end;
	read(n);// Read n and find the H-semi-primes below n
	while n<>0 do
		begin
			ans:=0;
			for i:=1 to primesize do
				if prime[i]>n/5 then
					break
				else
					for j:=1 to primesize do// Enumerate every pair of H-primes
						if prime[i]*prime[j]>n then
							break
						else
							if isprime[prime[i]*prime[j]]<>2 then
								begin
									isprime[prime[i]*prime[j]]:=2;
									inc(ans);
									queue[ans]:=prime[i]*prime[j];
								end;
			writeln(n,' ',ans);
			for i:=1 to ans do// The mark of H-semi-primes in the queue needs to be removed to avoid being not counted
				isprime[queue[i]]:=0;
			read(n);
		end;
end.
