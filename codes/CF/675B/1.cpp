#include<cstdio>
using namespace std;
int main()
{
	long n,a,b,c,d;
	scanf("%ld%ld%ld%ld%ld",&n,&a,&b,&c,&d);
	long max=(a+c<a+b)?a+b:a+c;// Update maximum pair values
	max=(max<b+d)?b+d:max;
	max=(max<c+d)?c+d:max;
	long min=(a+c>a+b)?a+b:a+c;// Update minimum pair values
	min=(min>b+d)?b+d:min;
	min=(min>c+d)?c+d:min;
	if(max-min>n)// Pay attention to this situation
		putchar('0');
	else
		printf("%lld",(long long)(n-max+min)*n);
	return 0;
}
