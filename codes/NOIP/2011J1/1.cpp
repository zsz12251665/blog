#include<cstdio>
using namespace std;
int main()
{
	long n;
	scanf("%ld",&n);
	if(n<0)// Check if n is a negative number
	{
		putchar('-');
		n=-n;
	}
	if(n==0)// Check if n is zero
	{
		putchar('0');
		return 0;
	}
	while(n%10==0)// Remove the prefix zero
		n/=10;
	while(n>0)// Reverse the number
	{
		printf("%d",n%10);
		n/=10;
	}
	return 0;
}
