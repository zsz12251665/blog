#include<cstdio>
using namespace std;
int main()
{
	int ans=0,mxt=8,a,b;// mxt equals 8 because she won't be unhappy if the time is less than 8 hours
	for(int i=1;i<8;++i)
	{
		scanf("%d%d",&a,&b);
		if(a+b>mxt)
		{
			mxt=a+b;
			ans=i;
		}
	}
	printf("%d",ans);
	return 0;
}
