#include<cstdio>
using namespace std;
long add[30000],small[30000],big[30000];
int get[30000];
void qsort(int l,int r)// The quick sort is used to make sure the get operation in increasing order, it isn't necessary
{
	int x=l,y=r,std=get[(l+r)/2];
	while(x<y)
	{
		while(get[x]<std)
			++x;
		while(get[y]>std)
			--y;
		if(x<=y)
		{
			int tmp=get[x];
			get[x++]=get[y];
			get[y--]=tmp;
		}
	}
	if(l<y)
		qsort(l,y);
	if(x<r)
		qsort(x,r);
}
int main()
{
	int m,n;
	scanf("%d%d",&m,&n);
	for(int i=0;i<m;++i)
		scanf("%ld",&add[i]);
	for(int j=0;j<n;++j)
		scanf("%d",&get[j]);
	qsort(0,n-1);// Sort the get array
	for(int i=0,j=0;i<m && j<n;++i)
	{
		if(j>0 && add[i]<big[0])// The ADD request which started with checking if the new element should be put into the big-root heap
		{
			small[i-j]=big[0];// Put the root element of the big-root heap into the small-root heap
			for(int k=i-j;k>0 && small[k]<small[(k-1)/2];k=(k-1)/2)
			{
				long tmp=small[k];
				small[k]=small[(k-1)/2];
				small[(k-1)/2]=tmp;
			}
			big[0]=add[i];// Replace the root element of the big-root heap with the new element
			for(int k=0;2*k+1<j && big[k]<big[2*k+1] || 2*k+2<j && big[k]<big[2*k+2];)
			{
				k=(2*k+2<j && big[2*k+1]<big[2*k+2])?2*k+2:2*k+1;
				long tmp=big[k];
				big[k]=big[(k-1)/2];
				big[(k-1)/2]=tmp;
			}
		}
		else
		{
			small[i-j]=add[i];// Simply add the new element into the small-root heap
			for(int k=i-j;k>0 && small[k]<small[(k-1)/2];k=(k-1)/2)
			{
				long tmp=small[k];
				small[k]=small[(k-1)/2];
				small[(k-1)/2]=tmp;
			}
		}
		for(;i+1==get[j];++j)// The GET request
		{
			printf("%ld\n",small[0]);// Output the asking element
			big[j]=small[0];// Put the root element of the small-root heap into the big-root heap

			for(int k=j;k>0 && big[k]>big[(k-1)/2];k=(k-1)/2)
			{
				long tmp=big[k];
				big[k]=big[(k-1)/2];
				big[(k-1)/2]=tmp;
			}
			small[0]=small[i-j];// Remove the root element of the small-root heap
			for(int k=0;2*k+1<i-j && small[k]>small[2*k+1] || 2*k+2<i-j && small[k]>small[2*k+2];)
			{
				k=(2*k+2<i-j && small[2*k+1]>small[2*k+2])?2*k+2:2*k+1;
				long tmp=small[k];
				small[k]=small[(k-1)/2];
				small[(k-1)/2]=tmp;
			}
		}
	}
	return 0;
}
