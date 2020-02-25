#include<cstdio>
#include<cstring>// We need to use the strlen function in cstring
using namespace std;
char s[300000];
long h[300000],f[300000],nxt[300000],len[300000],queue[2][300000],head[2],foot[2];
int main()
{
	scanf("%s",&s);
	long cnt=0;
	head[0]=head[1]=foot[0]=foot[1]=0;// Initialize the queue
	for(long i=0,l=strlen(s);i<l;++i)
	{
		nxt[i]=-1;
		if(head['1'-s[i]]!=foot['1'-s[i]])// Use queue to find the suitable zebra sequence in a short time
		{
			long j=queue['1'-s[i]][head['1'-s[i]]++];
			f[j]=nxt[f[j]]=i;
			len[j]++;
			queue[s[i]-'0'][foot[s[i]-'0']++]=j;
			continue;
		}
		if(s[i]=='1')
		{
			printf("-1");
			return 0;
		}
		else
		{
			h[cnt]=f[cnt]=i;
			len[cnt]=1;
			queue[s[i]-'0'][foot[s[i]-'0']++]=cnt++;
		}
	}
	if(head[1]!=foot[1])// Check whether the queue of '1' is empty to check if there is a zebra sequence ended with '1'
	{
		printf("-1");
		return 0;
	}
	printf("%ld",cnt);
	for(long i=0;i<cnt;++i)
	{
		printf("\n%ld",len[i]);
		for(long j=h[i];j!=-1;j=nxt[j])
			printf(" %ld",j+1);
	}
	return 0;
}
