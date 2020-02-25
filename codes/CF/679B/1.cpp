#include<cstdio>
using namespace std;
long long cube(long a)
{
	return (long long)a*a*a;
}
long count(long long m)// Count how many blocks can be added at most
{
	if(m<8)
		return m;
	long a=1;
	while(cube(a+1)<=m)
		++a;
	if(cube(a)-1-cube(a-1)>m-cube(a))// Choose the situation with the maximum volume remained
		return 1+count(cube(a)-1-cube(a-1));
	else
		return 1+count(m-cube(a));
}
int main()
{
	long long m,x=0;
	long h=0,a;
	for(scanf("%lld",&m);m>0;)// m is the volume remained
	{
		++h;
		for(a=1;cube(a+1)<=m;)// find the biggest cube
			++a;
		if(count(cube(a)-1-cube(a-1))>count(m-cube(a)))// Choose the tallest solution
		{
			m=cube(a)-1-cube(a-1);
			x+=cube(a-1);
		}
		else
		{
			m-=cube(a);
			x+=cube(a);
		}
	}
	printf("%ld %lld\n",h,x);
	return 0;
}
