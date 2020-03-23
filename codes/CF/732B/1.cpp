#include<cstdio>
using namespace std;
int a[500];
int main()
{
	int n,k;
	scanf("%d%d",&n,&k);
	long ans=0;
	for(int i=0;i<n;++i)
		scanf("%d",&a[i]);
	for(int i=1;i<n;++i)// Enumerate any two consecutive days
		if(a[i-1]+a[i]<k)
		{
			ans+=k-a[i]-a[i-1];// Add the second day to the requirement
			a[i]=k-a[i-1];
		}
	printf("%ld\n",ans);
	for(int i=0;i<n;++i)
		printf("%d ",a[i]);
	return 0;
}
