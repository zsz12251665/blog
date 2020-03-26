#include<cstdio>
using namespace std;
int main()
{
	long n,k;
	scanf("%ld%ld",&n,&k);
	long long ans=0;// Though it should be smaller than 998244353, we are using long long to avoid overlimit when multiplication
	for(long i=0,p,cnt=1;i<n;++i)
	{
		scanf("%d",&p);
		if(p>n-k)
		{
			ans=(ans*cnt)%998244353;
			if(ans==0)// The numbers before the first number lareger than (n-k) is not needed
				++ans;
			cnt=1;
		}
		else
			++cnt;
	}
	printf("%lld %lld",(long long)(n-k+1+n)*k/2,ans);
}
