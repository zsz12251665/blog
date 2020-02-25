var
	ans:array[1..250000]of longint;// We use n to show the H-number 4n+1 and the maxinum of n is 250000
	isprime:array[1..250000]of integer;// We Mark H-primes with 0, H-semi-primes with 1 and the others with -1
	n,i,j,k:longint;
begin
	for i:=1 to 250000 do// Initialize the isprime array
		isprime[i]:=0;
	for i:=1 to 250000 do// Enumerate every pair of H-numbers
		for j:=1 to 250000 do
			begin
				k:=4*i*j+i+j;// (4i+1)(4j+1)=4(4i*j+i+j)+1
				if k>250000 then// To avoid overlimit
					break;
				if (isprime[i]=0) and (isprime[j]=0) then// Judge if it is a H-semi-prime
					isprime[k]:=1
				else
					isprime[k]:=-1;
			end;
	ans[1]:=isprime[1];// Count the number of H-semi-primes from 5 to 4n+1
	for i:=2 to 250000 do
		if isprime[i]=1 then
			ans[i]:=ans[i-1]+1
		else
			ans[i]:=ans[i-1];
	read(n);// Read n and print the answer as feedback
	while n<>0 do
		begin
			writeln(n,' ',ans[(n-1) div 4]);
			read(n);
		end;
end.
