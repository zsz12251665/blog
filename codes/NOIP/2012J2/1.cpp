#include<cstdio>
using namespace std;
long num[10000][100];
int floor[10000][100],count[10000];// The count array is used to record the rooms with stairs on this floor
int main()
{
	int n,m,x,ans=0;
	scanf("%d%d",&n,&m);
	for(int i=0;i<n;++i)
	{
		count[i]=0;
		for(int j=0;j<m;++j)
		{
			scanf("%d%ld",&floor[i][j],&num[i][j]);
			count[i]+=floor[i][j];
		}
	}
	scanf("%d",&x);
	for(int i=0;i<n;++i)// Searching the right stairs to the upper floor
	{
		ans=(ans+num[i][x])%20123;
		int t=(num[i][x]-1)%count[i]+1;// It's here where we reduce the time searching by taking the remainder
		while(t-floor[i][x]>0)
		{
			t-=floor[i][x];
			x=(x+1)%m;
		}
	}
	printf("%d",ans);
	return 0;
}
