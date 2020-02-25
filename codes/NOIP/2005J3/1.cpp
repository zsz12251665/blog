#include<cstdio>
using namespace std;
long dp[1001];
int main()
{
	for(int i=0;i<1001;++i)// Initialize the dp array
		dp[i]=0;
	int t,m;
	scanf("%d%d",&t,&m);
	for(int i=0;i<m;++i)
	{
		int cost,price;
		scanf("%d%d",&cost,&price);
		for(int j=t;j>=cost;--j)
			if(dp[j]<dp[j-cost]+price)// dp=max(dp[j-cost]+price)
				dp[j]=dp[j-cost]+price;
	}
	printf("%ld",dp[t]);
	return 0;
}
