#include<cstdio>
using namespace std;
long u[100000],v[100000],d[100000];
int main()
{
	long n,max_p=0;// max_p is the node with maximum degree
	scanf("%ld",&n);
	for(long i=0;i<n;++i)
		d[i]=0;
	for(long i=0;i<n-1;++i)
	{
		scanf("%ld%ld",&u[i],&v[i]);
		++d[--u[i]];
		++d[--v[i]];
		if(d[u[i]]>d[max_p])// Find the node with maximum degree
			max_p=u[i];
		if(d[v[i]]>d[max_p])
			max_p=v[i];
	}
	if(d[max_p]<3)// The tree is a chain
		for(long i=0;i<n-1;++i)
			printf("%ld\n",i);
	else
		for(long i=0,cnt=0;i<n-1;++i)// Allocate the minimum labels to the edges connecting to max_p
			printf("%ld\n",(u[i]==max_p || v[i]==max_p)?cnt++:n-2-i+cnt);
	return 0;
}
