#include<cstdio>
using namespace std;
int main()
{
	double d;
	for(scanf("%lf",&d);d>0;scanf("%lf",&d))
	{
		int ans=2;// Don't forget it starts from 2 to ans+1
		for(;d>0;++ans)
			d-=1.0/ans;// If you just use 1 instead of 1.0, the compiler of C++ will answer an integer, which is 0 here
		printf("%d card(s)\n",ans-2);// Do not forget to minus 1 since it starts from 2 and stops at ans+2 due to the loop
	}
	return 0;
}
