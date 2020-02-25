#include<cstdio>
using namespace std;
int isprime[1000002];// We Mark H-primes with 1, H-semi-primes with 2 and the others with 0
long prime[1000002],queue[1000002],primesize=0;
int main()
{
	for(long i=5;i<1000002;i+=4)// Initialize the isprime array
		isprime[i]=1;
	for(long i=5;i<1000002;i+=4)// The Sieve of Euler
	{
		if(isprime[i]==1)
			prime[primesize++]=i;
		for(long j=0;j<primesize && i*prime[j]<1000002;++j)
		{
			isprime[i*prime[j]]=0;
			if(i%prime[j]==0)
				break;
		}
	}
	long n;// Read n and find the H-semi-primes below n
	scanf("%ld",&n);
	while(n!=0)
	{
		long ans=0;
		for(long i=0;prime[i]<=n/5 && i<primesize;++i)// Enumerate every pair of H-primes
			for(long j=0;prime[i]*prime[j]<=n && j<primesize;++j)
				if(isprime[prime[i]*prime[j]]!=2)
				{
					isprime[prime[i]*prime[j]]=2;
					queue[ans++]=prime[i]*prime[j];
				}
		printf("%ld %ld\n",n,ans);
		for(long i=0;i<ans;++i)// The mark of H-semi-primes in the queue needs to be removed to avoid being not counted
			isprime[queue[i]]=0;
		scanf("%ld",&n);
	}
	return 0;
}
