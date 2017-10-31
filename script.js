var HTMLCode='';
HTMLCode+='<header>zsz12251665\'s blog</header>';
HTMLCode+='<nav>';
HTMLCode+='	<a target="_parent" href="/"><h3>Home</h3></a>';
HTMLCode+='	<a target="_parent" href="/posts/"><h3>Post List</h3></a>';
HTMLCode+='	<ul>';
HTMLCode+='		<li><a target="_parent" href="/posts/A Trip of Konjac/">A Trip of Konjac</a></li>';
HTMLCode+='		<li><a target="_parent" href="/posts/About Me/">About Me</a></li>';
HTMLCode+='		<li><a target="_parent" href="/posts/Preface Founding/">Preface: Founding</a></li>';
HTMLCode+='		<li><a target="_parent" href="/posts/The Story of the Chorus (1)/">The Story of the Chorus (1)</a></li>';
HTMLCode+='		<li><a target="_parent" href="/posts/The Story of the Chorus (2)/">The Story of the Chorus (2)</a></li>';
HTMLCode+='		<li><a target="_parent" href="/posts/The Story of the Chorus (3)/">The Story of the Chorus (3)</a></li>';
HTMLCode+='	</ul>';
HTMLCode+='	<a target="_parent" href="/codes/"><h3>Code List</h3></a>';
HTMLCode+='	<ul>';
HTMLCode+='		<li><a target="_parent" href="/codes/BZOJ/">BZOJ Problems</a></li>';
HTMLCode+='		<li><a target="_parent" href="/codes/CF/">CF Problems</a></li>';
HTMLCode+='		<li><a target="_parent" href="/codes/HDU/">HDU Problems</a></li>';
HTMLCode+='		<li><a target="_parent" href="/codes/NOIp/">NOIp Problems</a></li>';
HTMLCode+='		<li><a target="_parent" href="/codes/POJ/">POJ Problems</a></li>';
HTMLCode+='	</ul>';
HTMLCode+='	<h3>Friendly Link</h3>';
HTMLCode+='	<ul>';
HTMLCode+='		<li>_|￣|○ <a target="_parent" href="http://blog.oceaneye.moe/">HFer_FDC</a></li>';
HTMLCode+='		<li>_|￣|○ <a target="_parent" href="https://www.cnblogs.com/yohanlong/">HFer_LHZ</a></li>';
HTMLCode+='		<li>_|￣|○ <a target="_parent" href="http://blog.csdn.net/haarmony/">HFer_MHX</a></li>';
HTMLCode+='		<li>_|￣|○ <a target="_parent" href="http://blog.eleele.gq/">HFer_WHJ</a></li>';
HTMLCode+='		<li>_|￣|○ <a target="_parent" href="http://blog.csdn.net/wendavidoi/">HFer_WJW</a></li>';
HTMLCode+='		<li>_|￣|○ <a target="_parent" href="http://snakes.moe/">HFer_YZW</a></li>';
HTMLCode+='		<li>_|￣|○ <a target="_parent" href="https://code.del.moe/">HFer_ZFR</a></li>';
HTMLCode+='	</ul>';
HTMLCode+='</nav>';
HTMLCode+='<article>';
HTMLCode+=document.getElementsByTagName('body')[0].innerHTML;
HTMLCode+='</article>';
HTMLCode+='<footer>&copy; 2017 zsz12251665. Powered by zsz12251665. Theme by zsz12251665. </footer>';
document.getElementsByTagName('body')[0].innerHTML=HTMLCode;
var visibile=true;
function hidebar()
{
	visibile=!visibile;
	if(visibile)
		document.getElementsByTagName('nav')[0].style.display='block';
	else
		document.getElementsByTagName('nav')[0].style.display='none';
}
document.getElementsByTagName('header')[0].addEventListener('click',hidebar);
function parse(source)
{
	source=source.replace(/&amp;/g,"&");
	source=source.replace(/&lt;/g,"<");
	source=source.replace(/&gt;/g,">");
	var p=new Array(),t=new Array();
	var flag=0,temp=String(""),tempflag=0,ptop=0;
	var result=String("");
	var strop=0,comop=0,hex=0;
	/*flags:
		0: none
		1: op
		2: key
		3: str
		4: num
		5: name
		6: tag
		7: com
		8: declear
		9: func
	*/
	for (var i=0;i<source.length;i++)
	{
		if (flag==0)
		{
			temp=temp+source[i];
			if (source[i]=='+'||source[i]=='-'||source[i]=='*'||source[i]=='/'||source[i]=='%'||source[i]==','||source[i]=='{'||source[i]=='}'||source[i]==';'||source[i]=='?'||source[i]==':')
				flag=1;
			if (source[i]=='/'&&source[i+1]=='*')
			{
				flag=7;
				if (comop==0)
					comop=1;
			}
			if (source[i]=='/'&&source[i+1]=='/')
			{
				flag=7;
				if (comop==0)
					comop=2;
			}
			if (source[i]=='&'||source[i]=='<'||source[i]=='>'||source[i]=='='||source[i]=='|'||source[i]=='!'||source[i]=='~'||source[i]=='^'||source[i]=='('||source[i]==')'||source[i]=='['||source[i]==']'||source[i]=='{'||source[i]=='}')
				flag=1;
			if (source[i]=="\"")
			{
				flag=3;
				if (strop==0&&comop==0)
					strop=1;
			}
			if (source[i]=="\'")
			{
				flag=3;
				if (strop==0&&comop==0)
					strop=2;
			}
			if (source[i]>='0'&&source[i]<='9')
				flag=4;
			if (source[i]=='\n'||source[i]=='\r'||source[i]==' '||source[i]=='\t')
				flag=6;
			if (flag==0)
				flag=5;
			continue;
		}
		tempflag=0;
		if (source[i]=='+'||source[i]=='-'||source[i]=='*'||source[i]=='/'||source[i]=='%'||source[i]==','||source[i]=='{'||source[i]=='}'||source[i]==';'||source[i]=='?'||source[i]==':')
			tempflag=1;
		if (source[i]=='/'&&source[i+1]=='*')
		{
			tempflag=7;
			if (comop==0)
				comop=1;
		}
		if (source[i]=='/'&&source[i-1]=='*')
			if (comop==1)
			{
				temp=temp+source[i];
				p[ptop]=temp;
				t[ptop]=flag;
				temp=String("");
				flag=0;
				ptop++;
				comop=0;
				continue;
			}
		if (source[i]=='/'&&source[i+1]=='/')
		{
			tempflag=7;
			if (comop==0)
				comop=2;
		}
		if (source[i]=='&'||source[i]=='<'||source[i]=='>'||source[i]=='='||source[i]=='|'||source[i]=='!'||source[i]=='~'||source[i]=='^'||source[i]=='('||source[i]==')'||source[i]=='['||source[i]==']'||source[i]=='{'||source[i]=='}')
			tempflag=1;
		if (source[i]=="\"")
		{
			tempflag=3;
			if (strop==1)
			{
				temp=temp+source[i];
				p[ptop]=temp;
				t[ptop]=flag;
				temp=String("");
				flag=0;
				ptop++;
				strop=0;
				continue;
			}
			if (strop==0&&comop==0)
				strop=1;
		}
		if (source[i]=="\'")
		{
			tempflag=3;
			if (strop==2)
			{
				temp=temp+source[i];
				p[ptop]=temp;
				t[ptop]=flag;
				temp=String("");
				flag=0;
				ptop++;
				strop=0;
				continue;
			}
			if (strop==0&&comop==0)
				strop=2;
		}
		if (source[i]>='0'&&source[i]<='9'&&flag!=5)
			tempflag=4;
		if (flag==4&&source[i]=='x'&&source[i-1]=='0'&&temp.length==1&&flag==4&&(('0'<=source[i+1]&&source[i+1]<='9')||('A'<=source[i+1]&&source[i+1]<='F')))
		{
			tempflag=4;
			hex=1;
		}
		if (source[i]=='$'&&(('0'<=source[i+1]&&source[i+1]<='9')||('A'<=source[i+1]&&source[i+1]<='F')))
		{
			p[ptop]=temp;
			t[ptop]=flag;
			temp=source[i];
			flag=4;
			ptop++;
			hex=1;
			continue;
		}
		if (('0'<=source[i]&&source[i]<='9')||('A'<=source[i]&&source[i]<='F'))
			if (hex==1)
				tempflag=4;
		if ((source[i]=='.'||source[i]=='e')&&flag==4)
			tempflag=4;
		if (source[i]=='-'&&source[i-1]=='e'&&flag==4)
			tempflag=4;
		if (tempflag==0)
			tempflag=5;
		if (source[i]=='\n'||source[i]=='\r'||source[i]==' '||source[i]=='\t')
			tempflag=6;
		if (source[i]=='\n'||source[i]=='\r')
			if (comop==2)
			{
				p[ptop]=temp;
				t[ptop]=flag;
				temp=source[i];
				flag=tempflag;
				ptop++;
				comop=0;
				continue;
			}
		if (tempflag==flag||flag==3||flag==7)
			temp=temp+source[i];
		else
		{
			if (temp[0]=='#')
				flag=8;
			if (temp=="int"||
				temp=="long"||
				temp=="continue"||
				temp=="return"||
				temp=="if"||
				temp=="else"||
				temp=="for"||
				temp=="void"||
				temp=="bool"||
				temp=="using"||
				temp=="namespace"||
				temp=="inline"||
				temp=="char"||
				temp=="const"||
				temp=="var"||
				temp=="begin"||
				temp=="end"||
				temp=="real"||
				temp=="float"||
				temp=="double"||
				temp=="string"||
				temp=="unsigned"||
				temp=="do"||
				temp=="while"||
				temp=="struct")
				flag=2;
			if (flag==5&&source[i]=='(')
				flag=9;
			p[ptop]=temp;
			t[ptop]=flag;
			temp=source[i];
			flag=tempflag;
			ptop++;
			hex=0;
		}
	}
	p[ptop]=temp;
	t[ptop]=flag;
	ptop++;
	for (var i=0;i<ptop;i++)
	{
		if (t[i]==0)
			result=result+p[i];
		if (t[i]==1)
			result=result+"<span style='color: #FF80B0;'>"+p[i]+"</span>";
		if (t[i]==2)
			result=result+"<span style='color: #80B0FF; font-style: Italic;'>"+p[i]+"</span>";
		if (t[i]==3)
			result=result+"<span style='color: #FFB080;'>"+p[i]+"</span>";
		if (t[i]==4)
			result=result+"<span style='color: #B080FF;'>"+p[i]+"</span>";
		if (t[i]==5)
			result=result+p[i];
		if (t[i]==6)
			result=result+p[i];
		if (t[i]==7)
			result=result+"<span style='color: #808080;'>"+p[i]+"</span>";
		if (t[i]==8)
			result=result+"<span style='color: #80FFB0;'>"+p[i]+"</span>";
		if (t[i]==9)
			result=result+"<span style='color: #B0FF80;'>"+p[i]+"</span>";
	}
	return result;
}
window.onload=function highlight()
{
	if (!document.getElementsByTagName)
	{
		alert("Error!");
		return;
	}
	var codes=document.getElementsByTagName("code");
	for (var i=0;i<codes.length;i++)
	{
		var source=codes[i].innerHTML;
		var result=parse(source);
		codes[i].innerHTML=result;
	}
}
