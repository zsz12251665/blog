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
	var nav=document.querySelector('nav');
	document.querySelector('header').addEventListener('click',function(e){nav.style.top=nav.style.top?'':e.target.offsetHeight;});
	for(let abbr of document.querySelectorAll('abbr'))
		abbr.addEventListener('click',function(e){alert(e.target.title);});
	// Change the theme and set the theme selector
	sessionStorage.setItem('theme',request.theme||sessionStorage.getItem('theme')||'Dfault');
	var Dfault=document.body.className,theme=document.createElement('select');
	theme.style.display='block';
	theme.style.margin='auto';
	theme.innerHTML='<option value="Dfault">Default Theme</option><option value="bricks">Brick Wall</option><option value="foxtal">Fox\'s Tale</option><option value="matrix">Matrix Flow</option><option value="OParis">Oh, Paris</option><option value="sberry">Strawberry</option><option value="star9t">Starry Night</option><option value="vector">Vector</option>';
	nav.insertBefore(theme,nav.firstChild);
	for(let option of theme.options)
		option.selected=option.value==sessionStorage.getItem('theme');
	theme.onchange=function(){sessionStorage.setItem('theme',document.body.className=theme.options[theme.selectedIndex].value);if(document.body.className=='Dfault')document.body.className=Dfault;};
	theme.onchange();
}
