var HTMLCode='';
HTMLCode+='<header>zsz12251665\'s blog</header>';
HTMLCode+='<nav>';
HTMLCode+='	<a href="/"><h3>Home</h3></a>';
HTMLCode+='	<a href="/posts/"><h3>Post List</h3></a>';
HTMLCode+='	<ul>';
HTMLCode+='		<li><a href="/posts/A Trip of Konjac/">A Trip of Konjac</a></li>';
HTMLCode+='		<li><a href="/posts/About Me/">About Me</a></li>';
HTMLCode+='		<li><a href="/posts/Preface Founding/">Preface: Founding</a></li>';
HTMLCode+='		<li><a href="/posts/The Story of the Chorus (1)/">The Story of the Chorus (1)</a></li>';
HTMLCode+='		<li><a href="/posts/The Story of the Chorus (2)/">The Story of the Chorus (2)</a></li>';
HTMLCode+='		<li><a href="/posts/The Story of the Chorus (3)/">The Story of the Chorus (3)</a></li>';
HTMLCode+='	</ul>';
HTMLCode+='	<a href="/codes/"><h3>Code List</h3></a>';
HTMLCode+='	<ul>';
HTMLCode+='		<li><a href="/codes/BZOJ/">BZOJ Problems</a></li>';
HTMLCode+='		<li><a href="/codes/CF/">CF Problems</a></li>';
HTMLCode+='		<li><a href="/codes/HDU/">HDU Problems</a></li>';
HTMLCode+='		<li><a href="/codes/NOIp/">NOIp Problems</a></li>';
HTMLCode+='		<li><a href="/codes/POJ/">POJ Problems</a></li>';
HTMLCode+='	</ul>';
HTMLCode+='	<h3>Friendly Link</h3>';
HTMLCode+='	<ul>';
HTMLCode+='		<li>_|￣|○ <a href="http://blog.oceaneye.moe/">HFer_FDC</a></li>';
HTMLCode+='		<li>_|￣|○ <a href="https://www.cnblogs.com/yohanlong/">HFer_LHZ</a></li>';
HTMLCode+='		<li>_|￣|○ <a href="http://blog.csdn.net/haarmony/">HFer_MHX</a></li>';
HTMLCode+='		<li>_|￣|○ <a href="http://blog.eleele.gq/">HFer_WHJ</a></li>';
HTMLCode+='		<li>_|￣|○ <a href="http://blog.csdn.net/wendavidoi/">HFer_WJW</a></li>';
HTMLCode+='		<li>_|￣|○ <a href="http://blog.snakes.moe/">HFer_YZW</a></li>';
HTMLCode+='		<li>_|￣|○ <a href="https://code.del.moe/">HFer_ZFR</a></li>';
HTMLCode+='	</ul>';
HTMLCode+='</nav>';
HTMLCode+='<article>';
HTMLCode+=document.getElementsByTagName('body')[0].innerHTML;
HTMLCode+='</article>';
HTMLCode+='<footer>&copy; 2017 zsz12251665. Powered by zsz12251665. Theme by zsz12251665. </footer>';
document.getElementsByTagName('body')[0].innerHTML=HTMLCode;
var visibile=false;
function hidebar()
{
	visibile=!visibile;
	if(visibile)
		document.getElementsByTagName('nav')[0].style.display='block';
	else
		document.getElementsByTagName('nav')[0].style.display='none';
}
document.getElementsByTagName('header')[0].addEventListener('click',hidebar);
