#include<cstdio>
using namespace std;
long k[129][129];
int main()
{
	int d,n,cnt=0;
	long long ans=0;
	scanf("%d%d",&d,&n);
	for(int i=0;i<129;++i)// Initialize the k array
		for(int j=0;j<129;++j)
			k[i][j]=0;
	for(int i=0,x,y;i<n;++i)
	{
		scanf("%d%d",&x,&y);
		scanf("%ld",&k[x][y]);
	}
	for(int x=0;x<129;++x)// Enumerate the center of the transmitter
		for(int y=0;y<129;++y)
		{
			long long sum=0;// Calculate the sum of the matrix with the center of (x,y)
			for(int i=(x-d>0)?x-d:0;i<=(x-d<128)?x-d:128;++i)// To avoid the array overlimited
				for(int j=(y-d>0)?y-d:0;j<=(y-d<128)?y-d:128;++j)
					sum+=k[i][j];
			if(sum==ans)// Count the number of the solution
				++cnt;
			if(sum>ans)// Update the best solution
			{
				ans=sum;
				cnt=1;// Reset the counter
			}
		}
	printf("%d %lld",cnt,ans);
	return 0;
}
