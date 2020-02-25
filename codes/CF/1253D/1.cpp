#include<cstdio>
using namespace std;
long f[200001];
long find(long p)
{
	if(f[p]!=p)
		f[p]=find(f[p]);
	return f[p];
}
void merge(long a,long b)
{
	long fa=find(a),fb=find(b);
	if(fa>fb)// Make sure the root point has the maximum index
		f[fb]=fa;
	else
		f[fa]=fb;
}
int main()
{
	long n,m;
	scanf("%ld%ld",&n,&m);
	for(long i=0;i<=n;++i)
		f[i]=i;
	for(long i=0,x,y;i<m;++i)
	{
		scanf("%ld%ld",&x,&y);
		merge(x-1,y-1);
	}
	long ans=0;
	for(long i=0,p=find(0);i<n;++i)// Scan the sequence and add edges if necessary, p is the maximum index in this block
	{
		if(find(i)!=p)// Find a point which does not match
		{
			merge(i,p);
			p=find(i);// Update the maximum index
			++ans;
		}
		if(i==p && i<n-1)// Jump to the next connected block
			p=find(i+1);
	}
	printf("%ld",ans);
	return 0;
}
