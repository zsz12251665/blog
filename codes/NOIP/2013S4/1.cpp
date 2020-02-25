#include<cstdio>
using namespace std;
int main()
{
	long n,ans=0;
	scanf("%ld",&n);
	int h,last=0;// For the first brick, all height should be added, so last will be 0
	for(long i=0;i<n;++i)
	{
		scanf("%d",&h);
		if(h>last)// If h>last, we need to add more operation to reach it
			ans+=h-last;
		last=h;
	}
	printf("%ld",ans);
	return 0;
}
