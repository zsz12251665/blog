#include<cstdio>
using namespace std;
int main()
{
	int p,q;
	for(scanf("%d%d",&p,&q);p!=0 || q!=0;scanf("%d%d",&p,&q))
		if(p*p-4*q<0)// If p*p-4*q<0, there won't be a square root
			printf("No\n");
		else
			for(int i=0;i<10003;++i)// 10002*10002=100040004>10000*10000+4*10000
				if(i*i>=p*p-4*q)
				{
					printf((i*i==p*p-4*q)?"Yes\n":"No\n");
					break;
				}
	return 0;
}
