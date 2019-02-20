// The highlights of functions and variables are still missing
window.addEventListener('DOMContentLoaded',LoadHighlight);
function LoadHighlight()
{
	// Load the style sheet of highlight
	document.head.innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/highlight/highlight.css" />';
	// Load the request
	var request=JSON.parse('{'+location.search.slice(1).replace(/([^&=]*)=([^&]*)/g,'"$1":"$2"').replace(/&/g,',')+'}');
	if((!document.querySelector('code'))||(!request.oj)||(!request.pid))
		return;
	// Load soft tab request and set up soft tabs panel
	if(request.softTab)
		sessionStorage.setItem('softTab',request.softTab);
	var softTab=document.createElement('div');
	softTab.innerHTML+='<input type="checkbox" id="softTab" />Replace tabs with 4 spaces';
	document.querySelector('nav').appendChild(softTab);
	softTab=document.querySelector('#softTab');
	softTab.checked=String(sessionStorage.getItem('softTab'))=='true';
	softTab.onclick=function(){sessionStorage.setItem('softTab',softTab.checked);for(var t=0,code=document.querySelectorAll('code');t<code.length;t++)code[t].innerHTML=softTab.checked?code[t].innerHTML.replace(/\t/g,'&nbsp;&nbsp;&nbsp;&nbsp;'):code[t].innerHTML.replace(/(&nbsp;){4}/g,'\t');};
	// Load and highlight the code
	var ajax=new XMLHttpRequest();
	ajax.open('GET','/codes/'+request.oj+'/'+request.pid+'.code',true);
	ajax.onreadystatechange=function()
	{
		if((ajax.readyState!=4)||(ajax.status!=200))
			return;
		for(var t=0,code=document.querySelectorAll('code'),codetext=ajax.responseText.split('\n\n');t<code.length;t++)
		{
			// Load the code
			var source=codetext[t].replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;');
			// Highlight constants
			source=source.replace(/(\"[^\n]*?\"|\'[^\n]*?\')/g,'<span class="constant">$1</span>').replace(/\b([0-9][.0-9]*|maxint|maxlongint|true|false)\b/g,'<span class="constant">$1</span>');
			// Highlight comments
			source=source.replace(/(\/\/[^\n]*)/g,'<span class="comment">$1</span>');
			// Hightlight keywords
			if(code[t].lang=='cpp')
				var keyword=['asm','auto','bool','break','case','catch','char','const','continue','default','define','delete','do','double','else','enum','explicit','extern','float','for','friend','goto','if','include','inline','int','long','mutable','namespace','new','null','operator','private','protected','public','register','return','short','signed','sizeof','static','struct','switch','template','this','throw','try','typedef','union','unsigned','using','virtual','void','volatile','while'];
			if(code[t].lang=='pas')
				var keyword=['and','ansistring','array','asm','begin','break','case','char','const','continue','div','do','double','downto','else','end','file','float','for','function','goto','if','in','inline','int64','integer','label','longint','mod','nil','not','object','of','operator','or','procedure','program','record','repeat','set','shl','shr','single','string','then','to','type','unit','until','uses','var','while','with','xor'];
			for(var i=0;i<keyword.length;i++)
				source=source.replace(RegExp('\\b('+keyword[i]+')\\b','g'),'<span class="keyword">$1</span>');
			// Highlight commas
			for(var i=0;i<source.length;i++)
			{
				for(var j=0,comma=['!','@','#','$','%','^','+','-','*','/','(',')','=','[',']','{','}','|',',','.',';',':','\\','?'];j<comma.length;j++)
					source=(source[i]==comma[j])?source.slice(0,i)+'<span class="comma">'+source[i]+'</span>'+source.slice(i+1):source;
				if(source[i]=='<')
				{
					for(;(i<source.length)&&(source[i]!='>');i++);
					for(;(i<source.length)&&(source[i]!='<');i++);
					for(;(i<source.length)&&(source[i]!='>');i++);
				}
			}
			source=source.replace(/&(amp|lt|gt)<span class="comma">;<\/span>/g,'<span class="comma">&$1;</span>');
			// Process soft tabs
			source=softTab.checked?source.replace(/\t/g,'&nbsp;&nbsp;&nbsp;&nbsp;'):source.replace(/(&nbsp;){4}/g,'\t');
			code[t].innerHTML=source;
		}
		// Clear other highlights in comment and constant
		for(var i=0,comment=document.querySelectorAll('code span.comment');i<comment.length;i++)
			comment[i].innerHTML=comment[i].innerHTML.replace(/<\/?span( class="[a-z]*")?>/g,'');
		for(var i=0,constant=document.querySelectorAll('code span.constant');i<constant.length;i++)
			constant[i].innerHTML=constant[i].innerHTML.replace(/<\/?span( class="[a-z]*")?>/g,'');
	}
	ajax.send();
}
