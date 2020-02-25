#include<cstdio>
#include<cstring>// We need to use the memset function and the strlen function in cstring
using namespace std;
long count[10000000];
char s[64];
int main()
{
	memset(count,0,sizeof count);// Initialize the counter
	long n;
	scanf("%ld",&n);
	for(long i=0;i<n;++i)
	{
		scanf("%s",&s);
		long tmp=0;// Decode the telephone number
		for(int j=0,len=strlen(s);j<len;++j)
			switch(s[j])// Pay attention that in C++ it is illeagal to use "case '2','A','B','C':" just like Pascal, but it will continue to run the code below until a "break" no matter if there was a "case"
			{
				case '0':
					tmp*=10;
					break;
				case '1':
					tmp=tmp*10+1;
					break;
				case '2':
				case 'A':
				case 'B':
				case 'C':
					tmp=tmp*10+2;
					break;
				case '3':
				case 'D':
				case 'E':
				case 'F':
					tmp=tmp*10+3;
					break;
				case '4':
				case 'G':
				case 'H':
				case 'I':
					tmp=tmp*10+4;
					break;
				case '5':
				case 'J':
				case 'K':
				case 'L':
					tmp=tmp*10+5;
					break;
				case '6':
				case 'M':
				case 'N':
				case 'O':
					tmp=tmp*10+6;
					break;
				case '7':
				case 'P':
				case 'R':
				case 'S':
					tmp=tmp*10+7;
					break;
				case '8':
				case 'T':
				case 'U':
				case 'V':
					tmp=tmp*10+8;
					break;
				case '9':
				case 'W':
				case 'X':
				case 'Y':
					tmp=tmp*10+9;
					break;
			}
		count[tmp]++;// Update the counter
	}
	bool no_duplicates=true;
	for(long i=0;i<10000000;++i)// Find duplicated numbers
		if(count[i]>1)
		{
			printf("%d%d%d-%d%d%d%d %ld\n",i/1000000,i/100000%10,i/10000%10,i/1000%10,i/100%10,i/10%10,i%10,count[i]);// Print the number bit by bit
			no_duplicates=false;
		}
	if(no_duplicates)
		printf("No duplicates.");
	return 0;
}
