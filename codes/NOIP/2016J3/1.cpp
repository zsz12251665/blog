#include<cstdio>
using namespace std;
long nation[300000],count[100001],time[100000],passenger[100001];// The nationalies are from 1 to 100000, so we need a count array with a size of 100001 since the array is started from 0 in C++
int main()
{
	long n,ans=0,queue=0;
	for(long i=0;i<100001;++i)// Initialize the count array
		count[i]=0;
	passenger[0]=0;
	scanf("%ld",&n);
	for(long i=0;i<n;++i)
	{
		scanf("%ld%ld",&time[i],&passenger[i+1]);
		passenger[i+1]+=passenger[i];
		for(long j=passenger[i];j<passenger[i+1];++j)
		{
			scanf("%ld",&nation[j]);
			if(count[nation[j]]==0)// If there was no one else with this nationality, refresh the answer
				++ans;
			count[nation[j]]++;
		}
		while(time[queue]+86400<=time[i])// Check whether the head ship is still in the interval
		{
			for(long j=passenger[queue];j<passenger[queue+1];++j)
			{
				count[nation[j]]--;
				if(count[nation[j]]<=0)// If there was no one else with this nationality, refresh the answer
					--ans;
			}
			++queue;
		}
		printf("%ld\n",ans);
	}
	return 0;
}
