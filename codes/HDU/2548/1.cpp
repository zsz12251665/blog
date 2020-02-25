#include<cstdio>
using namespace std;
int main()
{
	int t;
	for(scanf("%d",&t);t>0;--t)
	{
		double u,v,w,l;
		scanf("%lf%lf%lf%lf",&u,&v,&w,&l);
		printf("%.3lf\n",l/(u+v)*w);// In C/++C, the / operator returns an integer answer (truncate the digits after the decimal point) if both are integers, otherwise the answer will be a real number
	}
	return 0;
}
