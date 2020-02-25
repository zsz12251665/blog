#include<cstdio>
using namespace std;
long d[50001];
int main()
{
	long l,n,m;
	scanf("%ld%ld%ld",&l,&n,&m);
	for(long i=0;i<n;++i)
		scanf("%ld",&d[i]);
	d[n]=l;
	long left=0,right=l,ans;// Initialize the halving range
	while(left<=right)
	{
		long mid=(left+right)/2,tmp=0,cnt=0;// tmp is the last rock that is not removed, cnt counts the number of the rocks that has been removed
		for(long i=0;i<=n;++i)
			if(d[i]-tmp<mid)// Check if the distance is far enough
				++cnt;
			else
				tmp=d[i];
		if(cnt>m)// Check whether too many rocks are removed
			right=mid-1;
		else
		{
			ans=mid;// Update the answer
			left=mid+1;
		}
	}
	printf("%ld",ans);
	return 0;
}
