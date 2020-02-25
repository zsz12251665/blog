#include<cstdio>
using namespace std;
int h[15],pre[15],q[15],des[2000],nxt[2000],flow[2000],n,m;// The pre array is used to record from which edge the point is
bool visited[15];
int bfs(int s,int t)
{
	int head=0,foot=1;
	for(int i=0;i<n;++i)
	{
		pre[i]=-1;
		visited[i]=false;
	}
	q[0]=s;// Push the start point into the queue
	visited[s]=true;
	while(head!=foot)
	{
		int p=q[head];
		head=(head+1)%15;
		for(int i=h[p];i!=-1;i=nxt[i])
			if(!visited[des[i]] && flow[i]>0)// Find a new point
			{
				visited[des[i]]=true;
				pre[des[i]]=i;
				if(des[i]==t)// Reach the end point
				{
					int ans=65535;
					for(int j=pre[t];j!=-1;j=pre[des[(j%2==1)?j-1:j+1]])// Trace back to find the bottleneck edge
						if(ans>flow[j])
							ans=flow[j];
					for(int j=pre[t];j!=-1;j=pre[des[(j%2==1)?j-1:j+1]])
					{
						flow[j]-=ans;// Update the edge
						flow[(j%2==1)?j-1:j+1]+=ans;// Update the inverse edge
					}
					return ans;
				}
				q[foot]=des[i];// Push it into the queue
				foot=(foot+1)%15;
			}
	}
	return 0;
}
int main()
{
	int t;
	scanf("%d",&t);
	for(int ti=1;ti<=t;++ti)
	{
		scanf("%d%d",&n,&m);
		for(int i=0;i<n;++i)
			h[i]=-1;
		for(int i=0,u,v,w;i<m;++i)
		{
			scanf("%d%d%d",&u,&v,&w);
			des[2*i]=v-1;// Build the edge
			nxt[2*i]=h[u-1];
			flow[2*i]=w;
			h[u-1]=2*i;
			des[2*i+1]=u-1;// Build the inverse edge
			nxt[2*i+1]=h[v-1];
			flow[2*i+1]=0;
			h[v-1]=2*i+1;
		}
		long ans=0;
		for(int tmp=bfs(0,n-1);tmp>0;tmp=bfs(0,n-1))// Keep trying until we cannot find a new augment path
			ans+=tmp;
		printf("Case %d: %ld\n",ti,ans);
	}
	return 0;
}
