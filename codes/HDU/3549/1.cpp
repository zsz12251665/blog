#include<cstdio>
using namespace std;
int h[15],des[2000],nxt[2000],flow[2000],n,m;
bool visited[15];
int dfs(int p,int t,int f)// f is the maximum flow available from the start point to point p
{
	if(p==t)// Reach the end point
		return f;
	visited[p]=true;
	for(int i=h[p];i!=-1;i=nxt[i])
		if(!visited[des[i]] && flow[i]>0)
		{
			int tmp=dfs(des[i],t,(f<flow[i])?f:flow[i]);
			if(tmp>0)// Find a new augment path
			{
				flow[i]-=tmp;// Update the edge
				flow[(i%2==1)?i-1:i+1]+=tmp;// Update the inverse edge
				visited[p]=false;
				return tmp;
			}
		}
	visited[p]=false;
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
		{
			h[i]=-1;
			visited[i]=false;
		}
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
		for(int tmp=dfs(0,n-1,65535);tmp>0;tmp=dfs(0,n-1,65535))// Keep trying until we cannot find a new augment path
			ans+=tmp;
		printf("Case %d: %ld\n",ti,ans);
	}
	return 0;
}
