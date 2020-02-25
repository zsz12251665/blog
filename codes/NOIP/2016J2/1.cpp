#include<cstdio>
using namespace std;
int main()
{
	int count=0;
	long left,right,date;
	scanf("%ld%ld",&left,&right);
	for(int m=1;m<13;++m)// Enumerate the month
		for(int d=1;d<32;++d)// Enumerate the date
		{
			if(m==2 && d>29 || (m==4 || m==6 || m==9 || m==11) && d>30)// Don't forget the short months
				continue;
			date=d%10*1000+d/10*100+m%10*10+m/10;// Calculate the year
			date=date*10000+m*100+d;// Get the complete date
			if(left<=date && right>=date)
				++count;
		}
	printf("%d",count);
	return 0;
}
