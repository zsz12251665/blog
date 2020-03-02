#include<cstdio>
#include<cstring>// We need to use the strlen function in cstring
using namespace std;
char a[101],b[101],c[101];
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		scanf("%s%s%s",&a,&b,&c);
		bool ans=true;
		for(int i=0,len=strlen(c);i<len;++i)
			if(a[i]!=c[i] && b[i]!=c[i])// Find the position which cannot be same
			{
				ans=false;
				break;
			}
		printf(ans?"YES\n":"NO\n");
	}
	return 0;
}
