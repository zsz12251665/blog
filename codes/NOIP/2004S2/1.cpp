#include<cstdio>
using namespace std;
long fruit[20001];// To avoid overlimit, I made the fruit array twice larger
int size=0;
void insert(long a)// The proceudure to insert a number into the fruit array
{
	++size;
	fruit[size]=a;
	for(int i=size;i>1 && fruit[i]<fruit[i/2];i/=2)// Maintain the heap
	{
		long tmp=fruit[i];
		fruit[i]=fruit[i/2];
		fruit[i/2]=tmp;
	}
}
long extract()// The proceudure to extract the top from the fruit array
{
	long ans=fruit[1];// C++ couldn't use the use the name of function to keep the feedback, so I have to use another longint to keep it
	fruit[1]=fruit[size];
	fruit[size]=2147483647;// Fill the null part with 2147483647
	--size;
	for(int i=1;fruit[i*2]<fruit[i] || fruit[i*2+1]<fruit[i];)// Maintain the heap
	{
		i=(fruit[i*2]<fruit[i*2+1])?i*2:i*2+1;
		long tmp=fruit[i];
		fruit[i]=fruit[i/2];
		fruit[i/2]=tmp;
	}
	return ans;
}
int main()
{
	long ans=0,tmp;
	int n;
	scanf("%d",&n);
	for(int i=1;i<=2*n;++i)// Fill the array with maxlongint
		fruit[i]=2147483647;
	for(int i=0;i<n;++i)
	{
		scanf("%ld",&tmp);
		insert(tmp);
	}
	for(int i=1;i<n;++i)
	{
		tmp=extract()+extract();
		ans+=tmp;
		insert(tmp);
	}
	printf("%ld",ans);
	return 0;
}
