#include<cstdio>
using namespace std;
int main()
{
	int t,n;
	for(scanf("%d",&t);t>0;--t)
	{
		scanf("%d",&n);
		int ans=-1;// ans shows the position of the even number (-1 means there is no even number)
		for(int i=0,a;i<n;++i)
		{
			scanf("%d",&a);
			if(a%2==0)
				ans=i;
		}
		if(ans!=-1)// There is an even number
			printf("1\n%d\n",ans+1);
		else
			if(n==1)// Only a single odd number provided
				printf("-1\n");
			else// More than 1 odd numbers
				printf("2\n1 2\n");
	}
	return 0;
}
