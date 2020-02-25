#include<cstdio>
using namespace std;
int apple[10];
int main()
{
	int h,ans=0;
	for(int i=0;i<10;++i)// Get the apples
		scanf("%d",&apple[i]);
	scanf("%d",&h);
	for(int i=0;i<10;++i)// Count the apples
		if(h+30>=apple[i])
			++ans;
	printf("%d",ans);
	return 0;
}
