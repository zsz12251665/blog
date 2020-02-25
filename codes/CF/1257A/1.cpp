#include<cstdio>
using namespace std;
int main()
{
	int t,n,x,a,b;
	for(scanf("%d",&t);t>0;--t)
	{
		scanf("%d%d%d%d",&n,&x,&a,&b);
		if(a>b)// Make sure a is smaller than b
		{
			int i=a;
			a=b;
			b=i;
		}
		for(int i=0;i<x && (a!=1 || b!=n);++i)// Swap the students
			if(a!=1)
				--a;
			else
				++b;
		printf("%d\n",b-a);
	}
	return 0;
}
