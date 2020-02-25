#include<cstdio>
using namespace std;
int main()
{
	int t,a,b,c;
	for(scanf("%d",&t);t>0;--t)
	{
		scanf("%d%d%d",&a,&b,&c);
		if(a<b)// Sort the numbers in advance
		{
			int tmp=a;
			a=b;
			b=tmp;
		}
		if(a<c)
		{
			int tmp=a;
			a=c;
			c=tmp;
		}
		if(b<c)
		{
			int tmp=b;
			b=c;
			c=tmp;
		}
		int ans=0;// Try all the combinations
		if(a>0)
		{
			--a;
			++ans;
		}
		if(b>0)
		{
			--b;
			++ans;
		}
		if(c>0)
		{
			--c;
			++ans;
		}
		if(a>0 && b>0)
		{
			--a;
			--b;
			++ans;
		}
		if(a>0 && c>0)// The order should not be change here because we hope to use as many a as possible because it is the largest
		{
			--a;
			--c;
			++ans;
		}
		if(b>0 && c>0)
		{
			--b;
			--c;
			++ans;
		}
		if(a>0 && b>0 && c>0)
		{
			--a;
			--b;
			--c;
			++ans;
		}
		printf("%d\n",ans);
	}
	return 0;
}
