//The highlights of functions and variables are still missing
window.addEventListener('DOMContentLoaded',LoadHighlight);
function LoadHighlight()
{
	//Load the style sheet of highlight
	document.getElementsByTagName('head')[0].innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/highlight/highlight.css" />';
	//Load and highlight the code
	var request=JSON.parse('{'+location.search.slice(1).replace(/([^&=]*)=([^&]*)/g,'"$1":"$2"').replace(/&/g,',')+'}');
	if((document.getElementsByTagName('code').length==0)||(!request.oj)||(!request.pid))
		return;
	var ajax=new XMLHttpRequest();
	ajax.open('GET','/codes/'+request.oj+'/'+request.pid+'.code',true);
	ajax.onreadystatechange=function()
	{
		if((ajax.readyState!=4)||(ajax.status!=200))
			return;
		for(var t=0,code=document.getElementsByTagName('code'),codetext=ajax.responseText.split('\n\n');t<code.length;t++)
		{
			//Load the code
			var source=codetext[t].replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
			//Highlight constants
			source=source.replace(/(\"[^\n]*?\"|\'[^\n]*?\')/g,'<span class="constant">$1</span>').replace(/\b([0-9][.0-9]*|maxint|maxlongint|true|false)\b/g,'<span class="constant">$1</span>');
			//Highlight comments
			source=source.replace(/(\/\/[^\n]*)/g,'<span class="comment">$1</span>');
			//Hightlight keywords
			if(code[t].lang=='cpp')
				for(var i=0,keyword=['asm','auto','bool','break','case','catch','char','const','continue','default','define','delete','do','double','else','enum','explicit','extern','float','for','friend','goto','if','include','inline','int','long','mutable','namespace','new','null','operator','private','protected','public','register','return','short','signed','sizeof','static','struct','switch','template','this','throw','try','typedef','union','unsigned','using','virtual','void','volatile','while'];i<keyword.length;i++)
					source=source.replace(RegExp('\\b('+keyword[i]+')\\b','g'),'<span class="keyword">$1</span>');
			if(code[t].lang=='pas')
				for(var i=0,keyword=['and','ansistring','array','asm','begin','break','case','char','const','continue','div','do','double','downto','else','end','file','float','for','function','goto','if','in','inline','int64','integer','label','longint','mod','nil','not','object','of','operator','or','procedure','program','record','repeat','set','shl','shr','single','string','then','to','type','unit','until','uses','var','while','with','xor'];i<keyword.length;i++)
					source=source.replace(RegExp('\\b('+keyword[i]+')\\b','g'),'<span class="keyword">$1</span>');
			//Highlight commas
			for(var i=0;i<source.length;i++)
			{
				if((source[i]=='!')||(source[i]=='@')||(source[i]=='#')||(source[i]=='$')
				||(source[i]=='%')||(source[i]=='^')||(source[i]=='+')||(source[i]=='-')
				||(source[i]=='*')||(source[i]=='/')||(source[i]=='(')||(source[i]==')')
				||(source[i]=='=')||(source[i]=='[')||(source[i]==']')||(source[i]=='{')
				||(source[i]=='}')||(source[i]=='|')||(source[i]==',')||(source[i]=='.')
				||(source[i]==';')||(source[i]==':')||(source[i]=='\\')||(source[i]=='?'))
					source=source.slice(0,i)+'<span class="comma">'+source[i]+'</span>'+source.slice(i+1);
				if(source[i]=='<')
				{
					for(;(i<source.length)&&(source[i]!='>');i++);
					for(;(i<source.length)&&(source[i]!='<');i++);
					for(;(i<source.length)&&(source[i]!='>');i++);
				}
			}
			source=source.replace(/&(amp|lt|gt)<span class="comma">;<\/span>/g,'<span class="comma">&$1;</span>');
			code[t].innerHTML=source;
		}
		//Clear other highlights in comment and constant
		for(var i=0,comment=document.getElementsByClassName('comment');i<comment.length;i++)
			comment[i].innerHTML=comment[i].innerHTML.replace(/<\/?span( class="[a-z]*")?>/g,'');
		for(var i=0,constant=document.getElementsByClassName('constant');i<constant.length;i++)
			constant[i].innerHTML=constant[i].innerHTML.replace(/<\/?span( class="[a-z]*")?>/g,'');
	}
	ajax.send();
}
