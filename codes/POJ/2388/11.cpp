#include<cstdio>
using namespace std;
int counter[1000001];
int main()
{
	for(long milk=1;milk<1000001;++milk)
		counter[milk]=0;
	int n;
	scanf("%d",&n);
	for(int i=0;i<n;++i)
	{
		long milk;
		scanf("%ld",&milk);
		counter[milk]++;
	}
	int tmp=0;
	for(long milk=1;milk<1000001;++milk)// Replace this line with "for(long milk=1000000;milk>0;--milk)" to sort in decrease order
		if(tmp+counter[milk]>n/2)
		{
			printf("%ld",milk);
			return 0;
		}
		else
			tmp+=counter[milk];
	return 0;
}
