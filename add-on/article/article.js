window.addEventListener('DOMContentLoaded', LoadArticle);
// Append the style sheet
document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="/add-on/article/article.css" />';

function LoadArticle() {
	// Load the request
	var request = JSON.parse('{' + location.search.slice(1).replace(/([^&=]*)=([^&]*)/g, '"$1":"$2"').replace(/&/g, ',') + '}');
	// Initialize the session storage value of theme
	sessionStorage.setItem('article.theme', request.theme || sessionStorage.getItem('article.theme') || 'DefaultTheme');
	// Edit the title
	if (document.querySelector('h1'))
		document.title = document.querySelector('h1').innerText + ' | zsz12251665\'s Blog';
	// Set abbreviations functions
	for (let abbr of document.querySelectorAll('abbr'))
		abbr.addEventListener('click', function () {
			alert(abbr.title);
		});
	// Apply the theme
	var themeList = ['BrickWall', 'FoxTale', 'MatrixFlow', 'OhParis', 'StarryNight', 'Strawberry', 'Vector'];
	if (sessionStorage.getItem('article.theme') == 'RandomTheme')
		document.body.className = themeList[Math.floor(Math.random() * themeList.length)];
	for (let theme of themeList)
		if (sessionStorage.getItem('article.theme') == theme)
			document.body.className = theme;
}
