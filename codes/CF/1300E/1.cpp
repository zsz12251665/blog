#include<cstdio>
using namespace std;
double p[1000000];// p[i] is the numerator of the average
long q[1000000];// q[i] is the denominator of the average as well as the number of elements
int main()
{
	long n,size=0;// size is the number of elements inside the stack
	scanf("%ld",&n);
	for(long i=0,tmp;i<n;++i)
	{
		scanf("%ld",&tmp);
		p[size]=tmp;
		q[size]=1;
		while(size>0 && p[size]/q[size]<p[size-1]/q[size-1])// Average with the previous block
		{
			p[size-1]+=p[size];
			q[size-1]+=q[size];
			--size;
		}
		++size;
	}
	for(long i=0;i<size;++i)
		for(long j=0;j<q[i];++j)
			printf("%.10lf\n",p[i]/q[i]);
	return 0;
}
