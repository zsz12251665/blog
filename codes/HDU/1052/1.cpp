#include<cstdio>
using namespace std;
int copy[1000],king[1000],tian[1000];// The array copy is used to save a copy while doing merge sort
void msort(int l,int r)
{
	if(l>=r)
		return;
	msort(l,(l+r)/2);
	msort((l+r)/2+1,r);
	for(int i=l;i<=r;++i)
		copy[i]=king[i];
	for(int i=l,x=l,y=(l+r)/2+1;i<=r;++i)
	{
		if(x>(l+r)/2)
		{
			king[i]=copy[y++];
			continue;
		}
		if(y>r)
		{
			king[i]=copy[x++];
			continue;
		}
		if(copy[x]<copy[y])
			king[i]=copy[y++];
		else
			king[i]=copy[x++];
	}
	for(int i=l;i<=r;++i)// We sort the array king and array tian at the same time here
		copy[i]=tian[i];
	for(int i=l,x=l,y=(l+r)/2+1;i<=r;++i)
	{
		if(x>(l+r)/2)
		{
			tian[i]=copy[y++];
			continue;
		}
		if(y>r)
		{
			tian[i]=copy[x++];
			continue;
		}
		if(copy[x]<copy[y])
			tian[i]=copy[y++];
		else
			tian[i]=copy[x++];
	}
}
int main()
{
	int n;
	for(scanf("%d",&n);n!=0;scanf("%d",&n))
	{
		for(int i=0;i<n;++i)
			scanf("%d",&tian[i]);
		for(int i=0;i<n;++i)
			scanf("%d",&king[i]);
		msort(0,n-1);
		int ans=0,king_best=0,tian_best=0,king_worst=n-1,tian_worst=n-1;
		for(int i=0;i<n;++i)// The greedy part
		{
			if(tian[tian_worst]>king[king_worst])
			{
				++ans;
				--tian_worst;
				--king_worst;
				continue;
			}
			if(tian[tian_worst]<king[king_worst])
			{
				--ans;
				--tian_worst;
				++king_best;
				continue;
			}
			if(tian[tian_best]>king[king_best])
			{
				++ans;
				++tian_best;
				++king_best;
				continue;
			}
			if(tian[tian_worst]<king[king_best])
				--ans;
			if(tian[tian_worst]>king[king_best])
				++ans;
			--tian_worst;
			++king_best;
		}
		printf("%d\n",ans*200);
	}
	return 0;
}
