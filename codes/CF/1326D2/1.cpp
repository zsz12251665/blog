#include<cstdio>
#include<cstring>// We need to use the strlen function in cstring
using namespace std;
char s[1000001],tmp[2000002];// Since there is another t, we use tmp as the new string
int r[2000002];
int main()
{
	long t;
	for(scanf("%ld",&t);t>0;--t)
	{
		scanf("%s",&s);
		long len_s=strlen(s),p=-1;// p==-1 means the string is a palindrome
		for(long i=0;i<len_s-1-i;++i)// Find the length of the longest symmetric prefix and suffix of the substring of s
			if(s[i]!=s[len_s-1-i])
			{
				p=i;
				break;
			}
		if(p==-1)// s is a palindrome
		{
			printf("%s\n",s);
			continue;
		}
		long len_t=1;// Forming the string tmp
		tmp[0]='#';
		for(long i=p;i<len_s-p;++i)
		{
			tmp[len_t++]=s[i];
			tmp[len_t++]='#';
		}
		for(long i=0,mx=0,ce;i<len_t;++i)// Calculate the array r
		{
			r[i]=(i<mx)?((mx-i<r[2*ce-i])?mx-i:r[2*ce-i]):1;// The optimization
			while(i-r[i]>=0 && i+r[i]<len_t && tmp[i-r[i]]==tmp[i+r[i]])
				++r[i];
			if(i+r[i]>mx)// Update mx
			{
				mx=i+r[i];
				ce=i;
			}
		}
		long max_pre=0,max_suf=0;// The length of the longest palindrome which is the prefix or the suffix
		for(long i=0;i<len_t/2;++i)// Enumerate the length
		{
			if(r[i]==i+1)
				max_pre=i;
			if(r[len_t-1-i]==i+1)
				max_suf=i;
		}
		if(max_pre>max_suf)// Output the answer
		{
			for(long i=0;i<p+max_pre;++i)
				putchar(s[i]);
			for(long i=len_s-p;i<len_s;++i)
				putchar(s[i]);
		}
		else
		{
			for(long i=0;i<p;++i)
				putchar(s[i]);
			for(long i=len_s-p-max_suf;i<len_s;++i)
				putchar(s[i]);
		}
		putchar('\n');
	}
	return 0;
}
