#include<cstdio>
#include<cstring>// We need to use the memset function and the memcpy function in cstring
using namespace std;
long long matrix[30][30],answer[30][30],multi[30][30],power[30][30],sum[30][30],temp[30][30];
int main()
{
	int n,m;
	long k;
	scanf("%d%ld%d",&n,&k,&m);
	for(int i=0;i<n;++i)// Read the matrix A
		for(int j=0;j<n;++j)
		{
			scanf("%lld",&matrix[i][j]);
			matrix[i][j]=matrix[i][j]%m;
		}
	memcpy(power,matrix,sizeof power);// Initialize the 2^0 times of the matrix A, which is the matrix A
	memcpy(sum,matrix,sizeof sum);// Initialize the sum of the first 2^0 times of the matrix A, which is the matrix A too
	memset(answer,0,sizeof answer);// Initialize the answer matrix, which is the zero matrix
	memset(multi,0,sizeof multi);// Initialize the multi matrix to the identity matrix
	for(int i=0;i<n;++i)
		multi[i][i]=1;
	for(;k>0;k/=2)// Conver k into binary
	{
		if(k%2==1)
		{
			for(int i=0;i<n;++i)// Add the product of the sum and the multiplier to the answer
				for(int j=0;j<n;++j)
					for(int c=0;c<n;++c)
						answer[i][j]=(multi[i][c]*sum[c][j]+answer[i][j])%m;
			memset(temp,0,sizeof temp);// Update the multiplier
			for(int i=0;i<n;++i)
				for(int j=0;j<n;++j)
					for(int c=0;c<n;++c)
						temp[i][j]=(multi[i][c]*power[c][j]+temp[i][j])%m;
			memcpy(multi,temp,sizeof multi);
		}
		memcpy(temp,sum,sizeof temp);// Update the sum
		for(int i=0;i<n;++i)
			for(int j=0;j<n;++j)
				for(int c=0;c<n;++c)
					temp[i][j]=(sum[i][c]*power[c][j]+temp[i][j])%m;
		memcpy(sum,temp,sizeof sum);
		memset(temp,0,sizeof temp);// Update the power
		for(int i=0;i<n;++i)
			for(int j=0;j<n;++j)
				for(int c=0;c<n;++c)
					temp[i][j]=(power[i][c]*power[c][j]+temp[i][j])%m;
		memcpy(power,temp,sizeof power);
	}
	for(int i=0;i<n;++i)
	{
		for(int j=0;j<n;++j)
			printf("%lld ",answer[i][j]);
		putchar('\n');
	}
	return 0;
}
