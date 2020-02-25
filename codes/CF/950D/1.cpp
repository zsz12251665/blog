#include<cstdio>
using namespace std;
int main()
{
	long long n,x;
	int q;
	for(scanf("%lld%d",&n,&q);q>0;--q)
	{
		for(scanf("%lld",&x);x%2==0;)// All number was in an odd-indexed cell at first, so we just need to retrospect the ones in even-indexed cell
			x=n+(x/2);
		printf("%lld\n",(x+1)/2);
	}
	return 0;
}
