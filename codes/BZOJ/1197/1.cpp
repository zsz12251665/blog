#include<cstdio>
using namespace std;
long long f[16][101];// f[n][m] keeps the number of kinds of flowers
int main()
{
	int n,m;
	scanf("%d%d",&m,&n);
	for(int i=1;i<=n;++i)// When m=0
		f[i][0]=1;
	for(int j=1;j<=m;++j)// When n=1
		f[1][j]=2*j;
	for(int i=2;i<=n;++i)// When n>1 and m>0
		for(int j=1;j<=m;++j)
			f[i][j]=f[i-1][j-1]+f[i][j-1];
	printf("%lld",f[n][m]);
	return 0;
}
