#include<cstdio>
using namespace std;
int ans[251][100];// ans[i][j] is the j-th bit of ans[i] from the right
int main()
{
	for(int i=0;i<2;++i)// Initialize ans[0] and ans[1]
		for(int j=0;j<100;++j)
			ans[i][j]=0;
	ans[0][0]=ans[1][0]=1;
	for(int i=2;i<251;++i)// Pretreat ans[2] to ans[250]
		for(int j=0,tmp=0;j<100;++j)// High precision addition
		{
			tmp+=2*ans[i-2][j]+ans[i-1][j];// ans[i]=2*ans[i-2]+ans[i-1]
			ans[i][j]=tmp%10;
			tmp/=10;
		}
	int i;
	while(scanf("%d",&i)!=EOF)
	{
		bool start=false;
		for(int j=99;j>=0;--j)
		{
			if(ans[i][j]==0 && !start)// Remove the prefix made up of 0
				continue;
			start=true;
			printf("%d",ans[i][j]);
		}
		printf("\n");
	}
	return 0;
}
