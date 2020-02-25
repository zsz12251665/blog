#include<cstdio>
using namespace std;
long queue[3][8000000],foot[3],head[3];// Don't worry about the memory because you are given 512 MB in this problem
void qsort(long l,long r)
{
	long x=l,y=r,std=queue[0][(l+r)/2];
	while(x<y)
	{
		while(queue[0][x]>std)
			++x;
		while(queue[0][y]<std)
			--y;
		if(x<=y)
		{
			long tmp=queue[0][x];
			queue[0][x++]=queue[0][y];
			queue[0][y--]=tmp;
		}
	}
	if(l<y)
		qsort(l,y);
	if(x<r)
		qsort(x,r);
}
int main()
{
	long n,m,u,v;
	int q,t;
	scanf("%ld%ld%d%ld%ld%d",&n,&m,&q,&u,&v,&t);
	for(long i=0;i<n;++i)
		scanf("%ld",&queue[0][i]);
	qsort(0,n-1);
	head[0]=head[1]=head[2]=foot[1]=foot[2]=0;// Initialize the queues
	foot[0]=n;
	for(long i=0;i<m;++i)
	{
		int mx;// Find the longest worm
		long long worm=-2147483647;
		for(int j=0;j<3;++j)
			if(head[j]<foot[j] && queue[j][head[j]]>worm)
			{
				mx=j;
				worm=queue[j][head[j]];
			}
		worm+=i*q;// Don't forget to add the length while not being cut
		if((i+1)%t==0)
			printf("%lld ",worm);
		queue[1][foot[1]]=worm*u/v-q*(i+1);// Push the two pieces into the queue
		queue[2][foot[2]]=worm-queue[1][foot[1]]-2*q*(i+1);
		head[mx]++;
		foot[1]++;
		foot[2]++;
	}
	putchar('\n');
	for(long i=0;i<n+m;++i)
	{
		int mx;// Find the longest worm
		long long worm=-2147483647;
		for(int j=0;j<3;++j)
			if(head[j]<foot[j] && queue[j][head[j]]>worm)
			{
				mx=j;
				worm=queue[j][head[j]];
			}
		worm+=m*q;
		if((i+1)%t==0)
			printf("%lld ",worm);
		head[mx]++;
	}
	return 0;
}
