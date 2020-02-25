#include<cstdio>
using namespace std;
void exgcd(long a,long b,long &x,long &y)
{
	if(b==0)// The recursion border
	{
		x=1;// Keep the quotients
		y=0;
		return;
	}
	exgcd(b,a%b,y,x);// Recur gcd
	y-=a/b*x;// Update the quotients
}
int main()
{
	long a,b,x,y;
	scanf("%ld%ld",&a,&b);
	exgcd(a,b,x,y);
	printf("%ld",(x%b+b)%b);// Output the minimum positive integer
	return 0;
}
