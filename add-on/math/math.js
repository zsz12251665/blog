window.addEventListener('DOMContentLoaded',LoadMath);
function LoadMath()
{
	//Load the stylesheet of mathmatical expressions
	document.getElementsByTagName('head')[0].innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/math/math.css"/>';
	//Search and replace the expressions
	var math=document.getElementsByTagName('var');
	for(var t=0;t<math.length;t++)
	{
	    var html=math[t].innerHTML;
		for(var i=0;i<html.length;i++)
		{
			//Replace the two-tuple groups
			if(html[i]=='@')
				for(var j=i+1,flag=0;(j<html.length)&&(flag==0);j++)
					if(html[j]=='@')
						for(var k=j+1;(k<html.length)&&(flag==0);k++)
							if(html[k]=='@')
							{
								html=html.slice(0,i)+'<span class="updown">'+html.slice(i+1,j)+'<span></span>'+html.slice(j+1,k)+'</span>'+html.slice(k+1);
								flag=1;
							}
			//Replace the divison
			if((html[i]=='/')&&(html[i-1]!='<'))
				for(var j=i+1,flag=0;(j<html.length)&&(flag==0);j++)
					if((html[j]=='/')&&(html[j-1]!='<'))
						for(var k=j+1;(k<html.length)&&(flag==0);k++)
							if((html[k]=='/')&&(html[k-1]!='<'))
							{
								html=html.slice(0,i)+'<span class="div">'+html.slice(i+1,j)+'<span></span>'+html.slice(j+1,k)+'</span>'+html.slice(k+1);
								flag=1;
							}
			//Replace the multiplication
			if(html[i]=='*')
				html=html.slice(0,i)+'&times;'+html.slice(i+1);
			//Replace the variable
			if(html[i]=='#')
				for(var j=i+1;j<html.length;j++)
					if(html[j]=='#')
					{
						html=html.slice(0,i)+'<span class="var">'+html.slice(i+1,j)+'</span>'+html.slice(j+1);
						break;
					}
			//Replace the subscript
			if(html.slice(i,i+2)=='(_')
				for(var j=i+1;j<html.length;j++)
					if(html.slice(j,j+2)=='_)')
					{
						html=html.slice(0,i)+'<sub>'+html.slice(i+2,j)+'</sub>'+html.slice(j+2);
						break;
					}
			//Replace the superscript
			if(html.slice(i,i+2)=='(^')
				for(var j=i+1;j<html.length;j++)
					if(html.slice(j,j+2)=='^)')
					{
						html=html.slice(0,i)+'<sup>'+html.slice(i+2,j)+'</sup>'+html.slice(j+2);
						break;
					}
			//Replace the square root
			if(html.slice(i,i+2)=='(\\')
				for(var j=i+1;j<html.length;j++)
					if(html.slice(j,j+2)=='\\)')
					{
						html=html.slice(0,i)+'&radic;<span class="sqrt">'+html.slice(i+2,j)+'</span>'+html.slice(j+2);
						break;
					}
		}
		math[t].innerHTML=html;
	}
	//Update the font of variable
	math=document.getElementsByClassName('var');
	for(var t=0;t<math.length;t++)
	{
	    var html=math[t].innerHTML;
		for(var i=0;i<html.length;i++)
		{
			if((html.charCodeAt(i)>64)&&(html.charCodeAt(i)<91))
				html=html.slice(0,i)+'&#'+String(119847+html.charCodeAt(i))+';'+html.slice(i+1);
			if((html.charCodeAt(i)>96)&&(html.charCodeAt(i)<123))
				html=html.slice(0,i)+'&#'+String(119841+html.charCodeAt(i))+';'+html.slice(i+1);
		}
		math[t].innerHTML=html;
	}
}
