#include<cstdio>
using namespace std;
char s[3000][5];// The pattern how Bashar is moving
int c[3000];// How many times Bashar should moves
int main()
{
	int n,m;
	long k;
	scanf("%d%d%ld",&n,&m,&k);
	if(4*n*m-2*n-2*m<k)// The distance is longer than the maximum available
	{
		printf("NO");
		return 0;
	}
	printf("YES\n");
	if(m==1)// There are only 1 column
	{
		printf("2\n%d D\n%d U\n",k-k/2,k/2);
		return 0;
	}
	int size=0;
	for(int i=0;k>0&&i<n;++i)
	{
		c[size]=(k>m-1)?m-1:k;// Move to the right border (or as right as possible)
		sprintf(s[size],"R");
		k-=c[size++];
		if(k==0)
			break;
		if(i<n-1)// Not the last row
		{
			c[size]=(k/3>m-1)?m-1:k/3;// Move back to the left
			sprintf(s[size],"DUL");
			if(c[size]>0)
				k-=3*c[size++];
			if(k>0)
			{
				c[size]=1;// Move downward or finish the last steps
				sprintf(s[size++],(k==2)?"DU":"D");
				k-=(k==2)?2:1;
			}
		}
		else// The last row
		{
			c[size]=(k>m-1)?m-1:k;// Move back to the left
			sprintf(s[size],"L");
			k-=c[size++];
			if(k>0)
			{
				c[size]=k;// Move upward back to the start point
				sprintf(s[size++],"U");
			}
		}
	}
	printf("%d\n",size);
	for(int i=0;i<size;++i)
		printf("%d %s\n",c[i],s[i]);
	return 0;
}
