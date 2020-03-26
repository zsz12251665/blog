#include<cstdio>
#include<cstring>// We need to use the strlen function in cstring
using namespace std;
char s[5001];
int symmetricLength(int b,int e)// Find the length of the longest symmetric prefix and suffix of the substring of s
{
	for(int i=0;b+i<e-i;++i)
		if(s[b+i]!=s[e-i])
			return i;
	return -1;// -1 means the substring is a palindrome
}
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		scanf("%s",&s);
		int len=strlen(s),p=symmetricLength(0,len-1);
		if(p==-1)// s is a palindrome
		{
			printf("%s\n",s);
			continue;
		}
		int max_pre=0,max_suf=0;// The length of the longest palindrome which is the prefix or the suffix
		for(int i=1;i<len-2*p;++i)// Enumerate the length
		{
			if(symmetricLength(p,p+i-1)==-1)
				max_pre=i;
			if(symmetricLength(len-p-i,len-p-1)==-1)
				max_suf=i;
		}
		if(max_pre>max_suf)// Output the answer
		{
			for(int i=0;i<p+max_pre;++i)
				putchar(s[i]);
			for(int i=len-p;i<len;++i)
				putchar(s[i]);
		}
		else
		{
			for(int i=0;i<p;++i)
				putchar(s[i]);
			for(int i=len-p-max_suf;i<len;++i)
				putchar(s[i]);
		}
		putchar('\n');
	}
	return 0;
}
