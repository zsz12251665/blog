#include<cstdio>
using namespace std;
int main()
{
	int n;
	scanf("%d",&n);
	long long ans=0;// You need a long long to store the answer because the answer can be as large as 2^50 or 3^33
	for(int i=0,tmp,cnt=1;i<n;++i)
	{
		scanf("%d",&tmp);
		if(tmp==0)
			++cnt;
		else
		{
			ans*=cnt;
			if(ans==0)// We don't need the empty bars before the first nut
				++ans;
			cnt=1;
		}
	}
	printf("%lld",ans);
}
