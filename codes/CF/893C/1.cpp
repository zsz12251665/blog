#include<cstdio>
using namespace std;
long f[100000],c[100000];
long find(long p)
{
	if(f[p]!=p)
		f[p]=find(f[p]);
	return f[p];
}
void merge(long a,long b)// Merge the sets
{
	int fa=find(a),fb=find(b);
	if(c[fa]<c[fb])// Make sure the root of the set is the smallest
		f[fb]=fa;
	else
		f[fa]=fb;
}
int main()
{
	long n,m;
	long long ans=0;
	scanf("%ld%ld",&n,&m);
	for(long i=0;i<n;++i)
	{
		scanf("%d",&c[i]);
		f[i]=i;// Initialize the union find set
	}
	for(long i=0,x,y;i<m;++i)
	{
		scanf("%d%d",&x,&y);
		merge(x-1,y-1);
	}
	for(long i=0;i<n;++i)// Bribe the characters
		if(c[find(i)]!=-1)
		{
			ans+=c[find(i)];
			c[find(i)]=-1;
		}
	printf("%lld",ans);
	return 0;
}
