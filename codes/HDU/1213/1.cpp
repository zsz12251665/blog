#include<cstdio>
using namespace std;
int uf_set[1000];// The array uf_set is the union find set
bool is_counted[1000];
int find(int a)
{
	if(uf_set[a]!=a)
		uf_set[a]=find(uf_set[a]);
	return uf_set[a];
}
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		int n,m,sum=0;
		scanf("%d%d",&n,&m);
		for(int i=0;i<n;++i)// Initialize the arrays
		{
			uf_set[i]=i;
			is_counted[i]=false;
		}
		for(int i=0,a,b;i<m;++i)
		{
			scanf("%d%d",&a,&b);
			uf_set[find(a-1)]=find(b-1);// Merge the sets
		}
		for(int i=0;i<n;++i)// Count the number of the tables
			if(!is_counted[find(i)])
			{
				is_counted[find(i)]=true;
				++sum;
			}
		printf("%d\n",sum);
	}
	return 0;
}
