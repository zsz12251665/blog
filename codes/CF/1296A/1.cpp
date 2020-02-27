#include<cstdio>
using namespace std;
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		int n,cnt=0;
		scanf("%d",&n);
		for(int i=0,a;i<n;++i)
		{
			scanf("%d",&a);
			if(a%2==1)// Count the number of odd numbers
				++cnt;
		}
		printf((cnt%2==1 || cnt>0 && cnt<n)?"YES\n":"NO\n");
	}
	return 0;
}
