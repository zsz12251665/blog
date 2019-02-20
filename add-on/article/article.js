window.addEventListener('DOMContentLoaded',LoadArticle);
function LoadArticle()
{
	// Load the style sheet of article
	document.head.innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/article/article.css" />';
	// Load the request
	var request=JSON.parse('{'+location.search.slice(1).replace(/([^&=]*)=([^&]*)/g,'"$1":"$2"').replace(/&/g,',')+'}');
	// Load the title
	if(document.querySelector('#title'))
		document.title=document.querySelector('#title').innerText+' | zsz12251665\'s Blog';
	// Add event listeners
	document.querySelector('header').addEventListener('click',function(){var nav=document.querySelector('nav');nav.style.top=nav.style.top?'':document.querySelector('header').offsetHeight;});
	for(var i=0,abbr=document.querySelectorAll('abbr');i<abbr.length;i++)
		abbr[i].addEventListener('click',function(e){alert(e.target.title);});
	// Set the theme selector and change the theme
	var Dfault=document.body.className;
	sessionStorage.setItem('theme',request.theme||sessionStorage.getItem('theme')||'Dfault');
	if(sessionStorage.getItem('theme')!='Dfault')
		document.body.className=sessionStorage.getItem('theme');
	var theme=document.querySelector('select#theme');
	for(var i=0;i<theme.length;i++)
		theme.options[i].selected=theme.options[i].value==sessionStorage.getItem('theme');
	theme.onchange=function(){sessionStorage.setItem('theme',document.body.className=theme.options[theme.selectedIndex].value);if(document.body.className=='Dfault')document.body.className=Dfault;};
}
