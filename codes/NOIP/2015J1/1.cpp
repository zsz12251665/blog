#include<cstdio>
using namespace std;
int main()
{
	int i=0,k;
	long ans=0;
	scanf("%d",&k);
	while(k>0)
	{
		for(int j=0;j<i;++j)
			if(k>0)// Do not forget to check if k equals 0 in the loop, or you may give too much coins
			{
				ans+=i;
				--k;
			}
		++i;
	}
	printf("%ld",ans);
	return 0;
}
