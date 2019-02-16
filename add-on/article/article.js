window.addEventListener('DOMContentLoaded',LoadArticle);
function LoadArticle()
{
	//Load the request and change the theme
	var request=JSON.parse('{'+location.search.slice(1).replace(/([^&=]*)=([^&]*)/g,'"$1":"$2"').replace(/&/g,',')+'}');
	if(!sessionStorage.getItem('theme'))
		sessionStorage.setItem('theme','Dfault');
	if(request.theme)
		sessionStorage.setItem('theme',request.theme);
	if(sessionStorage.getItem('theme')!='Dfault')
		document.body.className=sessionStorage.getItem('theme');
	//Load the style sheet of the article
	document.getElementsByTagName('head')[0].innerHTML+='<link rel="stylesheet" type="text/css" href="/add-on/article/article.css" />';
	//Fill the body and load the frame
	document.getElementsByTagName('body')[0].innerHTML='<nav class="btnfield"><select id="theme"><option value="Dfault">Default Theme</option><option value="bricks">Brick Wall</option><option value="foxtal">Fox\'s Tale</option><option value="matrix">Matrix Flow</option><option value="OParis">Oh, Paris</option><option value="sberry">Strawberry</option><option value="star9t">Starry Night</option><option value="vector">Vector</option></select><br /><a href="/">Homepage</a><a href="/codes/">Code List</a><a href="/posts/">Post List</a><a href="/sitemap.html">Sitemap</a></nav><header>zsz12251665</header><article>'+document.getElementsByTagName('body')[0].innerHTML+'</article><footer>&copy; 2016-2019 zsz12251665. Theme by zsz12251665. Licensed under the <a href="https://creativecommons.org/licenses/by-nc-nd/4.0/">CC BY-NC-ND 4.0 International License</a>. </footer>';
	//Load the title
	if(document.getElementById('title'))
		document.title=document.getElementById('title').innerText+' | zsz12251665\'s Blog';
	//Load the event listeners
	document.getElementsByTagName('header')[0].addEventListener('click',function(){document.getElementsByTagName('nav')[0].style.top=document.getElementsByTagName('nav')[0].style.top?'':document.getElementsByTagName('header')[0].offsetHeight;});
	for(var i=0,abbr=document.getElementsByTagName('abbr');i<abbr.length;i++)
		abbr[i].addEventListener('click',function(e){alert(e.target.title);});
	//Set the theme selector
	var selector=document.getElementById('theme');
	for(var i=0;i<selector.options.length;i++)
		if(selector.options[i].value==sessionStorage.getItem('theme'))
			selector.selectedIndex=i;
	selector.options[selector.selectedIndex].style.fontStyle='italic';
	selector.onchange=function(){sessionStorage.setItem('theme',selector.options[selector.selectedIndex].value);location.href=location.href.replace(/[?&]theme=[^&]*/g,'');};
}
