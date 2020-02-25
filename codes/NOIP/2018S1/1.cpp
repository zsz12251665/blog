#include<cstdio>
using namespace std;
int main()
{
	long n,ans=0;
	scanf("%ld",&n);
	int d,last=0;// For the first layer, all height should be added, so last will be 0
	for(long i=0;i<n;++i)
	{
		scanf("%d",&d);
		if(d>last)// If d>last, we need to add more operation to reach it
			ans+=d-last;
		last=d;
	}
	printf("%ld",ans);
	return 0;
}
