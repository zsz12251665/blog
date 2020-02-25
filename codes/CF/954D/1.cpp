#include<cstdio>
using namespace std;
int des[2000],nxt[2000],h[1000],dis_s[1000],dis_t[1000],queue[1000];
bool in_queue[1000];
int main()
{
	int n,m,s,t;
	scanf("%d%d%d%d",&n,&m,&s,&t);
	--s;// The point numbers are from 0 to n-1 in the program while they are from 1 to n in the problem
	--t;
	for(int i=0;i<n;++i)// Initialize arrays
	{
		dis_s[i]=dis_t[i]=65535;
		h[i]=-1;
		in_queue[i]=false;
	}
	for(int i=0,u,v;i<m;++i)// Read the edges
	{
		scanf("%d%d",&u,&v);
		--u;
		--v;
		nxt[2*i]=h[u];
		nxt[2*i+1]=h[v];
		des[2*i]=v;
		des[2*i+1]=u;
		h[u]=2*i;
		h[v]=2*i+1;
	}
	queue[0]=s;// Use SPFA to find the distance to s
	in_queue[s]=true;
	dis_s[s]=0;
	for(int u=0,v=1;u!=v;)// u is the head of the queue and v is the foot
	{
		int p=queue[u++];
		u%=1000;
		in_queue[p]=false;
		for(int i=h[p];i!=-1;i=nxt[i])
			if(dis_s[des[i]]>dis_s[p]+1)
			{
				dis_s[des[i]]=dis_s[p]+1;
				if(!in_queue[des[i]])
				{
					queue[v++]=des[i];
					v%=1000;
					in_queue[des[i]]=true;
				}
			}
	}
	queue[0]=t;// Use SPFA to find the distance to t
	in_queue[t]=1;
	dis_t[t]=0;
	for(int u=0,v=1;u!=v;)
	{
		int p=queue[u++];
		u%=1000;
		in_queue[p]=0;
		for(int i=h[p];i!=-1;i=nxt[i])
			if(dis_t[des[i]]>dis_t[p]+1)
			{
				dis_t[des[i]]=dis_t[p]+1;
				if(!in_queue[des[i]])
				{
					queue[v++]=des[i];
					v%=1000;
					in_queue[des[i]]=true;
				}
			}
	}
	int ans=0;
	for(int u=0;u<n;++u)// Enumerate the pairs to find the possible edges
		for(int v=0;v<u;++v)
			if(dis_s[u]+dis_t[v]+1>=dis_s[t] && dis_t[u]+dis_s[v]+1>=dis_t[s])// Both dis_s[t] and dis_t[s] mean the distance between s and t
				++ans;
	printf("%d",ans-m);// Remove the edges that already exist
	return 0;
}
