#include<cstdio>
using namespace std;
int finger[10000],n;
bool used[10001];
int find(int a)
{
	for(int i=a+1;i<=n;++i)
		if(!used[i])// If there is another finger that is not used
			return i;
	return -1;
}
void add(int a)
{
	used[finger[a]]=false;
	if(find(finger[a])==-1)
	{
		add(a-1);// Carry on the previous bit
		finger[a]=find(0);// Find the smallest finger that is not used
	}
	else
		finger[a]=find(finger[a]);
	used[finger[a]]=true;
}
int main()
{
	int m;
	scanf("%d%d",&n,&m);
	for(int i=0;i<n;++i)
	{
		scanf("%d",&finger[i]);
		used[finger[i]]=true;
	}
	for(int i=0;i<m;++i)// To add m, just add 1 for m times
		add(n-1);
	for(int i=0;i<n;++i)
		printf("%d ",finger[i]);
	return 0;
}
