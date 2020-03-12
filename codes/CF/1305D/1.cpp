#include<cstdio>
using namespace std;
int d[1001],h[1001],des[2000],nxt[2000];// d[i] is the degree of point i
int main()
{
	int n;
	scanf("%d",&n);
	for(int i=1;i<=n;++i)
	{
		d[i]=0;
		h[i]=-1;
	}
	for(int i=1,p,q;i<n;++i)
	{
		scanf("%d%d",&p,&q);
		++d[p];
		++d[q];
		des[2*i-2]=q;
		nxt[2*i-2]=h[p];
		h[p]=2*i-2;
		des[2*i-1]=p;
		nxt[2*i-1]=h[q];
		h[q]=2*i-1;
	}
	for(int i=0;i<n/2;++i)// Send the queries
	{
		int p=-1,q,lca;// Find two leaf points
		for(int j=1;j<=n;++j)
			if(d[j]==1)
			{
				if(p==-1)
					p=j;
				else
				{
					q=j;
					break;
				}
			}
		printf("? %d %d\n",p,q);// Send the query
		fflush(stdout);
		scanf("%d",&lca);
		if(lca==p || lca==q)// LCA is one of the endpoints
		{
			printf("! %d\n",lca);
			return 0;
		}
		d[p]=d[q]=-1;// Remove the points
		for(int j=h[p];j!=-1;j=nxt[j])
			--d[des[j]];
		for(int j=h[q];j!=-1;j=nxt[j])
			--d[des[j]];
	}
	for(int i=1;i<=n;++i)// Find the last point
		if(d[i]>=0)
		{
			printf("! %d\n",i);
			return 0;
		}
	return 0;
}
