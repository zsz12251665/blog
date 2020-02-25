#include<cstdio>
using namespace std;
char field[102][102];// Make the minefield a liitle larger to avoid the subscript out of range
int main()
{
	for(int i=0;i<102;++i)// Initialize the minefield
		for(int j=0;j<102;++j)
			field[i][j]='?';
	int n,m;
	scanf("%d%d",&n,&m);
	for(int i=1;i<=n;++i)
	{
		scanf("%s",&field[i]);// There may be some problems if we use scanf("%c",&field[i][j]) or getchar() because of the char enter and the char return, so instead we use a different way here
		for(int j=101;j>0;--j)
			field[i][j]=field[i][j-1];
		field[i][0]='?';
	}
	for(int i=1;i<=n;++i)// Scan the minefield
	{
		for(int j=1;j<=m;++j)
			if(field[i][j]!='*')
			{
				int count=0;
				if(field[i-1][j-1]=='*')
					++count;
				if(field[i-1][j]=='*')
					++count;
				if(field[i-1][j+1]=='*')
					++count;
				if(field[i][j-1]=='*')
					++count;
				if(field[i][j+1]=='*')
					++count;
				if(field[i+1][j-1]=='*')
					++count;
				if(field[i+1][j]=='*')
					++count;
				if(field[i+1][j+1]=='*')
					++count;
				printf("%d",count);
			}
			else
				printf("*");
		printf("\n");
	}
	return 0;
}
