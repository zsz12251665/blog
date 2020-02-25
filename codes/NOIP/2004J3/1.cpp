#include<cstdio>
using namespace std;
char s[1024];
char traversal(int l,int r)// The function of recursion
{
	if(l==r)// If it is a leaf node, return it
		if(s[l]=='0')
		{
			putchar('B');
			return 'B';
		}
		else
		{
			putchar('I');
			return 'I';
		}
	char lc=traversal(l,(l+r+1)/2-1),rc=traversal((l+r+1)/2,r);// Get the childern nodes by recursion
	if(lc==rc)// Decide what the parent node should be
	{
		putchar(lc);
		return lc;
	}
	else
	{
		putchar('F');
		return 'F';
	}
}
int main()
{
	int n;
	scanf("%d%s",&n,&s);
	traversal(0,(1<<n)-1);// 1<<n means 2^n("<<" is a bit operator. It is the right shift that it is able to move 1 to the right for n bits)
	return 0;
}
