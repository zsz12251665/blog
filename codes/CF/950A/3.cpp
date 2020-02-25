#include<cstdio>
using namespace std;
int main()
{
	int l,r,a;
	scanf("%d%d%d",&l,&r,&a);
	if(l>r)// We suppose that there are more right-handers
	{
		l=l+r;// l=l0+r0
		r=l-r;// r=l0+r0-r0=l0
		l=l-r;// l=l0+r0-l0=r0
	}
	printf("%d",(l+a<r)?2*(l+a):2*(r+(a+l-r)/2));// If there are not enough ambidexters
	return 0;
}
