#include<cstdio>
#include<cstring>// We need to use the strlen function in cstring
using namespace std;
char s[100][51],pre[5000]="",suf[5000]="",tmp[5000]="";// The prefix and the suffix of the answer, tmp is used as a medium
bool sym[100][100],unused[100];
int main()
{
	int n,m;
	scanf("%d%d",&n,&m);
	for(int i=0;i<n;++i)
	{
		unused[i]=true;
		scanf("%s",&s[i]);
	}
	for(int i=0;i<n;++i)
		for(int j=0;j<=i;++j)
		{
			sym[i][j]=sym[j][i]=true;// Checking whether each pair of strings is symmetric
			for(int k=0;k<m;++k)
				if(s[i][k]!=s[j][m-1-k])
				{
					sym[i][j]=sym[j][i]=false;
					break;
				}
		}
	for(int i=0;i<n;++i)// Finding the pairs
		if(unused[i])
			for(int j=0;j<i;++j)
				if(unused[j]&&sym[i][j])
				{
					sprintf(pre,"%s%s",pre,s[i]);
					sprintf(tmp,"%s%s",s[j],suf);
					sprintf(suf,"%s",tmp);
					unused[i]=unused[j]=false;
					break;
				}
	for(int i=0;i<n;++i)// Find a middle one
		if(unused[i]&&sym[i][i])
		{
			sprintf(pre,"%s%s",pre,s[i]);
			break;
		}
	printf("%d\n%s%s",strlen(pre)+strlen(suf),pre,suf);
	return 0;
}
