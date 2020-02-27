#include<cstdio>
using namespace std;
long cost[200000];
void qsort(long l,long r)// Sort the cost array in increasing order
{
	long x=l,y=r,std=cost[(l+r)/2];
	while(x<y)
	{
		while(cost[x]<std)
			++x;
		while(cost[y]>std)
			--y;
		if(x<=y)
		{
			long tmp=cost[x];
			cost[x++]=cost[y];
			cost[y--]=tmp;
		}
	}
	if(l<y)
		qsort(l,y);
	if(x<r)
		qsort(x,r);
}
int main()
{
	long n,a,b,k;
	scanf("%ld%ld%ld%ld",&n,&a,&b,&k);
	for(long i=0,h;i<n;++i)// Calculate the cost
	{
		scanf("%ld",&h);
		h=(h-1)%(a+b)+1;
		cost[i]=(h<=a)?0:(h-1)/a;
	}
	qsort(0,n-1);// Sort the cost
	long ans=0;
	for(long i=0;i<n && k>=cost[i];++i)// Choose greedily
	{
		k-=cost[i];
		++ans;
	}
	printf("%d",ans);
	return 0;
}
