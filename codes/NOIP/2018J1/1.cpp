#include<cstdio>
using namespace std;
int main()
{
	int cnt=0;
	for(char c=getchar();c!=EOF;c=getchar())// Scan the whole input
		cnt+=c>='0' && c<='9' || c>='A' && c<='Z' || c>='a' && c<='z';// When c is a letter or a number, add the counter
	printf("%d",cnt);
	return 0;
}
