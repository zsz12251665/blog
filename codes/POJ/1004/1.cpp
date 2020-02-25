#include<cstdio>
using namespace std;
int main()
{
	double sum=0.0,tmp;
	for(int i=0;i<12;++i)
	{
		scanf("%lf",&tmp);
		sum+=tmp;
	}
	printf("$%.2lf",sum/12.0);// In C/C++, the %.2lf in the format string of printf() function means to print the real number with 2 digits
	return 0;
}
