#include<cstdio>
using namespace std;
int main()
{
	int k,r,ans=1;
	scanf("%d%d",&k,&r);
	while((k*ans)%10!=0 && (k*ans)%10!=r)// Enumerate the number of shovels to buy
		++ans;
	printf("%d",ans);
	return 0;
}
