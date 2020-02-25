#include<cstdio>
using namespace std;
int a[100];
bool unable[25001];
void qsort(int l,int r)
{
	int x=l,y=r,std=a[(l+r)/2];
	while(x<y)
	{
		while(a[x]<std)
			++x;
		while(a[y]>std)
			--y;
		if(x<=y)
		{
			int tmp=a[x];
			a[x++]=a[y];
			a[y--]=tmp;
		}
	}
	if(l<y)
		qsort(l,y);
	if(x<r)
		qsort(x,r);
}
int main()
{
	int t,n;
	for(scanf("%d",&t);t>0;--t)
	{
		for(int i=0;i<25001;++i)// Initialize the unable array
			unable[i]=true;
		scanf("%d",&n);
		for(int i=0;i<n;++i)
		scanf("%d",&a[i]);
		qsort(0,n-1);
		int ans=0;
		for(int i=0;i<n;++i)
			if(unable[a[i]])
			{
				++ans;
				unable[a[i]]=false;
				for(int j=1;j+a[i]<25001;++j)// Update the unable array
					if(!unable[j])
						unable[j+a[i]]=false;
			}
		printf("%d\n",ans);
	}
	return 0;
}
