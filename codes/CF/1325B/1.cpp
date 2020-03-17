#include<cstdio>
using namespace std;
long a[100000];
void qsort(long l,long r)// Sort the array in increasing order
{
	long x=l,y=r,std=a[(l+r)/2];
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
		for(long i=0;i<n;++i)
			scanf("%ld",&a[i]);
		qsort(0,n-1);// Sort the array in increasing order
		long ans=n;// Count the number of different numbers
		for(long i=1;i<n;++i)
			if(a[i]==a[i-1])
				--ans;
		printf("%ld\n",ans);
	}
	return 0;
}
