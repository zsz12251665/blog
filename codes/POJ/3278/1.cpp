#include<cstdio>
using namespace std;
long time[100000],queue[100000],head=0,foot=1;// The time array is used to mark if it is visited and keep the time to reach
int main()
{
	for(long t=0;t<100000;++i)// Initialize the time array
		time[t]=-1;
	long n,k,t=0;
	scanf("%d%d",&n,&k);
	time[n]=0;
	queue[head]=n;
	long tmp=foot;// tmp is used to keep the end of the queue of this minute
	while(true)
	{
		++t;
		while(head!=tmp)
		{
			if(queue[head]==k)// If FJ has come to k, print the time and return
			{
				printf("%d",time[queue[head]]);
				return 0;
			}
			if(queue[head]<100000 && time[queue[head]+1]==-1)
			{
				time[queue[head]+1]=t;
				queue[foot]=queue[head]+1;
				foot=(foot+1)%100000;// Don't forget to modulo 100000 to avoid getting over array limit
			}
			if(queue[head]>-1 && time[queue[head]-1]==-1)
			{
				time[queue[head]-1]=t;
				queue[foot]=queue[head]-1;
				foot=(foot+1)%100000;
			}
			if(queue[head]<50000 && time[queue[head]*2]==-1)
			{
				time[queue[head]*2]=t;
				queue[foot]=queue[head]*2;
				foot=(foot+1)%100000;
			}
			head=(head+1)%100000;
		}
		tmp=foot;
	}
	return 0;
}
