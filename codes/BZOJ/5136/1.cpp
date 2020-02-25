#include<cstdio>
using namespace std;
long big_m[500][500];
int main()
{
	int n,m;
	long t;
	scanf("%d%d%ld",&n,&m,&t);
	for(int i=0;i<n;++i)
		for(int j=0;j<m;++j)
			scanf("%ld",&big_m[i][j]);
	for(;t>0;--t)
	{
		int x,y,k;
		bool is_clever=true;
		scanf("%d%d%d",&x,&y,&k);
		--x;
		--y;
		for(int i=1;i<k && is_clever;++i)// Check each pair of lines
			for(int j=1;j<k && is_clever;++j)
				is_clever=big_m[x+i][y]-big_m[x+i-1][y]==big_m[x+i][y+j]-big_m[x+i-1][y+j];// We set x2=x1-1, y2=y1-1 here to make sure it applies to the other numbers
		printf(is_clever?"Y\n":"N\n");
	}
	return 0;
}
