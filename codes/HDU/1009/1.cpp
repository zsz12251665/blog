#include<cstdio>
using namespace std;
int j[1000],f[1000],cj[1000],cf[1000];// The array cf and cj are used to save a copy in merge sort
void msort(int l,int r)
{
	if(l>=r)
		return;
	msort(l,(l+r)/2);
	msort((l+r)/2+1,r);
	for(int i=l;i<=r;++i)
	{
		cj[i]=j[i];
		cf[i]=f[i];
	}
	for(int i=l,x=l,y=(l+r)/2+1;i<=r;++i)
	{
		if(x>(l+r)/2)
		{
			j[i]=cj[y];
			f[i]=cf[y++];
			continue;
		}
		if(y>r)
		{
			j[i]=cj[x];
			f[i]=cf[x++];
			continue;
		}
		if(cj[x]*cf[y]>cj[y]*cf[x])// Not using (cj[x]/cf[x])>(cj[y]/cj[y]) is to avoid dividing 0
		{
			j[i]=cj[x];
			f[i]=cf[x++];
		}
		else
		{
			j[i]=cj[y];
			f[i]=cf[y++];
		}
	}
}
int main()
{
	int m,n;
	for(scanf("%d%d",&m,&n);m!=-1 && n!=-1;scanf("%d%d",&m,&n))
	{
		for(int i=0;i<n;++i)
			scanf("%d%d",&j[i],&f[i]);
		msort(0,n-1);
		long ans=0;
		int i=0;
		for(;i<n && m>f[i];++i)// Take the JavaBeans from high rewards to low ones
		{
			ans+=j[i];
			m-=f[i];
		}
		if(i<n)
			printf("%.3lf\n",ans+m*1.0/f[i]*j[i]);
		else
			printf("%ld.000\n",ans);// Do not forget the 3 numbers after the digit
	}
 	return 0;
}
