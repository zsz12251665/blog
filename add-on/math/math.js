window.addEventListener('DOMContentLoaded',LoadMath);
function LoadMath()
{
	//Load the stylesheet of mathmatical expressions
	document.getElementsByTagName('head')[0].innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/math/math.css" />';
	//Search and replace the expressions
	for(var t=0,math=document.getElementsByTagName('math');t<math.length;t++)
	{
	    var html=math[t].innerHTML;
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
				html=html.slice(0,i)+'<m'+html[i]+'>'+html.slice(i+2);
				i+=3;
			}
			if(html[i]=='}')
			{
				html=html.slice(0,i)+'</m'+stack.pop()+'>'+html.slice(i+1);
				i+=4;
			}
		}
		math[t].innerHTML=html;	
	}
	//Update the font of variable
	for(var t=0,mv=document.getElementsByTagName('mv');t<mv.length;t++)
	{
	    var html=mv[t].innerHTML;
		for(var i=0;i<html.length;i++)
		{
			if((html.charCodeAt(i)>64)&&(html.charCodeAt(i)<91))
				html=html.slice(0,i)+'&#'+String(119847+html.charCodeAt(i))+';'+html.slice(i+1);
			if((html.charCodeAt(i)>96)&&(html.charCodeAt(i)<123))
				html=html.slice(0,i)+'&#'+String(119841+html.charCodeAt(i))+';'+html.slice(i+1);
		}
		mv[t].innerHTML=html;
	}
}
