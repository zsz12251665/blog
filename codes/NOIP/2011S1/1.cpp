#include<cstdio>
using namespace std;
long a[10000],b[10000],g[10000],k[10000];
int main()
{
	int n;
	scanf("%d",&n);
	for(int i=0;i<n;++i)
		scanf("%ld%ld%ld%ld",&a[i],&b[i],&g[i],&k[i]);
	long x,y;
	scanf("%ld%ld",&x,&y);
	for(int i=n-1;i>=0;--i)// Remember that we need to output the top one
		if(a[i]<=x && b[i]<=y && a[i]+g[i]>=x && b[i]+k[i]>=y)// If it has covered the coordinate, output it then exit
		{
			printf("%d",i+1);// In C/C++, the array indexes are from 0 to n-1, so do not forget to add 1 when you output the index
			return 0;
		}
	printf("-1");// If no carpet has covered the coordinate, output -1
	return 0;
}
