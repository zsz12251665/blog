#include<cstdio>
using namespace std;
long a[200000];
void qsort(long l,long r)// Sort the array in increase order
{
	long x=l,y=r;
	long std=a[(l+r)/2];
	while(x<y)
	{
		while(a[x]<std)
			++x;
		while(a[y]>std)
			--y;
		if(x<=y)
		{
			long tmp=a[x];
			a[x++]=a[y];
			a[y--]=tmp;
		}
	}
	if(l<y)
		qsort(l,y);
	if(x<r)
		qsort(x,r);
}
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		long n;
		scanf("%ld",&n);
		for(long i=0;i<2*n;++i)
			scanf("%ld",&a[i]);
		qsort(0,2*n-1);
		printf("%ld\n",a[n]-a[n-1]);
	}
	return 0;
}
