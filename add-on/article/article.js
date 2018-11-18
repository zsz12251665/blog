window.addEventListener('DOMContentLoaded',LoadArticle);
function LoadArticle()
{
	//Load the request and change the theme
	var request=JSON.parse('{'+location.search.slice(1).replace(/([^&=]*)=([^&]*)/g,'"$1":"$2"').replace(/&/g,',')+'}');
	if(request.theme)
		document.body.className=request.theme;
	//Load the style sheet of the article
	document.getElementsByTagName('head')[0].innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/article/article.css" />';
	document.getElementsByTagName('head')[0].innerHTML+='<link rel="stylesheet" type="text/css" href="/theme/'+document.body.className+'.css" />';
	//Fill the body and load the frame
	var HTMLCode='';
	HTMLCode+='<header>zsz12251665</header>';
	HTMLCode+='<div style="font-size: xx-large;opacity: 0;padding: 0.1rem;">&nbsp;</div>';
	HTMLCode+='<article>';
	HTMLCode+=document.getElementsByTagName('body')[0].innerHTML;
	HTMLCode+='</article>';
	HTMLCode+='<footer>&copy; 2016-2018 zsz12251665. Theme by zsz12251665. Licensed under the <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/">CC BY-NC-ND 4.0 International License</a>. </footer>';
	document.getElementsByTagName('body')[0].innerHTML=HTMLCode;
	//Load the event listener
	document.getElementsByTagName('header')[0].addEventListener('click',function(){location.href=((location.pathname=='/')||(location.pathname=='/index.html'))?'/sitemap.html':'/'});
	for(var i=0,abbr=document.getElementsByTagName('abbr');i<abbr.length;i++)
		abbr[i].addEventListener('click',function(e){alert(e.target.title);});
}
