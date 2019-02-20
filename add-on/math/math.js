// b = sub; c = constant; f = fraction; i = inline block; l = line; o = operator; p = super; t = top line; v = variable
window.addEventListener('DOMContentLoaded',LoadMath);
function LoadMath()
{
	// Load the style sheet of mathematical expressions
	document.head.innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/math/math.css" />';
	// Show the expressions
	for(var t=0,data=document.querySelectorAll('data');t<data.length;t++)
		data[t].innerHTML=data[t].value.replace(/([a-z])\{/g,'<span class="$1">').replace(/(?<!\\)\}/g,'</span>').replace(/\\(.)/g,'$1');
	// Update the font style of variable
	for(var t=0,data=document.querySelectorAll('data span.v');t<data.length;t++)
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
