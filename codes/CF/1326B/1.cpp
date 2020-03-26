#include<cstdio>
using namespace std;
int main()
{
	long n;
	scanf("%ld",&n);
	long long x=0;// x[1]=0
	for(long i=0,b;i<n;++i)
	{
		scanf("%ld",&b);
		printf("%lld ",b+x);// a[i]=b[i]+x[i]
		if(b>0)// Update the maximum value
			x+=b;
	}
	return 0;
}
