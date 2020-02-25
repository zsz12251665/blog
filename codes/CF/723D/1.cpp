#include<cstdio>
using namespace std;
int island[50][50],lake[2500][3],cnt=0,n,m;// lake[i][0] is the x coordinate, lake[i][1] is the y coordinate, lake[i][2] is the size
char s[51];
void qsort(int l,int r)// Sort the lakes according to their sizes
{
	int x=l,y=r,std=lake[(l+r)/2][2];
	while(x<y)
	{
		while(lake[x][2]<std)
			++x;
		while(lake[y][2]>std)
			--y;
		if(x<=y)
		{
			int tmp=lake[x][0];// Exchange the information of lakes
			lake[x][0]=lake[y][0];
			lake[y][0]=tmp;
			tmp=lake[x][1];
			lake[x][1]=lake[y][1];
			lake[y][1]=tmp;
			tmp=lake[x][2];
			lake[x][2]=lake[y][2];
			lake[y][2]=tmp;
			++x;
			--y;
		}
	}
	if(l<y)
		qsort(l,y);
	if(r>x)
		qsort(x,r);
}
int search(int x,int y)// Search the whole district to get the size of the lake
{
	if(island[x+1][y]==-10000 || island[x-1][y]==-10000	|| island[x][y+1]==-10000 || island[x][y-1]==-10000)// If it is next to the sea, it is the sea too
		return -10000;
	island[x][y]=-2;// Mark the water that has been counted
	int tmp=1;
	if(island[x+1][y]==0)// Search the water around
		tmp+=search(x+1,y);
	if(island[x-1][y]==0)
		tmp+=search(x-1,y);
	if(island[x][y+1]==0)
		tmp+=search(x,y+1);
	if(island[x][y-1]==0)
		tmp+=search(x,y-1);
	if(tmp<0)// If it is connected to water which is next to the sea, it is the sea too
		return -10000;
	return tmp;
}
void fill(int x,int y,int mark,int key)// Fill the lake with the mark and the key is the mark which it used to be
{
	island[x][y]=mark;
	if(island[x+1][y]==key)
		fill(x+1,y,mark,key);
	if(island[x-1][y]==key)
		fill(x-1,y,mark,key);
	if(island[x][y+1]==key)
		fill(x,y+1,mark,key);
	if(island[x][y-1]==key)
		fill(x,y-1,mark,key);
}
int main()
{
	int k,ans=0;
	scanf("%d%d%d",&n,&m,&k);
	for(int i=0;i<n;++i)// Read the map of the island
	{
		scanf("%s",&s);
		for(int j=0;j<m;++j)
			if(s[j]=='*')// -1 means land, -10000 means sea, 0 means water
				island[i][j]=-1;
			else
				island[i][j]=(i==0 || j==0 || i==n-1 || j==m-1)?-10000:0;
	}
	for(int i=0;i<n;++i)// Find all the lakes on the island
		for(int j=0;j<m;++j)
			if(island[i][j]==0)
			{
				fill(i,j,search(i,j),-2);
				if(island[i][j]>0)// Keep the information of lakes
				{
					lake[cnt][0]=i;
					lake[cnt][1]=j;
					lake[cnt][2]=island[i][j];
					++cnt;
				}
			}
	qsort(0,cnt-1);
	for(int i=0;i<cnt-k;++i)// Fill the smallest lakes with land
	{
		ans+=lake[i][2];
		fill(lake[i][0],lake[i][1],-1,lake[i][2]);
	}
	printf("%d\n",ans);
	for(int i=0;i<n;++i)
	{
		for(int j=0;j<m;++j)
			if(island[i][j]==-1)
				putchar('*');
			else
				putchar('.');
		putchar('\n');
	}
	return 0;
}
