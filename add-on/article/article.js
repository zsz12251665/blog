window.addEventListener('DOMContentLoaded', LoadArticle);
// Append the style sheet
document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="/add-on/article/article.css" />';

function LoadArticle() {
	// Load the request
	var request = JSON.parse('{' + location.search.slice(1).replace(/([^&=]*)=([^&]*)/g, '"$1":"$2"').replace(/&/g, ',') + '}');
	// Edit the title
	if (document.querySelector('h2'))
		document.title = document.querySelector('h2').innerText + ' | zsz12251665\'s Blog';
	// Set the header and abbreviations functions
	var nav = document.querySelector('nav');
	document.querySelector('header').addEventListener('click', function (e) {
		nav.style.top = nav.style.top ? null : e.target.offsetHeight;
	});
	for (let abbr of document.querySelectorAll('abbr'))
		abbr.addEventListener('click', function () {
			alert(abbr.title);
		});
	// Initialize the session storage value
	sessionStorage.setItem('theme', request.theme || sessionStorage.getItem('theme') || 'DefaultTheme');
	// Append the theme selector
	var defaultTheme = document.body.className,
		themeSelector = document.createElement('select'),
		themeList = ['Brick Wall', 'Fox Tale', 'Matrix Flow', 'Oh, Paris', 'Starry Night', 'Strawberry', 'Vector'];
	themeSelector.style.display = 'block';
	themeSelector.style.margin = 'auto';
	themeSelector.innerHTML = '<option value="DefaultTheme" style="font-style: italic;">Default Theme</option><option value="RandomTheme" style="font-style: italic;">Random Theme</option>';
	for (let theme of themeList)
		themeSelector.innerHTML += '<option value="' + theme.replace(/[^A-Za-z]/g, '') + '">' + theme + '</option>';
	nav.insertBefore(themeSelector, nav.firstChild);
	for (let option of themeSelector.options)
		option.selected = option.value == sessionStorage.getItem('theme');
	// Set the theme selector function
	themeSelector.onchange = function () {
		if (themeSelector.options[themeSelector.selectedIndex].value == 'RandomTheme')
			themeSelector.selectedIndex = 2 + Math.floor(Math.random() * themeList.length);
		sessionStorage.setItem('theme', document.body.className = themeSelector.options[themeSelector.selectedIndex].value);
		if (document.body.className == 'DefaultTheme')
			document.body.className = defaultTheme;
	};
	// Initialize the theme
	themeSelector.onchange();
}
