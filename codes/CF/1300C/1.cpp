#include<cstdio>
using namespace std;
long a[100000],b[100000];// b[i] is all elements of the array a except a[i] merging together with the operator |
int main()
{
	long n,ans=0;
	scanf("%ld",&n);
	for(long i=0;i<n;++i)
	{
		scanf("%ld",&a[i]);
		b[i]=0;
	}
	for(long i=0,tmp=0;i<n;++i)// Preprocessing the prefix
	{
		b[i]|=tmp;
		tmp|=a[i];
	}
	for(long i=n-1,tmp=0;i>=0;--i)// Preprocessing the suffix
	{
		b[i]|=tmp;
		tmp|=a[i];
	}
	for(long i=0;i<n;++i)// Find the maximum
		if((a[i]&~b[i])>(a[ans]&~b[ans]))
			ans=i;
	printf("%ld",a[ans]);
	for(long i=0;i<n;++i)
		if(i!=ans)
			printf(" %ld",a[i]);
	return 0;
}
