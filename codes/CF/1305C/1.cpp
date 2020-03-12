#include<cstdio>
using namespace std;
long num[1000];// num[i] contains an a[j] that a[j]%m==i
int main()
{
	long n;
	int m;
	scanf("%ld%d",&n,&m);
	for(int i=0;i<m;++i)
		num[i]=-1;// -1 means that there is no number yet
	for(long a;n>0;--n)// Find same remainders
	{
		scanf("%ld",&a);
		if(num[a%m]==-1)
			num[a%m]=a;
		else// Find a second one
		{
			printf("0");
			return 0;
		}
	}
	int ans=1;// Calculate the answer
	for(int i=0;i<m;++i)
		if(num[i]!=-1)
			for(int j=0;j<i;++j)
				if(num[j]!=-1)
					ans=(((num[i]>num[j])?num[i]-num[j]:num[j]-num[i])%m*ans)%m;
	printf("%d",ans);
	return 0;
}
