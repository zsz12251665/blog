#include<cstdio>
using namespace std;
int main()
{
	int n;
	long m;
	scanf("%d%ld",&n,&m);
	if(n/2*(n/2-1+n%2)<m)// n is not enough to make m triples
	{
		printf("-1");
		return 0;
	}
	for(int i=1;n>0 && m>0;++i)// Adding numbers from 1 to i
		if((i-1)/2<=m)
		{
			printf("%d ",i);
			--n;
			m-=(i-1)/2;
		}
		else
		{
			printf("%d ",i+((i-1)/2-m)*2);
			--n;
			break;
		}
	for(int i=0;i<n;++i)// The rest of the a[i], making a[i]+a[j]==a[k] impossible
		printf("%ld ",(100000-n+i)*10000);
	return 0;
}
