#include<cstdio>
#include<cstring>// We need to use the strlen function in cstring
using namespace std;
char s[300000];
long h[300000],f[300000],nxt[300000],len[300000];// The array h and the array f are the head and the foot of the adjacency table
int main()
{
	scanf("%s",&s);
	long cnt=0;// cnt is the number of the zebra sequences
	for(long i=0,l=strlen(s);i<l;++i)
	{
		nxt[i]=-1;
		bool is_added=false;// Whether this char has been added to a zebra sequence
		for(long j=0;j<cnt;++j)// Enumerate the zebra sequences to find the suitable one
			if(s[f[j]]!=s[i])
			{
				f[j]=nxt[f[j]]=i;
				len[j]++;
				is_added=true;
				break;
			}
		if(is_added)
			continue;
		if(s[i]=='1')// Too many '1's are found to divide the 01 string into serval zebra sequences
		{
			printf("-1");
			return 0;
		}
		else// Create a new zebra sequence
		{
			h[cnt]=f[cnt]=i;
			len[cnt++]=1;
		}
	}
	for(long i=0;i<cnt;++i)// Check if there is a zebra sequence ended with '1'
		if(s[f[i]]=='1')
		{
			printf("-1");
			return 0;
		}
	printf("%ld",cnt);// Output the answer
	for(long i=0;i<cnt;++i)
	{
		printf("\n%ld",len[i]);
		for(long j=h[i];j!=-1;j=nxt[j])
			printf(" %ld",j+1);
	}
	return 0;
}
