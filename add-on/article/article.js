window.addEventListener('DOMContentLoaded',LoadArticle);
function LoadArticle()
{
	//Load the stylesheet of the article
	document.getElementsByTagName('head')[0].innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/article/article.css"/>';
	//Fill the body and load the frame
	var HTMLCode='';
	HTMLCode+='<main>';
	if((location.pathname=='/')||(location.pathname=='/index.html'))
		HTMLCode+='<a href="/sitemap.html"><header>zsz12251665</header></a>';
	else
		HTMLCode+='<a href="/"><header>zsz12251665</header></a>';
	HTMLCode+='<article>';
	HTMLCode+=document.getElementsByTagName('body')[0].innerHTML;
	HTMLCode+='</article>';
	HTMLCode+='<footer>&copy; 2016-2018 zsz12251665. Powered by zsz12251665. Theme by zsz12251665. </footer>';
	HTMLCode+='</main>';
	document.getElementsByTagName('body')[0].innerHTML=HTMLCode;
}
