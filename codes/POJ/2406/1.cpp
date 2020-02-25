#include<cstdio>
#include<cstring>// We need to use the strlen function in cstring
using namespace std;
char s[1000001];
int main()
{
	for(scanf("%s",&s);strcmp(s,".")!=0;scanf("%s",&s))
	{
		long len=strlen(s);
		for(long i=1;i<=len;++i)// Enumerate the length of a period
			if(len%i==0)
			{
				bool is_period=true;
				for(long j=0;j<len;++j)// Scan the whole string to check if it is a period
					if(s[j]!=s[j%i])
					{
						is_period=false;
						break;
					}
				if(is_period)// The shortest period makes the biggest power index
				{
					printf("%ld\n",len/i);
					break;
				}
			}
	}
	return 0;
}
