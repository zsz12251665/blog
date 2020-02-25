#include<cstdio>
using namespace std;
int face[100000];
char job[100000][20];
int main()
{
	long n,m;
	scanf("%ld%ld",&n,&m);
	for(long i=0;i<n;++i)
		scanf("%d%s",&face[i],&job[i]);
	long p=0;// Start from the 1st toy
	for(long i=0;i<m;++i)
	{
		long d,s;
		scanf("%ld%ld",&d,&s);
		if(face[p]==d)
			p+=n-s;// Move clockwise
		else
			p+=s;// Move counterclockwise
		p%=n;
	}
	printf("%s",job[p]);
	return 0;
}
