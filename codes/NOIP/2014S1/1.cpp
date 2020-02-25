#include<cstdio>
using namespace std;
int a[200],b[200];
int main()
{
	int n,na,nb,pa=0,pb=0;// pa counts the number of the times that Little A wins, pb counts the number of the times that Little B wins
	scanf("%d%d%d",&n,&na,&nb);
	for(int i=0;i<na;++i)
		scanf("%d",&a[i]);
	for(int i=0;i<nb;++i)
		scanf("%d",&b[i]);
	for(int i=0;i<n;++i)// Simulate the rounds
	{
		if(a[i%na]==0 && b[i%nb]==2 || a[i%na]==0 && b[i%nb]==3 || a[i%na]==1 && b[i%nb]==0 || a[i%na]==1 && b[i%nb]==3 || a[i%na]==2 && b[i%nb]==1 || a[i%na]==2 && b[i%nb]==4 || a[i%na]==3 && b[i%nb]==2 || a[i%na]==3 && b[i%nb]==4 || a[i%na]==4 && b[i%nb]==0 || a[i%na]==4 && b[i%nb]==1)// Judge if Little A wins
			++pa;
		if(b[i%nb]==0 && a[i%na]==2 || b[i%nb]==0 && a[i%na]==3 || b[i%nb]==1 && a[i%na]==0 || b[i%nb]==1 && a[i%na]==3 || b[i%nb]==2 && a[i%na]==1 || b[i%nb]==2 && a[i%na]==4 || b[i%nb]==3 && a[i%na]==2 || b[i%nb]==3 && a[i%na]==4 || b[i%nb]==4 && a[i%na]==0 || b[i%nb]==4 && a[i%na]==1)// Judge if Little B wins
			++pb;
	}
	printf("%d %d",pa,pb);
	return 0;
}
