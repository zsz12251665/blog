#include<cstdio>
using namespace std;
char s[200001];
int main()
{
	long n,cnt=0,min=0;
	scanf("%ld%s",&n,&s);
	for(long i=0;i<n;++i)// Scan the sequence
	{
		cnt+=(s[i]=='(')?1:-1;// Count the difference of the numbers of brackets
		min=(cnt<min)?cnt:min;// The minimum of the difference shows how many right brackets appeared before their left brackets
	}
	printf((cnt!=0 || min<-1)?"No":"Yes");
	return 0;
}
