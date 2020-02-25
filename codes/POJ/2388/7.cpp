#include<cstdio>
#include<cstring>// We need to use the memcpy function in cstring
using namespace std;
long milk[10000],copy[10000];
void msort(int l,int r)
{
	if(l>=r)
		return;
	msort(l,(l+r)/2);
	msort((l+r)/2+1,r);
	memcpy(copy,milk,sizeof milk);
	for(int i=l,x=l,y=(l+r)/2+1;i<=r;++i)
	{
		if(x>(l+r)/2)
		{
			milk[i]=copy[y++];
			continue;
		}
		if(y>r)
		{
			milk[i]=copy[x++];
			continue;
		}
		if(copy[x]>copy[y])// Replace this line with "if(copy[x]<copy[y])" to sort in decrease order
			milk[i]=copy[y++];
		else
			milk[i]=copy[x++];
	}
}
int main()
{
	int n;
	scanf("%d",&n);
	for(int i=0;i<n;++i)
		scanf("%ld",&milk[i]);
	msort(0,n-1);
	printf("%ld",milk[n/2]);
	return 0;
}
