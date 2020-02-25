#include<cstdio>
using namespace std;
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		long n,x,y;
		scanf("%ld%ld%ld",&n,&x,&y);
		if(x+y>n)
			printf("%ld %ld\n",(x+y==2*n)?n:x+y+1-n,n);
		else
			printf("%ld %ld\n",1,x+y-1);
	}
	return 0;
}
