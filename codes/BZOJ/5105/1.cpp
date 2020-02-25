#include<cstdio>
using namespace std;
long long gcd(long long a,long long b)// This is a non-recursive form of the gcd function
{
	while(b!=0)
	{
		long long tmp=a%b;// Divides their difference
		a=b;
		b=tmp;
	}
	return a;
}
int main()
{
	long long a,b,c;
	scanf("%lld%lld%lld",&a,&b,&c);
	long long ans=a*b/gcd(a,b);
	ans*=c/gcd(ans,c);
	printf("%lld",ans);
	return 0;
}
