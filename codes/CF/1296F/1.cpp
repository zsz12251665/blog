#include<cstdio>
using namespace std;
struct survey
{
	int a,b;
	long g;
};
survey s[5000];
int des[10000],nxt[10000],h[5000],que[5000],fa[5000],d[5000];
long f[5000];// f[i] is the scenery beauty of the edge connecting i and fa[i]
void qsort(int l,int r)// Sort the survey array in increasing order of g
{
	int x=l,y=r;
	long std=s[(l+r)/2].g;
	while(x<y)
	{
		while(s[x].g<std)
			++x;
		while(s[y].g>std)
			--y;
		if(x<=y)
		{
			survey tmp=s[x];
			s[x++]=s[y];
			s[y--]=tmp;
		}
	}
	if(l<y)
		qsort(l,y);
	if(x<r)
		qsort(x,r);
}
int find_lca(int a,int b)// Find the lowest common ancestor of a and b
{
	while(d[a]>d[b])
		a=fa[a];
	while(d[a]<d[b])
		b=fa[b];
	while(a!=b)
	{
		a=fa[a];
		b=fa[b];
	}
	return a;
}
int main()
{
	int n,m;
	scanf("%d",&n);
	for(int i=0;i<n;++i)
	{
		h[i]=-1;
		f[i]=1;// The minimum value of f[i] is 1
	}
	for(int i=1,p,q;i<n;++i)// Input the graph
	{
		scanf("%d%d",&p,&q);
		--p;
		--q;
		des[2*i-2]=q;
		nxt[2*i-2]=h[p];
		h[p]=2*i-2;
		des[2*i-1]=p;
		nxt[2*i-1]=h[q];
		h[q]=2*i-1;
	}
	fa[0]=d[0]=que[0]=0;// Build the tree
	for(int head=0,foot=1;head!=foot;)
	{
		int p=que[head++];
		for(int i=h[p];i!=-1;i=nxt[i])
			if(des[i]!=fa[p])
			{
				fa[des[i]]=p;
				d[des[i]]=d[p]+1;
				que[foot++]=des[i];
			}
	}
	scanf("%d",&m);
	for(int i=0;i<m;++i)// Input the surveys
	{
		scanf("%d%d%ld",&s[i].a,&s[i].b,&s[i].g);
		--s[i].a;
		--s[i].b;
	}
	qsort(0,m-1);// Sort the surveys
	for(int i=0;i<m;++i)// Apply the surveys
	{
		int lca=find_lca(s[i].a,s[i].b);
		for(int j=s[i].a;j!=lca;j=fa[j])
			if(f[j]<s[i].g)
				f[j]=s[i].g;
		for(int j=s[i].b;j!=lca;j=fa[j])
			if(f[j]<s[i].g)
				f[j]=s[i].g;
	}
	for(int i=0;i<m;++i)// Validate the surveys
	{
		int lca=find_lca(s[i].a,s[i].b);
		long min=2147483647;
		for(int j=s[i].a;j!=lca;j=fa[j])
			if(f[j]<min)
				min=f[j];
		for(int j=s[i].b;j!=lca;j=fa[j])
			if(f[j]<min)
				min=f[j];
		if(min!=s[i].g)// The result is different
		{
			printf("-1");
			return 0;
		}
	}
	for(int i=1;i<n;++i)
		printf("%d ",(d[des[2*i-2]]<d[des[2*i-1]])?f[des[2*i-1]]:f[des[2*i-2]]);// Output the result in the order of the edges
	return 0;
}
