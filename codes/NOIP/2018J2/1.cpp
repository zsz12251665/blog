#include<cstdio>
using namespace std;
long a[100000];
long long abs(long long a)
{
	return (a>0)?a:-a;
}
int main()
{
	long n,m,s1,s2,p1,p2=0;
	long long diff=0;
	scanf("%ld",&n);
	for(long i=0;i<n;++i)
		scanf("%ld",&a[i]);
	scanf("%ld%ld%ld%ld",&m,&p1,&s1,&s2);
	a[p1-1]+=s1;
	--m;// C++ starts an array from 0, so remember to minus 1
	for(long i=0;i<n;++i)// Calculate the difference of their powers
		diff+=(long long)a[i]*(i-m);
	for(long i=0;i<n;++i)// Enumerate the position to put your soldiers
		if(abs((long long)s2*(i-m)+diff)<abs((long long)s2*(p2-m)+diff))// long long is required because the data can reach 5,000,000
			p2=i;
	printf("%ld",p2+1);
	return 0;
}
