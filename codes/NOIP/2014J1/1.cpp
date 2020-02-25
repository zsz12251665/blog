#include<cstdio>
using namespace std;
int a[100];
int main()
{
	int n,cnt=0;
	scanf("%d",&n);
	for(int i=0;i<n;++i)
		scanf("%d",&a[i]);
	for(int i=0;i<n;++i)// Enumerate the numbers
		for(int j=0;j<n*n;++j)// Enumerate the pairs in one loop by enumerating j1*n+j2
			if(j/n!=j%n && a[i]==a[j/n]+a[j%n])
			{
				++cnt;
				break;// We are asked to count the number of the numbers, not the pairs
			}
	printf("%d",cnt);
	return 0;
}
