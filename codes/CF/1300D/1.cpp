#include<cstdio>
using namespace std;
long x[100000],y[100000];
int main()
{
	long n;
	scanf("%ld",&n);
	if(n%2==1)// There are odd points (edges)
	{
		printf("NO");
		return 0;
	}
	for(long i=0;i<n;++i)
		scanf("%ld%ld",&x[i],&y[i]);
	for(long i=0;i<n/2;++i)
		if(x[i+1]-x[i]!=x[i+n/2]-x[(i+n/2+1)%n]||y[i+1]-y[i]!=y[i+n/2]-y[(i+n/2+1)%n])// The vectors of the subtenses are not opposite to each other
		{
			printf("NO");
			return 0;
		}
	printf("YES");
	return 0;
}
