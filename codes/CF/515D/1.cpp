#include<cstdio>
using namespace std;
char field[2000][2001];// A char for '\0' is required, so you need 2001 but not 2000
int n,m,dx[4]={1,-1,0,0},dy[4]={0,0,1,-1};
bool check(int x,int y)// Check if it is a slot
{
	int cnt=0;
	for(int i=0;i<4;++i)
		if(x+dx[i]>=0 && x+dx[i]<n && y+dy[i]>=0 && y+dy[i]<m && field[x+dx[i]][y+dy[i]]=='.')
			++cnt;
	return cnt==1;
}
void update(int x,int y)
{
	for(int i=0;i<4;++i)// Find the right direction to fill the slot with a tile
		if(x+dx[i]>=0 && x+dx[i]<n && y+dy[i]>=0 && y+dy[i]<m && field[x+dx[i]][y+dy[i]]=='.')
		{
			if(i==0)
			{
				field[x][y]='^';
				field[x+dx[i]][y+dy[i]]='v';
			}
			if(i==1)
			{
				field[x][y]='v';
				field[x+dx[i]][y+dy[i]]='^';
			}
			if(i==2)
			{
				field[x][y]='<';
				field[x+dx[i]][y+dy[i]]='>';
			}
			if(i==3)
			{
				field[x][y]='>';
				field[x+dx[i]][y+dy[i]]='<';
			}
			x+=dx[i];
			y+=dy[i];
			break;
		}
	for(int i=0;i<4;++i)// Check if there are any new slot around
		if(x+dx[i]>=0 && x+dx[i]<n && y+dy[i]>=0 && y+dy[i]<m && field[x+dx[i]][y+dy[i]]=='.' && check(x+dx[i],y+dy[i]))
			update(x+dx[i],y+dy[i]);
}
int main()
{
	scanf("%d%d",&n,&m);
	for(int i=0;i<n;++i)
		scanf("%s",field[i]);
	for(int i=0;i<n;++i)// Find the point with 1 edge remains and fill it with a tile
		for(int j=0;j<m;++j)
			if(field[i][j]=='.' && check(i,j))
				update(i,j);
	bool is_unique=true;// Check if there are any point empty
	for(int i=0;is_unique && i<n;++i)
		for(int j=0;is_unique && j<m;++j)
			is_unique=field[i][j]!='.';
	if(is_unique)
		for(int i=0;i<n;++i)
			printf("%s\n",field[i]);
	else
		printf("Not unique");
	return 0;
}
