#include<cstdio>
using namespace std;
long c[300000],rank[300000];// rank[i] keeps the order of c[i]
bool timeline[600000];
void qsort(long l,long r)
{
	long x=l,y=r,std=c[rank[(l+r)/2]];
	while(x<y)
	{
		while(c[rank[x]]>std)
			++x;
		while(c[rank[y]]<std)
			--y;
		if(x<=y)
		{
			long tmp=rank[x];
			rank[x++]=rank[y];
			rank[y--]=tmp;
		}
	}
	if(l<y)
		qsort(l,y);
	if(x<r)
		qsort(x,r);
}
int main()
{
	long n,k;
	scanf("%ld%ld",&n,&k);
	for(long i=0;i<n;++i)
	{
		scanf("%ld",&c[i]);
		rank[i]=i;
		timeline[i]=false;
	}
	qsort(0,n-1);
	long long sum=0;
	for(long i=0,mt=0;i<n;++i)// mt is the minimum time that a plane can depart now
	{
		if(rank[i]>mt+k)// Check if it is still able to depart as the initial schedule planned
		{
			timeline[rank[i]-k]=true;
			c[rank[i]]=rank[i];// The c array is now scrolled to keep the moment to depart
		}
		else
		{
			sum+=(long long)c[rank[i]]*(mt+k-rank[i]);// If you do not change it into long long, it may overflow
			timeline[mt]=true;
			c[rank[i]]=mt+k;
		}
		while(timeline[mt])// Refresh the minimum time
			++mt;
	}
	printf("%lld\n",sum);
	for(long i=0;i<n;++i)
		printf("%ld ",c[i]+1);// C++ starts the array from 0, so do not forget to plus 1
	return 0;
}
