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
	// Change the theme and set the theme selector
	var Dfault=document.body.className;
	sessionStorage.setItem('theme',request.theme||sessionStorage.getItem('theme')||'Dfault');
	if(sessionStorage.getItem('theme')!='Dfault')
		document.body.className=sessionStorage.getItem('theme');
	var theme=document.createElement('select');
	theme.style.display='block';
	theme.style.margin='auto';
	theme.innerHTML='<option value="Dfault">Default Theme</option><option value="bricks">Brick Wall</option><option value="foxtal">Fox\'s Tale</option><option value="matrix">Matrix Flow</option><option value="OParis">Oh, Paris</option><option value="sberry">Strawberry</option><option value="star9t">Starry Night</option><option value="vector">Vector</option>';
	document.querySelector('nav').insertBefore(theme,document.querySelector('nav').firstChild);
	for(var i=0;i<theme.length;i++)
		theme.options[i].selected=theme.options[i].value==sessionStorage.getItem('theme');
	theme.onchange=function(){sessionStorage.setItem('theme',document.body.className=theme.options[theme.selectedIndex].value);if(document.body.className=='Dfault')document.body.className=Dfault;};
}
