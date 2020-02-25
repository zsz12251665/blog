#include<cstdio>
using namespace std;
int a[100],inca[100],deca[100];
int main()
{
	int n;
	scanf("%d",&n);
	for(int i=0;i<n;++i)
	{
		scanf("%d",&a[i]);
		inca[i]=deca[i]=1;
	}
	for(int i=1;i<n;++i)// Find the longest ascending subsequences
		for(int j=0;j<i;++j)
			if(a[j]<a[i] && inca[j]+1>inca[i])
				inca[i]=inca[j]+1;
	for(int i=n-2;i>0;--i)// Find the longest descending subsequences
		for(int j=n-1;j>i;--j)
			if(a[j]<a[i] && deca[j]+1>deca[i])
				deca[i]=deca[j]+1;
	int ans=n;
	for(int i=0;i<n;++i)
		if(n-inca[i]-deca[i]+1<ans)// Do not forget to add 1 because you've count i twice
			ans=n-inca[i]-deca[i]+1;
	printf("%d",ans);
	return 0;
}
