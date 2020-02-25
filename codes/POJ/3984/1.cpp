#include<cstdio>
using namespace std;
int field[25],parent[25],queue[25],head=0,foot=1;// To make the queue smaller, we use one-dimensional array with (x,y)=field[5x+y]
void show(int a)// Print the answer in reverse order by the function stack
{
	if(a!=0)
		show(parent[a]);
	printf("(%d, %d)\n",a/5,a%5);
}
int main()
{
	for(int i=0;i<25;++i)
	{
		scanf("%d",&field[i]);
		if(field[i]==1)
			parent[i]=-2;
		else
			parent[i]=-1;
	}
	queue[0]=0;
	parent[0]=0;
	while(head<foot)// Make the BFS tree
	{
		if(queue[head]%5>0 && parent[queue[head]-1]==-1)
		{
			queue[foot++]=queue[head]-1;
			parent[queue[head]-1]=queue[head];
		}
		if(queue[head]%5<4 && parent[queue[head]+1]==-1)
		{
			queue[foot++]=queue[head]+1;
			parent[queue[head]+1]=queue[head];
		}
		if(queue[head]/5>0 && parent[queue[head]-5]==-1)
		{
			queue[foot++]=queue[head]-5;
			parent[queue[head]-5]=queue[head];
		}
		if(queue[head]/5<4 && parent[queue[head]+5]==-1)
		{
			queue[foot++]=queue[head]+5;
			parent[queue[head]+5]=queue[head];
		}
		++head;
	}
	show(24);// Print the path
	return 0;
}
