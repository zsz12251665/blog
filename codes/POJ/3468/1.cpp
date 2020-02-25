#include<cstdio>
using namespace std;
long long sum[262144];
long arr[100000],left[262144],right[262144],lazytag[262144];
void init(long p,long l,long r)// Build and initialize the segment tree
{
	left[p]=l;
	right[p]=r;
	lazytag[p]=0;
	if(l==r)
	{
		sum[p]=arr[l-1];
		return;
	}
	init(2*p+1,l,(l+r)/2);
	init(2*p+2,(l+r)/2+1,r);
	sum[p]=sum[2*p+1]+sum[2*p+2];
}
void add(long p,long l,long r,long c)// The adding operation
{
	sum[p]+=(long long)c*(r-l+1);// Update the sum and remember to use long long
	if(l==left[p] && r==right[p])
	{
		if(l!=r)// Add the lazytag
			lazytag[p]+=c;
		return;
	}
	int mid=(left[p]+right[p])/2;
	if(lazytag[p]!=0)// Pass down the lazytag
	{
		add(2*p+1,left[p],mid,lazytag[p]);
		add(2*p+2,mid+1,right[p],lazytag[p]);
		lazytag[p]=0;
	}
	if(r<=mid)
		add(2*p+1,l,r,c);
	if(l>mid)
		add(2*p+2,l,r,c);
	if(l<=mid && r>mid)
	{
		add(2*p+1,l,mid,c);
		add(2*p+2,mid+1,r,c);
	}
}
long long search(long p,long l,long r)// The searching operation
{
	if(l==left[p] && r==right[p])
		return sum[p];
	int mid=(left[p]+right[p])/2;
	if(lazytag[p]!=0)// Pass down the lazytag
	{
		add(2*p+1,left[p],mid,lazytag[p]);
		add(2*p+2,mid+1,right[p],lazytag[p]);
		lazytag[p]=0;
	}
	if(r<=mid)
		return search(2*p+1,l,r);
	if(l>mid)
		return search(2*p+2,l,r);
	if(l<=mid && r>mid)
		return search(2*p+1,l,mid)+search(2*p+2,mid+1,r);
}
int main()
{
	long n,q;
	scanf("%ld%ld",&n,&q);
	for(int i=0;i<n;++i)
		scanf("%ld",&arr[i]);
	init(0,1,n);// Build and initialize the segment tree
	for(long i=0,a,b;i<q;++i)
	{
		char s=getchar();
		while(s!='C' && s!='Q')
			s=getchar();
		if(s=='C')// The adding operation
		{
			int c;
			scanf("%ld%ld%d",&a,&b,&c);
			add(0,a,b,c);
		}
		if(s=='Q')// The searching operation
		{
			scanf("%ld%ld",&a,&b);
			printf("%lld\n",search(0,a,b));
		}
	}
	return 0;
}
