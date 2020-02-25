#include<cstdio>
using namespace std;
long dp[32];
int main()
{
	long n,ans=0;
	for(long j=0;j<32;++j)// Initialize the dp array
		dp[j]=0;
	scanf("%ld",&n);
	for(long i=0;i<n;++i)
	{
		long a,max=0;
		scanf("%ld",&a);
		for(long j=0;j<32;++j)
			if((a&(1<<j))!=0 && max<dp[j])// Find the length of the longest subsequence that a[i] can append
				max=dp[j];
		++max;
		for(long j=0;j<32;++j)
			if((a&(1<<j))!=0 && dp[j]<max)// Update the dp array
			{
				dp[j]=max;
				if(ans<dp[j])// Update the answer
					ans=dp[j];
			}
	}
	printf("%ld",ans);
	return 0;
}
