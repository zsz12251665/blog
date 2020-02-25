#include<cstdio>
using namespace std;
long last[200000];// Array last records the last of position of the numbers
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		long n,a,min=2147483647;
		scanf("%ld",&n);
		for(long i=0;i<=n;++i)// Initialize the array last
			last[i]=-1;
		for(long i=0;i<n;++i)// Scan the sequence to find the closest pairs
		{
			scanf("%ld",&a);
			if(last[a]!=-1 && min>i-last[a]+1)
				min=i-last[a]+1;
			last[a]=i;
		}
		printf("%ld\n",(min==2147483647)?-1:min);
	}
	return 0;
}
