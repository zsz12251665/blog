#include<cstdio>
using namespace std;
int f[367],m[367];
char s[5];
int main()
{
	for(int i=0;i<367;++i)// Initialize the counter
		f[i]=m[i]=0;
	int n;
	scanf("%d",&n);
	for(int i=0,l,r;i<n;++i)
	{
		scanf("%s%d%d",s,&l,&r);
		for(int j=l;j<=r;++j)// Update the counter
			if(s[0]=='F')
				++f[j];
			else
				++m[j];
	}
	int ans=0;
	for(int i=0;i<367;++i)
	{
		int j=(f[i]<m[i])?f[i]:m[i];
		if(j>ans)// Find the maximum number of participants
			ans=j;
	}
	printf("%d",2*ans);
	return 0;
}
