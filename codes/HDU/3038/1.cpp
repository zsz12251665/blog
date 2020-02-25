#include<cstdio>
using namespace std;
long f[200001];
long long d[200001];// d[i] is the difference of the prefix sum to the i-th and the prefix sum to the f[i]-th
long find(long p)
{
	if(f[p]==p)
		return p;
	long fp=find(f[p]);
	d[p]+=d[f[p]];
	return f[p]=fp;
}
bool merge(long a,long b,long s)
{
	long fa=find(a),fb=find(b);
	if(fa==fb)// The relationship is clear
		return d[b]-d[a]!=s;// Find a wrong answer
	d[fb]=s+d[a]-d[b];
	f[fb]=fa;
	return false;
}
int main()
{
	for(long n,m;scanf("%ld%ld",&n,&m)!=EOF;)
	{
		for(long i=0;i<=n;++i)// Initialize the union find set and the difference
		{
			f[i]=i;
			d[i]=0;
		}
		long ans=0;
		for(long i=0,a,b,s;i<m;++i)
		{
			scanf("%ld%ld%ld",&a,&b,&s);
			ans+=merge(a-1,b,s)?1:0;
		}
		printf("%ld\n",ans);
	}
	return 0;
}
