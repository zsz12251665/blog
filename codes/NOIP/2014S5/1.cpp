#include<cstdio>
using namespace std;
long h_nxt[200000],f_nxt[200000],h[10000],f[10000];// the h arrays are the edges in the normal order, the f ones are the edges in the reverse order
int h_des[200000],f_des[200000],dis[10000],status[10000],queue[10000];
bool inqueue[10000];
void mark(int p)// Mark the points that are linked to the destination
{
	for(long i=f[p];i!=-1;i=f_nxt[i])
		if(status[f_des[i]]==0)
		{
			status[f_des[i]]=1;
			mark(f_des[i]);
		}
}
int main()
{
	int n,s,t;
	long m;
	scanf("%d%ld",&n,&m);
	for(int i=0;i<n;++i)// Initialize the arrays
	{
		h[i]=f[i]=-1;// The sign of the end
		status[i]=0;// status[i]=1 means i is linked to t, status[i]=0 means it isn't, and status[i]>=10 means there is at least 1 point which is connected to i but not linked to t
		dis[i]=32767;
		inqueue[i]=false;
	}
	for(long j=0;j<m;++j)
	{
		scanf("%d%d",&f_des[j],&h_des[j]);
		f_des[j]--;// C++ starts the arrays from 0 to n-1, so we minus 1 to make it suitable
		h_des[j]--;
		h_nxt[j]=h[f_des[j]];// Insert the edges
		f_nxt[j]=f[h_des[j]];
		h[f_des[j]]=j;
		f[h_des[j]]=j;
	}
	scanf("%d%d",&s,&t);
	--s;
	--t;
	status[t]=1;
	mark(t);
	for(int i=0;i<n;++i)// Mark the points that is connect to the points which are not linked to the destination
		for(long j=h[i];j!=-1;j=h_nxt[j])
			if(status[h_des[j]]%10!=1)
			{
				status[i]+=10;
				break;
			}
	dis[s]=0;// Use SPFA to find the shortest path
	queue[0]=s;
	inqueue[s]=true;
	int head=0,foot=1;
	while(head!=foot)
	{
		int p=queue[head];
		head=(head+1)%10000;
		inqueue[p]=false;
		for(long j=h[p];j!=-1;j=h_nxt[j])
			if(status[h_des[j]]==1 && dis[h_des[j]]>dis[p]+1)// Check if this point is optional
			{
				if(!inqueue[h_des[j]])
				{
					inqueue[h_des[j]]=true;
					queue[foot]=h_des[j];
					foot=(foot+1)%10000;
				}
				dis[h_des[j]]=dis[p]+1;
			}
	}
	if(dis[t]==32767)
		printf("-1");
	else
		printf("%d",dis[t]);
	return 0;
}
