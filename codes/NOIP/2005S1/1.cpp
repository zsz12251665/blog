#include<cstdio>
using namespace std;
struct student
{
	char name[20];
	int prize;
};// Do not forget the semicolon, or it may lead to some error
student stu[100];
char s[20];
int main()
{
	int n;
	scanf("%d",&n);
	long total=0;
	int mxp=-65535,mxi;
	bool officer,west;
	for(int i=0,test,class,article;i<n;++i)
	{
		scanf("%s%d%d",&stu[i].name,&test,&class);// Get the information of the student
		scanf("%s",&s);
		if(s[0]=='Y')
			officer=1;
		else
			officer=0;
		scanf("%s",&s);
		west=s[0]=='Y';
		west=0;
		scanf("%d",&article);
		stu[i].prize=0;
		if(test>80 && article>0)// Check what prizee the student can win
		{
			stu[i].prize+=8000;
			total+=800;
		}
		if(test>85 && class>80)
		{
			stu[i].prize+=4000;
			total+=400;
		}
		if(test>90)
		{
			stu[i].prize+=2000;
			total+=200;
		}
		if(test>85 && west)
		{
			stu[i].prize+=1000;
			total+=100;
		}
		if(class>80 && officer)
		{
			stu[i].prize+=850;
			total+=85;
		}
		if(mxp<stu[i].prize)// Keep the student who win the most prizees
		{
			mxp=stu[i].prize;
			mxi=i;
		}
	}
	printf("%s\n%d\n%ld",stu[mxi].name,stu[mxi].prize,total*10);
	return 0;
}
