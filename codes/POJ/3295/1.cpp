#include<cstdio>
#include<cstring>// We need to use the strlen function in cstring
using namespace std;
int stack[100];
char wff[100];
void solve()
{
	for(int p=0;p<2;++p)// Enumerate every possible group of (p,q,r,s,t)
		for(int q=0;q<2;++q)
			for(int r=0;r<2;++r)
				for(int s=0;s<2;++s)
					for(int t=0;t<2;++t)
					{
						int top=0;
						for(int i=strlen(wff)-1;i>=0;--i)// Do not forget to scan from end to start since it's a prefix expression
							switch(wff[i])
							{
								case 'p':
									stack[top]=p;// Add number into the stack
									++top;
									break;
								case 'q':
									stack[top]=q;
									++top;
									break;
								case 'r':
									stack[top]=r;
									++top;
									break;
								case 's':
									stack[top]=s;
									++top;
									break;
								case 't':
									stack[top]=t;
									++top;
									break;
								case 'K':
									--top;
									stack[top-1]=stack[top]*stack[top-1];// Calculate the answer and add it back to the stack
									break;
								case 'A':
									--top;
									stack[top-1]=1-(1-stack[top])*(1-stack[top-1]);
									break;
								case 'N':
									stack[top-1]=1-stack[top-1];
									break;
								case 'C':
									--top;
									stack[top-1]=(stack[top]==1 && stack[top-1]==0)?0:1;
									break;
								case 'E':
									--top;
									stack[top-1]=(stack[top]==stack[top-1])?1:0;
									break;
							}
						if(stack[top-1]==0)
						{
							printf("not\n");
							return;
						}
					}
	printf("tautology\n");
}
int main()
{
	scanf("%s",&wff);
	while(wff[0]!='0')
	{
		solve();// There are over 5 loops, so a return in another function can simplify the code
		scanf("%s",&wff);
	}
	return 0;
}
