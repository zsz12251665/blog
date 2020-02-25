#include<cstdio>
using namespace std;
int n;
bool visit[1000];// Remember to set up a visit array to prevent your dfs from falling into a loop
long long x[1000],y[1000],z[1000],h,r;// To avoid overlimit or too many type conversions, I set the large integers as long long directly
bool dfs(int p)
{
	visit[p]=true;// Set the visit tag
	if(z[p]>=h-r)// Check if the mouse has got out
		return true;
	for(int i=0;i<n;++i)// Find the way to go on
		if(!visit[i] && (x[i]-x[p])*(x[i]-x[p])+(y[i]-y[p])*(y[i]-y[p])+(z[i]-z[p])*(z[i]-z[p])<=4*r*r && dfs(i))
			return true;
	return false;
}
int main()
{
	int t;
	scanf("%d",&t);
	for(;t>0;--t)
	{
		scanf("%d%lld%lld",&n,&h,&r);
		for(int i=0;i<n;++i)
		{
			visit[i]=false;
			scanf("%lld%lld%lld",&x[i],&y[i],&z[i]);
		}
		bool getout=false;
		for(int i=0;i<n && !getout;++i)// Enumerate the way to get in
			if(z[i]<=r)
				getout=dfs(i);
		printf(getout?"Yes\n":"No\n");
	}
	return 0;
}
