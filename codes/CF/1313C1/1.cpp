#include<cstdio>
using namespace std;
long a[1000];
int main()
{
	int n,ans_i;// ans_i is the index of the peak with the largest total number of floors
	long long ans_v=0;// ans_v is the value of the largest total number of floors
	scanf("%d",&n);
	for(int i=0;i<n;++i)
		scanf("%ld",&a[i]);
	for(int i=0;i<n;++i)// Enumerate the peaks
	{
		long long sum=a[i];// Calculate the total number of floors
		long min_a=a[i];// The minimum value of a[i], used to make both sides of the peak monotonic but remained the array unchanged
		for(int j=i-1;j>=0;--j)
		{
			min_a=(a[j]<min_a)?a[j]:min_a;
			sum+=min_a;
		}
		min_a=a[i];
		for(int j=i+1;j<n;++j)
		{
			min_a=(a[j]<min_a)?a[j]:min_a;
			sum+=min_a;
		}
		if(sum>ans_v)// Take the largest one
		{
			ans_v=sum;
			ans_i=i;
		}
	}
	for(long i=ans_i-1;i>=0;--i)// Shape the answer
		a[i]=(a[i+1]<a[i])?a[i+1]:a[i];
	for(long i=ans_i+1;i<n;++i)
		a[i]=(a[i-1]<a[i])?a[i-1]:a[i];
	for(long i=0;i<n;++i)// Output the answer
		printf("%ld ",a[i]);
	return 0;
}
