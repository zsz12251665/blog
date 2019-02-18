window.addEventListener('DOMContentLoaded',LoadArticle);
function LoadArticle()
{
	// Load the style sheet of article
	document.getElementsByTagName('head')[0].innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/article/article.css" />';
	// Load the request
	var request=JSON.parse('{'+location.search.slice(1).replace(/([^&=]*)=([^&]*)/g,'"$1":"$2"').replace(/&/g,',')+'}');
	// Load the title
	if(document.getElementById('title'))
		document.title=document.getElementById('title').innerText+' | zsz12251665\'s Blog';
	// Add event listeners
	document.getElementsByTagName('header')[0].addEventListener('click',function(){document.getElementsByTagName('nav')[0].style.top=document.getElementsByTagName('nav')[0].style.top?'':document.getElementsByTagName('header')[0].offsetHeight;});
	for(var i=0,abbr=document.getElementsByTagName('abbr');i<abbr.length;i++)
		abbr[i].addEventListener('click',function(e){alert(e.target.title);});
	// Set the theme selector and change the theme
	if(!sessionStorage.getItem('theme'))
		sessionStorage.setItem('theme','Dfault');
	if(request.theme)
		sessionStorage.setItem('theme',request.theme);
	if(sessionStorage.getItem('theme')!='Dfault')
		document.body.className=sessionStorage.getItem('theme');
	var selector=document.getElementById('theme');
	for(var i=0;i<selector.options.length;i++)
		if(selector.options[i].value==sessionStorage.getItem('theme'))
			selector.options[selector.selectedIndex=i].style.fontStyle='italic';
	selector.onchange=function(){sessionStorage.setItem('theme',selector.options[selector.selectedIndex].value);location.href=location.href.replace(/[?&]theme=[^&]*/g,'');};
}
