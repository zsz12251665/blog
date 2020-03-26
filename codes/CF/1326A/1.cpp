#include<cstdio>
using namespace std;
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		long n;
		scanf("%ld",&n);
		if(n==1)
		{
			printf("-1\n");
			continue;
		}
		putchar('2');//We use 2333... here
		for(;n>1;--n)
			putchar('3');
		putchar('\n');
	}
	return 0;
}
