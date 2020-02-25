#include<cstdio>
using namespace std;
long a[1000000],queue[1000000],index[1000000];
int main()
{
	long n,k;
	scanf("%ld%ld",&n,&k);
	for(long i=0;i<n;++i)
		scanf("%ld",&a[i]);
	long head=0,foot=0;
	for(long i=0;i<k-1;++i)
	{
		while(foot>head && a[i]<queue[foot-1])// Pop out the nodes in the end to keep the queue monotonous
			--foot;
		queue[foot]=a[i];
		index[foot]=i;
		++foot;
	}
	for(long i=k-1;i<n;++i)
	{
		while(foot>head && a[i]<queue[foot-1])// Pop out the nodes in the end to keep the queue monotonous
			--foot;
		queue[foot]=a[i];
		index[foot]=i;
		++foot;
		if(index[head]<=i-k)// Pop out the node that has been out of the range
			++head;
		printf("%ld ",queue[head]);
	}
	putchar('\n');
	head=foot=0;
	for(long i=0;i<k-1;++i)
	{
		while(foot>head && a[i]>queue[foot-1])// Pop out the nodes in the end to keep the queue monotonous
			--foot;
		queue[foot]=a[i];
		index[foot]=i;
		++foot;
	}
	for(long i=k-1;i<n;++i)
	{
		while((foot>head)&&(a[i]>queue[foot-1]))// Pop out the nodes in the end to keep the queue monotonous
			--foot;
		queue[foot]=a[i];
		index[foot]=i;
		++foot;
		if(index[head]<=i-k)// Pop out the node that has been out of the range
			++head;
		printf("%ld ",queue[head]);
	}
	return 0;
}
