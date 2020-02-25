#include<cstdio>
using namespace std;
int main()
{
	int cash=0,save=0,spend;
	for(int i=0;i<12;++i)
	{
		scanf("%d",&spend);
		cash+=300-spend;
		if(cash<0)// Judge whether the money is enough or not
		{
			printf("-%d",i+1);// The i is from 0 to 11, so don't forget to add 1
			return 0;
		}
		save+=cash/100;// Save the hundreds of money
		cash%=100;
	}
	cash+=save*120;
	printf("%d",cash);
	return 0;
}
