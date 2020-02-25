#include<cstdio>
#include<cstring>// We need to use the strcmp function in cstring
using namespace std;
char s[100],v[100];// The array v keeps the variable names
int c[100];
int main()
{
	int t;
	scanf("%d",&t);
	for(;t>0;--t)
	{
		int l,complexity;
		scanf("%d%s",&l,&s);
		if(strcmp("O(1)",s)==0)// Read the time complexity
			complexity=0;
		else
			sscanf(s,"O(n^%d)",&complexity);// sscanf is similar to scanf, but it does not read values from your terminal but from a string
		int depth=0,max=0;// depth means the depth of the loops
		bool err=false;
		for(int i=0;i<l;++i)
		{
			if(err)
			{
				scanf("%s",&s);
				if(s[0]=='E')
					continue;
				scanf("%s",&s);
				scanf("%s",&s);
				scanf("%s",&s);
				continue;
			}
			scanf("%s",&s);
			if(s[0]=='E')// Quit a loop
			{
				--depth;
				if(depth<0)
					err=true;
				continue;
			}
			scanf("%s",&s);// Read the variable name
			v[depth]=s[0];
			for(int j=0;j<depth;++j)// Check if there are two same variable names
				if(v[j]==v[depth])
				{
					err=true;
					break;
				}
			if(err)
			{
				scanf("%s",&s);
				scanf("%s",&s);
				continue;
			}
			int a,b;
			scanf("%s",&s);
			if(s[0]=='n')
				a=1000;
			else
				sscanf(s,"%d",&a);
			scanf("%s",&s);
			if(s[0]=='n')
				b=1000;
			else
				sscanf(s,"%d",&b);
			if(depth==0)
				c[depth]=0;
			else
				c[depth]=c[depth-1];
			if(c[depth]>-1 && b==1000 && a!=b)// The loop increase the time complexity
				c[depth]++;
			if(a>b)// The loop won't run
				c[depth]=-1;
			if(c[depth]>max)
				max=c[depth];
			++depth;
		}
		if(depth!=0 || err)
		{
			printf("ERR\n");
			continue;
		}
		printf((max==complexity)?"Yes\n":"No\n");
	}
	return 0;
}
