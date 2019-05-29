// b = sub; c = constant; f = fraction; i = inline block; l = line; o = operator; p = super; t = top line; v = variable
window.addEventListener('DOMContentLoaded', LoadMath);

function LoadMath() {
	// Load the style sheet of mathematical expressions
	document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="/add-on/math/math.css" />';
	// Show the expressions
	for (let data of document.querySelectorAll('data'))
		data.innerHTML = data.value.replace(/([a-z])\{/g, '<span class="$1">').replace(/(?<!\\)\}/g, '</span>').replace(/\\(.)/g, '$1');
	// Update the font style of variable
	for (let variable of document.querySelectorAll('data span.v'))
		for (let i = 0; i < 26; i++) {
			variable.innerHTML = variable.innerHTML.replace(String.fromCharCode(i + 65), '&#' + String(119912 + i) + ';');
			variable.innerHTML = variable.innerHTML.replace(String.fromCharCode(i + 97), '&#' + String(119938 + i) + ';');
		}
}
