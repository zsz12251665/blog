#include<cstdio>
using namespace std;
long milk[10000];
int main()
{
	int n;
	scanf("%d",&n);
	for(int i=0;i<n;++i)
		scanf("%ld",&milk[i]);
	for(int i=1;i<n;++i)
		for(int j=0;j<i;++j)
			if(milk[i]<milk[j])// Replace this line with "if(milk[i]>milk[j])" to sort in decrease order
			{
				long tmp=milk[j];
				milk[j]=milk[i];
				milk[i]=tmp;
			}
	printf("%ld",milk[n/2]);
	return 0;
}
