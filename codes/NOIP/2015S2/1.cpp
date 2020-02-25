#include<cstdio>
using namespace std;
int next[200000],visit[200000];
int main()
{
	int n,min=2147483647;
	scanf("%d",&n);
	for(int i=0;i<n;++i)
	{
		scanf("%d",&next[i]);
		visit[i]=-1;// Initialize the visit array
	}
	for(int i=0,t=1,last=0;i<n;++i)// last is used check whether the path we found is a circle
		if(visit[i]==-1)
		{
			int p=i;
			while(visit[p]==-1)// When we reach a point visited, stop the loop
			{
				visit[p]=t;
				p=next[p]-1;// C++ starts the array from 0, so do not forget to minus 1
				++t;
			}
			if(visit[p]>last && min>t-visit[p])// visit[p]<last means we've visited this point in a previous round
				min=t-visit[p];
			last=t-1;
		}
	printf("%d",min);
	return 0;
}
