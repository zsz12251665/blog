#include<cstdio>
using namespace std;
long a[200000];
long abs(long a)
{
	return a>0?a:-a;
}
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		long n,max_a=0,min_a=1000000000;// You cannot use 2147483647 to initialize min_a in this problem. Otherwise if all a[i] is -1, the answer will be larger than 10^9. And it can also prevent k from overlimit
		scanf("%ld",&n);
		for(long i=0;i<n;++i)
			scanf("%ld",&a[i]);
		for(long i=0;i<n;++i)// Find the range of the elements beside -1
			if(a[i]==-1)
			{
				if(i>0&&a[i-1]!=-1)
				{
					max_a=(a[i-1]>max_a)?a[i-1]:max_a;
					min_a=(a[i-1]<min_a)?a[i-1]:min_a;
				}
				if(i<n-1&&a[i+1]!=-1)
				{
					max_a=(a[i+1]>max_a)?a[i+1]:max_a;
					min_a=(a[i+1]<min_a)?a[i+1]:min_a;
				}
			}
		long k=(max_a+min_a)/2,m=0;
		if(a[0]==-1)
			a[0]=k;
		for(long i=1;i<n;++i)// Calculate the maximum absolute difference
		{
			if(a[i]==-1)
				a[i]=k;
			if(m<abs(a[i]-a[i-1]))
				m=abs(a[i]-a[i-1]);
		}
		printf("%ld %ld\n",m,k);
	}
	return 0;
}
