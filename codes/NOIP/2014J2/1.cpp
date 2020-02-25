#include<cstdio>
using namespace std;
int gcd(int a,int b)// Check if a and b are co-prime to each other
{
	if(a<b)
	{
		int tmp=a;
		a=b;
		b=tmp;
	}
	if(a%b==0)
		return b;
	else
		return gcd(b,a%b);
}
int main()
{
	long a,b;
	int l,x=65535,y=1;// Maximum x and minimum y to make the ratio as big as possible
	scanf("%ld%ld%d",&a,&b,&l);
	for(int i=1;i<=l;++i)// Enumerate every pair of (i,j) in [1..l]
		for(int j=1;j<=l;++j)
			if(gcd(i,j)==1 && i*b>=a*j && i*y<x*j)// i*b>=a*j <=> i/j>=a/b, i*y<x*j <=> i/j<x/y
			{
				x=i;
				y=j;
			}
	printf("%d %d",x,y);
	return 0;
}
