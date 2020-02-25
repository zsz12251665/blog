#include<cstdio>
using namespace std;
int main()
{
	long n,ans=0;
	int x;
	scanf("%ld%d",&n,&x);
	for(int i=0;i<n;++i)// Enumerate integers
	{
		int t=i+1;
		while(t>0)// Check it bit by bit
		{
			if(t%10==x)
				++ans;
			t/=10;
		}
	}
	printf("%ld",ans);
	return 0;
}
