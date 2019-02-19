window.addEventListener('DOMContentLoaded',LoadMath);
function LoadMath()
{
	// Load the style sheet of mathematical expressions
	document.head.innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/math/math.css" />';
	// Search and replace the expressions
	for(var t=0,data=document.getElementsByTagName('data');t<data.length;t++)
	{
	    var html=data[t].value;
		var stack=new Array();
		for(var i=0;i<html.length;i++)
		{
			if(html[i]=='\\')
			{
				html=html.slice(0,i)+html.slice(i+1);
				i++;
			}
			if((html[i]>='a')&&(html[i]<='z')&&(i+1<html.length)&&(html[i+1]=='{'))
			{
				stack.push(html[i]);
				html=html.slice(0,i)+'<span class="'+html[i]+'">'+html.slice(i+2);
				i+=15;
			}
			if(html[i]=='}')
			{
				html=html.slice(0,i)+'</span>'+html.slice(i+1);
				i+=6;
			}
		}
		data[t].innerHTML=html;	
	}
	// Update the font style of variable
	for(var t=0,data=document.getElementsByClassName('v');t<data.length;t++)
	{
	    var html=data[t].innerHTML;
		for(var i=0;i<html.length;i++)
		{
			if((html.charCodeAt(i)>64)&&(html.charCodeAt(i)<91))
				html=html.slice(0,i)+'&#'+String(119847+html.charCodeAt(i))+';'+html.slice(i+1);
			if((html.charCodeAt(i)>96)&&(html.charCodeAt(i)<123))
				html=html.slice(0,i)+'&#'+String(119841+html.charCodeAt(i))+';'+html.slice(i+1);
		}
		data[t].innerHTML=html;
	}
}
/*
b = sub
c = constant
f = fraction
i = inline block
l = line
o = operator
p = super
t = topline
v = variable
*/
