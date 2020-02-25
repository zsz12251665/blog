#include<cstdio>
using namespace std;
int min(int a,int b)// The function of the minimum number of two (4 is too complex to compare)
{
	return (a<b)?a:b;
}
int main()
{
	int b,g,n;
	scanf("%d%d%d",&b,&g,&n);
	printf("%d",min(min(b,g),min(b+g-n,n))+1);// We move the plus 1 to the end but it doesn't matter
	return 0;
}
