#include<cstdio>
using namespace std;
int main()
{
	int p,e,i,d,t=0;
	scanf("%d%d%d%d",&p,&e,&i,&d);
	while(p!=-1 || e!=-1 || i!=-1 || d!=-1)
	{
		++t;
		printf("Case %d: the next triple peak occurs in %d days.\n",t,(5544*p+14421*e+1288*i-d+21251)%21252+1);// Pay attention to the format of the output
	scanf("%d%d%d%d",&p,&e,&i,&d);
	}
	return 0;
}
