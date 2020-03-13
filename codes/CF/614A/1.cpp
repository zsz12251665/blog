#include<cstdio>
using namespace std;
int main()
{
	long long l,r,pwr=1;
	long k;
	scanf("%lld%lld%ld",&l,&r,&k);
	while(l/pwr>=k)// l>=k*pwr, the loop continues until pwr<=l but pwr*k>l
		pwr*=k;
	if(pwr==l)// If pwr==l, pwr is the first one, otherwise k*pwr is the first one
		printf("%lld ",pwr);
	else
		if(r/pwr<k)// r<k*pwr, k*pwr is not in range, so there is no such numbers
		{
			printf("-1");
			return 0;
		}
	while(r/pwr>=k)// while r>=pwr*k, output pwr*k
	{
		pwr*=k;
		printf("%lld ",pwr);
	}
	return 0;
}
