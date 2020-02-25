#include<cstdio>
using namespace std;
int main()
{
	int l,r,a;
	for(scanf("%d%d%d",&l,&r,&a);a>0;--a)// Check which hand each ambidexter should use
		if(l>r)
			++r;
		else
			++l;
	printf("%d",(l>r)?2*r:2*l);
	return 0;
}
