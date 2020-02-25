#include<cstdio>
using namespace std;
int matrix[4],power[4],tmp[4];
int main()
{
	long n;
	scanf("%ld",&n);
	while(n!=-1)
	{
		matrix[3]=power[1]=power[2]=0;// Initialize the matrixes
		matrix[0]=matrix[1]=matrix[2]=power[0]=power[3]=1;
		for(;n>0;n/=2)// The fast power of matrix
		{
			if(n%2==1)// Divide n into binary
			{
				tmp[0]=(power[0]*matrix[0]+power[1]*matrix[2])%10000;// The multiplication of matrix
				tmp[1]=(power[0]*matrix[1]+power[1]*matrix[3])%10000;
				tmp[2]=(power[2]*matrix[0]+power[3]*matrix[2])%10000;
				tmp[3]=(power[2]*matrix[1]+power[3]*matrix[3])%10000;
				power[0]=tmp[0];
				power[1]=tmp[1];
				power[2]=tmp[2];
				power[3]=tmp[3];
			}
			tmp[0]=(matrix[0]*matrix[0]+matrix[1]*matrix[2])%10000;// Square the matrix
			tmp[1]=(matrix[0]*matrix[1]+matrix[1]*matrix[3])%10000;
			tmp[2]=(matrix[2]*matrix[0]+matrix[3]*matrix[2])%10000;
			tmp[3]=(matrix[2]*matrix[1]+matrix[3]*matrix[3])%10000;
			matrix[0]=tmp[0];
			matrix[1]=tmp[1];
			matrix[2]=tmp[2];
			matrix[3]=tmp[3];
		}
		printf("%d\n",power[1]);
		scanf("%ld",&n);
	}
	return 0;
}
