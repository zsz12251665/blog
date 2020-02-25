#include<cstdio>
using namespace std;
long long coe[5][5],pwr[5][5],tmp[5][5];
int main()
{
	long long n,f[3],c,ans=1;
	scanf("%lld%lld%lld%lld%lld",&n,&f[0],&f[1],&f[2],&c);
	for(int i=0;i<5;++i)// Initialize the matrices
	{
		for(int j=0;j<5;++j)
			coe[i][j]=pwr[i][j]=0;
		coe[i][i]=1;
	}
	pwr[0][0]=pwr[0][1]=pwr[0][2]=pwr[0][3]=pwr[1][0]=pwr[2][1]=pwr[3][3]=pwr[4][4]=1;
	pwr[3][4]=2;
	for(n-=3;n>0;n/=2)// Run the power of the matrix
	{
		if(n%2==1)
		{
			for(int i=0;i<5;++i)
				for(int j=0;j<5;++j)
					tmp[i][j]=0;
			for(int i=0;i<5;++i)
				for(int j=0;j<5;++j)
					for(int k=0;k<5;++k)
						tmp[i][j]=(tmp[i][j]+coe[i][k]*pwr[k][j]%1000000006)%1000000006;
			for(int i=0;i<5;++i)
				for(int j=0;j<5;++j)
					coe[i][j]=tmp[i][j];
		}
		for(int i=0;i<5;++i)
			for(int j=0;j<5;++j)
				tmp[i][j]=0;
		for(int i=0;i<5;++i)
			for(int j=0;j<5;++j)
				for(int k=0;k<5;++k)
					tmp[i][j]=(tmp[i][j]+pwr[i][k]*pwr[k][j]%1000000006)%1000000006;
		for(int i=0;i<5;++i)
			for(int j=0;j<5;++j)
				pwr[i][j]=tmp[i][j];
	}
	for(long long t=(2*coe[0][3]+coe[0][4])%1000000006;t>0;t/=2)// Calculate the power of c
	{
		if(t%2==1)
			ans=ans*c%1000000007;
		c=c*c%1000000007;
	}
	for(int i=0;i<3;++i)// Calculate the power of f
		for(;coe[0][i]>0;coe[0][i]/=2)
		{
			if(coe[0][i]%2==1)
				ans=ans*f[2-i]%1000000007;
			f[2-i]=f[2-i]*f[2-i]%1000000007;
		}
	printf("%lld",ans);
	return 0;
}
