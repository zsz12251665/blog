#include<cstdio>
using namespace std;
long a[2000];
int b[2001];
int main()
{
	int n,m;
	scanf("%d%d",&n,&m);
	for(int i=0;i<=m;++i)// Initialize the counter
		b[i]=0;
	for(int i=0;i<n;++i)// Input the playlist and count the number of the songs that each band will sing
	{
		scanf("%ld",&a[i]);
		if(a[i]<=m)
			b[a[i]]++;
	}
	for(int i=0;i<n;++i)// Replace the songs
		if(a[i]>m || b[a[i]]>n/m)
			for(int j=1;j<=m;++j)// Eunmerate the band can replace the song
				if(b[j]<n/m)
				{
					b[0]++;// Update the counter
					b[j]++;
					if(a[i]<=m)
						b[a[i]]--;
					a[i]=j;// Change the value
					break;
				}
	printf("%d %d\n",n/m,b[0]);
	for(int i=0;i<n;++i)
		printf("%d ",a[i]);
	return 0;
}
