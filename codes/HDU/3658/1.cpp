#include<cstdio>
using namespace std;
long long matrix[104][104],answer[104][104],power[104][104],temp[104][104];
int main()
{
	for(int i=0;i<104;++i)// Construct the transition matrix
		for(int j=0;j<104;++j)
			matrix[i][j]=0;
	for(int i=0;i<52;++i)// The difference of their ASCII code must not be greater than 32
		for(int j=0;j<52;++j)
			if(i-j>-26 && i-j<26)
				matrix[i][j]=matrix[52+i][52+j]=1;
	for(int i=0;i<26;++i)// The difference of their ASCII code is exactly 32
		matrix[78+i][i]=matrix[52+i][26+i]=matrix[78+i][52+i]=matrix[52+i][78+i]=1;
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		long m;
		scanf("%ld",&m);
		--m;
		for(int i=0;i<104;++i)// Initialize the answer matrix to the identity matrix
		{
			for(int j=0;j<104;++j)
				answer[i][j]=0;
			answer[i][i]=1;
		}
		for(int i=0;i<104;++i)// Initialize the power matrix
			for(int j=0;j<104;++j)
				power[i][j]=matrix[i][j];
		for(;m>0;m/=2)// Calculate the power of matrix
		{
			if(m%2==1)
			{
				for(int i=0;i<104;++i)
					for(int j=0;j<104;++j)
						temp[i][j]=0;
				for(int i=0;i<104;++i)
					for(int j=0;j<104;++j)
						for(int c=0;c<104;++c)
							temp[i][j]=(answer[i][c]*power[c][j]+temp[i][j])%1000000007;
				for(int i=0;i<104;++i)
					for(int j=0;j<104;++j)
						answer[i][j]=temp[i][j];
			}
			for(int i=0;i<104;++i)
				for(int j=0;j<104;++j)
					temp[i][j]=0;
			for(int i=0;i<104;++i)
				for(int j=0;j<104;++j)
					for(int c=0;c<104;++c)
						temp[i][j]=(power[i][c]*power[c][j]+temp[i][j])%1000000007;
				for(int i=0;i<104;++i)
					for(int j=0;j<104;++j)
						power[i][j]=temp[i][j];
		}
		long sum=0;// Calculate the answer, which is the sum of a sub-matrix in the answer matrix
		for(int i=52;i<104;++i)
			for(int j=0;j<52;++j)
				sum=(sum+answer[i][j])%1000000007;
		printf("%ld\n",sum);
	}
	return 0;
}
