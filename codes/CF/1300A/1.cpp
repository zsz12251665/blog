#include<cstdio>
using namespace std;
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		int n,ans=0,sum=0;
		scanf("%d",&n);
		for(int i=0,a;i<n;++i)
		{
			scanf("%d",&a);
			if(a==0)// Maintain the product is not 0
			{
				++ans;
				++sum;
			}
			else
				sum+=a;
		}
		if(sum==0)// Maintain the sum is not 0
			++ans;
		printf("%d\n",ans);
	}
	return 0;
}
