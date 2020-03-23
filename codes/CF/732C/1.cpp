#include<cstdio>
using namespace std;
int main()
{
	long long b,d,s;
	scanf("%lld%lld%lld",&b,&d,&s);
	if(b<d)// Swap the variables to make sure b>=d>=s
	{
		long long tmp=b;
		b=d;
		d=tmp;
	}
	if(b<s)
	{
		long long tmp=b;
		b=s;
		s=tmp;
	}
	if(d<s)
	{
		long long tmp=d;
		d=s;
		s=tmp;
	}
	printf("%lld",(d<b-1?b-1-d:0)+(s<b-1?b-1-s:0));// Calculate the answer
	return 0;
}
