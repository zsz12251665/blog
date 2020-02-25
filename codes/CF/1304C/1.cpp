#include<cstdio>
using namespace std;
int main()
{
	int q,n;
	for(scanf("%d",&q);q>0;--q)
	{
		long m,t,l,h;
		scanf("%d%ld",&n,&m);
		long lp=m,hp=m,last=0;// lp and hp are the lowest and the highest possible temperature, last is the time last customer arrives
		bool ans=true;
		for(int i=0;i<n;++i)
		{
			scanf("%ld%ld%ld",&t,&l,&h);
			lp=(l>lp-t+last)?l:lp-t+last;// Update the range
			hp=(h<hp+t-last)?h:hp+t-last;
			last=t;
			ans=ans&&(lp<=hp);// Check if all range exist
		}
		printf(ans?"YES\n":"NO\n");
	}
	return 0;
}
