document.getElementsByTagName('h1')[0].addEventListener('click',hidebar);
var visibile=true;
function hidebar()
{
	visibile=!visibile;
	if(visibile)
		document.getElementById('bar').style.display='table-cell';
	else
		document.getElementById('bar').style.display='none';
}
var menu='';
menu+='<a target="_parent" href="/"><h3>Home</h3></a>';
menu+='<a target="_parent" href="/posts/"><h3>Post List</h3></a>';
menu+='<ul>';
menu+='	<li><a target="_parent" href="/posts/A Trip of Konjac/">A Trip of Konjac</a></li>';
menu+='	<li><a target="_parent" href="/posts/About Me/">About Me</a></li>';
menu+='	<li><a target="_parent" href="/posts/Preface Founding/">Preface: Founding</a></li>';
menu+='	<li><a target="_parent" href="/posts/The Story of the Chorus (1)/">The Story of the Chorus (1)</a></li>';
menu+='	<li><a target="_parent" href="/posts/The Story of the Chorus (2)/">The Story of the Chorus (2)</a></li>';
menu+='	<li><a target="_parent" href="/posts/The Story of the Chorus (3)/">The Story of the Chorus (3)</a></li>';
menu+='</ul>';
menu+='<a target="_parent" href="/codes/"><h3>Code List</h3></a>';
menu+='<ul>';
menu+='	<li><a target="_parent" href="/codes/BZOJ/">BZOJ Problems</a></li>';
menu+='	<li><a target="_parent" href="/codes/CF/">CF Problems</a></li>';
menu+='	<li><a target="_parent" href="/codes/HDU/">HDU Problems</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/">NOIp Problems</a></li>';
menu+='	<li><a target="_parent" href="/codes/POJ/">POJ Problems</a></li>';
menu+='</ul>';
menu+='<h3>Friendly Link</h3>';
menu+='<ul>';
menu+='	<li>_|￣|○ <a target="_parent" href="http://blog.oceaneye.moe/">HFer_FDC</a></li>';
menu+='	<li>_|￣|○ <a target="_parent" href="https://www.cnblogs.com/yohanlong/">HFer_LHZ</a></li>';
menu+='	<li>_|￣|○ <a target="_parent" href="http://blog.csdn.net/haarmony/">HFer_MHX</a></li>';
menu+='	<li>_|￣|○ <a target="_parent" href="http://blog.eleele.gq/">HFer_WHJ</a></li>';
menu+='	<li>_|￣|○ <a target="_parent" href="http://snakes.moe/">HFer_YZW</a></li>';
menu+='	<li>_|￣|○ <a target="_parent" href="https://code.del.moe/">HFer_ZFR</a></li>';
menu+='</ul>';
document.getElementById('menu').innerHTML=menu;
