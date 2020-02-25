#include<cstdio>
using namespace std;
long milk[10000];
int main()
{
	int n;
	scanf("%d",&n);
	for(int i=0;i<n;++i)
	{
		scanf("%ld",&milk[i]);
		for(int j=i;j>0 && milk[(j-1)/2]>milk[j];j=(j-1)/2)// Replace this line with "for(int j=i;j>0 && milk[(j-1)/2]<milk[j];j=(j-1)/2)" to sort in decrease order
		{
			long tmp=milk[j];
			milk[j]=milk[(j-1)/2];
			milk[(j-1)/2]=tmp;
		}
	}
	for(int i=0;i<n/2;++i)
	{
		milk[0]=milk[n-1-i];
		for(int j=0;2*j+1<n-1-i && milk[j]>milk[2*j+1] || 2*j+2<n-1-i && milk[j]>milk[2*j+2];)// Replace this line with "for(int j=0;2*j+1<n-1-i && milk[j]<milk[2*j+1] || 2*j+2<n-1-i && milk[j]<milk[2*j+2];)" to sort in decrease order
		{
			j=(2*j+2<n-1-i && milk[2*j+1]>milk[2*j+2])?2*j+2:2*j+1;// Replace this line with "j=(2*j+2<n-1-i && milk[2*j+1]<milk[2*j+2])?2*j+2:2*j+1;" to sort in decrease order
			long tmp=milk[j];
			milk[j]=milk[(j-1)/2];
			milk[(j-1)/2]=tmp;
		}
	}
	printf("%ld",milk[0]);
	return 0;
}
