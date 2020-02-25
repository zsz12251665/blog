#include<cstdio>
using namespace std;
long long plank[20000];
int size=0;
void insert(long long a)// Insert a number into the plank array
{
	plank[size++]=a;
	for(int i=size-1;i>0 && plank[i]<plank[(i+1)/2-1];i=(i+1)/2-1)// Maintain the heap
	{
		long long tmp=plank[i];
		plank[i]=plank[(i+1)/2-1];
		plank[(i+1)/2-1]=tmp;
	}
}
long long extract()// Extract the top from the plank array
{
	long long ans=plank[0];// C++ couldn't use the use the name of function to keep the feedback, so I have to use another long long to keep it
	plank[0]=plank[--size];
	for(int i=0;2*i+1<size && (plank[2*i+1]<plank[i] || plank[2*i+2]<plank[i]);)// Maintain the heap
		if(2*i+2<size && plank[2*i+1]>plank[2*i+2])
		{
			long long tmp=plank[i];
			plank[i]=plank[2*i+2];
			i=2*i+2;
			plank[i]=tmp;
		}
		else
		{
			long long tmp=plank[i];
			plank[i]=plank[2*i+1];
			i=2*i+1;
			plank[i]=tmp;
		}
	return ans;
}
int main()
{
	long long ans=0,tmp;
	int n;
	scanf("%d",&n);
	for(int i=0;i<n;++i)
	{
		scanf("%lld",&tmp);
		insert(tmp);
	}
	for(int i=1;i<n;++i)
	{
		tmp=extract()+extract();
		ans+=tmp;
		insert(tmp);
	}
	printf("%lld",ans);
	return 0;
}
