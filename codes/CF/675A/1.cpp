#include<cstdio>
using namespace std;
int main()
{
	long a,b,c;
	scanf("%ld%ld%ld",&a,&b,&c);
	if(a==b)
	{
		printf("YES");
		return 0;
	}
	if(c==0)
	{
		printf("NO");
		return 0;
	}
	printf(((b-a)%c==0 && (a>b ^ c>0))?"YES":"NO");// Pay attention to the division you use! It mustn't be 0 or you will catch some errors
	return 0;
}
