#include<cstdio>
using namespace std;
long long exgcd(long long a,long long b,long long &x,long long &y)// A combined version of exGCD and GCD
{
	if(b==0)
	{
		x=1;
		y=0;
		return a;
	}
	long long gcd=exgcd(b,a%b,y,x);
	y-=a/b*x;
	return gcd;
}
int main()
{
	long long a,b,c;
	int k;
	for(scanf("%lld%lld%lld%d",&a,&b,&c,&k);a!=0 || b!=0 || c!=0 || k!=0;scanf("%lld%lld%lld%d",&a,&b,&c,&k))
	{
		long long power=1,ans;
		for(int i=0;i<k;++i)
			power*=2;
		b-=a;
		if(b<0)// Make sure the number is positive
			b+=power;
		long long gcd=exgcd(c,power,ans,a);
		if(b%gcd!=0)// There is no need to check if c is 0
		{
			printf("FOREVER\n");
			continue;
		}
		ans=ans*(b/gcd)%(power/gcd);
		if(ans<0)// Make sure the number is positive
			ans+=power/gcd;
		printf("%lld\n",ans);
	}
	return 0;
}
