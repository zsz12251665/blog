#include<cstdio>
using namespace std;
int p[20][20];
int main()
{
	int n,m,k,maxi=0,maxj=0;// The coordinate of the tree with most peanuts
	scanf("%d%d%d",&n,&m,&k);
	for(int i=0;i<n;++i)
		for(int j=0;j<m;++j)
		{
			scanf("%d",&p[i][j]);
			if(p[i][j]>p[maxi][maxj])// Find the tree with most peanuts
			{
				maxi=i;
				maxj=j;
			}
		}
	int lasti=-1,lastj=maxj,sum=0;// Decide the start point, it is the coordinate of the last visited tree
	k-=((maxj>lastj)?(maxj-lastj):(lastj-maxj))+1;// Calculate the extra time
	if(maxi>lasti)// If max point isn't on the way back
		k-=(maxi-lasti)*2;
	while(k>=0)
	{
		sum+=p[maxi][maxj];
		p[maxi][maxj]=0;
		lasti=maxi;
		lastj=maxj;
		maxi=maxj=0;
		for(int i=0;i<n;++i)
			for(int j=0;j<m;++j)
				if(p[i][j]>p[maxi][maxj])// Find the tree with most peanuts
				{
					maxi=i;
					maxj=j;
				}
		k-=((maxj>lastj)?(maxj-lastj):(lastj-maxj))+1;// Calculate the extra time
		if(maxi>lasti)// If max point isn't on the way back
			k-=(maxi-lasti)*2;
	}
	printf("%d",sum);
	return 0;
}
