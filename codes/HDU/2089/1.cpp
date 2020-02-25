#include<cstdio>
using namespace std;
bool is_good(long a)
{
	for(long i=1;i<a;i*=10)// It is a little dangerous here because i may overflow and you'll get a WA
		if((a/i)%100==62 || (a/i)%10==4)
			return false;
	return true;
}
int main()
{
	long n,m;
	for(scanf("%ld%ld",&n,&m);n!=0 || m!=0;scanf("%ld%ld",&n,&m))
	{
		long count=0;
		for(long i=n;i<=m;++i)// Search the interval
			if(is_good(i))
				++count;
		printf("%ld\n",count);
	}
	return 0;
}
