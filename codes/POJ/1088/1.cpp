#include<cstdio>
using namespace std;
int height[100][100],length[100][100],r,c;
int search(int x,int y)// Search function
{
	if(length[x][y]!=0)// If the point has been searched, return the answer
		return length[x][y];
	int max=0;// Search the longest length
	if(x>0 && height[x-1][y]<height[x][y] && search(x-1,y)>max)
		max=length[x-1][y];
	if(y>0 && height[x][y-1]<height[x][y] && search(x,y-1)>max)
		max=length[x][y-1];
	if(x<r-1 && height[x+1][y]<height[x][y] && search(x+1,y)>max)
		max=length[x+1][y];
	if(y<c-1 && height[x][y+1]<height[x][y] && search(x,y+1)>max)
		max=length[x][y+1];
	length[x][y]=max+1;// Do not forget to plus 1, or you'll forget to count this point
	return length[x][y];
}
int main()
{
	scanf("%d%d",&r,&c);
	for(int i=0;i<r;++i)
		for(int j=0;j<c;++j)
		{
			length[i][j]=0;// Initialize the length array
			scanf("%d",&height[i][j]);
		}
	int ans=0;// Search the longest length of each point and keep the longest one
	for(int i=0;i<r;++i)
		for(int j=0;j<c;++j)
			if(search(i,j)>ans)
				ans=length[i][j];
	printf("%d",ans);
	return 0;
}
