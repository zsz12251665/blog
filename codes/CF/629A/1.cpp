#include<cstdio>
using namespace std;
char s[100][101];
int main()
{
	int n;
	scanf("%d",&n);
	for(int i=0;i<n;++i)
		scanf("%s",&s[i]);
	long ans=0;
	for(int i=0;i<n;++i)
	{
		int t=0;// Count the number of chocolates in the i-th row
		for(int j=0;j<n;++j)
			if(s[i][j]=='C')
				++t;
		ans+=t*(t-1)/2;
		t=0;// Count the number of chocolates in the i-th column
		for(int j=0;j<n;++j)
			if(s[j][i]=='C')
				++t;
		ans+=t*(t-1)/2;
	}
	printf("%ld",ans);
	return 0;
}
