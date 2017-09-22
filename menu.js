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
menu+='	<li><a target="_parent" href="/posts/Preface/">Preface</a></li>';
menu+='	<li><a target="_parent" href="/posts/The Story of the Chorus-I/">The Story of the Chorus-I</a></li>';
menu+='	<li><a target="_parent" href="/posts/The Story of the Chorus-II/">The Story of the Chorus-II</a></li>';
menu+='	<li><a target="_parent" href="/posts/The Story of the Chorus-III/">The Story of the Chorus-III</a></li>';
menu+='</ul>';
menu+='<a target="_parent" href="/codes/"><h3>Code List</h3></a>';
menu+='<ul>';
menu+='	<li><a target="_parent" href="/codes/BZOJ/1197.html">BZOJ 1197</a></li>';
menu+='	<li><a target="_parent" href="/codes/BZOJ/4300.html">BZOJ 4300</a></li>';
menu+='	<li><a target="_parent" href="/codes/HDU/1009.html">HDU 1009</a></li>';
menu+='	<li><a target="_parent" href="/codes/HDU/1052.html">HDU 1052</a></li>';
menu+='	<li><a target="_parent" href="/codes/HDU/2089.html">HDU 2089</a></li>';
menu+='	<li><a target="_parent" href="/codes/HDU/2094.html">HDU 2094</a></li>';
menu+='	<li><a target="_parent" href="/codes/HDU/2548.html">HDU 2548</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2004 PJT1.html">NOIp 2004 PJT1</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2004 PJT2.html">NOIp 2004 PJT2</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2004 PJT3.html">NOIp 2004 PJT3</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2004 PJT4.html">NOIp 2004 PJT4</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2004 TGT1.html">NOIp 2004 TGT1</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2004 TGT2.html">NOIp 2004 TGT2</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2004 TGT3.html">NOIp 2004 TGT3</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2005 PJT2.html">NOIp 2005 PJT2</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2005 PJT3.html">NOIp 2005 PJT3</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2005 TGT1.html">NOIp 2005 TGT1</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2011 TGT1.html">NOIp 2011 TGT1</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2011 TGT2.html">NOIp 2011 TGT2</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2011 TGT4.html">NOIp 2011 TGT4</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2012 PJT1.html">NOIp 2012 PJT1</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2012 TGT1.html">NOIp 2012 TGT1</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2015 PJT1.html">NOIp 2015 PJT1</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2015 PJT2.html">NOIp 2015 PJT2</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2015 TGT1.html">NOIp 2015 TGT1</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2016 PJT1.html">NOIp 2016 PJT1</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2016 PJT2.html">NOIp 2016 PJT2</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2016 PJT3.html">NOIp 2016 PJT3</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2016 TGT1.html">NOIp 2016 TGT1</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2016 TGT4.html">NOIp 2016 TGT4</a></li>';
menu+='	<li><a target="_parent" href="/codes/NOIp/2016 TGT5.html">NOIp 2016 TGT5</a></li>';
menu+='	<li><a target="_parent" href="/codes/POJ/1003.html">POJ 1003</a></li>';
menu+='	<li><a target="_parent" href="/codes/POJ/1004.html">POJ 1004</a></li>';
menu+='	<li><a target="_parent" href="/codes/POJ/1006.html">POJ 1006</a></li>';
menu+='	<li><a target="_parent" href="/codes/POJ/1007.html">POJ 1007</a></li>';
menu+='	<li><a target="_parent" href="/codes/POJ/1088.html">POJ 1088</a></li>';
menu+='	<li><a target="_parent" href="/codes/POJ/2000.html">POJ 2000</a></li>';
menu+='	<li><a target="_parent" href="/codes/POJ/2506.html">POJ 2506</a></li>';
menu+='	<li><a target="_parent" href="/codes/POJ/2965.html">POJ 2965</a></li>';
menu+='	<li><a target="_parent" href="/codes/POJ/3278.html">POJ 3278</a></li>';
menu+='	<li><a target="_parent" href="/codes/POJ/3292.html">POJ 3292</a></li>';
menu+='	<li><a target="_parent" href="/codes/POJ/3295.html">POJ 3295</a></li>';
menu+='</ul>';
menu+='<h3>Friendly Link</h3>';
menu+='<ul>';
menu+='	<li>_|￣|○ <a target="_parent" href="http://blog.oceaneye.moe/">HFer_FDC</a></li>';
menu+='	<li>_|￣|○ <a target="_parent" href="https://www.cnblogs.com/yohanlong/">HFer_LHZ</a></li>';
menu+='	<li>_|￣|○ <a target="_parent" href="http://blog.csdn.net/haarmony/">HFer_MHX</a></li>';
menu+='	<li>_|￣|○ <a target="_parent" href="http://blog.eleele.gq/">HFer_WHJ</a></li>';
menu+='	<li>_|￣|○ <a target="_parent" href="https://code.del.moe/">HFer_ZFR</a></li>';
menu+='</ul>';
document.getElementById('menu').innerHTML=menu;
