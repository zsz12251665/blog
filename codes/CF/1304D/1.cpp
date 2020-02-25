#include<cstdio>
using namespace std;
char s[200000];
long g[200000],l[200000];// g[i] is the number of '>' following consecutively and l[i] is the number of '<' following consecutively
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		long n;
		scanf("%ld%s",&n,s);
		g[n-1]=l[n-1]=0;// Calculate g[i] and l[i]
		for(long i=n-2;i>=0;--i)
		{
			g[i]=(s[i]=='<')?0:g[i+1]+1;
			l[i]=(s[i]=='>')?0:l[i+1]+1;
		}
		printf("%ld",n-l[0]);// The lexicographically largest sequence
		for(long i=1,last=n;i<n;++i)
		{
			if(s[i-1]=='>')
				last=n-i;
			printf(" %ld",last-l[i]);
		}
		putchar('\n');
		printf("%ld",1+g[0]);// The lexicographically smallest sequence
		for(long i=1,last=1;i<n;++i)
		{
			if(s[i-1]=='<')
				last=1+i;
			printf(" %ld",last+g[i]);
		}
		putchar('\n');
	}
	return 0;
}
