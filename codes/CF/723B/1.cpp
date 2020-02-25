#include<cstdio>
using namespace std;
char s[256];
int main()
{
	int n,cnt=0,max=0,tmp=0;
	bool in_parentheses=false;
	scanf("%d%s",&n,&s);
	for(int i=0;i<n;++i)
	{
		if(s[i]=='(')
		{
			max=(tmp>max)?tmp:max;// Update the max length of words that is not in parentheses
			tmp=0;
			in_parentheses=true;
			continue;
		}
		if(s[i]==')')
		{
			if(tmp>0)// Count the number of words that is in parentheses
				++cnt;
			tmp=0;
			in_parentheses=false;
			continue;
		}
		if(s[i]=='_')
		{
			if(!in_parentheses && tmp>max)// Update the max length of words that is not in parentheses
				max=tmp;
			if(in_parentheses && tmp>0)// Count the number of words that is in parentheses
				++cnt;
			tmp=0;
			continue;
		}
		++tmp;
	}
	max=(tmp>max)?tmp:max;// Update the max length of words that is not in parentheses
	printf("%d %d",max,cnt);
	return 0;
}
