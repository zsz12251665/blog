#include<cstdio>
using namespace std;
int main()
{
	int n,i,j;
	scanf("%d%d%d",&n,&i,&j);
	long ans=0;
	while(true)
	{
		if(i==1)// At the top border
		{
			ans+=j;
			break;
		}
		if(i==n)// At the bottom border
		{
			ans+=3*n-1-j;
			break;
		}
		if(j==1)// At the left border
		{
			ans+=4*n-2-i;
			break;
		}
		if(j==n)// At the right border
		{
			ans+=n-1+i;
			break;
		}
		ans+=4*n-4;// Solve the problem recursively
		n=n-2;
		--i;
		--j;
	}
	printf("%ld",ans);
	return 0;
}
