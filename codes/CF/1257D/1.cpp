#include<cstdio>
using namespace std;
long a[200000],p[200000],s[200000];
void qsort(long l,long r)// Sort the heroes
{
	long x=l,y=r,std_p=p[(l+r)/2],std_s=s[(l+r)/2];
	while(x<y)
	{
		while(p[x]>std_p || p[x]==std_p && s[x]>std_s)
			++x;
		while(p[y]<std_p || p[y]==std_p && s[y]<std_s)
			--y;
		if(x<=y)
		{
			long tmp=p[x];
			p[x]=p[y];
			p[y]=tmp;
			tmp=s[x];
			s[x++]=s[y];
			s[y--]=tmp;
		}
	}
	if(l<y)
		qsort(l,y);
	if(x<r)
		qsort(x,r);
}
int main()
{
	long t;
	for(scanf("%ld",&t);t>0;--t)
	{
		long n,m,max=-1,ans=0;
		scanf("%ld",&n);
		for(long i=0;i<n;++i)
		{
			scanf("%ld",&a[i]);
			max=(max<a[i])?a[i]:max;
		}
		scanf("%ld",&m);
		for(long i=0;i<m;++i)
			scanf("%ld%ld",&p[i],&s[i]);
		qsort(0,m-1);
		if(max>p[0])// Check whether all the monsters can be defeated
		{
			printf("-1\n");
			continue;
		}
		for(long i=0,max=-1;i<m;++i)// Remove the useless heroes
			if(s[i]>max)
				max=s[i];
			else
				p[i]=-1;
		qsort(0,m-1);
		for(long i=0;i<n;++ans)// Use greedy algorithm to defeat as many monsters as possible
		{
			long cnt=0,max=a[i];
			for(long j=0;j<m && i<n && max<=p[j];++j)// Replace a hero with less power but more endurance
				while(i<n && cnt<s[j] && max<=p[j])// Defeating monsters
				{
					++i;
					++cnt;
					max=(max<a[i])?a[i]:max;
				}
		}
		printf("%d\n",ans);
	}
	return 0;
}
