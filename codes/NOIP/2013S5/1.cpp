#include<cstdio>
using namespace std;
int main()
{
	long n,h,rise,drop,lh,lrise=1,ldrop=1;// We just need h[i] and h[i-1], so we can scroll it by h and lh, etc.
	scanf("%ld%ld",&n,&lh);// Take the first one will not make the answer worse either
	for(long i=1;i<n;++i)
	{
		scanf("%ld",&h);
		rise=drop=1;
		if(h>lh)
			rise=ldrop+1;
		else
			rise=lrise;
		if(h<lh)
			drop=lrise+1;
		else
			drop=ldrop;
		lh=h;// Scroll the space
		ldrop=drop;
		lrise=rise;
	}
	if(ldrop>lrise)// Compare the lengths
		printf("%ld",ldrop);
	else
		printf("%ld",lrise);
	return 0;
}
