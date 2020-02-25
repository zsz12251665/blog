#include<cstdio>
using namespace std;
int field[39][39];
int main()
{
	int n,i,j;
	scanf("%d",&n);
	for(i=0;i<n;++i)// Initialize the field array
		for(j=0;j<n;++j)
			field[i][j]=0;
	i=0;
	j=n/2;
	for(int t=1;t<=n*n;++t)// Put the numbers into the field array
	{
		field[i][j]=t;
		if(i==0 && j!=n-1)
		{
			i=n-1;
			++j;
			continue;
		}
		if(i!=0 && j==n-1)
		{
			--i;
			j=0;
			continue;
		}
		if(i==0 && j==n-1 || field[i-1][j+1]!=0)
			++i;
		else
		{
			--i;
			++j;
		}
	}
	for(i=0;i<n;++i)// Print the field array
	{
		for(j=0;j<n;++j)
			printf("%d ",field[i][j]);
		printf("\n");
	}
	return 0;
}
