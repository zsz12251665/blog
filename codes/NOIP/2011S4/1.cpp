#include<cstdio>
using namespace std;
long coe[1000][1000];
int main()
{
	long a,b,k,n,m;
	scanf("%ld%ld%ld%ld%ld",&a,&b,&k,&n,&m);
	a%=10007;// Avoid making the coefficient too large
	b%=10007;
	coe[0][0]=1;
	for(long i=0;i<=n;++i)// DP Part
		for(long j=0;j<=m;++j)
		{
			if(i==0 && j==0)
				continue;
			coe[i][j]=0;
			if(i>0)// Do not forget this, or your array index may be overlimited
				coe[i][j]=(coe[i][j]+coe[i-1][j]*a)%10007;
			if(j>0)
				coe[i][j]=(coe[i][j]+coe[i][j-1]*b)%10007;
		}
	printf("%ld",coe[n][m]);
	return 0;
}
