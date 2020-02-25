#include<cstdio>
using namespace std;
long left[262144],right[262144],colour[262144];
int lazytag[262144];
void init(long p,long l,long r)// Build and initialize the segment tree
{
	left[p]=l;
	right[p]=r;
	colour[p]=1<<1;
	lazytag[p]=0;
	if(l==r)
		return;
	init(2*p+1,l,(l+r)/2);
	init(2*p+2,(l+r)/2+1,r);
}
void change(long p,long l,long r,int c)// The setting operation
{
	if(l==left[p] && r==right[p])// If the range is covered, set the lazytag (that's why the operation is O(lg(n)))
	{
		colour[p]=1<<c;
		if(l!=r)
			lazytag[p]=c;
		return;
	}
	int mid=(left[p]+right[p])/2;
	if(lazytag[p]!=0)// Pass down the lazytag
	{
		change(2*p+1,left[p],mid,lazytag[p]);
		change(2*p+2,mid+1,right[p],lazytag[p]);
		lazytag[p]=0;
	}
	if(r<=mid)
		change(2*p+1,l,r,c);
	if(l>mid)
		change(2*p+2,l,r,c);
	if(l<=mid && r>mid)
	{
		change(2*p+1,l,mid,c);
		change(2*p+2,mid+1,r,c);
	}
	colour[p]=colour[2*p+1]|colour[2*p+2];// Update the colour state
}
long search(long p,long l,long r)// The asking operation
{
	if(lazytag[p]!=0 || l==left[p] && r==right[p])// Lazytag exists means the range is in the same colour, so we don't need to search
		return colour[p];
	int mid=(left[p]+right[p])/2;
	if(r<=mid)
		return search(2*p+1,l,r);
	if(l>mid)
		return search(2*p+2,l,r);
	if(l<=mid && r>mid)
		return search(2*p+1,l,mid)|search(2*p+2,mid+1,r);
}
int main()
{
	long l,o;
	int t;
	scanf("%ld%d%ld",&l,&t,&o);
	init(0,1,l);// Build and init the segment tree
	for(long i=0,a,b;i<o;++i)
	{
		char s=getchar();
		while(s!='C' && s!='P')
			s=getchar();
		if(s=='C')// The setting operation
		{
			scanf("%ld%ld%d",&a,&b,&t);
			change(0,a,b,t);
		}
		if(s=='P')// The asking operation
		{
			scanf("%ld%ld",&a,&b);
			long cset=search(0,a,b);
			t=0;// Count the number of colours
			while(cset!=0)
			{
				t+=cset%2;
				cset/=2;
			}
			printf("%d\n",t);
		}
	}
	return 0;
}
