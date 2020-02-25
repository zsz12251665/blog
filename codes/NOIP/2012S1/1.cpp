#include<cstdio>
#include<cstring>// We need to use the strlen function in cstring
using namespace std;
int main()
{
	char key[100],txt[1000];
	scanf("%s%s",&key,&txt);
	int keylen=strlen(key),txtlen=strlen(txt);// In C/C++, the strlen() is not very fast, so I use two variable to keep them
	for(int i=0;i<txtlen;++i)
		txt[i]=(txt[i]%32-key[i%keylen]%32+26)%26+txt[i]-txt[i]%32+1;// In ASCII, 'A' ~ 'Z' are 65 to 90, 'a' ~ 'z' are 97 to 122. So a char which modulo 32 can show its order in the alphabet
	printf("%s",txt);
	return 0;
}
