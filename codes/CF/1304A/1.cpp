#include<cstdio>
using namespace std;
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		long x,y,a,b;
		scanf("%ld%ld%ld%ld",&x,&y,&a,&b);
		printf("%ld\n",(y>=x && (y-x)%(a+b)==0)?(y-x)/(a+b):-1);
	}
	return 0;
}
