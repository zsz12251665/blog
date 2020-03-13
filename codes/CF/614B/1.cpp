#include<cstdio>
#include<cstring>// We need to use the strcmp, strcpy and strlen function in cstring
using namespace std;
char s[100000],ans[100000]="1";
int main()
{
	long n,cnt=0;
	scanf("%ld",&n);
	for(long i=0;i<n;++i)
	{
		scanf("%s",&s);
		long len=strlen(s);
		while(len>0 && s[len-1]=='0')// Count and remove the suffix 0s
		{
			++cnt;
			--len;
		}
		if(len==0)// The number is 0
		{
			putchar('0');
			return 0;
		}
		s[len]='\0';
		if(strcmp(s,"1")!=0)// If it is not a beautiful number, save it in the string ans
			strcpy(ans,s);
	}
	printf("%s",ans);// Output the answer
	for(long i=0;i<cnt;++i)
		putchar('0');
	return 0;
}
