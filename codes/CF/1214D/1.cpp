#include<cstdio>
using namespace std;
bool map[1000000],a[1000000][4];
long n,m;
char s[1000001];
void search(long p,int mode)
{
	a[p][mode]=true;
	switch(mode)
	{
		case 0:// Search from start to end
			if(p%m<m-1 && map[p+1] && !a[p+1][0])// Check a to avoid visiting once again
				search(p+1,0);
			if(p+m<n*m && map[p+m] && !a[p+m][0])
				search(p+m,0);
			break;
		case 1:// Search from end to start
			if(p%m>0 && map[p-1] && !a[p-1][1])
				search(p-1,1);
			if(p>=m && map[p-m] && !a[p-m][1])
				search(p-m,1);
			break;
		case 2:// Search with n first
			if(p+m<n*m && map[p+m] && a[p+m][0] && a[p+m][1])
				search(p+m,2);
			else
				if(p%m<m-1 && map[p+1] && a[p+1][0] && a[p+1][1])
					search(p+1,2);
			break;
		case 3:// Search with m first
			if(p%m<m-1 && map[p+1] && a[p+1][0] && a[p+1][1])
				search(p+1,3);
			else
				if(p+m<n*m && map[p+m] && a[p+m][0] && a[p+m][1])
					search(p+m,3);
			break;
	}
}
int main()
{
	scanf("%ld%ld",&n,&m);
	for(long i=0;i<n;++i)
	{
		scanf("%s",s);
		for(long j=0;j<m;++j)
		{
			map[i*m+j]=s[j]=='.';
			a[i*m+j][0]=a[i*m+j][1]=a[i*m+j][2]=a[i*m+j][3]=false;
		}
	}
	search(0,0);// Search from start to end
	if(!a[n*m-1][0])// If the treasure is already unreachable, output 0 and exit
	{
		putchar('0');
		return 0;
	}
	search(n*m-1,1);// Search from end to start
	search(0,2);// Search with n first
	search(0,3);// Search with m first
	for(long i=1;i<n*m-1;++i)// Find the common cell except the start and the end
		if(a[i][2] && a[i][3])
		{
			putchar('1');
			return 0;
		}
	putchar('2');
	return 0;
}
