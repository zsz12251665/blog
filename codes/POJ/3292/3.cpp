#include<cstdio>
using namespace std;
long ans[250001];// We use n to show the H-number 4n+1 and the maxinum of n is 250000
int isprime[250001];// We Mark H-primes with 0, H-semi-primes with 1 and the others with -1
int main()
{
	for(long i=1;i<250001;++i)// Initialize the isprime array
		isprime[i]=0;
	for(long i=1;i<250001;++i)// Enumerate every pair of H-numbers
		for(long j=1;j<250001;++j)
		{
			long k=4*i*j+i+j;// (4i+1)(4j+1)=4(4i*j+i+j)+1
			if(k>250000)// To avoid overlimit
				break;
			if(isprime[i]==0 && isprime[j]==0)// Judge if it is a H-semi-prime
				isprime[k]=1;
			else
				isprime[k]=-1;
		}
	ans[0]=0;// Count the number of H-semi-primes from 1 to 4n+1
	for(long i=1;i<250001;++i)
		if(isprime[i]==1)
			ans[i]=ans[i-1]+1;
		else
			ans[i]=ans[i-1];
	long n;// Read n and print the answer as feedback
	scanf("%ld",&n);
	while(n!=0)
	{
		printf("%ld %ld\n",n,ans[(n-1)/4]);
		scanf("%ld",&n);
	}
	return 0;
}
