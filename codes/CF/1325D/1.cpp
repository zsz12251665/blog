#include<cstdio>
using namespace std;
int main()
{
	long long u,v;
	scanf("%lld%lld",&u,&v);
	if(u==v)
	{
		if(u==0)
			printf("0");
		else
			printf("1\n%lld",u);
		return 0;
	}
	if(u>v || (v-u)%2==1)// (v-u) is not positive and even
	{
		printf("-1");
		return 0;
	}
	v=(v-u)/2;
	if((v&u)==0)
		printf("2\n%lld %lld",u+v,v);
	else
		printf("3\n%lld %lld %lld",u,v,v);
	return 0;
}
