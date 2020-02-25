#include<cstdio>
using namespace std;
long milk[10000];
void qsort(int l,int r)
{
	int x=l,y=r;
	long std=milk[(l+r)/2];
	while(x<y)
	{
		while(milk[x]<std)// Replace this line with "while(milk[x]>std)" to sort in decrease order
			++x;
		while(milk[y]>std)// Replace this line with "while(milk[y]<std)" to sort in decrease order
			--y;
		if(x<=y)
		{
			long tmp=milk[x];
			milk[x++]=milk[y];
			milk[y--]=tmp;
		}
	}
	if(l<y)
		qsort(l,y);
	if(x<r)
		qsort(x,r);
}
int main()
{
	int n;
	scanf("%d",&n);
	for(int i=0;i<n;++i)
		scanf("%ld",&milk[i]);
	qsort(0,n-1);
	printf("%ld",milk[n/2]);
	return 0;
}
