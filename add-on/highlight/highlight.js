//The highlights of functions and variables are still missing
window.addEventListener('DOMContentLoaded',LoadHighlight);
function LoadHighlight()
{
	//Load the stylesheet of highlight
	document.getElementsByTagName('head')[0].innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/highlight/highlight.css"/>';
	//Highlight the code
	var code=document.getElementsByTagName('code');
	for(t=0;t<code.length;t++)
	{
		//Clear the tab before the line
		var source=code[t].innerHTML.replace(/\t*/g,'');
		//Highlight strings
		source=source.replace(/(\"[^\n]*?\"|\'[^\n]*?\')/g,'<span class="constant">$1</span>');
		//Highlight numbers
		for(var i=0;i<2;i++)
			source=source.replace(/([^_a-zA-Z0-9])([0-9][.0-9]*)([^_a-zA-Z0-9])/g,'$1<span class="constant">$2</span>$3');
		//Highlight other special constant
		for(var i=0;i<2;i++)
			source=source.replace(/([^_a-zA-Z0-9])(maxint|maxlongint|true|false)([^_a-zA-Z0-9])/g,'$1<span class="constant">$2</span>$3');
		//Highlight comments
		source=source.replace(/(\/\/[^\n]*)/g,'<span class="comment">$1</span>');
		//Hightlight keywords
		source=source.replace(/([^_a-zA-Z0-9])(and)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(ansistring)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(array)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(begin)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(boolean)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(break)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(case)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(char)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(cmath)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(const)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(continue)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(cstdio)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(cstdlib)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(cstring)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(div)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(do)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(double)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(downto)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(else)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(end)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(for)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(function)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(if)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(include)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(int)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(int64)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(integer)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(long long)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(long)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(longint)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(mod)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(not)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(of)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(or)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(procedure)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(record)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(repeat)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(return)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(set)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(string)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(struct)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(switch)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(then)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(to)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(type)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(until)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(uses)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(var)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(void)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(while)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		source=source.replace(/([^_a-zA-Z0-9])(xor)([^_a-zA-Z0-9])/g,'$1<span class="keyword">$2</span>$3');
		//Highlight commas
		for(var i=0;i<source.length;i++)
		{
			if((source[i]=='!')||(source[i]=='@')
			||(source[i]=='#')||(source[i]=='$')
			||(source[i]=='%')||(source[i]=='^')
			||(source[i]=='+')||(source[i]=='-')
			||(source[i]=='*')||(source[i]=='/')
			||(source[i]=='(')||(source[i]==')')
			||(source[i]=='=')||(source[i]=='[')
			||(source[i]==']')||(source[i]=='{')
			||(source[i]=='}')||(source[i]=='|')
			||(source[i]==',')||(source[i]=='.')
			||(source[i]==';')||(source[i]==':')
			||(source[i]=='\\')||(source[i]=='?'))
				source=source.slice(0,i)+'<span class="comma">'+source[i]+'</span>'+source.slice(i+1);
			if(source[i]=='<')
			{
				for(;(i<source.length)&&(source[i]!='>');i++);
				for(;(i<source.length)&&(source[i]!='<');i++);
				for(;(i<source.length)&&(source[i]!='>');i++);
			}
		}
		source=source.replace(/&lt<span class="comma">;<\/span>/g,'<span class="comma">&lt;</span>');
		source=source.replace(/&gt<span class="comma">;<\/span>/g,'<span class="comma">&gt;</span>');
		source=source.replace(/&amp<span class="comma">;<\/span>/g,'<span class="comma">&amp;</span>');
		//Make the tab visible
		code[t].innerHTML=source.slice(1).replace(/\`/g,'\t');
	}
	//Clear other highlights in comment
	for(var i=0,comment=document.getElementsByClassName('comment');i<comment.length;i++)
		comment[i].innerHTML=comment[i].innerHTML.replace(/<span class="[a-z]*">/g,'').replace(/<\/span>/g,'');
	//Clear other highlights in constant
	for(var i=0,constant=document.getElementsByClassName('constant');i<constant.length;i++)
		constant[i].innerHTML=constant[i].innerHTML.replace(/<span class="[a-z]*">/g,'').replace(/<\/span>/g,'');
	//Clear other highlights in keyword
	for(var i=0,keyword=document.getElementsByClassName('keyword');i<keyword.length;i++)
		keyword[i].innerHTML=keyword[i].innerHTML.replace(/<span class="[a-z]*">/g,'').replace(/<\/span>/g,'');
}
