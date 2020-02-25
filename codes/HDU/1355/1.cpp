#include<cstdio>
using namespace std;
int p[50][50];
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		int n,m,k,max_i=0,max_j=0;// The coordinate of the tree with most peanuts
		scanf("%d%d%d",&n,&m,&k);
		for(int i=0;i<n;++i)
			for(int j=0;j<m;++j)
			{
				scanf("%d",&p[i][j]);
				if(p[i][j]>p[max_i][max_j])// Find the tree with most peanuts
				{
					max_i=i;
					max_j=j;
				}
			}
		int last_i=-1,last_j=max_j;// Decide the start point, it is the coordinate of the last visited tree
		long sum=0;
		k-=((max_j>last_j)?max_j-last_j:last_j-max_j)+1;// Calculate the extra time
		if(max_i>last_i)// If max point isn't on the way back
			k-=(max_i-last_i)*2;
		while(k>=0)
		{
			sum+=p[max_i][max_j];
			p[max_i][max_j]=0;
			last_i=max_i;
			last_j=max_j;
			max_i=max_j=0;
			for(int i=0;i<n;++i)
				for(int j=0;j<m;++j)
					if(p[i][j]>p[max_i][max_j])// Find the tree with most peanuts
					{
						max_i=i;
						max_j=j;
					}
			k-=((max_j>last_j)?max_j-last_j:last_j-max_j)+1;// Calculate the extra time
			if(max_i>last_i)// If max point isn't on the way back
				k-=(max_i-last_i)*2;
		}
		printf("%ld\n",sum);
	}
	return 0;
}
