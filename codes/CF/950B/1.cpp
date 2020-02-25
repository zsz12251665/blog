#include<cstdio>
using namespace std;
long x[100000],y[100000];
int main()
{
	long n,m,ans=0;
	scanf("%ld%ld",&n,&m);
	for(long i=0;i<n;++i)
		scanf("%ld",&x[i]);
	for(long i=0;i<m;++i)
		scanf("%ld",&y[i]);
	for(long i=0,j=0,total_x=0,total_y=0;i<n || j<m;)
	{
		if(total_x>total_y)// Add the smaller one
			total_y+=y[j++];
		else
			total_x+=x[i++];
		if(total_x==total_y)// Add it to the counter
			++ans;
	}
	printf("%ld",ans);
	return 0;
}
