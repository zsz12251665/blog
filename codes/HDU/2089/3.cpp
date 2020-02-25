#include<cstdio>
using namespace std;
long count[1000001];// count[i] keeps the number of the is_good numbers from 0 to i
bool is_good(long a)
{
	for(;a>0;a/=10)
		if(a%100==62 || a%10==4)
			return false;
	return true;
}
int main()
{
	count[0]=1;
	for(long i=1;i<1000001;++i)// Fill the count[i]
		count[i]=(is_good(i))?count[i-1]+1:count[i-1];
	long n,m;
	for(scanf("%ld%ld",&n,&m);n!=0 || m!=0;scanf("%ld%ld",&n,&m))
		printf("%ld\n",count[m]-count[n-1]);// Don't forget to use the one before n, or you may lose the number n
	return 0;
}
