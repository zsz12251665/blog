#include<cstdio>
#include<cstring>// We need to use the strlen function in cstring
using namespace std;
long long win[1000],lose[1000];// the array win keeps the winner list and the array lose keeps the loser list
void getname(long a)// A function that keeps the name strings in integers so that it can be easily compared
{
	char s[256];
	win[a]=lose[a]=0;
	scanf("%s",&s);
	long long p=1;// Turn name strings to integers
	for(int i=0,len=strlen(s);i<len;++i)
	{
		win[a]+=p*s[i];
		p*=128;
	}
	scanf("%s",&s);
	p=1;
	for(int i=0,len=strlen(s);i<len;++i)
	{
		lose[a]+=p*s[i];
		p*=128;
	}
}
int main()
{
	int n;
	for(scanf("%d",&n);n!=0;scanf("%d",&n))
	{
		for(int i=0;i<n;++i)
			getname(i);
		for(int i=0;i<n;++i)// Scan the array lose and array win to check if the winner used to lose a match
			for(int j=0;j<n;++j)
				if(win[j]==lose[i])
					win[j]=-1;
		long long champion=-1;// champion=-1 means there is no champion
		for(int i=0;i<n;++i)// Scan the array win to check if there are more than one champion or no champion
			if(win[i]!=-1 && champion!=win[i])
				if(champion==-1)
					champion=win[i];
				else
				{
					champion=-1;
					break;
				}
		printf((champion==-1)?"No\n":"Yes\n");
	}
	return 0;
}
