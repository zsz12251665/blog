window.addEventListener('DOMContentLoaded',LoadArticle);
function LoadArticle()
{
	//Load the stylesheet of the article
	document.getElementsByTagName('head')[0].innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/article/article.css" />';
	document.getElementsByTagName('head')[0].innerHTML+='<link rel="stylesheet" type="text/css" href="/theme/'+document.body.className+'.css" />';
	//Fill the body and load the frame
	var HTMLCode='';
	if((location.pathname=='/')||(location.pathname=='/index.html'))
		HTMLCode+='<a href="/sitemap.html"><header>zsz12251665</header></a>';
	else
		HTMLCode+='<a href="/"><header>zsz12251665</header></a>';
	HTMLCode+='<article>';
	HTMLCode+='<div style="font-size: xx-large;opacity: 0;padding: 0.1rem;">&nbsp;</div>';
	HTMLCode+=document.getElementsByTagName('body')[0].innerHTML;
	HTMLCode+='</article>';
	HTMLCode+='<footer>&copy; 2016-2018 zsz12251665. Theme by zsz12251665. Licensed under the <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/">CC BY-NC-ND 4.0 International License</a>. </footer>';
	document.getElementsByTagName('body')[0].innerHTML=HTMLCode;
	for(var i=0,abbr=document.getElementsByTagName('abbr');i<abbr.length;i++)
		abbr[i].addEventListener('click',ShowTitle);
}
function ShowTitle(e)
{
	alert(e.target.title);
}