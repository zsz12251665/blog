#include<cstdio>
using namespace std;
int c[2001][2001],sum[2001][2001];
int main()
{
	int t,k,n,m;
	long ans;
	scanf("%d%d",&t,&k);
	for(int i=1;i<2001;++i)// Make the Pascal Triangle and the prefix sum of the line
	{
		c[i][0]=c[i][i]=1;
		sum[i][0]=0;
		for(int j=1;j<i;++j)
		{
			c[i][j]=(c[i-1][j]+c[i-1][j-1])%k;
			sum[i][j]=sum[i][j-1];
			if(c[i][j]==0)
				sum[i][j]++;
		}
		sum[i][i]=sum[i][i-1];
	}
	while(t>0)
	{
		scanf("%d%d",&n,&m);
		ans=0;
		for(int i=2;i<=n;++i)// Add the prefix sum together to get the answer
			if(i>m)
				ans+=sum[i][m];
			else
				ans+=sum[i][i];
		printf("%ld\n",ans);
		--t;
	}
	return 0;
}
