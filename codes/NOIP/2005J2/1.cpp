#include<cstdio>
using namespace std;
bool tree[10001];
int main()
{
	int l,m,ans=0;
	scanf("%d",&l);
	for(int i=0;i<=l;++i)// Initialize the tree array
		tree[i]=true;
	scanf("%d",&m);
	for(int i=0;i<m;++i)
	{
		int s,e;
		scanf("%d%d",&s,&e);
		for(int j=s;j<=e;++j)// Cut the trees down
			tree[j]=false;
	}
	for(int i=0;i<=l;++i)// Count the number of the trees
		if(tree[i])
			++ans;
	printf("%d",ans);
	return 0;
}
