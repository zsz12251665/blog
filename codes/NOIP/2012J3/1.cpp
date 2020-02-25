#include<cstdio>
using namespace std;
long dp[101][101];
int main()
{
	int n,m;
	scanf("%d%d",&n,&m);
	dp[0][0]=1;
	for(int i=1,a;i<=n;++i)
	{
		scanf("%d",&a);// We can scroll a because we just need it once
		for(int j=0;j<=m;++j)
			if(a>j)// Without this, the array may be overlimited
				for(int k=0;k<=j;++k)
					dp[i][j]=(dp[i][j]+dp[i-1][j-k])%1000007;
			else
				for(int k=0;k<=a;++k)
					dp[i][j]=(dp[i][j]+dp[i-1][j-k])%1000007;
	}
	printf("%ld",dp[n][m]);
	return 0;
}
