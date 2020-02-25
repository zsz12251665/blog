#include<cstdio>
#include<cmath>// We need to use the sqrt function in cmath
using namespace std;
int main()// This problem does not need any comments to explain it
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		double a,b,c,d;
		scanf("%lf%lf%lf%lf",&a,&b,&c,&d);
		printf("%.1lf\n",sqrt((a-c)*(a-c)+(b-d)*(b-d)));
	}
	return 0;
}
