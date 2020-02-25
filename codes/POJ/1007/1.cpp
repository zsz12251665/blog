#include<cstdio>
using namespace std;
char s[100][51];// Make the string a little bigger, or you may got an OLE
int count[100];
int main()
{
	int n,m;
	scanf("%d%d",&n,&m);
	for(int i=0;i<m;++i)
	{
		scanf("%s",&s[i]);
		count[i]=0;
		for(int j=0;j<n;++j)// Count the inversions
			for(int k=j+1;k<n;++k)
				if(s[i][j]>s[i][k])
					count[i]++;
	}
	for(int i=0;i<m;++i)// Sort and output the strings
	{
		int min=0;
		for(int j=1;j<m;++j)
			if(count[j]<count[min])
				min=j;
		count[min]=32767;// Set count[i] as maxint to mark that it is outputed
		printf("%s\n",s[min]);
	}
	return 0;
}
