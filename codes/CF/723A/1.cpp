#include<cstdio>
using namespace std;
int main()
{
	int a,b,c;
	scanf("%d%d%d",&a,&b,&c);// We use a0, b0, c0 to represent the original value of a, b, c
	if(a<b)// Using another variable
	{
		int tmp=a;// tmp=a0
		a=b;// a=b0
		b=tmp;// b=tmp=a0
	}
	if(b<c)// Using the bit operator xor
	{
		b=b^c;// b=b0^c0
		c=b^c;// c=(b0^c0)^c0=b0
		b=b^c;// b=(b0^c0)^b0=c0
	}
	if(a<b)// Using the sum
	{
		a=a+b;// a=a0+b0
		b=a-b;// b=(a0+b0)-b0=a0
		a=a-b;// a=(a0+b0)-a0=b0
	}
	printf("%ld",a-c);
	return 0;
}
