#include<cstdio>
using namespace std;
int main()
{
	long n;
	int d,e,ans=65535;
	scanf("%ld%d%d",&n,&d,&e);
	e*=5;// Don't forget that it is a FIVE euro bill
	for(long i=0;i<=n/e;++i)// Enumerate the number of the 5 euro bills
		ans=(ans>(n-i*e)%d)?(n-i*e)%d:ans;
	printf("%d",ans);
	return 0;
}
