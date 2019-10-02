// b = sub; c = constant; f = fraction; i = inline block; l = line; o = operator; p = super; t = top line; v = variable
window.addEventListener('DOMContentLoaded', LoadMath);
// Append the style sheet
document.head.innerHTML += '<link rel="stylesheet" type="text/css" href="/add-on/math/math.css" />';

function LoadMath() {
	// Load the expressions
	for (let data of document.querySelectorAll('data'))
		data.innerHTML = data.value.replace(/\\(.)/g,'$1\\').replace(/([a-z])\{/g, '<span class="$1">').replace(/\}(?!\\)/g, '</span>').replace(/(.)\\/g, '$1');
}
