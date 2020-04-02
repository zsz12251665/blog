#include<cstdio>
using namespace std;
char s[1000001];
int main()
{
	long n,cnt=0,ans=0;// cnt is the difference between the numbers of the left brackets and the right brackets
	scanf("%d%s",&n,&s);
	for(int i=0,p=-1;i<n;++i)// p==-1 means no incorrect substring start postion was found, otherwise it contains the start position
	{
		cnt+=(s[i]=='(')?1:-1;
		if(cnt<0 && p==-1)// The start position is found
			p=i;
		if(cnt>=0 && p!=-1)// The end position is found
		{
			ans+=i-p+1;
			p=-1;
		}
	}
	printf("%ld",(cnt!=0)?-1:ans);// cnt!=0 means the numbers of left brackets and the right brackets are not equal
	return 0;
}
