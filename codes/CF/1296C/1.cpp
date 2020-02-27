#include<cstdio>
using namespace std;
char s[200001];
struct node
{
	long i,x,y;// i is the index, x and y is the coodinate of the robot
};
node a[200001];
void qsort(long l,long r)// Sort in increasing order of (x,y,i)
{
	long x=l,y=r;
	node std=a[(l+r)/2];
	while(x<y)
	{
		while(a[x].x<std.x || a[x].x==std.x && (a[x].y<std.y || a[x].y==std.y && a[x].i<std.i))
			++x;
		while(a[y].x>std.x || a[y].x==std.x && (a[y].y>std.y || a[y].y==std.y && a[y].i>std.i))
			--y;
		if(x<=y)
		{
			node tmp=a[x];
			a[x++]=a[y];
			a[y--]=tmp;
		}
	}
	if(l<y)
		qsort(l,y);
	if(x<r)
		qsort(x,r);
}
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		long n;
		scanf("%d%s",&n,&s);
		a[0].i=a[0].x=a[0].y=0;// Record the index and coodinate
		for(int i=1;i<=n;++i)
		{
			a[i]=a[i-1];
			a[i].i=i;
			if(s[i-1]=='L')
				--a[i].x;
			if(s[i-1]=='R')
				++a[i].x;
			if(s[i-1]=='U')
				++a[i].y;
			if(s[i-1]=='D')
				--a[i].y;
		}
		qsort(0,n);
		long ans=-1;// ans is the index of the answer in the array, -1 means there are not answer yet
		for(long i=0;i<n;++i)
			if(a[i].x==a[i+1].x && a[i].y==a[i+1].y)// Share the same coodinate
				if(ans==-1 || a[i+1].i-a[i].i<a[ans+1].i-a[ans].i)// Update the answer
					ans=i;
		if(ans==-1)
			printf("-1\n");
		else
			printf("%ld %ld\n",a[ans].i+1,a[ans+1].i);
	}
	return 0;
}
