#include<cstdio>
using namespace std;
int mu[10000001];
long pre[10000001],prime[10000001];
bool isPrime[10000001];
int main()
{
	long n,size=0;
	scanf("%ld",&n);
	for(long i=2;i<=n;++i)
		isPrime[i]=true;
	mu[1]=1;
	for(long i=2;i<=n;++i)// The linear sieve to calculate mu[i] and find the primes
	{
		if(isPrime[i])
		{
			mu[i]=-1;
			prime[size++]=i;
		}
		for(long j=0;j<size&&i*prime[j]<=n;++j)
		{
			isPrime[i*prime[j]]=false;
			mu[i*prime[j]]=(i%prime[j]==0)?0:-mu[i];
			if(i%prime[j]==0)
				break;
		}
	}
	pre[0]=0;// Calculate the prefix sum of mu[i]
	for(long i=1;i<=n;++i)
		pre[i]=pre[i-1]+mu[i];
	long long ans=0;// Calculate the answer
	for(long i=0;i<size;++i)
		for(long d=1,j;d<=n/prime[i];d=n/prime[i]/j+1)
		{
			j=n/prime[i]/d;
			ans+=(long long)(pre[n/prime[i]/j]-pre[d-1])*j*j;
		}
	printf("%lld",ans);
	return 0;
}
