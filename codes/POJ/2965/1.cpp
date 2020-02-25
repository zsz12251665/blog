#include<cstdio>
using namespace std;
bool done[4][4];
int main()
{
	char handle[4];
	for(int i=0;i<4;++i)// Initialize the done array
		for(int j=0;j<4;++j)
			done[i][j]=false;
	for(int i=0;i<4;++i)
	{
		scanf("%s",&handle);
		for(int j=0;j<4;++j)
			if(handle[j]=='+')// Scan the handles
			{
				for(int k=0;k<4;++k)
				{
					done[i][k]=!done[i][k];
					done[k][j]=!done[k][j];
				}
				done[i][j]=!done[i][j];// In the for-loop, (i,j) has been done twice, so add once more can keep that all the seven handles is done
			}
	}
	int ans=0;
	for(int i=0;i<4;++i)// Count the number
		for(int j=0;j<4;++j)
			if(done[i][j])
				++ans;
	printf("%d\n",ans);
	for(int i=0;i<4;++i)
		for(int j=0;j<4;++j)
			if(done[i][j])
				printf("%d %d\n",i+1,j+1);// Don't forget to plus 1 because your loop is from 0 to 3 in C++
	return 0;
}
