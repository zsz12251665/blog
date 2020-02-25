#include<cstdio>
#include<cstring>// We need to use the memcpy function in cstring
using namespace std;
long count[50],last[50];
int main()
{
	long n,ans=0;
	int k,p;
	scanf("%ld%d%d",&n,&k,&p);
	for(int colour=0;colour<k;++colour)// Initialize the arrays
		count[colour]=last[colour]=0;
	for(long i=0;i<n;++i)
	{
		int colour,cost;
		scanf("%d%d",&colour,&cost);
		count[colour]++;
		if(cost<=p)
		{
			memcpy(last,count,sizeof last);// Renew the last array
			ans+=count[colour]-1;// Remember to minus 1 becuase they would not stay in the same hotel
		}
		else
			ans+=last[colour];
	}
	printf("%ld",ans);
	return 0;
}
